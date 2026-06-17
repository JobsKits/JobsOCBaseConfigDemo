#!/bin/zsh
set -u
setopt NO_NOMATCH

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"
SCRIPT_BASENAME="$(basename "$0" | sed 's/\.[^.]*$//')"
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
: > "$LOG_FILE"

LABEL="[CodeGraph]"

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }

fail() {
  error_echo "$1"
  exit 1
}

lowercase() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]'
}

add_path_if_exists() {
  local dir="$1"
  if [[ -d "$dir" ]]; then
    case ":$PATH:" in
      *":$dir:"*) ;;
      *) export PATH="$dir:$PATH" ;;
    esac
  fi
}

resolve_project_root() {
  cd "$SCRIPT_DIR/../.." && pwd
}

ask_any_to_run() {
  local message="$1"
  local answer=""

  if [[ "${CODEGRAPH_UPGRADE:-0}" == "1" ]]; then
    return 0
  fi

  if [[ ! -t 0 ]]; then
    return 1
  fi

  read -r "?${message}（直接回车跳过；输入任意字符后回车执行）：" answer
  [[ -n "$answer" ]]
}

should_run() {
  if [[ "${CODEGRAPH_AUTO_INIT:-0}" == "1" ]]; then
    info_echo "检测到 CODEGRAPH_AUTO_INIT=1，跳过交互确认，直接执行。"
    return 0
  fi

  if [[ ! -t 0 ]]; then
    warn_echo "当前不是交互式终端，跳过 CodeGraph。需要强制执行可设置 CODEGRAPH_AUTO_INIT=1。"
    return 1
  fi

  local answer=""
  echo ""
  read -r "?${LABEL} pod install 已完成。按回车自检/安装 CodeGraph、更新索引并导出深度 Markdown；输入 n 跳过：" answer
  answer="$(lowercase "${answer:-}")"

  case "$answer" in
    n|no|q|quit|s|skip|跳过)
      warn_echo "已跳过 CodeGraph。"
      return 1
      ;;
    *)
      return 0
      ;;
  esac
}

find_brew() {
  if command -v brew >/dev/null 2>&1; then
    BREW_BIN="$(command -v brew)"
    return 0
  fi

  if [[ -x /opt/homebrew/bin/brew ]]; then
    BREW_BIN="/opt/homebrew/bin/brew"
    return 0
  fi

  if [[ -x /usr/local/bin/brew ]]; then
    BREW_BIN="/usr/local/bin/brew"
    return 0
  fi

  return 1
}

load_brew_shellenv() {
  if [[ -n "${BREW_BIN:-}" ]]; then
    eval "$("$BREW_BIN" shellenv)"
  fi
}

ensure_brew() {
  add_path_if_exists /opt/homebrew/bin
  add_path_if_exists /usr/local/bin

  if find_brew; then
    load_brew_shellenv
    success_echo "Homebrew 已就绪：$(brew --version | head -n 1)"
    return 0
  fi

  if [[ "$(uname -s)" != "Darwin" ]]; then
    fail "未检测到 Homebrew，且当前不是 macOS，无法自动安装。"
  fi

  command -v curl >/dev/null 2>&1 || fail "未检测到 curl，无法安装 Homebrew。"

  warn_echo "未检测到 Homebrew，开始安装 Homebrew。"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || fail "Homebrew 安装失败。"

  find_brew || fail "Homebrew 安装后仍不可用，请检查 PATH。"
  load_brew_shellenv
  success_echo "Homebrew 安装完成：$(brew --version | head -n 1)"
}

ensure_npm() {
  add_path_if_exists /opt/homebrew/bin
  add_path_if_exists /usr/local/bin

  if command -v npm >/dev/null 2>&1; then
    success_echo "npm 已就绪：$(npm --version)"
    return 0
  fi

  warn_echo "未检测到 npm，使用 Homebrew 安装 node。"
  brew install node || fail "通过 Homebrew 安装 node/npm 失败。"
  hash -r 2>/dev/null || true

  local brew_prefix=""
  brew_prefix="$(brew --prefix 2>/dev/null || true)"
  [[ -n "$brew_prefix" ]] && add_path_if_exists "$brew_prefix/bin"

  command -v npm >/dev/null 2>&1 || fail "node 安装后仍未检测到 npm，请检查 PATH。"
  success_echo "npm 安装完成：$(npm --version)"
}

add_npm_global_bin_to_path() {
  local npm_global_bin=""
  npm_global_bin="$(npm prefix -g 2>/dev/null)/bin"
  add_path_if_exists "$npm_global_bin"
}

ensure_codegraph() {
  add_npm_global_bin_to_path

  if command -v codegraph >/dev/null 2>&1; then
    success_echo "CodeGraph 已安装：$(codegraph --version 2>/dev/null || printf 'version unknown')"

    if ask_any_to_run "检测到已安装 CodeGraph，是否执行 npm 全局升级"; then
      info_echo "开始升级 CodeGraph：npm i -g @colbymchenry/codegraph"
      npm i -g @colbymchenry/codegraph || fail "CodeGraph 升级失败。"
      hash -r 2>/dev/null || true
      add_npm_global_bin_to_path
    else
      note_echo "已跳过 CodeGraph 升级，仅使用当前版本。"
    fi
  else
    warn_echo "未检测到 CodeGraph，开始安装：npm i -g @colbymchenry/codegraph"
    npm i -g @colbymchenry/codegraph || fail "CodeGraph 安装失败。"
    hash -r 2>/dev/null || true
    add_npm_global_bin_to_path
  fi

  command -v codegraph >/dev/null 2>&1 || fail "CodeGraph 安装后仍不可用，请检查 npm global bin。"
  success_echo "CodeGraph 已就绪：$(codegraph --version 2>/dev/null || printf 'version unknown')"
}

run_codegraph_index() {
  local db_path="${CODEGRAPH_DB_PATH:-.codegraph/codegraph.db}"

  if [[ -f "$db_path" ]]; then
    info_echo "检测到已有数据库：$db_path"
    info_echo "执行：codegraph sync"

    if codegraph sync; then
      success_echo "CodeGraph 增量同步完成。"
    else
      warn_echo "codegraph sync 失败，降级执行：codegraph index"
      codegraph index || fail "codegraph sync / codegraph index 均执行失败。"
      success_echo "CodeGraph 全量索引完成。"
    fi
  else
    info_echo "未检测到数据库，执行：codegraph init -i"

    if codegraph init -i; then
      success_echo "CodeGraph 初始化完成。"
    else
      warn_echo "codegraph init -i 执行失败，尝试执行：codegraph index"
      codegraph index || fail "codegraph init -i / codegraph index 均执行失败。"
    fi
  fi

  [[ -f "$db_path" ]] || fail "CodeGraph 执行结束，但未找到数据库：$db_path"
  success_echo "CodeGraph 数据库已就绪：$db_path"
}

run_export_with_heartbeat() {
  local export_script="$1"
  local heartbeat_seconds="${CODEGRAPH_EXPORT_HEARTBEAT_SECONDS:-10}"
  local timeout_seconds="${CODEGRAPH_EXPORT_TIMEOUT_SECONDS:-0}"

  [[ "$heartbeat_seconds" == <-> ]] || heartbeat_seconds=10
  [[ "$timeout_seconds" == <-> ]] || timeout_seconds=0

  info_echo "执行：CodeGraph Markdown 深度导出"
  gray_echo "输出目录：${CODEGRAPH_MD_OUT_DIR:-.codegraph/codegraph.md}"
  gray_echo "导出模式：前台等待 + 心跳日志；设置 CODEGRAPH_EXPORT_ASYNC=1 可后台导出。"
  gray_echo "心跳间隔：${heartbeat_seconds}s；超时：${timeout_seconds}s，0 表示不超时。"

  "$export_script" &
  local child_pid=$!
  local elapsed=0
  local status=0

  while kill -0 "$child_pid" 2>/dev/null; do
    sleep "$heartbeat_seconds"
    elapsed=$((elapsed + heartbeat_seconds))

    if ! kill -0 "$child_pid" 2>/dev/null; then
      break
    fi

    note_echo "CodeGraph Markdown 深度导出仍在运行：${elapsed}s；PID=${child_pid}；日志=/tmp/codegraph_export_md.log"

    if [[ -f /tmp/codegraph_export_md.log ]]; then
      gray_echo "最近日志："
      tail -n 5 /tmp/codegraph_export_md.log | sed 's/^/  /' | tee -a "$LOG_FILE"
    fi

    if (( timeout_seconds > 0 && elapsed >= timeout_seconds )); then
      warn_echo "导出超过 ${timeout_seconds}s，开始终止：$export_script"
      kill "$child_pid" 2>/dev/null || true
      sleep 2
      kill -9 "$child_pid" 2>/dev/null || true
      wait "$child_pid" 2>/dev/null || true
      return 124
    fi
  done

  wait "$child_pid"
  status=$?
  return "$status"
}

run_export_async() {
  local export_script="$1"
  local async_log="/tmp/codegraph_export_md.async.log"

  info_echo "后台执行：CodeGraph Markdown 深度导出"
  gray_echo "后台日志：$async_log"
  gray_echo "查看进度：tail -f $async_log"

  nohup "$export_script" > "$async_log" 2>&1 &
  local child_pid=$!
  echo "$child_pid" > ".codegraph/codegraph_export_md.pid"
  disown "$child_pid" 2>/dev/null || true

  success_echo "CodeGraph Markdown 深度导出已转入后台，PID=${child_pid}。"
}

export_codegraph_markdown() {
  if [[ "${CODEGRAPH_SKIP_EXPORT:-0}" == "1" ]]; then
    warn_echo "检测到 CODEGRAPH_SKIP_EXPORT=1，跳过 Markdown 导出。"
    return 0
  fi

  local export_script="$PROJECT_ROOT/ScriptsByPods/codegraph_export_md.command/codegraph_export_md.command"

  if [[ ! -f "$export_script" ]]; then
    warn_echo "未找到 Markdown 导出脚本，跳过：$export_script"
    return 0
  fi

  chmod +x "$export_script" 2>/dev/null || true

  export CODEGRAPH_MD_OUT_DIR="${CODEGRAPH_MD_OUT_DIR:-.codegraph/codegraph.md}"
  export CODEGRAPH_MD_EDGE_KINDS="${CODEGRAPH_MD_EDGE_KINDS:-auto}"
  export CODEGRAPH_MD_EDGE_SCAN_LIMIT="${CODEGRAPH_MD_EDGE_SCAN_LIMIT:-20000}"
  export CODEGRAPH_MD_EDGE_EXPORT_LIMIT="${CODEGRAPH_MD_EDGE_EXPORT_LIMIT:-5000}"
  export CODEGRAPH_MD_GRAPH_EDGE_LIMIT="${CODEGRAPH_MD_GRAPH_EDGE_LIMIT:-25}"
  export CODEGRAPH_MD_GRAPH_DIRECTION="${CODEGRAPH_MD_GRAPH_DIRECTION:-LR}"

  if [[ "${CODEGRAPH_EXPORT_ASYNC:-0}" == "1" ]]; then
    run_export_async "$export_script"
    return 0
  fi

  if run_export_with_heartbeat "$export_script"; then
    success_echo "CodeGraph Markdown 深度导出完成。"
    return 0
  fi

  local status=$?
  if [[ "$status" == "124" ]]; then
    warn_echo "CodeGraph Markdown 深度导出超时，数据库不受影响。"
  else
    warn_echo "CodeGraph Markdown 深度导出失败，退出码：$status。数据库不受影响。"
  fi

  return 0
}

print_summary() {
  echo "" | tee -a "$LOG_FILE"
  highlight_echo "CodeGraph 处理完成"
  gray_echo "工程目录：$PROJECT_ROOT"
  gray_echo "数据库：${CODEGRAPH_DB_PATH:-.codegraph/codegraph.db}"
  gray_echo "Markdown：${CODEGRAPH_MD_OUT_DIR:-.codegraph/codegraph.md}"
  gray_echo "日志：$LOG_FILE"
}

main() {
  PROJECT_ROOT="$(resolve_project_root)" || fail "无法定位工程根目录。"
  cd "$PROJECT_ROOT" || fail "无法进入工程根目录：$PROJECT_ROOT"

  should_run || exit 0

  highlight_echo "CodeGraph 初始化 / 同步 / 深度 Markdown 导出"
  info_echo "工程根目录：$PROJECT_ROOT"

  ensure_brew
  ensure_npm
  ensure_codegraph
  run_codegraph_index
  export_codegraph_markdown
  print_summary

  success_echo "CodeGraph 流程结束。"
}

main "$@"
