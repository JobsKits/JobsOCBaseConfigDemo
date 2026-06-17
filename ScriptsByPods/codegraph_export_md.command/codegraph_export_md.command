#!/bin/zsh
set -u
setopt NO_NOMATCH

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
SCRIPT_BASENAME="$(basename "$0" | sed 's/\.[^.]*$//')"
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
: > "$LOG_FILE"

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }

fail() {
  error_echo "$1"
  exit 1
}

resolve_project_root() {
  cd "$SCRIPT_DIR/../.." && pwd
}

has_cmd() {
  command -v "$1" >/dev/null 2>&1
}

md_escape() {
  printf '%s' "$1" | sed 's/|/\\|/g; s/`/'"'"'/g'
}

clean_csv() {
  printf '%s' "$1" | tr -cd 'A-Za-z0-9_,-'
}

csv_to_sql_list() {
  local csv="$(clean_csv "$1")"
  printf '%s' "$csv" | awk -F',' '
    BEGIN { out="" }
    {
      for (i=1; i<=NF; i++) {
        if ($i == "") continue
        if (out != "") out = out ","
        out = out "\047" $i "\047"
      }
    }
    END { print out }
  '
}

write_md_header() {
  local file_path="$1"
  local title="$2"
  cat > "$file_path" <<MD
# \`${title}\`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

MD
}

write_md_footer() {
  local file_path="$1"
  cat >> "$file_path" <<'MD'

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
MD
}

run_sql() {
  sqlite3 "$DB_PATH" "$@"
}

run_sql_file() {
  local sql_file="$1"
  sqlite3 "$DB_PATH" < "$sql_file"
}

make_tmp_dir() {
  TMP_DIR="$(mktemp -d "/tmp/codegraph_md.XXXXXX")"
}

cleanup_tmp_dir() {
  [[ -n "${TMP_DIR:-}" && -d "$TMP_DIR" ]] && rm -rf "$TMP_DIR"
}

trap cleanup_tmp_dir EXIT

build_edge_kind_selection() {
  info_echo "统计实际 edge kind..."

  EDGE_KIND_STATS_TSV="$TMP_DIR/edge-kind-stats.tsv"
  sqlite3 -header -tabs "$DB_PATH" <<'SQL' > "$EDGE_KIND_STATS_TSV"
SELECT kind, COUNT(*) AS count
FROM edges
GROUP BY kind
ORDER BY count DESC, kind ASC;
SQL

  ACTUAL_EDGE_KIND_COUNT="$(awk 'NR > 1 { c++ } END { print c + 0 }' "$EDGE_KIND_STATS_TSV")"

  if [[ "${CODEGRAPH_MD_EDGE_KINDS:-auto}" == "auto" || -z "${CODEGRAPH_MD_EDGE_KINDS:-}" ]]; then
    ACTIVE_EDGE_KINDS="$(awk -F'\t' 'NR > 1 && $1 != "contains" && $1 != "defines" && $1 != "defined_in" { if (out != "") out = out ","; out = out $1 } END { print out }' "$EDGE_KIND_STATS_TSV")"

    if [[ -z "$ACTIVE_EDGE_KINDS" ]]; then
      ACTIVE_EDGE_KINDS="$(awk -F'\t' 'NR > 1 { if (out != "") out = out ","; out = out $1 } END { print out }' "$EDGE_KIND_STATS_TSV")"
    fi
  else
    ACTIVE_EDGE_KINDS="$(clean_csv "$CODEGRAPH_MD_EDGE_KINDS")"
  fi

  [[ -n "$ACTIVE_EDGE_KINDS" ]] || fail "edges 表没有任何可导出的 kind。"

  EDGE_KIND_SQL_LIST="$(csv_to_sql_list "$ACTIVE_EDGE_KINDS")"
  [[ -n "$EDGE_KIND_SQL_LIST" ]] || fail "edge kind 为空，无法导出。"

  success_echo "实际 edge kind 数量：$ACTUAL_EDGE_KIND_COUNT"
  info_echo "本次参与导出的 edge kind：$ACTIVE_EDGE_KINDS"
}

write_schema_snapshot() {
  info_echo "写入 DB Schema 快照..."
  local file_path="$OUT_DIR/99-DB-Schema.md"
  write_md_header "$file_path" "CodeGraph DB Schema"
  cat >> "$file_path" <<MD
本文件用于排查 \`codegraph.db\` 的表结构，不直接作为架构文档阅读。

## 一、数据表

\`\`\`text
$(sqlite3 "$DB_PATH" '.tables' 2>&1)
\`\`\`

## 二、Schema

\`\`\`sql
$(sqlite3 "$DB_PATH" "SELECT sql FROM sqlite_master WHERE type IN ('table','index','trigger','view') AND sql IS NOT NULL ORDER BY type, name;" 2>&1)
\`\`\`
MD
  write_md_footer "$file_path"
}

write_health_report() {
  info_echo "写入数据库体检报告..."
  local file_path="$OUT_DIR/00-数据库体检.md"
  write_md_header "$file_path" "CodeGraph 数据库体检"

  local node_count edge_count file_count unresolved_count
  node_count="$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM nodes;" 2>/dev/null || echo 0)"
  edge_count="$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM edges;" 2>/dev/null || echo 0)"
  file_count="$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM files;" 2>/dev/null || echo 0)"
  unresolved_count="$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM unresolved_refs;" 2>/dev/null || echo 0)"

  cat >> "$file_path" <<MD
这份体检是后续所有图谱是否有营养的基础。先看这里，不要先看 Mermaid。

## 一、总量概览 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 数量 |
| --- | ---: |
| nodes | \`${node_count}\` |
| edges | \`${edge_count}\` |
| files | \`${file_count}\` |
| unresolved_refs | \`${unresolved_count}\` |

## 二、Edge Kind 实际分布 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| edge kind | 数量 |
| --- | ---: |
MD

  awk -F'\t' 'NR > 1 { printf("| `%s` | `%s` |\n", $1, $2) }' "$EDGE_KIND_STATS_TSV" >> "$file_path"

  cat >> "$file_path" <<MD

## 三、Node Kind 分布 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| node kind | 数量 |
| --- | ---: |
MD

  sqlite3 -tabs "$DB_PATH" "SELECT kind, COUNT(*) FROM nodes GROUP BY kind ORDER BY COUNT(*) DESC, kind ASC LIMIT 80;" |
    awk -F'\t' '{ printf("| `%s` | `%s` |\n", $1, $2) }' >> "$file_path"

  cat >> "$file_path" <<MD

## 四、语言分布 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| language | 文件数 | 节点数 |
| --- | ---: | ---: |
MD

  sqlite3 -tabs "$DB_PATH" <<'SQL' |
SELECT f.language, COUNT(*) AS file_count, COALESCE(SUM(f.node_count), 0) AS node_count
FROM files f
GROUP BY f.language
ORDER BY file_count DESC, f.language ASC
LIMIT 80;
SQL
    awk -F'\t' '{ printf("| `%s` | `%s` | `%s` |\n", $1, $2, $3) }' >> "$file_path"

  cat >> "$file_path" <<MD

## 五、诊断结论 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 如果这里没有 \`calls\`，那就不是导出脚本漏了，而是当前 CodeGraph 对本项目没有沉淀调用边。
- 如果 \`references\` / \`imports\` 很多，后续模块关联图会基于这些实际存在的边做聚合。
- 如果 \`unresolved_refs\` 很高，说明有大量引用没有被解析成确定目标，后续图谱需要按模块聚合看，不要强求方法级调用图。
MD

  write_md_footer "$file_path"
}

write_project_overview() {
  info_echo "写入项目概览..."
  local file_path="$OUT_DIR/01-项目概览.md"
  write_md_header "$file_path" "CodeGraph 项目概览"

  cat >> "$file_path" <<MD
本目录由 \`codegraph_export_md.command\` 从 \`.codegraph/codegraph.db\` 导出。重点不是堆文件列表，而是把 CodeGraph 已经索引到的项目内在关系变成人能读的结构报告。

## 一、导出信息 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 值 |
| --- | --- |
| 生成时间 | \`$(date '+%Y-%m-%d %H:%M:%S')\` |
| 项目根目录 | \`$PROJECT_ROOT\` |
| 数据库 | \`$DB_PATH\` |
| 输出目录 | \`$OUT_DIR\` |
| 本次导出 edge kind | \`$ACTIVE_EDGE_KINDS\` |
| 扫描上限 | \`$EDGE_SCAN_LIMIT\` |
| 明细导出上限 | \`$EDGE_EXPORT_LIMIT\` |
| 单图边数 | \`$GRAPH_EDGE_LIMIT\` |

## 二、推荐阅读顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 顺序 | 文件 | 用途 |
| --- | --- | --- |
| 1 | \`00-数据库体检.md\` | 判断 CodeGraph 实际有哪些边，不再盲猜 \`calls\` 是否存在 |
| 2 | \`02-模块关联.md\` | 看项目内部模块 / Pod / 目录之间的耦合 |
| 3 | \`03-核心符号.md\` | 看入度、出度最高的符号，快速定位核心类和热点方法 |
| 4 | \`04-边明细.md\` | 看符号级关系明细 |
| 5 | \`graphs/\` | 看拆分后的 Mermaid 图 |

MD

  write_md_footer "$file_path"
}

module_expr_for() {
  local alias="$1"
  cat <<SQL
CASE
  WHEN ${alias}.file_path LIKE 'Pods/%' OR ${alias}.file_path LIKE './Pods/%' THEN 'Pods'
  WHEN ${alias}.file_path LIKE 'JobsByPods/%/%' THEN 'JobsByPods/' || substr(substr(${alias}.file_path, length('JobsByPods/') + 1), 1, instr(substr(${alias}.file_path, length('JobsByPods/') + 1), '/') - 1)
  WHEN ${alias}.file_path LIKE 'JobsByPods/%' THEN 'JobsByPods/' || substr(${alias}.file_path, length('JobsByPods/') + 1)
  WHEN ${alias}.file_path LIKE 'JobsOCBaseConfigDemo/%' THEN 'App/JobsOCBaseConfigDemo'
  WHEN instr(${alias}.file_path, '/') > 0 THEN substr(${alias}.file_path, 1, instr(${alias}.file_path, '/') - 1)
  ELSE ${alias}.file_path
END
SQL
}

write_edges_tsv() {
  info_echo "导出符号边明细 TSV，扫描上限：$EDGE_SCAN_LIMIT，导出上限：$EDGE_EXPORT_LIMIT..."
  EDGES_TSV="$EDGE_DIR/codegraph-edges.tsv"
  cat > "$TMP_DIR/export_edges.sql" <<SQL
.headers on
.mode tabs
PRAGMA query_only=ON;
PRAGMA temp_store=MEMORY;
PRAGMA cache_size=-200000;
WITH edge_pick AS (
  SELECT id, source, target, kind, line, col
  FROM edges INDEXED BY idx_edges_kind
  WHERE kind IN ($EDGE_KIND_SQL_LIST)
  ORDER BY kind, id
  LIMIT $EDGE_SCAN_LIMIT
), joined AS (
  SELECT
    e.kind AS edge_kind,
    s.kind AS source_kind,
    COALESCE(NULLIF(s.qualified_name, ''), s.name) AS source_name,
    s.file_path AS source_file,
    s.start_line AS source_line,
    t.kind AS target_kind,
    COALESCE(NULLIF(t.qualified_name, ''), t.name) AS target_name,
    t.file_path AS target_file,
    t.start_line AS target_line,
    e.line AS edge_line
  FROM edge_pick e
  JOIN nodes s ON s.id = e.source
  JOIN nodes t ON t.id = e.target
  WHERE s.file_path NOT LIKE '.git/%'
    AND t.file_path NOT LIKE '.git/%'
    AND s.file_path NOT LIKE '.codegraph/%'
    AND t.file_path NOT LIKE '.codegraph/%'
    AND s.file_path NOT LIKE 'build/%'
    AND t.file_path NOT LIKE 'build/%'
    AND s.file_path NOT LIKE '%/DerivedData/%'
    AND t.file_path NOT LIKE '%/DerivedData/%'
)
SELECT
  edge_kind,
  source_kind || ':' || source_name AS source,
  target_kind || ':' || target_name AS target,
  source_file,
  target_file,
  COALESCE(source_line, '') AS source_line,
  COALESCE(target_line, '') AS target_line,
  COALESCE(edge_line, '') AS edge_line
FROM joined
LIMIT $EDGE_EXPORT_LIMIT;
SQL
  run_sql_file "$TMP_DIR/export_edges.sql" > "$EDGES_TSV"
  EXPORTED_EDGE_COUNT="$(awk 'NR > 1 { c++ } END { print c + 0 }' "$EDGES_TSV")"
  success_echo "符号边明细已导出：$EXPORTED_EDGE_COUNT 条"
}

write_module_coupling() {
  info_echo "生成模块关联报告..."
  MODULE_TSV="$EDGE_DIR/module-coupling.tsv"
  local smodule="$(module_expr_for s)"
  local tmodule="$(module_expr_for t)"

  cat > "$TMP_DIR/module_coupling.sql" <<SQL
.headers on
.mode tabs
PRAGMA query_only=ON;
PRAGMA temp_store=MEMORY;
PRAGMA cache_size=-200000;
WITH edge_pick AS (
  SELECT source, target, kind
  FROM edges INDEXED BY idx_edges_kind
  WHERE kind IN ($EDGE_KIND_SQL_LIST)
  ORDER BY kind, id
  LIMIT $EDGE_SCAN_LIMIT
), joined AS (
  SELECT
    e.kind AS edge_kind,
    $smodule AS source_module,
    $tmodule AS target_module,
    s.file_path AS source_file,
    t.file_path AS target_file
  FROM edge_pick e
  JOIN nodes s ON s.id = e.source
  JOIN nodes t ON t.id = e.target
  WHERE s.file_path NOT LIKE '.git/%'
    AND t.file_path NOT LIKE '.git/%'
    AND s.file_path NOT LIKE '.codegraph/%'
    AND t.file_path NOT LIKE '.codegraph/%'
    AND s.file_path NOT LIKE 'build/%'
    AND t.file_path NOT LIKE 'build/%'
    AND s.file_path NOT LIKE '%/DerivedData/%'
    AND t.file_path NOT LIKE '%/DerivedData/%'
    AND s.file_path != ''
    AND t.file_path != ''
), grouped AS (
  SELECT source_module, target_module, edge_kind, COUNT(*) AS weight
  FROM joined
  WHERE source_module != target_module
    AND source_module != ''
    AND target_module != ''
    AND source_module != 'Pods'
    AND target_module != 'Pods'
  GROUP BY source_module, target_module, edge_kind
)
SELECT source_module, target_module, edge_kind, weight
FROM grouped
ORDER BY weight DESC, source_module ASC, target_module ASC, edge_kind ASC
LIMIT $MODULE_EDGE_EXPORT_LIMIT;
SQL
  run_sql_file "$TMP_DIR/module_coupling.sql" > "$MODULE_TSV"

  local file_path="$OUT_DIR/02-模块关联.md"
  write_md_header "$file_path" "CodeGraph 模块关联"
  cat >> "$file_path" <<MD
这里看的是目录 / Pod / 模块之间的真实边聚合，比单个符号大图更适合判断项目内在耦合。

## 一、模块关联 Top ${MODULE_EDGE_PREVIEW_LIMIT} <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

完整 TSV：\`edges/module-coupling.tsv\`。

| 来源模块 | 目标模块 | 关系 | 权重 |
| --- | --- | --- | ---: |
MD

  awk -F'\t' -v limit="$MODULE_EDGE_PREVIEW_LIMIT" 'NR > 1 && c < limit { printf("| `%s` | `%s` | `%s` | `%s` |\n", $1, $2, $3, $4); c++ }' "$MODULE_TSV" >> "$file_path"

  cat >> "$file_path" <<MD

## 二、阅读判断 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 权重高，不一定就是坏；它代表当前索引视角下两个模块之间关系密集。
- 如果一个基础模块被大量模块指向，说明它是公共依赖。
- 如果业务模块之间互相指向很多，后续改动风险会更高。
MD
  write_md_footer "$file_path"
}

write_core_symbols() {
  info_echo "生成核心符号报告..."
  INBOUND_TSV="$EDGE_DIR/top-inbound-symbols.tsv"
  OUTBOUND_TSV="$EDGE_DIR/top-outbound-symbols.tsv"

  cat > "$TMP_DIR/top_inbound.sql" <<SQL
.headers on
.mode tabs
PRAGMA query_only=ON;
PRAGMA temp_store=MEMORY;
WITH edge_pick AS (
  SELECT source, target, kind
  FROM edges INDEXED BY idx_edges_kind
  WHERE kind IN ($EDGE_KIND_SQL_LIST)
  ORDER BY kind, id
  LIMIT $EDGE_SCAN_LIMIT
)
SELECT
  t.kind AS node_kind,
  COALESCE(NULLIF(t.qualified_name, ''), t.name) AS node_name,
  t.file_path,
  t.start_line,
  COUNT(*) AS inbound_count,
  GROUP_CONCAT(DISTINCT e.kind) AS edge_kinds
FROM edge_pick e
JOIN nodes t ON t.id = e.target
WHERE t.file_path NOT LIKE '.git/%'
  AND t.file_path NOT LIKE '.codegraph/%'
  AND t.file_path NOT LIKE 'build/%'
  AND t.file_path NOT LIKE '%/DerivedData/%'
GROUP BY t.id
ORDER BY inbound_count DESC, node_name ASC
LIMIT $CORE_SYMBOL_LIMIT;
SQL
  run_sql_file "$TMP_DIR/top_inbound.sql" > "$INBOUND_TSV"

  cat > "$TMP_DIR/top_outbound.sql" <<SQL
.headers on
.mode tabs
PRAGMA query_only=ON;
PRAGMA temp_store=MEMORY;
WITH edge_pick AS (
  SELECT source, target, kind
  FROM edges INDEXED BY idx_edges_kind
  WHERE kind IN ($EDGE_KIND_SQL_LIST)
  ORDER BY kind, id
  LIMIT $EDGE_SCAN_LIMIT
)
SELECT
  s.kind AS node_kind,
  COALESCE(NULLIF(s.qualified_name, ''), s.name) AS node_name,
  s.file_path,
  s.start_line,
  COUNT(*) AS outbound_count,
  GROUP_CONCAT(DISTINCT e.kind) AS edge_kinds
FROM edge_pick e
JOIN nodes s ON s.id = e.source
WHERE s.file_path NOT LIKE '.git/%'
  AND s.file_path NOT LIKE '.codegraph/%'
  AND s.file_path NOT LIKE 'build/%'
  AND s.file_path NOT LIKE '%/DerivedData/%'
GROUP BY s.id
ORDER BY outbound_count DESC, node_name ASC
LIMIT $CORE_SYMBOL_LIMIT;
SQL
  run_sql_file "$TMP_DIR/top_outbound.sql" > "$OUTBOUND_TSV"

  local file_path="$OUT_DIR/03-核心符号.md"
  write_md_header "$file_path" "CodeGraph 核心符号"
  cat >> "$file_path" <<MD
核心符号不是按名字猜出来的，而是按 CodeGraph 边的入度 / 出度统计出来的。

## 一、被依赖最多的符号 Top ${CORE_SYMBOL_LIMIT} <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

完整 TSV：\`edges/top-inbound-symbols.tsv\`。

| 类型 | 符号 | 文件 | 行 | 入度 | 关系 |
| --- | --- | --- | ---: | ---: | --- |
MD
  awk -F'\t' 'NR > 1 { printf("| `%s` | `%s` | `%s` | `%s` | `%s` | `%s` |\n", $1, $2, $3, $4, $5, $6) }' "$INBOUND_TSV" >> "$file_path"

  cat >> "$file_path" <<MD

## 二、依赖外部最多的符号 Top ${CORE_SYMBOL_LIMIT} <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

完整 TSV：\`edges/top-outbound-symbols.tsv\`。

| 类型 | 符号 | 文件 | 行 | 出度 | 关系 |
| --- | --- | --- | ---: | ---: | --- |
MD
  awk -F'\t' 'NR > 1 { printf("| `%s` | `%s` | `%s` | `%s` | `%s` | `%s` |\n", $1, $2, $3, $4, $5, $6) }' "$OUTBOUND_TSV" >> "$file_path"

  write_md_footer "$file_path"
}

write_edge_details_md() {
  info_echo "生成边明细报告..."
  local file_path="$OUT_DIR/04-边明细.md"
  write_md_header "$file_path" "CodeGraph 边明细"
  cat >> "$file_path" <<MD
完整符号关系已经同步写入：\`edges/codegraph-edges.tsv\`。

## 一、导出结果 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 值 |
| --- | ---: |
| 导出边数 | \`${EXPORTED_EDGE_COUNT}\` |
| 扫描上限 | \`${EDGE_SCAN_LIMIT}\` |
| 明细上限 | \`${EDGE_EXPORT_LIMIT}\` |

## 二、导出边类型统计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 类型 | 数量 |
| --- | ---: |
MD

  awk -F'\t' 'NR > 1 { count[$1]++ } END { for (k in count) printf("%s\t%s\n", k, count[k]) }' "$EDGES_TSV" |
    sort -k2,2nr |
    awk -F'\t' '{ printf("| `%s` | `%s` |\n", $1, $2) }' >> "$file_path"

  cat >> "$file_path" <<MD

## 三、符号关系预览 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

这里只展示前 \`${EDGE_PREVIEW_LIMIT}\` 条，完整内容看 TSV。

| 类型 | 来源 | 目标 | 来源文件 | 目标文件 |
| --- | --- | --- | --- | --- |
MD

  awk -F'\t' -v limit="$EDGE_PREVIEW_LIMIT" 'NR > 1 && c < limit { printf("| `%s` | `%s` | `%s` | `%s` | `%s` |\n", $1, $2, $3, $4, $5); c++ }' "$EDGES_TSV" >> "$file_path"

  write_md_footer "$file_path"
}

generate_module_graph() {
  info_echo "生成模块 Mermaid 图..."
  local graph_file="$GRAPH_DIR/模块关联-Top.md"
  write_md_header "$graph_file" "模块关联 Top 图"
  cat >> "$graph_file" <<MD
模块级关系图来自 \`edges/module-coupling.tsv\`，每条边的数字是聚合权重。

\`\`\`mermaid
flowchart ${GRAPH_DIRECTION}
MD

  cat > "$TMP_DIR/module_graph.awk" <<'AWK'
function esc(s) {
  gsub(/"/, "'", s)
  gsub(/\[/, "(", s)
  gsub(/\]/, ")", s)
  gsub(/\|/, "/", s)
  return s
}
NR > 1 && count < limit {
  s=$1; t=$2; k=$3; w=$4
  if (!(s in id)) { id[s]="M" ++n; label[n]=s }
  if (!(t in id)) { id[t]="M" ++n; label[n]=t }
  edge[++m]=id[s] " -->|" esc(k) ":" w "| " id[t]
  count++
}
END {
  for (i=1; i<=n; i++) print "  M" i "[\"" esc(label[i]) "\"]"
  for (i=1; i<=m; i++) print "  " edge[i]
}
AWK

  awk -F'\t' -v limit="$MODULE_GRAPH_EDGE_LIMIT" -f "$TMP_DIR/module_graph.awk" "$MODULE_TSV" >> "$graph_file"

  cat >> "$graph_file" <<'MD'
```
MD
  write_md_footer "$graph_file"
}

safe_file_part() {
  printf '%s' "$1" | tr -cd 'A-Za-z0-9_-' | cut -c1-80
}

write_symbol_graph_file_header() {
  local graph_file="$1"
  local title="$2"
  write_md_header "$graph_file" "$title"
  cat >> "$graph_file" <<MD
这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

\`\`\`mermaid
flowchart ${GRAPH_DIRECTION}
MD
}

write_symbol_graph_file_footer() {
  local graph_file="$1"
  cat >> "$graph_file" <<'MD'
```
MD
  write_md_footer "$graph_file"
}

generate_symbol_graphs() {
  info_echo "生成符号关系 Mermaid 分片图..."

  local current_kind=""
  local chunk_index=0
  local line_in_chunk=0
  local graph_file=""
  local graph_count=0

  tail -n +2 "$EDGES_TSV" | while IFS=$'\t' read -r edge_kind source target source_file target_file source_line target_line edge_line; do
    [[ -n "$edge_kind" ]] || continue

    if [[ "$edge_kind" != "$current_kind" || "$line_in_chunk" -ge "$GRAPH_EDGE_LIMIT" ]]; then
      if [[ -n "$graph_file" ]]; then
        write_symbol_graph_file_footer "$graph_file"
      fi

      if [[ "$edge_kind" != "$current_kind" ]]; then
        current_kind="$edge_kind"
        chunk_index=1
      else
        chunk_index=$((chunk_index + 1))
      fi

      line_in_chunk=0
      graph_count=$((graph_count + 1))
      local kind_part="$(safe_file_part "$current_kind")"
      graph_file="$GRAPH_DIR/${kind_part}-$(printf '%03d' "$chunk_index").md"
      write_symbol_graph_file_header "$graph_file" "${current_kind} 符号关系 - $(printf '%03d' "$chunk_index")"
    fi

    line_in_chunk=$((line_in_chunk + 1))
    local source_label target_label
    source_label="$(printf '%s<br/>%s:%s' "$source" "$source_file" "$source_line" | sed 's/"/'"'"'/g; s/\[/(/g; s/\]/)/g; s/|/\//g')"
    target_label="$(printf '%s<br/>%s:%s' "$target" "$target_file" "$target_line" | sed 's/"/'"'"'/g; s/\[/(/g; s/\]/)/g; s/|/\//g')"

    {
      printf '  S%s["%s"]\n' "$line_in_chunk" "$source_label"
      printf '  T%s["%s"]\n' "$line_in_chunk" "$target_label"
      printf '  S%s -->|%s| T%s\n' "$line_in_chunk" "$edge_kind" "$line_in_chunk"
    } >> "$graph_file"
  done

  if [[ -n "$graph_file" ]]; then
    write_symbol_graph_file_footer "$graph_file"
  fi
}

write_graph_index() {
  info_echo "生成图谱索引..."
  local file_path="$OUT_DIR/05-图谱索引.md"
  write_md_header "$file_path" "CodeGraph 图谱索引"

  cat >> "$file_path" <<MD
图谱已经按用途和边类型拆开，不再把所有关系塞进一张图。

## 一、图谱入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 图谱 | 说明 |
| --- | --- |
MD

  if [[ -f "$GRAPH_DIR/模块关联-Top.md" ]]; then
    echo "| [\`模块关联-Top.md\`](./graphs/模块关联-Top.md) | 模块 / Pod / 目录之间的聚合关系 |" >> "$file_path"
  fi

  find "$GRAPH_DIR" -maxdepth 1 -type f -name '*.md' ! -name '模块关联-Top.md' | sort | while IFS= read -r graph_path; do
    local name="$(basename "$graph_path")"
    echo "| [\`${name}\`](./graphs/${name}) | 符号关系分片图 |" >> "$file_path"
  done

  cat >> "$file_path" <<MD

## 二、参数建议 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 看项目内在关联：优先看 \`02-模块关联.md\` 和 \`graphs/模块关联-Top.md\`。
- 看核心符号：优先看 \`03-核心符号.md\`。
- 如果 \`calls\` 不存在，不要硬筛 \`calls\`；先看 \`00-数据库体检.md\` 里的实际 \`edge kind\`。
- 如果需要更全，调大 \`CODEGRAPH_MD_EDGE_SCAN_LIMIT\` 和 \`CODEGRAPH_MD_EDGE_EXPORT_LIMIT\`。
MD
  write_md_footer "$file_path"
}

write_readme() {
  info_echo "生成 README..."
  local file_path="$OUT_DIR/README.md"
  write_md_header "$file_path" "CodeGraph Markdown 可视化"
  cat >> "$file_path" <<MD
这里是 \`.codegraph/codegraph.md/\`，用于集中保存 CodeGraph 的可读文档和 [**Mermaid**](https://mermaid.js.org) 拆分图。

## 一、目录说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件 / 目录 | 说明 |
| --- | --- |
| \`00-数据库体检.md\` | 实际 edge kind、node kind、语言分布，判断 CodeGraph 到底索引出了什么 |
| \`01-项目概览.md\` | 导出参数和推荐阅读顺序 |
| \`02-模块关联.md\` | 模块 / Pod / 目录之间的关系聚合，优先看这里 |
| \`03-核心符号.md\` | 入度 / 出度最高的符号，定位核心类和热点方法 |
| \`04-边明细.md\` | 符号级关系明细预览 |
| \`05-图谱索引.md\` | Mermaid 分片图入口 |
| \`99-DB-Schema.md\` | CodeGraph DB 表结构快照 |
| \`graphs/\` | 拆分后的 Mermaid 图 |
| \`edges/\` | 完整 TSV 数据 |

## 二、推荐入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1. 先打开 \`00-数据库体检.md\`，确认实际存在的 \`edge kind\`。
2. 再打开 \`02-模块关联.md\`，看项目内部模块耦合。
3. 然后打开 \`03-核心符号.md\`，看高入度 / 高出度符号。
4. 最后再看 \`graphs/\`，不要一上来盯 Mermaid。
MD
  write_md_footer "$file_path"
}

write_file_structure() {
  info_echo "生成精简文件结构..."
  local file_path="$OUT_DIR/06-文件结构.md"
  write_md_header "$file_path" "CodeGraph 文件结构"
  cat >> "$file_path" <<MD
这里记录当前工程的文件结构快照，优先排除 \`.git\`、\`Pods\`、\`.codegraph\`、\`build\`、\`DerivedData\` 等目录。

## 一、文件结构

\`\`\`text
MD
  find . \
    -path './.git' -prune -o \
    -path './Pods' -prune -o \
    -path './.codegraph' -prune -o \
    -path './build' -prune -o \
    -path './DerivedData' -prune -o \
    -type f -print |
    sed 's#^./##' |
    sort |
    head -n "$FILE_STRUCTURE_LIMIT" >> "$file_path"
  cat >> "$file_path" <<'MD'
```
MD
  write_md_footer "$file_path"
}

main() {
  PROJECT_ROOT="$(resolve_project_root)" || fail "无法定位工程根目录。"
  cd "$PROJECT_ROOT" || fail "无法进入工程根目录：$PROJECT_ROOT"

  DB_PATH="${CODEGRAPH_DB_PATH:-.codegraph/codegraph.db}"
  OUT_DIR="${CODEGRAPH_MD_OUT_DIR:-${CODEGRAPH_MD_OUTPUT_DIR:-${CODEGRAPH_EXPORT_OUT_DIR:-.codegraph/codegraph.md}}}"
  GRAPH_DIR="$OUT_DIR/graphs"
  EDGE_DIR="$OUT_DIR/edges"

  EDGE_SCAN_LIMIT="${CODEGRAPH_MD_EDGE_SCAN_LIMIT:-20000}"
  EDGE_EXPORT_LIMIT="${CODEGRAPH_MD_EDGE_EXPORT_LIMIT:-5000}"
  GRAPH_EDGE_LIMIT="${CODEGRAPH_MD_GRAPH_EDGE_LIMIT:-25}"
  GRAPH_DIRECTION="${CODEGRAPH_MD_GRAPH_DIRECTION:-LR}"
  MODULE_EDGE_EXPORT_LIMIT="${CODEGRAPH_MD_MODULE_EDGE_EXPORT_LIMIT:-500}"
  MODULE_EDGE_PREVIEW_LIMIT="${CODEGRAPH_MD_MODULE_EDGE_PREVIEW_LIMIT:-80}"
  MODULE_GRAPH_EDGE_LIMIT="${CODEGRAPH_MD_MODULE_GRAPH_EDGE_LIMIT:-80}"
  CORE_SYMBOL_LIMIT="${CODEGRAPH_MD_CORE_SYMBOL_LIMIT:-80}"
  EDGE_PREVIEW_LIMIT="${CODEGRAPH_MD_EDGE_PREVIEW_LIMIT:-300}"
  FILE_STRUCTURE_LIMIT="${CODEGRAPH_MD_FILE_STRUCTURE_LIMIT:-2000}"

  [[ "$EDGE_SCAN_LIMIT" == <-> ]] || EDGE_SCAN_LIMIT=20000
  [[ "$EDGE_EXPORT_LIMIT" == <-> ]] || EDGE_EXPORT_LIMIT=5000
  [[ "$GRAPH_EDGE_LIMIT" == <-> ]] || GRAPH_EDGE_LIMIT=25

  highlight_echo "CodeGraph Markdown 深度导出"
  info_echo "项目根目录：$PROJECT_ROOT"
  info_echo "输出目录：$OUT_DIR"
  info_echo "日志文件：$LOG_FILE"

  [[ -f "$DB_PATH" ]] || fail "找不到 CodeGraph 数据库：$DB_PATH"
  has_cmd sqlite3 || fail "未找到 sqlite3，无法读取 CodeGraph 数据库。"

  mkdir -p "$OUT_DIR" "$GRAPH_DIR" "$EDGE_DIR"
  rm -f "$OUT_DIR"/*.md "$GRAPH_DIR"/*.md "$EDGE_DIR"/*.tsv 2>/dev/null || true

  make_tmp_dir
  sqlite3 "$DB_PATH" 'PRAGMA wal_checkpoint(PASSIVE);' >/dev/null 2>&1 || true

  build_edge_kind_selection
  write_schema_snapshot
  write_health_report
  write_project_overview
  write_edges_tsv
  write_module_coupling
  write_core_symbols
  write_edge_details_md
  generate_module_graph
  generate_symbol_graphs
  write_graph_index
  write_file_structure
  write_readme

  success_echo "CodeGraph Markdown 深度导出完成：$OUT_DIR"
}

main "$@"
