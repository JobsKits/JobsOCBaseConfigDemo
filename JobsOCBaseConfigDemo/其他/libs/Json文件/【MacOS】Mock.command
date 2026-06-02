#!/bin/zsh
set -euo pipefail

# ================================== 基础信息 ==================================

SCRIPT_PATH="${0:A}"
SCRIPT_BASENAME="$(basename "$0" | sed 's/\.[^.]*$//')"
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
HTTP_LOG_FILE="/tmp/${SCRIPT_BASENAME}_http_server.log"
SERVER_PID=""
PORT="8080"
HOST="127.0.0.1"

# ================================== 日志与彩色输出 ==================================

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }
bold_echo()      { log "\033[1m$1\033[0m"; }

print_divider() {
  gray_echo "=================================================="
}

pause_enter() {
  echo -n $'\n'"按回车继续..."$'\n' | tee -a "$LOG_FILE"
  IFS= read -r _
}

prompt_optional_upgrade() {
  local name="$1"
  local choice=""
  echo -n $'\n' | tee -a "$LOG_FILE"
  read -r -p "检测到已安装 ${name}，输入任意字符升级，直接回车跳过： " choice
  [[ -n "$choice" ]]
}

# ================================== 通用工具 ==================================

require_macos() {
  if [[ "$(uname -s)" != "Darwin" ]]; then
    error_echo "该脚本当前仅针对 macOS 设计，检测到系统不是 macOS"
    exit 1
  fi
}

require_basic_commands() {
  local missing=()
  local cmd

  for cmd in basename sed tee uname find sort grep cat ps kill sleep; do
    command -v "$cmd" >/dev/null 2>&1 || missing+=("$cmd")
  done

  if [[ ${#missing[@]} -gt 0 ]]; then
    error_echo "缺少基础命令：${missing[*]}"
    exit 1
  fi
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

get_cpu_arch() {
  [[ "$(uname -m)" == "arm64" ]] && echo "arm64" || echo "x86_64"
}

get_shell_name() {
  echo "${SHELL##*/}"
}

get_shell_profile_file() {
  local shell_name
  shell_name="$(get_shell_name)"

  case "$shell_name" in
    zsh)  echo "$HOME/.zprofile" ;;
    bash) echo "$HOME/.bash_profile" ;;
    *)    echo "$HOME/.profile" ;;
  esac
}

ensure_file_exists() {
  local file="$1"
  mkdir -p "$(dirname "$file")"
  touch "$file" 2>/dev/null || {
    error_echo "无法创建或写入配置文件：$file"
    return 1
  }
}

# ================================== 幂等环境注入 ==================================
# 说明：
# 1. 用 block header 做唯一标识，避免重复写入
# 2. 统一支持后续扩展 PATH / alias / tool env
# 3. 写入后立即 eval，让当前 shell 直接生效

append_block_if_missing() {
  local file="$1"
  local block_id="$2"
  local content="$3"

  local begin_marker="# >>> ${block_id} >>>"
  local end_marker="# <<< ${block_id} <<<"

  ensure_file_exists "$file" || return 1

  if grep -Fq "$begin_marker" "$file" 2>/dev/null; then
    info_echo "配置块已存在：$block_id -> $file"
    return 0
  fi

  {
    echo ""
    echo "$begin_marker"
    printf "%s\n" "$content"
    echo "$end_marker"
  } >> "$file"

  success_echo "已写入配置块：$block_id -> $file"
}

inject_line_if_missing() {
  local file="$1"
  local line="$2"

  ensure_file_exists "$file" || return 1

  if grep -Fq "$line" "$file" 2>/dev/null; then
    info_echo "配置文件中已存在：$line"
  else
    {
      echo ""
      echo "$line"
    } >> "$file"
    success_echo "已追加到 $file：$line"
  fi
}

apply_shellenv_now() {
  local shellenv_cmd="$1"
  eval "$shellenv_cmd"
  success_echo "环境已在当前终端生效"
}

# ================================== Homebrew 环境处理 ==================================

brew_bin_candidates() {
  cat <<'EOF'
/opt/homebrew/bin/brew
/usr/local/bin/brew
EOF
}

detect_brew_bin() {
  local candidate

  if command_exists brew; then
    command -v brew
    return 0
  fi

  while IFS= read -r candidate; do
    if [[ -x "$candidate" ]]; then
      echo "$candidate"
      return 0
    fi
  done < <(brew_bin_candidates)

  return 1
}

ensure_brew_env() {
  local brew_bin=""

  if brew_bin="$(detect_brew_bin)"; then
    eval "\$(${brew_bin} shellenv)"
    return 0
  fi

  return 1
}

inject_brew_shellenv_if_needed() {
  local brew_bin="$1"
  local profile_file shellenv_cmd

  profile_file="$(get_shell_profile_file)"
  shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""

  append_block_if_missing "$profile_file" "homebrew-shellenv" "$shellenv_cmd"
  apply_shellenv_now "$shellenv_cmd"
}

# ================================== Homebrew 检查/安装/升级 ==================================

install_homebrew() {
  local arch brew_bin

  arch="$(get_cpu_arch)"
  warn_echo "未检测到 Homebrew，开始安装...（架构：$arch）"

  if ! command_exists curl; then
    error_echo "安装 Homebrew 依赖 curl，但当前系统未检测到 curl"
    exit 1
  fi

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ "$arch" == "arm64" ]]; then
    brew_bin="/opt/homebrew/bin/brew"
  else
    brew_bin="/usr/local/bin/brew"
  fi

  [[ -x "$brew_bin" ]] || {
    error_echo "Homebrew 安装后仍未找到 brew，可执行文件不存在：$brew_bin"
    exit 1
  }

  inject_brew_shellenv_if_needed "$brew_bin"

  if ! command_exists brew; then
    error_echo "Homebrew 安装后 brew 仍不可用"
    exit 1
  fi

  success_echo "Homebrew 安装完成：$(command -v brew)"
}

upgrade_brew_if_needed() {
  if prompt_optional_upgrade "brew"; then
    note_echo "开始执行 brew update"
    brew update
    note_echo "开始执行 brew upgrade"
    brew upgrade
    note_echo "开始执行 brew cleanup"
    brew cleanup || true
    note_echo "开始执行 brew doctor"
    brew doctor || warn_echo "brew doctor 有告警，请按提示自行处理"
    success_echo "brew 升级完成"
  else
    gray_echo "已跳过 brew 升级"
  fi
}

ensure_brew() {
  print_divider
  bold_echo "第 1 步：检查 Homebrew"

  if ! ensure_brew_env; then
    install_homebrew
  else
    success_echo "已检测到 Homebrew：$(command -v brew)"
    inject_brew_shellenv_if_needed "$(detect_brew_bin)"
    upgrade_brew_if_needed
  fi

  ensure_brew_env || {
    error_echo "Homebrew 环境初始化失败"
    exit 1
  }
}

# ================================== 通用 brew 包检查/安装/升级 ==================================
# 说明：
# 1. 优先检查命令是否可用
# 2. 安装完再校验一次
# 3. 对 python3 / fzf 打印版本，便于排障

brew_install_or_upgrade_pkg() {
  local command_name="$1"
  local brew_pkg_name="$2"
  local display_name="$3"

  print_divider
  bold_echo "检查 ${display_name}"

  if ! command_exists "$command_name"; then
    warn_echo "未检测到 ${display_name}，开始安装..."
    brew install "$brew_pkg_name"

    if ! command_exists "$command_name"; then
      error_echo "${display_name} 安装后仍不可用"
      exit 1
    fi

    success_echo "${display_name} 安装完成"
  else
    success_echo "已检测到 ${display_name}：$(command -v "$command_name")"
  fi

  case "$command_name" in
    python3) gray_echo "当前版本：$(python3 --version 2>/dev/null || true)" ;;
    fzf)     gray_echo "当前版本：$(fzf --version 2>/dev/null || true)" ;;
  esac

  if prompt_optional_upgrade "$display_name"; then
    note_echo "开始升级 ${display_name} ..."
    brew upgrade "$brew_pkg_name" || true
    success_echo "${display_name} 升级流程已执行完毕"
  else
    gray_echo "已跳过 ${display_name} 升级"
  fi
}

ensure_python3() {
  brew_install_or_upgrade_pkg "python3" "python" "python3"
}

ensure_fzf() {
  brew_install_or_upgrade_pkg "fzf" "fzf" "fzf"
}

# ================================== 目录与服务 ==================================

cd_to_script_dir() {
  cd "$SCRIPT_DIR"
  success_echo "已切换到脚本所在目录：$SCRIPT_DIR"
}

find_port_owner() {
  if command_exists lsof; then
    lsof -nP -iTCP:"$PORT" -sTCP:LISTEN 2>/dev/null || true
  fi
}

check_port_available() {
  if command_exists lsof && lsof -nP -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; then
    error_echo "端口 ${PORT} 已被占用，请先释放后再运行脚本"
    gray_echo "占用信息如下："
    find_port_owner | tee -a "$LOG_FILE" || true
    exit 1
  fi
}

wait_for_http_server_ready() {
  local url="http://${HOST}:${PORT}/"
  local i

  for i in {1..20}; do
    if curl -fsS "$url" >/dev/null 2>&1; then
      return 0
    fi
    sleep 0.3
  done

  return 1
}

start_local_http_server() {
  print_divider
  bold_echo "启动本地 HTTP 服务"

  check_port_available

  : > "$HTTP_LOG_FILE"
  note_echo "执行：python3 -m http.server ${PORT} --bind ${HOST}"
  python3 -m http.server "$PORT" --bind "$HOST" >"$HTTP_LOG_FILE" 2>&1 &
  SERVER_PID=$!

  if ! wait_for_http_server_ready; then
    error_echo "本地 HTTP 服务启动失败"
    gray_echo "日志如下："
    cat "$HTTP_LOG_FILE" || true
    exit 1
  fi

  success_echo "本地 HTTP 服务已启动：http://${HOST}:${PORT}"
}

stop_local_http_server() {
  if [[ -n "${SERVER_PID:-}" ]] && ps -p "$SERVER_PID" >/dev/null 2>&1; then
    kill "$SERVER_PID" >/dev/null 2>&1 || true
    wait "$SERVER_PID" 2>/dev/null || true
    gray_echo "本地 HTTP 服务已停止"
  fi
}

cleanup() {
  stop_local_http_server
}

# ================================== JSON 选择与 URL 处理 ==================================

find_json_files() {
  find . -type f -name '*.json' ! -path '*/.git/*' | sed 's#^\./##' | sort
}

ensure_json_files_exist() {
  if [[ -z "$(find_json_files)" ]]; then
    warn_echo "当前目录及子目录下未找到任何 JSON 文件"
    exit 0
  fi
}

pick_json_file() {
  local selected_json

  ensure_json_files_exist

  selected_json="$(find_json_files | fzf --prompt='请选择一个 JSON 文件: ' --height=40% --reverse)"

  if [[ -z "$selected_json" ]]; then
    warn_echo "未选择任何 JSON 文件，脚本结束"
    exit 0
  fi

  printf "%s" "$selected_json"
}

url_encode_with_python() {
  local raw="$1"
  python3 - <<'PY' "$raw"
import sys
import urllib.parse
print(urllib.parse.quote(sys.argv[1]))
PY
}

open_url() {
  local url="$1"

  if command_exists open; then
    open "$url"
  else
    error_echo "未检测到 open 命令，无法自动打开浏览器"
    return 1
  fi
}

open_json_in_browser() {
  local json_file="$1"
  local encoded_path url

  encoded_path="$(url_encode_with_python "$json_file")"
  url="http://${HOST}:${PORT}/${encoded_path}"

  print_divider
  highlight_echo "你选择的是：$json_file"
  note_echo "浏览器即将打开：$url"

  open_url "$url"
  success_echo "浏览器已打开"
}

# ================================== 自述说明 ==================================

show_intro() {
  print_divider
  bold_echo "本脚本将执行以下流程："
  log "1. 自述说明，并等待你回车"
  log "2. 检查 Homebrew：没有就安装，有就可选升级"
  log "3. 检查 python3：没有就安装，有就可选升级"
  log "4. 检查 fzf：没有就安装，有就可选升级"
  log "5. 切换到脚本所在目录"
  log "6. 启动本地服务：http://${HOST}:${PORT}"
  log "7. 用 fzf 选择一个 json 文件"
  log "8. 浏览器自动打开对应地址（已处理空格/中文等 URL 编码）"
  log "9. 服务保持运行，按 Ctrl + C 结束"
  print_divider
  pause_enter
}

show_runtime_summary() {
  print_divider
  success_echo "本地服务仍在运行中"
  gray_echo "脚本目录：$SCRIPT_DIR"
  gray_echo "日志文件：$LOG_FILE"
  gray_echo "HTTP 日志：$HTTP_LOG_FILE"
  gray_echo "按 Ctrl + C 可结束服务"
}

# ================================== 主流程 ==================================

main() {
  trap cleanup EXIT INT TERM

  require_macos
  require_basic_commands

  : > "$LOG_FILE"

  show_intro
  ensure_brew
  ensure_python3
  ensure_fzf
  cd_to_script_dir
  start_local_http_server

  local selected_json
  selected_json="$(pick_json_file)"
  open_json_in_browser "$selected_json"

  show_runtime_summary
  wait "$SERVER_PID"
}

main "$@"