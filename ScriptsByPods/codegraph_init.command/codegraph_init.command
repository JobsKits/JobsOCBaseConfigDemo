#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：codegraph_init.command。
# - 核心用途：pod install 集成后体检工具链、补齐缺失组件、更新精确工程的代码地图并导出 Markdown。
# - 影响范围：本工程 .codegraph；必要时经 Brew 准备 Node/npm，再安装官方 CodeGraph npm 包。
# - 运行提示：终端回车确认；Podfile 已授权后台执行；--check-only / 离线模式禁止安装，不主动升级工具。
typeset SCRIPT_DIR="" PROJECT_ROOT="" CODEGRAPH_TARGET_DIRECTORY=""
typeset CODEGRAPH_LOG_FILE="" CODEGRAPH_STATUS_JSON="" CODEGRAPH_BIN=""
typeset CODEGRAPH_NODE_BIN="" CODEGRAPH_NPM_BIN=""
typeset CODEGRAPH_PREFIX="$HOME/.local/share/jobs-codegraph"
typeset CODEGRAPH_NPM_REGISTRY="https://registry.npmjs.org/"
typeset CHECK_ONLY=0 ALLOW_INSTALL=1 PROJECT_LOCK="" SAMPLE_DIR="" EXPORT_PID=""
typeset TOOLCHAIN_LOCK="" TOOLCHAIN_LOCK_OWNED=0 PROJECT_LOCK_OWNED=0
# 打印固定自述；独立终端确认前不创建日志或写入工程。
show_script_intro_and_wait() {
  local answer="" argument=""
  codegraph_intro_line title '━━━━━━━━━━ CodeGraph 安装后代码地图 ━━━━━━━━━━'
  codegraph_intro_line body '1、完整体检：系统工具 / CLT → Homebrew → Node/npm → CodeGraph，以及 SQLite / JSON 和隔离样例建图。'
  codegraph_intro_line body '2、已有地图 sync，失败回退 index；首次 init --yes，严格核对项目、产物路径和索引完整状态。'
  codegraph_intro_line body '3、缺失时 Brew 准备 node@24，再安装官方 @colbymchenry/codegraph；当前无该产品的 Brew formula。'
  codegraph_intro_line body '4、仅补齐缺失或损坏组件，不主动升级健康工具；不修改 Shell 配置或代理，失败不影响 CocoaPods。'
  codegraph_intro_line body '5、--check-only 只检查、不安装、不建图；离线模式禁止安装。日志在系统临时目录 codegraph_init.<工程摘要>.log。'
  if [[ "${CODEGRAPH_AUTO_INIT:-0}" == 1 || "${JOBS_CODEGRAPH_INTRO_CONFIRMED:-0}" == 1 ]]; then
    return 0
  fi
  for argument in "$@"; do
    case "$argument" in --check-only|--help|-h) return 0 ;; esac
  done
  [[ -t 0 ]] || { print -u2 -r -- '没有可交互输入，请在终端重跑，或由 Podfile 自动入口执行。'; exit 1; }
  IFS= read -r 'answer?👉 已了解用途与影响，按回车继续；Ctrl+C 取消：' || exit 1
}
# 确认后解析参数、固定日志，并限定环境变量只作用于本进程。
initialize_runtime() {
  setopt NO_NOMATCH
  SCRIPT_DIR="${${(%):-%x}:A:h}"
  PROJECT_ROOT="${JOBS_CODEGRAPH_PROJECT_ROOT:-${SCRIPT_DIR}/../..}"
  while (( $# )); do
    case "$1" in
      --check-only) CHECK_ONLY=1 ;;
      --project-root)
        shift
        (( $# )) || { print -u2 -r -- '--project-root 缺少路径'; exit 2; }
        PROJECT_ROOT="$1"
        ;;
      --help|-h)
        print -r -- '用法：codegraph_init.command [--check-only] [--project-root 路径]'
        exit 0
        ;;
      *) print -u2 -r -- "未知参数：$1"; exit 2 ;;
    esac
    shift
  done
  [[ "${JOBS_SKIP_CODEGRAPH:-0}" != 1 ]] || { print -r -- 'JOBS_SKIP_CODEGRAPH=1，已跳过。'; exit 0; }
  [[ -d "$PROJECT_ROOT" ]] || { print -u2 -r -- "工程目录不存在：$PROJECT_ROOT"; exit 1; }
  PROJECT_ROOT="$(cd -P -- "$PROJECT_ROOT" && pwd)" || exit 1
  CODEGRAPH_TARGET_DIRECTORY="$PROJECT_ROOT"
  local project_tag="$(print -rn -- "$PROJECT_ROOT" | /usr/bin/cksum | /usr/bin/awk '{print $1}')"
  CODEGRAPH_LOG_FILE="${TMPDIR:-/tmp}/codegraph_init.${project_tag}.log"
  : >> "$CODEGRAPH_LOG_FILE" || exit 1
  ALLOW_INSTALL="${CODEGRAPH_ALLOW_INSTALL:-1}"
  [[ "$ALLOW_INSTALL" == 0 || "$ALLOW_INSTALL" == 1 ]] || codegraph_stop 'CODEGRAPH_ALLOW_INSTALL 只能为 0 或 1'
  [[ "${JOBS_POD_INSTALL_OFFLINE:-0}" != 1 && "$CHECK_ONLY" == 0 ]] || ALLOW_INSTALL=0
  export PATH="$CODEGRAPH_PREFIX/bin:/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
  export CODEGRAPH_DIR=.codegraph CODEGRAPH_TELEMETRY=0 DO_NOT_TRACK=1
  export CODEGRAPH_NO_DOWNLOAD=1 CODEGRAPH_NO_WATCH=0 NODE_DISABLE_COMPILE_CACHE=1
  export HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_CLEANUP=1 HOMEBREW_NO_ANALYTICS=1
  export JOBS_CODEGRAPH_INTRO_CONFIRMED=1
  codegraph_log "ℹ 工程：$PROJECT_ROOT；check_only=$CHECK_ONLY；允许安装=$ALLOW_INSTALL；日志：$CODEGRAPH_LOG_FILE"
}
# 禁止只读及离线分支隐式安装或修复。
require_installation() {
  [[ "$ALLOW_INSTALL" == 1 ]] || codegraph_stop "$1 缺失或损坏；当前只读 / 离线策略禁止安装，请在终端运行本入口完成配置"
}
# 用原子目录锁避免同工程重复更新，僵死锁只移除已确认的自身标记。
take_lock() {
  local lock_dir="$1" owner="" current_owner=""
  [[ ! -L "$lock_dir" ]] || return 1
  if /bin/mkdir "$lock_dir" 2>/dev/null; then
    print -r -- "$$" > "$lock_dir/pid" || return 1
    return 0
  fi
  [[ -f "$lock_dir/pid" && ! -L "$lock_dir/pid" ]] || return 1
  IFS= read -r owner < "$lock_dir/pid"
  [[ "$owner" == <-> && "$owner" -gt 1 ]] || return 1
  /bin/kill -0 "$owner" 2>/dev/null && return 1
  [[ "$(/bin/ps -p "$owner" -o pid= 2>/dev/null)" == "" ]] || return 1
  # 僵死锁的回收也要互斥，防止两个进程同时清掉刚被另一方接管的锁。
  /bin/mkdir "$lock_dir/reclaim" 2>/dev/null || return 1
  if [[ -f "$lock_dir/pid" ]]; then
    IFS= read -r current_owner < "$lock_dir/pid"
  fi
  if [[ "$current_owner" != "$owner" ]] || /bin/kill -0 "$current_owner" 2>/dev/null; then
    /bin/rmdir -- "$lock_dir/reclaim" 2>/dev/null
    return 1
  fi
  /bin/rm -f -- "$lock_dir/pid" || return 1
  /bin/rmdir -- "$lock_dir/reclaim" && /bin/rmdir -- "$lock_dir" || return 1
  /bin/mkdir "$lock_dir" 2>/dev/null || return 1
  print -r -- "$$" > "$lock_dir/pid"
}
# 全局安装链共用锁，串行运行不同工程触发的环境体检与缺失安装。
acquire_toolchain_lock() {
  (( CHECK_ONLY == 0 )) || return 0
  TOOLCHAIN_LOCK="${TMPDIR:-/tmp}/jobs-codegraph-toolchain.$UID.lock"
  [[ ! -L "$TOOLCHAIN_LOCK" ]] || codegraph_stop '工具链锁是符号链接，请先排查；未访问链接目标'
  local attempt=0
  until take_lock "$TOOLCHAIN_LOCK"; do
    (( attempt += 1 ))
    (( attempt <= 60 )) || codegraph_stop '其它 CodeGraph 工具链任务仍在运行；等待超过 60 秒，本次停止，请稍后重试'
    /bin/sleep 1
  done
  TOOLCHAIN_LOCK_OWNED=1
}
# 环境安装与样例复检完成后释放工具链锁，保留项目锁覆盖索引和导出。
release_toolchain_lock() {
  (( TOOLCHAIN_LOCK_OWNED == 1 )) || return 0
  /bin/rm -f -- "$TOOLCHAIN_LOCK/pid"
  /bin/rmdir -- "$TOOLCHAIN_LOCK" 2>/dev/null
  TOOLCHAIN_LOCK_OWNED=0
}
# 获取当前工程的更新锁，活跃任务存在时本次安全跳过。
acquire_project_lock() {
  (( CHECK_ONLY == 0 )) || return 0
  /bin/mkdir -p -- "$PROJECT_ROOT/.codegraph" || codegraph_stop '无法创建当前工程地图目录'
  PROJECT_LOCK="$PROJECT_ROOT/.codegraph/.jobs-update.lock"
  [[ ! -L "$PROJECT_LOCK" ]] || codegraph_stop '工程锁是符号链接，请先排查'
  if ! take_lock "$PROJECT_LOCK"; then
    codegraph_log 'ℹ 当前工程已有 CodeGraph 任务或待核查锁，本次跳过；未修改其它进程。'
    exit 0
  fi
  PROJECT_LOCK_OWNED=1
  print -r -- "$$" > "$PROJECT_ROOT/.codegraph/codegraph_init.pid"
}
# 精确清理本次样例与自己持有的锁，不扫描其它任务。
cleanup_runtime() {
  if [[ -n "$EXPORT_PID" ]]; then
    /bin/kill "$EXPORT_PID" 2>/dev/null
    wait "$EXPORT_PID" 2>/dev/null
    EXPORT_PID=""
  fi
  release_toolchain_lock
  if (( PROJECT_LOCK_OWNED == 1 )); then
    /bin/rm -f -- "$PROJECT_LOCK/pid"
    /bin/rmdir -- "$PROJECT_LOCK" 2>/dev/null
    if [[ -f "$PROJECT_ROOT/.codegraph/codegraph_init.pid" && "$(<"$PROJECT_ROOT/.codegraph/codegraph_init.pid")" == "$$" ]]; then
      /bin/rm -f -- "$PROJECT_ROOT/.codegraph/codegraph_init.pid"
    fi
  fi
  if [[ -n "$SAMPLE_DIR" && "$SAMPLE_DIR" == "${TMPDIR:-/tmp}"/jobs-codegraph-health.* && -d "$SAMPLE_DIR" && ! -L "$SAMPLE_DIR" ]]; then
    /bin/rm -r -- "$SAMPLE_DIR"
  fi
}
# 使用全局退出函数，避免 zsh 把函数内 EXIT trap 当成该函数的返回回调。
TRAPEXIT() {
  local result=$?
  cleanup_runtime
  return "$result"
}
# 中断时以对应状态退出，由全局退出函数释放本次资源。
TRAPINT() {
  exit 130
}
# 终止时以对应状态退出，由全局退出函数释放本次资源。
TRAPTERM() {
  exit 143
}
# 真实执行系统引导工具并校验 CLT，失败立即停止下游安装。
check_system_toolchain() {
  /bin/zsh -f -c 'print -r -- "$ZSH_VERSION"' >> "$CODEGRAPH_LOG_FILE" 2>&1 || codegraph_stop 'zsh 运行时失败'
  codegraph_check_installation_tools
  codegraph_run_logged /usr/bin/git --version || codegraph_stop '系统 Git 不可用'
  codegraph_run_logged /usr/bin/make --version || codegraph_stop 'make 不可用，请修复 Command Line Tools'
}
# SQLite 实际执行内存查询，禁用用户 sqliterc，避免只判断可执行文件存在。
check_export_runtime() {
  [[ "$(/usr/bin/sqlite3 -batch -init /dev/null :memory: 'SELECT 2 + 2;' 2>> "$CODEGRAPH_LOG_FILE")" == 4 ]] || codegraph_stop 'SQLite 内存查询失败'
  codegraph_log '✔ SQLite 内存查询与 JSON 工具体检通过。'
}
# 独立体检或修复 Homebrew，不自动更新健康安装。
ensure_brew() {
  codegraph_ensure_homebrew
}
# 体检或定点修复 Node/npm，复检失败停止。
ensure_node_npm() {
  codegraph_ensure_node_npm
}
# CLI 每个必需接口都能执行才允许继续。
check_codegraph_cli() {
  codegraph_candidate_ok "$1"
}
# 复用正确 CLI；缺失或损坏时仅安装一次官方包。
ensure_codegraph() {
  if codegraph_find_cli; then
    codegraph_log "✔ 复用 CodeGraph：$CODEGRAPH_BIN；版本：$("$CODEGRAPH_BIN" --version)"
    return 0
  fi
  codegraph_install_cli
}
# 校验自己目标数据库和 JSON，不允许 CLI 回退到父目录冒充成功。
validate_index_status() {
  codegraph_require_target_schema
  codegraph_read_status
  codegraph_validate_status "${1:-complete}"
}
# 临时样例真实建图，验证解析引擎及数据库；不改动业务工程。
check_codegraph_engine() {
  (( CHECK_ONLY == 0 )) || return 0
  SAMPLE_DIR="$(/usr/bin/mktemp -d "${TMPDIR:-/tmp}/jobs-codegraph-health.XXXXXX")" || codegraph_stop '无法创建体检样例目录'
  print -r -- 'export function jobsCodeGraphHealth(value) { return value + 1; }' > "$SAMPLE_DIR/health.js"
  codegraph_run_logged env CODEGRAPH_NO_WATCH=1 "$CODEGRAPH_BIN" init --yes "$SAMPLE_DIR" || codegraph_stop 'CodeGraph 解析引擎样例建图失败'
  (
    CODEGRAPH_TARGET_DIRECTORY="$(cd -P -- "$SAMPLE_DIR" && pwd)"
    validate_index_status complete
    [[ "$(codegraph_status_field nodeCount)" == <-> && "$(codegraph_status_field nodeCount)" -gt 0 ]] || codegraph_stop '样例没有生成符号节点'
  ) || codegraph_stop 'CodeGraph 解析引擎样例数据库复检失败'
  codegraph_log '✔ CodeGraph 隔离样例真实建图与数据库体检通过。'
}
# 已有地图先校验身份再同步；同步失败时保留数据库并尝试全量索引一次。
run_codegraph_index() {
  (( CHECK_ONLY == 0 )) || { codegraph_log '✔ 只读体检完成，未安装、建图或导出。'; return 0; }
  local result=0
  if [[ -f "$PROJECT_ROOT/.codegraph/codegraph.db" ]]; then
    validate_index_status identity
    if ! codegraph_run_logged "$CODEGRAPH_BIN" sync "$PROJECT_ROOT"; then
      codegraph_log '⚠ 增量同步失败，尝试一次全量 index。'
      codegraph_run_logged "$CODEGRAPH_BIN" index "$PROJECT_ROOT" || codegraph_stop 'CodeGraph sync / index 均失败'
    fi
  else
    codegraph_run_logged "$CODEGRAPH_BIN" init --yes "$PROJECT_ROOT" || codegraph_stop 'CodeGraph 首次初始化失败'
  fi
  validate_index_status complete
  codegraph_log "✔ 当前工程代码地图更新通过：$PROJECT_ROOT/.codegraph"
}
# 导出期间提供心跳，超时或失败如实告警；不把导出成功与索引成功混为一谈。
run_export_with_heartbeat() {
  local export_script="$1" child_pid="" elapsed=0 result=0
  local heartbeat="${CODEGRAPH_EXPORT_HEARTBEAT_SECONDS:-10}" timeout="${CODEGRAPH_EXPORT_TIMEOUT_SECONDS:-0}"
  [[ "$heartbeat" == <-> && "$heartbeat" -gt 0 ]] || heartbeat=10
  [[ "$timeout" == <-> ]] || timeout=0
  /bin/zsh "$export_script" >> "$CODEGRAPH_LOG_FILE" 2>&1 &
  child_pid=$!
  EXPORT_PID="$child_pid"
  while /bin/kill -0 "$child_pid" 2>/dev/null; do
    /bin/sleep 1
    (( elapsed += 1 ))
    if (( elapsed % heartbeat == 0 )); then
      codegraph_log "ℹ Markdown 导出仍在运行：${elapsed}s；PID=$child_pid"
    fi
    if (( timeout > 0 && elapsed >= timeout )); then
      /bin/kill "$child_pid" 2>/dev/null
      /bin/sleep 2
      /bin/kill -9 "$child_pid" 2>/dev/null
      wait "$child_pid" 2>/dev/null
      EXPORT_PID=""
      return 124
    fi
  done
  wait "$child_pid" || result=$?
  EXPORT_PID=""
  return "$result"
}
# 沿用既有导出参数与开关，在后台 hook 内同步等待，确保项目锁覆盖导出。
export_codegraph_markdown() {
  (( CHECK_ONLY == 0 )) || return 0
  [[ "${CODEGRAPH_SKIP_EXPORT:-0}" != 1 ]] || { codegraph_log 'ℹ CODEGRAPH_SKIP_EXPORT=1，跳过 Markdown。'; return 0; }
  local export_script="$PROJECT_ROOT/ScriptsByPods/codegraph_export_md.command/codegraph_export_md.command" result=0
  [[ -f "$export_script" ]] || { codegraph_log "⚠ 导出脚本不存在，索引已完成：$export_script"; return 0; }
  export CODEGRAPH_MD_OUT_DIR="${CODEGRAPH_MD_OUT_DIR:-.codegraph/codegraph.md}"
  export CODEGRAPH_DB_PATH=.codegraph/codegraph.db
  if [[ "${CODEGRAPH_EXPORT_ASYNC:-0}" == 1 ]]; then
    codegraph_log 'ℹ 已在安装后的后台任务中导出；为覆盖项目锁，本任务等待导出完成。'
  fi
  run_export_with_heartbeat "$export_script" || result=$?
  (( result == 0 )) || codegraph_stop "索引已完成，Markdown 导出失败或超时，退出码=$result" "$result"
  codegraph_log "✔ Markdown 导出完成：$CODEGRAPH_MD_OUT_DIR"
}
# 汇总当前项目产物与日志。
print_summary() {
  codegraph_log "ℹ 流程结束：$PROJECT_ROOT/.codegraph；日志：$CODEGRAPH_LOG_FILE"
}
# 为自述提供红色标题、蓝色正文和纯文本降级。
codegraph_intro_line() {
  local role="$1" message="$2"
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    if [[ "$role" == title ]]; then
      printf '\033[1;31m%s\033[0m\n' "$message"
    else
      printf '\033[0;34m%s\033[0m\n' "$message"
    fi
  else
    print -r -- "$message"
  fi
}
# 同步输出终端信息与纯文本日志。
codegraph_log() {
  print -r -- "$*" | /usr/bin/tee -a "$CODEGRAPH_LOG_FILE"
}
# 给出具体失败层并停止后续动作。
codegraph_stop() {
  codegraph_log "✖ $1；日志：$CODEGRAPH_LOG_FILE"
  exit "${2:-1}"
}
# 透传命令和日志写入的失败状态。
codegraph_run_logged() {
  local -a results
  codegraph_log "▶ 执行：${(j: :)${(q)@}}"
  "$@" 2>&1 | /usr/bin/tee -a "$CODEGRAPH_LOG_FILE"
  results=( "${pipestatus[@]}" )
  (( results[1] == 0 )) || return "${results[1]}"
  (( results[2] == 0 )) || return "${results[2]}"
}
# 固定精确目标并拒绝地图链接跨目录写入。
codegraph_check_target() {
  local map_entry=""
  [[ -n "$CODEGRAPH_TARGET_DIRECTORY" && -d "$CODEGRAPH_TARGET_DIRECTORY" ]] || codegraph_stop "目标目录不存在：$CODEGRAPH_TARGET_DIRECTORY"
  cd -P -- "$CODEGRAPH_TARGET_DIRECTORY" || codegraph_stop "无法进入目标目录：$CODEGRAPH_TARGET_DIRECTORY"
  CODEGRAPH_TARGET_DIRECTORY="$PWD"
  [[ ! -L "$PWD/.codegraph" ]] || codegraph_stop '目标 .codegraph 是符号链接，已停止以免写入其它位置'
  [[ ! -e "$PWD/.codegraph" || -d "$PWD/.codegraph" ]] || codegraph_stop '目标 .codegraph 已存在但不是目录'
  for map_entry in "$PWD/.codegraph"/*(DN); do
    [[ ! -L "$map_entry" ]] || codegraph_stop "地图直属条目是符号链接，已停止以免数据库、锁文件或内部配置写到其它位置：$map_entry"
  done
  [[ -x /usr/bin/plutil ]] || codegraph_stop '缺少 macOS plutil，无法核对地图 JSON 结果'
  [[ "$(print -r -- '{"health":true}' | /usr/bin/plutil -extract health raw -o - - 2>> "$CODEGRAPH_LOG_FILE")" == true ]] || codegraph_stop '系统 plutil 无法解析 JSON，停止地图操作'
  [[ -x /usr/bin/sqlite3 ]] && /usr/bin/sqlite3 -batch -init /dev/null -version >> "$CODEGRAPH_LOG_FILE" 2>&1 || codegraph_stop '系统 SQLite 不可用，无法在不访问父项目的前提下核对地图数据库'
  codegraph_log '✔ 地图校验工具：SQLite 只读接口、plutil JSON 解析健康。'
}
# 核对 CLI 身份及必需命令能力，禁用 shim 隐式下载。
codegraph_candidate_ok() {
  local candidate="$1"
  [[ -n "$candidate" && -x "$candidate" ]] || return 1
  local help_text=""
  help_text="$("$candidate" --help 2>> "$CODEGRAPH_LOG_FILE")" || return 1
  [[ "$help_text" == *'Code intelligence and knowledge graph'* ]] || return 1
  print -r -- "$help_text" >> "$CODEGRAPH_LOG_FILE"
  "$candidate" --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$candidate" init --help >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$candidate" sync --help >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$candidate" index --help >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$candidate" status --help >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
}
# 搜索当前环境与已知安装前缀，避免 PATH 未加载导致重复安装。
codegraph_find_cli() {
  local candidate=""
  local -a candidates=( "$CODEGRAPH_PREFIX/bin/codegraph" "$(command -v codegraph 2>/dev/null)"
    /opt/homebrew/bin/codegraph /usr/local/bin/codegraph "$HOME/.local/bin/codegraph"
    "$HOME/.npm-global/bin/codegraph" "${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}/bin/codegraph"
    "$HOME/.homebrew/bin/codegraph" )
  for candidate in "${candidates[@]}"; do
    if codegraph_candidate_ok "$candidate"; then
      CODEGRAPH_BIN="$candidate"
      return 0
    fi
  done
  return 1
}
# 实际执行引导工具与 CLT，未就绪时给出人工恢复入口。
codegraph_check_installation_tools() {
  local curl_bin="$(command -v curl 2>/dev/null)" selector_bin="$(command -v xcode-select 2>/dev/null)"
  local xcrun_bin="$(command -v xcrun 2>/dev/null)" clang_bin="" developer_path=""
  [[ -x /bin/bash ]] && /bin/bash --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || codegraph_stop '系统 bash 不可用，无法引导 Homebrew'
  [[ -n "$curl_bin" ]] && "$curl_bin" --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || codegraph_stop 'curl 不可用，请先修复系统下载工具'
  [[ -n "$selector_bin" && -n "$xcrun_bin" ]] || codegraph_stop '缺少 xcode-select/xcrun，请先准备 Apple Command Line Tools'
  developer_path="$("$selector_bin" -p 2>> "$CODEGRAPH_LOG_FILE")"
  clang_bin="$("$xcrun_bin" --find clang 2>> "$CODEGRAPH_LOG_FILE")"
  if [[ -z "$developer_path" || ! -d "$developer_path" || -z "$clang_bin" || ! -x "$clang_bin" ]] ||
     ! "$clang_bin" --version >> "$CODEGRAPH_LOG_FILE" 2>&1; then
    codegraph_log '⚠ Command Line Tools 不可用，请先完成系统安装后重跑本入口。'
    codegraph_log '请在终端运行 xcode-select --install，完成系统安装后重跑。'
    codegraph_stop 'Command Line Tools 尚未就绪，本次未继续安装下游组件'
  fi
  codegraph_log '✔ bash、curl 和 Command Line Tools 健康检查通过。'
}
# 体检已有 Homebrew，缺失时安装一次后重新激活。
codegraph_ensure_homebrew() {
  if ! JOBS_HOMEBREW_BIN="$(jobs_brew_find)"; then
    require_installation Homebrew
    codegraph_log '━━━━━━━━━━ 来源｜Homebrew ━━━━━━━━━━'
    codegraph_log '📥 系统安装器：https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'
    codegraph_log '📥 用户目录来源：https://github.com/Homebrew/brew.git（官方最新稳定发布）'
    jobs_brew_choose_installation || codegraph_stop 'Homebrew 安装路径选择已取消'
    case "$JOBS_HOMEBREW_INSTALL_MODE" in
      system) jobs_brew_install_system || codegraph_stop '系统目录 Homebrew 安装失败' ;;
      user) jobs_brew_install_user || codegraph_stop '用户目录 Homebrew 安装失败' ;;
      *) codegraph_stop 'Homebrew 安装路径选择无效' ;;
    esac
  fi
  jobs_brew_activate || codegraph_stop 'Homebrew 当前进程环境激活失败'
  codegraph_run_logged "$JOBS_HOMEBREW_BIN" --version || codegraph_stop 'Homebrew 版本检查失败'
  codegraph_run_logged "$JOBS_HOMEBREW_BIN" config || codegraph_stop 'Homebrew 配置检查失败'
  if ! codegraph_run_logged "$JOBS_HOMEBREW_BIN" doctor; then
    codegraph_log '⚠ Homebrew doctor 有诊断提示；用户前缀或无关公式警告不等于本次依赖不可用，继续按实际 Node/npm 健康检查判断。'
  fi
}
# Node 执行 JS，npm 校验版本与只读配置。
codegraph_node_npm_ok() {
  [[ -x "$CODEGRAPH_NODE_BIN" && -x "$CODEGRAPH_NPM_BIN" ]] || return 1
  "$CODEGRAPH_NODE_BIN" --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$CODEGRAPH_NODE_BIN" -e 'if (Number(process.versions.node.split(".")[0]) < 20) process.exit(1); require("node:fs"); require("node:path");' >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$CODEGRAPH_NPM_BIN" --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$CODEGRAPH_NPM_BIN" config get prefix >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$CODEGRAPH_NPM_BIN" root --global >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
}
# 搜索当前和 Brew 已有的成套 Node/npm。
codegraph_find_node_npm() {
  local node_path="$(command -v node 2>/dev/null)" candidate="" formula="" prefix=""
  local -a candidates=()
  [[ -z "$node_path" ]] || candidates+=( "${node_path:h}" )
  for formula in node@24 node node@22; do
    [[ -n "${JOBS_HOMEBREW_BIN:-}" && -x "$JOBS_HOMEBREW_BIN" ]] || break
    prefix="$("$JOBS_HOMEBREW_BIN" --prefix "$formula" 2>> "$CODEGRAPH_LOG_FILE")" || continue
    [[ "$prefix" != /* ]] || candidates+=( "$prefix/bin" )
  done
  for candidate in "${candidates[@]}"; do
    CODEGRAPH_NODE_BIN="$candidate/node"
    CODEGRAPH_NPM_BIN="$candidate/npm"
    export PATH="$candidate:$PATH"
    rehash
    codegraph_node_npm_ok && return 0
  done
  return 1
}
# 只修复缺失或损坏层，安装后立即复检。
codegraph_ensure_node_npm() {
  local node_prefix="" operation=install
  if codegraph_find_node_npm; then
    codegraph_log "✔ 复用健康 Node/npm：$CODEGRAPH_NODE_BIN / $CODEGRAPH_NPM_BIN"
    return 0
  fi
  require_installation Node/npm
  "$JOBS_HOMEBREW_BIN" list --versions node@24 >> "$CODEGRAPH_LOG_FILE" 2>&1 && operation=reinstall
  codegraph_log '━━━━━━━━━━ 来源｜Node.js / npm ━━━━━━━━━━'
  codegraph_log "📥 来源：Homebrew 官方 node@24 公式；动作：$operation；包下载地址由 Homebrew 解析"
  codegraph_run_logged "$JOBS_HOMEBREW_BIN" "$operation" node@24 || codegraph_stop 'Homebrew Node.js 安装或修复失败'
  node_prefix="$("$JOBS_HOMEBREW_BIN" --prefix node@24 2>> "$CODEGRAPH_LOG_FILE")" || codegraph_stop '无法读取 node@24 安装前缀'
  [[ "$node_prefix" == /* && -d "$node_prefix" ]] || codegraph_stop 'node@24 返回了无效安装前缀'
  CODEGRAPH_NODE_BIN="$node_prefix/bin/node"
  CODEGRAPH_NPM_BIN="$node_prefix/bin/npm"
  export PATH="$node_prefix/bin:$PATH"
  rehash
  codegraph_node_npm_ok || codegraph_stop 'Node/npm 安装后复检失败；停止，不反复安装'
  codegraph_log '✔ Node/npm 安装后健康检查通过。'
}
# 使用明确官方 Registry 与独立用户前缀安装正确产品。
codegraph_install_cli() {
  require_installation CodeGraph
  [[ ! -L "$CODEGRAPH_PREFIX" ]] || codegraph_stop "CodeGraph 安装前缀是符号链接：$CODEGRAPH_PREFIX"
  codegraph_log '━━━━━━━━━━ 来源｜CodeGraph ━━━━━━━━━━'
  codegraph_log '📦 包：@colbymchenry/codegraph@latest（官方 scoped npm 包）'
  codegraph_log "📥 Registry：$CODEGRAPH_NPM_REGISTRY；目标：$CODEGRAPH_PREFIX"
  codegraph_run_logged "$CODEGRAPH_NPM_BIN" ping --registry "$CODEGRAPH_NPM_REGISTRY" --fetch-retries=1 --fetch-timeout=30000 || codegraph_stop 'npm 官方 Registry 不可用，未开始安装 CodeGraph'
  codegraph_run_logged "$CODEGRAPH_NPM_BIN" install --global --prefix "$CODEGRAPH_PREFIX" --registry "$CODEGRAPH_NPM_REGISTRY" --include=optional --engine-strict --fetch-retries=1 --fetch-timeout=60000 '@colbymchenry/codegraph@latest' || codegraph_stop 'CodeGraph 官方 npm 包安装失败'
  CODEGRAPH_BIN="$CODEGRAPH_PREFIX/bin/codegraph"
  export PATH="$CODEGRAPH_PREFIX/bin:$PATH"
  rehash
  codegraph_candidate_ok "$CODEGRAPH_BIN" || codegraph_stop 'CodeGraph 安装后版本或 CLI 接口复检失败；停止，不反复安装'
  codegraph_log "✔ CodeGraph 安装后健康检查通过：$CODEGRAPH_BIN"
}
# 单独收集 JSON，避免 stderr 污染状态解析。
codegraph_read_status() {
  CODEGRAPH_STATUS_JSON="$("$CODEGRAPH_BIN" status --json "$CODEGRAPH_TARGET_DIRECTORY" 2>> "$CODEGRAPH_LOG_FILE")"
  local command_result=$?
  (( command_result == 0 )) || codegraph_stop 'CodeGraph 状态读取失败' "$command_result"
  codegraph_log "$CODEGRAPH_STATUS_JSON"
}
# 先检查目标自身数据库，阻止 CLI 回退父目录。
codegraph_require_target_schema() {
  local database_path="$CODEGRAPH_TARGET_DIRECTORY/.codegraph/codegraph.db" schema_result="" uri_path=""
  [[ -f "$database_path" ]] || codegraph_stop '目标地图数据库尚未生成，未读取可能属于父项目的状态'
  if ! schema_result="$(/usr/bin/sqlite3 -batch -readonly -init /dev/null "$database_path" "SELECT 1 FROM sqlite_master WHERE type='table' AND name='nodes' LIMIT 1;" 2>> "$CODEGRAPH_LOG_FILE")"; then
    # Apple SQLite 在 WAL 库没有 sidecar 时只读打开失败；仅无 WAL 时读取主库 schema，不能忽略活跃 WAL。
    [[ ! -e "${database_path}-wal" ]] || codegraph_stop '目标数据库含 WAL 且无法只读校验，请先排查锁定或权限问题'
    uri_path="$(print -rn -- "$database_path" | /usr/bin/sed -e 's/%/%25/g' -e 's/?/%3F/g' -e 's/#/%23/g')"
    schema_result="$(/usr/bin/sqlite3 -batch -readonly -init /dev/null "file:${uri_path}?mode=ro&immutable=1" "SELECT 1 FROM sqlite_master WHERE type='table' AND name='nodes' LIMIT 1;" 2>> "$CODEGRAPH_LOG_FILE")" || codegraph_stop '目标地图数据库无法只读校验，请先排查数据库损坏或锁定问题'
    [[ ! -e "${database_path}-wal" ]] || codegraph_stop 'schema 兼容检查期间出现 WAL，保留数据库并停止，请重试'
    codegraph_log 'ℹ 已使用无 WAL 主库的只读 schema 兼容检查；完整索引状态仍由 CLI 验证。'
  fi
  [[ "$schema_result" == 1 ]] || codegraph_stop '目标数据库缺少 CodeGraph nodes 表，保留原文件且不访问父项目地图'
}
# 使用系统 JSON 解析器读取必需字段。
codegraph_status_field() {
  /usr/bin/plutil -extract "$1" raw -o - - <<< "$CODEGRAPH_STATUS_JSON" 2>/dev/null
}
# 核对项目身份、产物位置、索引时间和完整状态。
codegraph_validate_status() {
  local initialized="" project_path="" index_path="" last_indexed="" index_state="" field="" count=""
  initialized="$(codegraph_status_field initialized)" || codegraph_stop 'JSON 缺少 initialized 字段'
  project_path="$(codegraph_status_field projectPath)" || codegraph_stop 'JSON 缺少 projectPath 字段'
  index_path="$(codegraph_status_field indexPath)" || codegraph_stop 'JSON 缺少 indexPath 字段'
  [[ "$initialized" == true && "$project_path" == "$CODEGRAPH_TARGET_DIRECTORY" && "$index_path" == "$CODEGRAPH_TARGET_DIRECTORY/.codegraph" ]] || codegraph_stop '地图项目身份或输出位置不匹配，未继续处理其它目录'
  if [[ "${1:-}" == complete ]]; then
    last_indexed="$(codegraph_status_field lastIndexed)" || codegraph_stop 'JSON 缺少索引时间'
    index_state="$(codegraph_status_field index.state)" || codegraph_stop 'JSON 缺少索引完整状态'
    [[ -n "$last_indexed" && "$last_indexed" != null && "$index_state" == complete && -d "$CODEGRAPH_TARGET_DIRECTORY/.codegraph" ]] || codegraph_stop '地图索引未完成或产物不存在'
    for field in pendingChanges.added pendingChanges.modified pendingChanges.removed index.pendingRefs; do
      count="$(codegraph_status_field "$field")" || codegraph_stop "JSON 缺少索引核验字段：$field"
      [[ "$count" == 0 ]] || codegraph_stop "地图仍存在待处理变更或解析问题：$field=$count"
    done
    for field in index.filesNeedingReindex index.filesWithParseErrors; do
      if count="$(codegraph_status_field "$field")"; then
        [[ "$count" == 0 ]] || codegraph_stop "地图仍存在待处理变更或解析问题：$field=$count"
      fi
    done
  fi
}
# >>> Jobs Homebrew install choice >>>
# 输出安装诊断，避免混入返回的命令路径。
jobs_brew_note() {
  codegraph_log "ℹ $*" >&2
}
# 验证候选能够执行；共享安装只读不代表未安装。
jobs_brew_candidate_ok() {
  local candidate="$1" prefix
  [[ -n "$candidate" && -x "$candidate" ]] || return 1
  HOMEBREW_NO_AUTO_UPDATE=1 "$candidate" --version >/dev/null 2>&1 || return 1
  prefix="$("$candidate" --prefix 2>/dev/null)" || return 1
  [[ "$prefix" == /* && -d "$prefix" ]]
}
# 发现既有健康安装，不以目录可写性决定是否重新安装。
jobs_brew_find() {
  local candidate
  local -a candidates
  candidates=("${JOBS_HOMEBREW_BIN:-}" "$(command -v brew 2>/dev/null)" /opt/homebrew/bin/brew /usr/local/bin/brew
    "${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}/bin/brew" "$HOME/.homebrew/bin/brew")
  for candidate in "${candidates[@]}"; do
    if jobs_brew_candidate_ok "$candidate"; then
      print -r -- "$candidate"
      return 0
    fi
  done
  return 1
}
# 计算官方系统目录；实际支持范围和授权交由官方安装器处理。
jobs_brew_system_prefix() {
  case "$(/usr/bin/uname -m)" in
    arm64) print -r -- /opt/homebrew ;;
    *) print -r -- /usr/local ;;
  esac
}
# 缺失时强提示选择安装路径；YES 只表示选择系统目录，不验证密码或权限。
jobs_brew_choose_installation() {
  local answer="" system_prefix="$(jobs_brew_system_prefix)"
  if [[ ! -t 0 || ! -t 2 || "${IS_SOURCETREE_RUNTIME:-0}" == 1 ]]; then
    jobs_brew_note "缺少 Homebrew，需要人工选择安装路径；请在可交互终端重新运行，未执行安装。"
    return 1
  fi
  print -u2 -r -- "⚠ Homebrew 尚未就绪，必须先选择安装路径："
  print -u2 -r -- "1、输入精确大写 YES：选择系统标准目录 $system_prefix（Apple Silicon：/opt/homebrew；Intel：/usr/local）。"
  print -u2 -r -- "   这表示你准备向系统目录安装；官方安装器可能随后要求管理员密码，并自行验证权限。"
  print -u2 -r -- "2、其它输入或直接回车：选择用户目录 ${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}，不使用 sudo；有管理员权限也可选此路径。"
  print -u2 -r -- "本步骤只选择路径，不收集或验证密码；选定路径失败就停止，不自动切换。按 Ctrl+C 取消整个任务。"
  print -u2 -n -r -- "➤ 安装路径选择："
  if ! IFS= read -r answer; then
    jobs_brew_note "输入已取消或结束，停止安装。"
    return 1
  fi
  if [[ "$answer" == YES ]]; then
    typeset -g JOBS_HOMEBREW_INSTALL_MODE=system
    jobs_brew_note "已选择系统安装目录：$system_prefix"
  else
    typeset -g JOBS_HOMEBREW_INSTALL_MODE=user
    jobs_brew_note "已选择用户安装目录：${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}"
  fi
}
# 将官方系统安装器下载到临时文件后执行，失败不自动改装到用户目录。
jobs_brew_install_system() {
  local installer system_prefix="$(jobs_brew_system_prefix)" installer_result=0
  command -v curl >/dev/null 2>&1 || { jobs_brew_note "缺少 curl，无法获取官方安装器。"; return 1; }
  installer="$(mktemp "${TMPDIR:-/tmp}/jobs-homebrew-install.XXXXXX")" || return 1
  if curl -fsSL --connect-timeout 10 --max-time 120 https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o "$installer"; then
    codegraph_run_logged /bin/bash "$installer" || installer_result=$?
  else
    installer_result=1
  fi
  rm -- "$installer"
  if (( installer_result != 0 )); then
    jobs_brew_note "系统目录安装失败（退出码 $installer_result）；停止，不自动切换安装路径。"
    return 1
  fi
  typeset -g JOBS_HOMEBREW_BIN="$system_prefix/bin/brew"
  jobs_brew_candidate_ok "$JOBS_HOMEBREW_BIN" || { jobs_brew_note "官方安装器结束后未找到健康 Homebrew：$JOBS_HOMEBREW_BIN"; return 1; }
}
# 克隆官方稳定版本到用户目录；不覆盖非空目录，不调用 sudo。
jobs_brew_install_user() {
  local prefix="${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}" stage release_tag git_bin
  [[ "$prefix" == /* && "$prefix" != / && "$prefix" != *[[:space:]:]* ]] || {
    jobs_brew_note "Homebrew 用户前缀须为不含空白或冒号的绝对目录：$prefix"
    return 1
  }
  if [[ -L "$prefix" || ( -e "$prefix" && ! -d "$prefix" ) || ( -d "$prefix" && -n "$(ls -A "$prefix" 2>/dev/null)" ) ]]; then
    jobs_brew_note "用户安装目标非空或不是普通目录，不覆盖：$prefix"
    return 1
  fi
  git_bin="$(command -v git 2>/dev/null)"
  [[ -n "$git_bin" ]] && "$git_bin" --version >/dev/null 2>&1 || { jobs_brew_note "用户目录安装需要可用 Git；请先准备 Git / Command Line Tools。"; return 1; }
  command -v curl >/dev/null 2>&1 || { jobs_brew_note "缺少 curl，无法获取官方稳定版本。"; return 1; }
  export HOMEBREW_NO_SUDO=1
  mkdir -p "${prefix:h}" || return 1
  stage="$(mktemp -d "${prefix:h}/.jobs-homebrew.XXXXXX")" || return 1
  if ! curl -fsSL --connect-timeout 10 --max-time 60 https://api.github.com/repos/Homebrew/brew/releases/latest -o "$stage/release.json"; then
    rm -r -- "$stage"
    jobs_brew_note "获取官方稳定版本失败，停止安装。"
    return 1
  fi
  release_tag="$(/usr/bin/plutil -extract tag_name raw -o - "$stage/release.json" 2>/dev/null)"
  if [[ ! "$release_tag" =~ '^[0-9]+\.[0-9]+\.[0-9]+$' ]] ||
     ! GIT_TERMINAL_PROMPT=0 codegraph_run_logged "$git_bin" -c http.lowSpeedLimit=1 -c http.lowSpeedTime=60 clone --depth 1 --branch "$release_tag" --single-branch https://github.com/Homebrew/brew.git "$stage/brew" ||
     ! "$git_bin" -C "$stage/brew" checkout -b stable ||
     ! "$git_bin" -C "$stage/brew" config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*' ||
     ! mkdir -p "$stage/brew/Cellar" "$stage/brew/Caskroom" "$stage/brew/etc" "$stage/brew/var"; then
    rm -r -- "$stage"
    jobs_brew_note "Homebrew 用户目录初始化失败，停止安装。"
    return 1
  fi
  # 空目录也只在下载成功后移除，避免提前改动用户的目标目录。
  if [[ -d "$prefix" ]] && ! rmdir -- "$prefix"; then
    rm -r -- "$stage"
    return 1
  fi
  if ! mv "$stage/brew" "$prefix"; then
    rm -r -- "$stage"
    return 1
  fi
  rm -r -- "$stage"
  typeset -g JOBS_HOMEBREW_BIN="$prefix/bin/brew"
  jobs_brew_candidate_ok "$JOBS_HOMEBREW_BIN" || { jobs_brew_note "用户目录安装后复检失败：$prefix"; return 1; }
}
# 仅激活当前子进程，不持久化用户 Shell 或其它全局配置。
jobs_brew_activate() {
  local brew_env
  brew_env="$("$JOBS_HOMEBREW_BIN" shellenv)" || return 1
  eval "$brew_env" || return 1
  typeset -g JOBS_HOMEBREW_PREFIX="$("$JOBS_HOMEBREW_BIN" --prefix)"
  [[ "$JOBS_HOMEBREW_PREFIX" == /* && -d "$JOBS_HOMEBREW_PREFIX" ]] || return 1
  export PATH="$JOBS_HOMEBREW_PREFIX/bin:$JOBS_HOMEBREW_PREFIX/sbin:$PATH"
  rehash
  HOMEBREW_NO_AUTO_UPDATE=1 "$JOBS_HOMEBREW_BIN" config >/dev/null || return 1
}
# <<< Jobs Homebrew install choice <<<

# 编排确认、依赖体检和安装后地图更新。
main() {
  show_script_intro_and_wait "$@" # 首先展示用途、安装范围与取消方式。
  initialize_runtime "$@" # 确认后解析参数与初始化独立日志。
  codegraph_check_target # 拒绝跨项目地图链接并检查结果校验工具。
  acquire_project_lock # 同工程已有活跃任务时安全跳过。
  acquire_toolchain_lock # 串行化跨工程的环境安装与修复。
  check_system_toolchain # 验证安装引导依赖和 Apple 工具链。
  check_export_runtime # 验证 SQLite 实际执行能力。
  ensure_brew # 体检 Homebrew，缺失时按既有路径规则处理。
  ensure_node_npm # 复用健康 Node/npm，必要时 Brew 安装修复。
  ensure_codegraph # 复用健康 CLI 或安装官方 scoped npm 包。
  check_codegraph_engine # 用隔离样例验证解析器和数据库写入。
  release_toolchain_lock # 样例复检通过后允许其它工程检查环境。
  run_codegraph_index # 更新当前工程并核对完整索引状态。
  export_codegraph_markdown # 沿用现有 Markdown 导出能力。
  print_summary # 输出产物和日志位置。
}
main "$@"
