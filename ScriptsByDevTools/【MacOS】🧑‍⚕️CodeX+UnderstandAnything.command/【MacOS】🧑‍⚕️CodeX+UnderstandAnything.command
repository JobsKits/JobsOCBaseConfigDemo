#!/bin/zsh
# ==============================================================================
# CodeX+UnderstandAnything.command
# 用途：体检 Codex 与 Understand Anything，为 Xcode/iOS 工程生成中文知识图谱。
# 边界：只在用户确认后安装或升级；不挂接 pod install，不自动分析工程。
# 风险：安装流程会下载官方安装脚本，/understand 会消耗 Codex/AI 额度。
# 日志：通过内置自述后，终端输出同步写入系统临时目录中的同名 .log 文件。
# ==============================================================================

APP_NAME="CodeX + Understand Anything"
UA_REPO="$HOME/.understand-anything/repo"
UA_INSTALL_URL="https://raw.githubusercontent.com/Lum1104/Understand-Anything/main/install.sh"

SCRIPT_PATH="${0:A}"
SCRIPT_DIR="${SCRIPT_PATH:h}"
SCRIPT_BASENAME="${SCRIPT_PATH:t}"
LOG_FILE="${TMPDIR%/}/${SCRIPT_BASENAME}.log"

PROJECT_ROOT=""
typeset -ga XCODE_ITEMS=()

# 在任何落盘或联网动作前说明用途、影响和取消方式，避免双击误触。
show_script_intro_and_wait() {
  print -r -- "============================== 脚本内置自述 =============================="
  print -r -- "脚本名称：${SCRIPT_BASENAME}"
  print -r -- "核心用途：体检 Codex 与 Understand Anything，并为指定 Xcode/iOS 工程准备代码图谱命令。"
  print -r -- "默认行为：不会自动安装、升级、生成图谱或启动 Codex；相关动作都会再次询问。"
  print -r -- "可能影响：用户确认后，可能下载官方安装脚本并更新用户级 Understand Anything Skills。"
  print -r -- "额度提醒：真正执行 /understand 时会消耗 Codex/AI 额度，本脚本不把它挂到 pod install。"
  print -r -- "日志位置：确认继续后，输出写入系统临时目录中的 ${SCRIPT_BASENAME}.log。"
  print -r -- "取消方式：此时按 Ctrl+C 终止，不会进入后续业务。"
  print -r -- "============================================================================"
  if [[ ! -t 0 ]]; then
    print -u2 -r -- "当前没有可交互终端，请双击脚本或在 Terminal 中运行。"
    exit 1
  fi
  read -r "?👉 已了解脚本用途与影响，按回车继续；按 Ctrl+C 取消：" _
}

# 在用户通过自述确认后再初始化严格选项与日志，避免确认前产生副作用。
initialize_script_runtime() {
  set -u
  setopt NO_NOMATCH
  : >| "$LOG_FILE"
  exec > >(tee -a "$LOG_FILE") 2>&1
}

# 输出带时间戳的统一日志，便于终端和日志文件交叉排查。
log() {
  print -r -- "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# 输出流程分隔线，降低长路径和命令说明混在一起的阅读成本。
line() {
  print -r -- "────────────────────────────────────────────────────────────"
}

# 展示运行身份和日志位置，让用户在选择工程前确认脚本来源。
print_runtime_header() {
  clear 2>/dev/null || true
  print -r -- "🧠 ${APP_NAME}"
  print -r -- "用途：为自有或授权 Xcode/iOS 工程准备 Understand Anything 中文代码图谱"
  line
  log "脚本路径：${SCRIPT_PATH}"
  log "脚本目录：${SCRIPT_DIR}"
  log "日志文件：${LOG_FILE}"
  line
}

# 清理 Finder 拖入路径的引号、转义和 file URL，保留真实目录语义。
normalize_user_path() {
  local raw="$1"
  raw="${raw#${raw%%[![:space:]]*}}"
  raw="${raw%${raw##*[![:space:]]}}"
  raw="${(Q)raw}"
  if [[ "$raw" == file://* ]]; then
    raw="${raw#file://}"
    if command -v python3 >/dev/null 2>&1; then
      raw="$(python3 -c 'import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]))' "$raw" 2>/dev/null || print -r -- "$raw")"
    fi
  fi
  if [[ "$raw" == "~" || "$raw" == ~/* ]]; then
    raw="${raw/#\~/$HOME}"
  fi
  print -r -- "$raw"
}

# 判断输入是否直接指向 Xcode workspace 或 project 包。
is_xcode_item_path() {
  local path="$1"
  local lower="${path:l}"
  [[ -d "$path" && ( "$lower" == *.xcworkspace || "$lower" == *.xcodeproj ) ]]
}

# 只扫描候选目录第一层，避免误选 Pods、示例子工程或其它仓库。
scan_xcode_items_in_dir() {
  local dir="$1"
  local item=""
  XCODE_ITEMS=()
  [[ -d "$dir" ]] || return 1
  while IFS= read -r item; do
    [[ -n "$item" ]] && XCODE_ITEMS+=("$item")
  done < <(find "$dir" -maxdepth 1 -type d -iname "*.xcworkspace" -print 2>/dev/null | sort)
  while IFS= read -r item; do
    [[ -n "$item" ]] && XCODE_ITEMS+=("$item")
  done < <(find "$dir" -maxdepth 1 -type d -iname "*.xcodeproj" -print 2>/dev/null | sort)
  (( ${#XCODE_ITEMS[@]} > 0 ))
}

# 打印候选工程包，避免只凭目录名误判项目根目录。
print_found_xcode_items() {
  local root="$1"
  local item=""
  line
  log "✅ 找到候选 Xcode/iOS 工程根目录：${root}"
  for item in "${XCODE_ITEMS[@]}"; do
    print -r -- "  - $(basename "$item")"
  done
  line
}

# 让用户确认自动命中的目录，输入任意字符可继续寻找其它候选项。
confirm_project_root() {
  local root="$1"
  local answer=""
  print_found_xcode_items "$root"
  read -r "?直接回车确认；输入任意字符后回车继续选择：" answer
  [[ -z "$answer" ]]
}

# 验证目录并在用户确认后写入唯一工程根目录。
try_set_project_root_from_dir() {
  local dir="$1"
  dir="${dir:A}"
  if scan_xcode_items_in_dir "$dir" && confirm_project_root "$dir"; then
    PROJECT_ROOT="$dir"
    return 0
  fi
  return 1
}

# 同时支持工程根目录、workspace 和 project 三种拖入输入。
try_set_project_root_from_input_path() {
  local candidate="$1"
  if is_xcode_item_path "$candidate"; then
    try_set_project_root_from_dir "${candidate:h}"
    return $?
  fi
  if [[ -d "$candidate" ]]; then
    try_set_project_root_from_dir "$candidate"
    return $?
  fi
  log "❌ 路径不存在，或不是目录 / .xcworkspace / .xcodeproj：${candidate}"
  return 1
}

# 从脚本目录逐层向上寻找工程，修复脚本位于 ScriptsByDevTools 时只查一级的问题。
try_set_project_root_from_ancestors() {
  local current="$SCRIPT_DIR"
  local level=0
  while (( level < 8 )); do
    log "自动检查第 $((level + 1)) 层：${current}"
    if try_set_project_root_from_dir "$current"; then
      return 0
    fi
    [[ "$current" == "/" ]] && break
    current="${current:h}"
    (( level += 1 ))
  done
  return 1
}

# 自动定位失败时循环接收人工路径，直到确认有效工程。
prompt_for_project_root() {
  local raw=""
  while true; do
    print
    print -r -- "请输入或拖入：工程根目录、.xcworkspace 或 .xcodeproj。"
    read -r "?路径：" raw
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

# 优先使用命令行参数，其次逐层向上扫描，最后进入人工选择。
locate_project_root_or_exit() {
  local supplied_path="${1:-}"
  line
  log "开始定位 Xcode/iOS 工程根目录。"
  if [[ -n "$supplied_path" ]]; then
    supplied_path="$(normalize_user_path "$supplied_path")"
    if try_set_project_root_from_input_path "$supplied_path"; then
      return 0
    fi
    log "命令行参数未通过确认，继续自动扫描。"
  fi
  if try_set_project_root_from_ancestors; then
    return 0
  fi
  prompt_for_project_root || exit 1
}

# 验证 Codex CLI 是否可调用，缺失时只提示官方入口，不代替用户安装。
ensure_codex_cli_or_exit() {
  line
  log "开始 Codex CLI 健康体检。"
  if ! command -v codex >/dev/null 2>&1; then
    log "❌ 未找到 codex 命令。请先从 OpenAI 官方渠道安装 Codex CLI。"
    log "官方说明：https://developers.openai.com/codex/cli"
    finish_and_wait 1
  fi
  log "✅ Codex 路径：$(command -v codex)"
  local version="$(codex --version 2>/dev/null | head -n 1 || true)"
  [[ -n "$version" ]] && log "Codex 版本：${version}"
}

# 对安装和升级动作统一采用“回车跳过、输入任意字符执行”的保守交互。
ask_any_to_run() {
  local message="$1"
  local answer=""
  read -r "?${message}（直接回车跳过；输入任意字符后回车执行）：" answer
  [[ -n "$answer" ]]
}

# 下载到独立临时目录并记录哈希，避免直接执行 curl 管道导致内容不可审计。
install_understand_anything_for_codex() {
  local temp_dir=""
  local installer=""
  line
  if ! ask_any_to_run "未检测到 Understand Anything，是否从官方仓库安装"; then
    log "已跳过安装；不会启动 Codex 或生成图谱。"
    finish_and_wait 0
  fi
  command -v curl >/dev/null 2>&1 || { log "❌ 未找到 curl。"; finish_and_wait 1; }
  temp_dir="$(mktemp -d "${TMPDIR%/}/understand-anything.XXXXXX")" || { log "❌ 无法创建临时目录。"; finish_and_wait 1; }
  installer="${temp_dir}/install.sh"
  log "下载安装脚本：${UA_INSTALL_URL}"
  if ! curl --proto '=https' --tlsv1.2 -fsSL "$UA_INSTALL_URL" -o "$installer"; then
    rmdir "$temp_dir" 2>/dev/null || true
    log "❌ 安装脚本下载失败。"
    finish_and_wait 1
  fi
  log "安装脚本 SHA-256：$(shasum -a 256 "$installer" | awk '{print $1}')"
  /bin/bash "$installer" codex
  local code=$?
  rm -f -- "$installer"
  rmdir "$temp_dir" 2>/dev/null || true
  if (( code != 0 )); then
    log "❌ Understand Anything 安装失败，退出码：${code}"
    finish_and_wait "$code"
  fi
}

# 展示当前提交并由用户决定是否调用仓库自带升级入口。
upgrade_understand_anything_if_requested() {
  local branch=""
  local commit=""
  branch="$(git -C "$UA_REPO" rev-parse --abbrev-ref HEAD 2>/dev/null || true)"
  commit="$(git -C "$UA_REPO" rev-parse --short HEAD 2>/dev/null || true)"
  [[ -n "$branch" ]] && log "Understand Anything 分支：${branch}"
  [[ -n "$commit" ]] && log "Understand Anything 提交：${commit}"
  if ! ask_any_to_run "Understand Anything 已安装，是否执行官方升级"; then
    log "已跳过 Understand Anything 升级。"
    return 0
  fi
  if [[ ! -f "$UA_REPO/install.sh" ]]; then
    log "❌ 安装目录缺少 install.sh，停止自动修复，请先检查目录来源。"
    finish_and_wait 1
  fi
  (
    cd "$UA_REPO" || exit 1
    /bin/bash ./install.sh --update
  )
  local code=$?
  if (( code != 0 )); then
    log "❌ Understand Anything 升级失败，退出码：${code}"
    finish_and_wait "$code"
  fi
  log "✅ Understand Anything 升级完成。"
}

# 检查仓库和用户级 Skill 链接，确保安装结果可被新的 Codex 会话加载。
validate_understand_anything_installation_or_exit() {
  if [[ ! -d "$UA_REPO" || ! -f "$UA_REPO/install.sh" ]]; then
    log "❌ 未检测到完整安装目录：${UA_REPO}"
    finish_and_wait 1
  fi
  log "✅ Understand Anything 仓库：${UA_REPO}"
  local skill_count=0
  local skill_path=""
  while IFS= read -r skill_path; do
    [[ -n "$skill_path" ]] || continue
    print -r -- "  - ${skill_path} -> $(readlink "$skill_path" 2>/dev/null || print -r -- '非符号链接')"
    (( skill_count += 1 ))
  done < <(find "$HOME/.agents/skills" -maxdepth 1 -name 'understand*' -print 2>/dev/null | sort)
  if (( skill_count == 0 )); then
    log "⚠️ 未在用户级 Skills 目录发现 understand* 项；重启 Codex 后若命令不可见，请重新执行安装。"
  else
    log "✅ 检测到 ${skill_count} 个 Understand Anything Skill 入口。"
  fi
}

# 按“已安装则可选升级、未安装则可选安装”的顺序完成健康体检。
ensure_understand_anything_or_exit() {
  line
  log "开始 Understand Anything 健康体检。"
  if [[ -d "$UA_REPO" && -f "$UA_REPO/install.sh" ]]; then
    upgrade_understand_anything_if_requested
  else
    install_understand_anything_for_codex
  fi
  validate_understand_anything_installation_or_exit
}

# 输出当前官方命令地图，明确生成图谱仍需用户进入 Codex 后主动执行。
print_understand_anything_usage() {
  line
  log "工程根目录：${PROJECT_ROOT}"
  print -r -- ""
  print -r -- "重新启动 Codex 后，在工程根目录按需要执行："
  print -r -- "  /understand --language zh      # 生成或增量更新代码知识图谱"
  print -r -- "  /understand-dashboard          # 打开交互式图谱"
  print -r -- "  /understand-chat               # 基于图谱提问"
  print -r -- "  /understand-diff               # 分析 Git 变更影响"
  print -r -- "  /understand-explain            # 深入解释文件、函数或模块"
  print -r -- "  /understand-onboard            # 生成项目入门指南"
  print -r -- "  /understand-domain             # 提取业务领域关系"
  print -r -- ""
  print -r -- "图谱通常位于：${PROJECT_ROOT}/.understand-anything/knowledge-graph.json"
  print -r -- "大型项目可先限定自有源码目录；默认增量分析，不要挂接高频构建或 pod install。"
  line
}

# 仅在用户主动输入内容时启动 Codex，直接回车保持无副作用结束。
offer_to_launch_codex() {
  if ! ask_any_to_run "是否现在进入工程根目录并启动 Codex"; then
    log "已选择不启动 Codex。"
    return 0
  fi
  log "进入工程根目录并启动 Codex：${PROJECT_ROOT}"
  cd "$PROJECT_ROOT" || { log "❌ 无法进入工程根目录。"; return 1; }
  codex
}

# 汇总使用说明并把启动动作留给用户最终确认。
show_usage_and_offer_launch() {
  print_understand_anything_usage
  if ! offer_to_launch_codex; then
    log "❌ Codex 启动流程失败。"
    finish_and_wait 1
  fi
}

# 统一输出退出码和日志路径，交互终端中等待用户确认后关闭窗口。
finish_and_wait() {
  local code="${1:-0}"
  print
  log "脚本流程结束，退出码：${code}"
  log "完整日志：${LOG_FILE}"
  read -r "?按回车退出：" _
  exit "$code"
}

# 主入口只编排高层业务动作，具体控制和异常收口由各函数负责。
main() {
  show_script_intro_and_wait "$@" # 先完成无副作用的三层自述确认
  initialize_script_runtime # 用户确认后初始化严格选项与日志
  print_runtime_header # 展示脚本身份、路径和日志位置
  locate_project_root_or_exit "$@" # 定位并确认 Xcode/iOS 工程根目录
  ensure_codex_cli_or_exit # 验证 Codex CLI 可用性
  ensure_understand_anything_or_exit # 可选安装或升级并验证 Skill 入口
  show_usage_and_offer_launch # 说明命令并由用户决定是否启动 Codex
  finish_and_wait 0 # 汇总日志并安全退出
}

main "$@"
