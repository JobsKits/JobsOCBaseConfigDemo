#!/bin/zsh
# ==============================================================================
# CodeX+UnderstandAnything.command
# 用途：在需要时，通过 Codex + Understand Anything 为 Xcode/iOS 工程生成代码图谱。
# 说明：Understand Anything 依赖 AI/Codex 算力，本脚本不挂 pod install，避免高频消耗。
# ==============================================================================

set -u
setopt NO_NOMATCH

APP_NAME="CodeX+UnderstandAnything"
UA_REPO="$HOME/.understand-anything/repo"
UA_INSTALL_URL="https://raw.githubusercontent.com/Lum1104/Understand-Anything/main/install.sh"

SCRIPT_PATH="${0:A}"
SCRIPT_DIR="${SCRIPT_PATH:h}"
SCRIPT_PARENT_DIR="${SCRIPT_DIR:h}"

PROJECT_ROOT=""
typeset -ga XCODE_ITEMS

log() {
  print -r -- "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

line() {
  print -r -- "────────────────────────────────────────────────────────────"
}

pause_to_exit() {
  print
  print -n "按回车退出："
  read -r _unused
}

print_header() {
  clear 2>/dev/null || true
  print -r -- "🧠 ${APP_NAME}"
  print -r -- "用途：通过 Understand Anything + Codex 生成 Xcode/iOS 工程代码图谱"
  line
  log "脚本路径：${SCRIPT_PATH}"
  log "脚本当前目录：${SCRIPT_DIR}"
  log "脚本上级目录：${SCRIPT_PARENT_DIR}"
  line
}

normalize_user_path() {
  local raw="$1"

  # 去掉首尾空白
  raw="${raw#${raw%%[![:space:]]*}}"
  raw="${raw%${raw##*[![:space:]]}}"

  # zsh quote removal：兼容 Finder 拖入路径时产生的反斜杠、单双引号
  raw="${(Q)raw}"

  # 兼容 file:// URL
  if [[ "$raw" == file://* ]]; then
    raw="${raw#file://}"
    if command -v python3 >/dev/null 2>&1; then
      raw="$(python3 -c 'import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]))' "$raw" 2>/dev/null || print -r -- "$raw")"
    fi
  fi

  # 兼容 ~
  if [[ "$raw" == "~" || "$raw" == ~/* ]]; then
    raw="${raw/#\~/$HOME}"
  fi

  print -r -- "$raw"
}

is_xcode_item_path() {
  local path="$1"
  local lower="${path:l}"
  [[ -d "$path" && ( "$lower" == *.xcworkspace || "$lower" == *.xcodeproj ) ]]
}

scan_xcode_items_in_dir() {
  local dir="$1"
  XCODE_ITEMS=()

  [[ -d "$dir" ]] || return 1

  # 优先列 workspace，再列 xcodeproj；只查当前目录，不递归，避免误命中 Pods/子工程。
  local p
  while IFS= read -r p; do
    [[ -n "$p" ]] && XCODE_ITEMS+=("$p")
  done < <(find "$dir" -maxdepth 1 -type d -iname "*.xcworkspace" -print 2>/dev/null | sort)

  while IFS= read -r p; do
    [[ -n "$p" ]] && XCODE_ITEMS+=("$p")
  done < <(find "$dir" -maxdepth 1 -type d -iname "*.xcodeproj" -print 2>/dev/null | sort)

  (( ${#XCODE_ITEMS[@]} > 0 ))
}

print_found_xcode_items() {
  local root="$1"
  line
  log "✅ 已找到 Xcode/iOS 工程根目录：${root}"
  log "命中的 .xcworkspace / .xcodeproj："
  local item
  for item in "${XCODE_ITEMS[@]}"; do
    print -r -- "  - $(basename "$item")"
    print -r -- "    ${item}"
  done
  line
}

confirm_project_root() {
  local root="$1"
  print_found_xcode_items "$root"
  print -n "请确认以上工程是否正确。直接回车确认；输入任意字符后回车则重新选择："
  local ans=""
  read -r ans
  [[ -z "$ans" ]]
}

try_set_project_root_from_dir() {
  local dir="$1"
  dir="${dir:A}"

  if scan_xcode_items_in_dir "$dir"; then
    if confirm_project_root "$dir"; then
      PROJECT_ROOT="$dir"
      return 0
    fi
  else
    log "未在此目录发现 .xcworkspace / .xcodeproj：${dir}"
  fi

  return 1
}

try_set_project_root_from_input_path() {
  local input_path="$1"
  local candidate="$input_path"

  if is_xcode_item_path "$candidate"; then
    local root="${candidate:h}"
    scan_xcode_items_in_dir "$root" || return 1
    if confirm_project_root "$root"; then
      PROJECT_ROOT="$root"
      return 0
    fi
    return 1
  fi

  if [[ -d "$candidate" ]]; then
    try_set_project_root_from_dir "$candidate"
    return $?
  fi

  log "❌ 路径不存在，或不是目录 / .xcworkspace / .xcodeproj：${candidate}"
  return 1
}

locate_project_root() {
  log "开始查找 Xcode/iOS 工程根目录。查找规则："
  log "1) 脚本当前目录"
  log "2) 脚本当前目录向上一级"
  log "3) 前两者未命中时，循环要求手动输入/拖入正确工程路径"
  line

  log "检查 1/3：脚本当前目录"
  if try_set_project_root_from_dir "$SCRIPT_DIR"; then
    return 0
  fi

  line
  log "检查 2/3：脚本当前目录向上一级"
  if try_set_project_root_from_dir "$SCRIPT_PARENT_DIR"; then
    return 0
  fi

  line
  log "检查 3/3：请手动输入或拖入 Xcode/iOS 工程根目录"

  while true; do
    print
    print -r -- "请输入/拖入以下任一对象后回车："
    print -r -- "  - 包含 .xcworkspace 或 .xcodeproj 的工程根目录"
    print -r -- "  - 某个 .xcworkspace"
    print -r -- "  - 某个 .xcodeproj"
    print -n "路径："

    local raw=""
    read -r raw
    raw="$(normalize_user_path "$raw")"

    if [[ -z "$raw" ]]; then
      log "未输入路径，请重新输入。"
      continue
    fi

    if try_set_project_root_from_input_path "$raw"; then
      return 0
    fi

    log "未能确认有效工程，请重新输入。"
  done
}

check_codex_health() {
  line
  log "开始 Codex 健康体检"

  if ! command -v codex >/dev/null 2>&1; then
    log "❌ 未找到 codex 命令。Understand Anything 的 Codex 集成需要 Codex CLI。"
    print -r -- ""
    print -r -- "可先安装 Codex CLI："
    print -r -- "  curl -fsSL https://chatgpt.com/codex/install.sh | sh"
    print -r -- ""
    return 1
  fi

  local codex_path="$(command -v codex)"
  log "✅ codex 命令存在：${codex_path}"

  local codex_version="$(codex --version 2>/dev/null | head -n 1 || true)"
  if [[ -n "$codex_version" ]]; then
    log "Codex 版本：${codex_version}"
  else
    log "⚠️  codex --version 无输出，仍继续检查 Understand Anything。"
  fi

  return 0
}

install_understand_anything_for_codex() {
  line
  log "开始安装 Understand Anything 到 Codex"
  log "安装命令：curl -fsSL ${UA_INSTALL_URL} | bash -s codex"
  line

  if ! command -v curl >/dev/null 2>&1; then
    log "❌ 未找到 curl，无法下载安装脚本。"
    return 1
  fi

  /bin/bash -lc "curl -fsSL '${UA_INSTALL_URL}' | bash -s codex"
  local code=$?

  if (( code != 0 )); then
    log "❌ Understand Anything 安装失败，退出码：${code}"
    return $code
  fi

  if [[ -d "$UA_REPO" && -f "$UA_REPO/install.sh" ]]; then
    log "✅ Understand Anything 安装完成：${UA_REPO}"
    return 0
  fi

  log "⚠️  安装命令执行完成，但未检测到预期目录：${UA_REPO}"
  return 1
}

upgrade_understand_anything_if_needed() {
  line
  log "检测到 Understand Anything 已安装：${UA_REPO}"

  if command -v git >/dev/null 2>&1 && [[ -d "$UA_REPO/.git" ]]; then
    local branch="$(git -C "$UA_REPO" rev-parse --abbrev-ref HEAD 2>/dev/null || true)"
    local commit="$(git -C "$UA_REPO" rev-parse --short HEAD 2>/dev/null || true)"
    [[ -n "$branch" ]] && log "当前分支：${branch}"
    [[ -n "$commit" ]] && log "当前提交：${commit}"
  fi

  print
  print -r -- "Understand Anything 已安装。"
  print -r -- "  - 直接回车：跳过升级"
  print -r -- "  - 输入任意字符后回车：执行升级"
  print -n "请选择："

  local ans=""
  read -r ans

  if [[ -z "$ans" ]]; then
    log "已选择跳过 Understand Anything 升级。"
    return 0
  fi

  if [[ ! -f "$UA_REPO/install.sh" ]]; then
    log "⚠️  已安装目录存在，但 install.sh 不存在，改为重新执行在线安装。"
    install_understand_anything_for_codex
    return $?
  fi

  line
  log "开始升级 Understand Anything"
  log "升级命令：cd ${UA_REPO} && bash ./install.sh --update"

  (
    cd "$UA_REPO" || exit 1
    bash ./install.sh --update
  )
  local code=$?

  if (( code != 0 )); then
    log "❌ Understand Anything 升级失败，退出码：${code}"
    return $code
  fi

  log "✅ Understand Anything 升级完成。"
  return 0
}

check_understand_anything_health() {
  line
  log "开始 Understand Anything 健康体检"

  if [[ -d "$UA_REPO" && -f "$UA_REPO/install.sh" ]]; then
    upgrade_understand_anything_if_needed
    return $?
  fi

  log "未检测到正常安装目录：${UA_REPO}"
  install_understand_anything_for_codex
  return $?
}

print_usage_logs() {
  line
  log "Understand Anything 使用方式"
  print -r -- ""
  print -r -- "工程根目录："
  print -r -- "  ${PROJECT_ROOT}"
  print -r -- ""
  print -r -- "如果你现在已经打开了 Codex，请先退出当前 Codex 会话，让新安装/升级的 Understand Anything 能被重新加载。"
  print -r -- "常见做法：在 Codex 里输入 /quit，或者按 Ctrl+C 退出。"
  print -r -- ""
  print -r -- "然后重新进入工程根目录启动 Codex："
  print -r -- "  cd '${PROJECT_ROOT}'"
  print -r -- "  codex"
  print -r -- ""
  print -r -- "Codex 打开后，依次输入："
  print -r -- "  /understand --language zh"
  print -r -- ""
  print -r -- "等待代码图谱生成完成后，再输入："
  print -r -- "  /understand-dashboard"
  print -r -- ""
  print -r -- "图谱文件通常会生成在："
  print -r -- "  ${PROJECT_ROOT}/.understand-anything/knowledge-graph.json"
  print -r -- ""
  print -r -- "如果项目特别大，可以先限定子目录，例如："
  print -r -- "  /understand Sources"
  print -r -- "  /understand App"
  print -r -- ""
  print -r -- "注意：/understand 会消耗 Codex/AI 额度；不要把它挂到高频 pod install。"
  line
}

launch_codex_prompt() {
  print
  print -r -- "是否现在从工程根目录启动 Codex？"
  print -r -- "  - 直接回车：启动 Codex"
  print -r -- "  - 输入任意字符后回车：不启动，只结束脚本"
  print -n "请选择："

  local ans=""
  read -r ans

  if [[ -n "$ans" ]]; then
    log "已选择不启动 Codex。"
    return 0
  fi

  line
  log "正在进入工程根目录并启动 Codex：${PROJECT_ROOT}"
  log "启动后请在 Codex 内输入：/understand --language zh"
  log "图谱生成完成后输入：/understand-dashboard"
  line

  cd "$PROJECT_ROOT" || return 1
  codex
}

main() {
  print_header

  if ! locate_project_root; then
    log "❌ 未能定位 Xcode/iOS 工程根目录。"
    pause_to_exit
    exit 1
  fi

  if ! check_codex_health; then
    pause_to_exit
    exit 1
  fi

  if ! check_understand_anything_health; then
    log "❌ Understand Anything 健康体检未通过。"
    pause_to_exit
    exit 1
  fi

  log "✅ 健康体检通过。"
  print_usage_logs
  launch_codex_prompt

  print
  log "脚本流程结束。"
  pause_to_exit
}

main "$@"
