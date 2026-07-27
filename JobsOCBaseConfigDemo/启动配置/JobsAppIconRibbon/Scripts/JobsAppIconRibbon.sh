# shell: zsh
# 脚本自述：
# - 脚本名称：JobsAppIconRibbon.sh
# - 核心用途：从原始 AppIcon 生成带当前打包环境绶带的派生 AppIcon。
# - 影响范围：只重建配置指定的 JobsAppIconRibbon-*.appiconset，不修改原始图标。
# - 运行提示：Xcode 构建阶段无交互执行；终端独立运行会先等待确认。

typeset -g SCRIPT_DIR=""
typeset -g SCRIPT_PATH=""
typeset -g LOG_FILE=""
typeset -g PROJECT_ROOT=""
typeset -g CONFIG_PATH=""
typeset -g BUILD_CONFIGURATION=""
typeset -g GENERATOR_PATH=""

# 初始化脚本路径、日志与 zsh 运行选项。
initialize_runtime() {
  setopt NO_NOMATCH ERR_EXIT
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
  SCRIPT_PATH="${SCRIPT_DIR}/$(basename -- "$0")"
  LOG_FILE="${TMPDIR:-/tmp}/JobsAppIconRibbon.log"
  : > "$LOG_FILE"
}
# 同步输出终端信息和日志文件。
log() {
  print -r -- "$1" | tee -a "$LOG_FILE"
}
# 判断当前是否由 Xcode 构建阶段自动调用。
is_xcode_build_runtime() {
  [[ "${JOBS_APP_ICON_RIBBON_NONINTERACTIVE:-0}" == "1" ]] || [[ -n "${ACTION:-}" && -n "${BUILD_DIR:-}" ]]
}
# 打印内置自述，并仅在手动执行时等待确认。
show_script_intro_and_wait() {
  log "======================== AppIcon 环境绶带 ========================"
  log "核心用途：为 App 图标右上角生成当前打包环境绶带。"
  log "安全边界：原始 AppIcon 不会被修改，只更新派生 appiconset。"
  log "日志文件：${LOG_FILE}"
  log "================================================================="
  is_xcode_build_runtime && return 0
  [[ -t 0 ]] || { log "✖ 当前没有可交互输入，请在终端中重新运行。"; return 1; }
  read -r "?👉 已了解影响范围，按回车继续；按 Ctrl+C 取消：" _
}
# 解析项目根目录、配置文件和当前构建环境。
resolve_build_context() {
  if [[ -n "${JOBS_APP_ICON_RIBBON_PROJECT_DIR:-}" ]]; then
    PROJECT_ROOT="$JOBS_APP_ICON_RIBBON_PROJECT_DIR"
  elif [[ -n "${PODS_PODFILE_DIR_PATH:-}" ]]; then
    PROJECT_ROOT="$PODS_PODFILE_DIR_PATH"
  elif [[ -n "${PODS_TARGET_SRCROOT:-}" ]]; then
    PROJECT_ROOT="$(cd "$PODS_TARGET_SRCROOT/../.." && pwd)"
  elif [[ -n "${SRCROOT:-}" ]]; then
    PROJECT_ROOT="$SRCROOT"
  else
    PROJECT_ROOT="$PWD"
  fi
  CONFIG_PATH="${JOBS_APP_ICON_RIBBON_CONFIG_PATH:-${PROJECT_ROOT}/JobsAppIconRibbon.config}"
  BUILD_CONFIGURATION="${CONFIGURATION:-Debug}"
  GENERATOR_PATH="${JOBS_APP_ICON_RIBBON_GENERATOR_PATH:-${SCRIPT_INPUT_FILE_1:-${SCRIPT_DIR}/JobsAppIconRibbonGenerator.swift}}"
}
# 检查 Swift 生成器和项目配置是否可用。
check_environment() {
  command -v xcrun >/dev/null 2>&1 || { log "✖ 找不到 xcrun，请检查 Xcode Command Line Tools。"; return 1; }
  [[ -f "$GENERATOR_PATH" ]] || { log "✖ 找不到 Swift 生成器：$GENERATOR_PATH"; return 1; }
  [[ -f "$CONFIG_PATH" ]] || { log "✖ 找不到配置文件：$CONFIG_PATH"; return 1; }
}
# 调用 Swift 生成器创建当前环境的派生 AppIcon。
generate_app_icon_ribbon() {
  env -u SDKROOT -u SDK_NAME -u PLATFORM_NAME -u EFFECTIVE_PLATFORM_NAME \
    xcrun --sdk macosx swift "$GENERATOR_PATH" \
    --project-root "$PROJECT_ROOT" \
    --config "$CONFIG_PATH" \
    --configuration "$BUILD_CONFIGURATION" 2>&1 | tee -a "$LOG_FILE"
  local result=${pipestatus[1]}
  [[ $result -eq 0 ]] || { log "✖ AppIcon 绶带生成失败。"; return $result; }
  log "✔ AppIcon 绶带生成完成。"
}
# 编排自述、上下文解析、环境检查和图标生成。
main() {
  initialize_runtime # 初始化路径、日志和 zsh 运行环境。
  show_script_intro_and_wait # 展示影响范围，并按运行入口决定是否等待确认。
  resolve_build_context # 获取项目根目录、配置文件和打包环境。
  check_environment # 验证 Xcode 工具链与模块文件。
  generate_app_icon_ribbon # 生成带环境绶带的派生 AppIcon。
}

main "$@"
