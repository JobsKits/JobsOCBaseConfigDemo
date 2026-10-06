#!/bin/zsh
# 脚本自述：
# - 脚本名称：【MacOS@Xcode】🫘打开终端运行Pod Install.command
# - 核心用途：从 Xcode 手动打开终端，为本工程运行 pod install。
# - 影响范围：确认后可能下载依赖并更新 Pods、Podfile.lock 和工作区文件。
# - 运行提示：终端中先显示自述，按回车安装，Ctrl+C 取消；不依赖 Sourcetree。
# shell: zsh

SCRIPT_PATH="$0"
SCRIPT_DIR=""
PROJECT_ROOT=""
LOG_FILE=""
INTRO_COLOR=0
POD_EXECUTABLE=""

# 只计算展示路径和入口参数，不初始化日志或执行安装。
prepare_display_context() {
  SCRIPT_PATH="${SCRIPT_PATH:A}"
  SCRIPT_DIR="${SCRIPT_PATH:h}"
  PROJECT_ROOT="${SCRIPT_DIR:h:h}"
  LOG_FILE="${TMPDIR:-/tmp}/jobs-oc-old-pod-install.log"
  if (( $# != 0 )); then
    printf '%s\n' '用法：直接运行本脚本，不需要传入参数。' >&2
    exit 64
  fi
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    INTRO_COLOR=1
  fi
}
# 让自述标题红色加粗、正文蓝色常规，非彩色环境使用纯文本。
print_intro_line() {
  if (( INTRO_COLOR )); then
    if [[ "$1" == title ]]; then
      printf '\033[1;31m%s\033[0m\n' "$2"
    else
      printf '\033[0;34m%s\033[0m\n' "$2"
    fi
  else
    printf '%s\n' "$2"
  fi
}
# 打印内置说明，并将 Xcode 入口转发到可确认的真实终端。
show_script_intro_and_wait() {
  prepare_display_context "$@"
  print_intro_line title '🫘 OC 老工程 · Pod Install'
  print_intro_line body "1、项目目录：$PROJECT_ROOT"
  print_intro_line body '2、用途：只执行 pod install，可能联网并更新依赖与工作区。'
  print_intro_line body '3、不会自动安装或升级 CocoaPods、Ruby、Homebrew，也不执行构建。'
  print_intro_line body "4、安装日志：$LOG_FILE（确认后开始记录）。"
  if [[ ! -t 0 ]]; then
    print_intro_line body '5、正在打开 Terminal；在终端按回车安装，Ctrl+C 取消。'
    open_terminal_and_run_script
    exit $?
  fi
  print_intro_line body '5、按回车开始安装；按 Ctrl+C 取消。'
  if ! read -r '?👉 已了解用途与影响，按回车继续：' _; then
    printf '\n%s\n' '[WARN] 未取得确认，已停止。' >&2
    exit 130
  fi
}
# 通过系统文件打开机制启动 .command，避免依赖 AppleScript 自动化授权。
open_terminal_and_run_script() {
  /usr/bin/open -b com.apple.Terminal "$SCRIPT_PATH"
  local launch_exit=$?
  if (( launch_exit != 0 )); then
    printf '[ERROR] 无法打开 Terminal，退出码：%s\n' "$launch_exit" >&2
    return "$launch_exit"
  fi
  printf '%s\n' '[INFO] 已打开终端等待确认；安装结果以终端及安装日志为准。'
}
# 确认后初始化本次日志，并保留安装管道的退出码处理权。
initialize_script_runtime() {
  setopt NO_NOMATCH PIPE_FAIL
  if ! : > "$LOG_FILE"; then
    printf '[ERROR] 无法写入安装日志：%s\n' "$LOG_FILE" >&2
    exit 1
  fi
  trap 'printf "\n[WARN] 安装已取消。\n" | /usr/bin/tee -a "$LOG_FILE"; exit 130' INT
}
# 同步显示业务日志并落盘，写入失败立即终止。
log() {
  printf '%s\n' "$1" | /usr/bin/tee -a "$LOG_FILE"
  if (( $? != 0 )); then
    printf '[ERROR] 写入日志失败：%s\n' "$LOG_FILE" >&2
    exit 1
  fi
}
# 校验本脚本归属的 Podfile，避免依赖 Xcode 的启动工作目录。
resolve_project_directory() {
  if [[ ! -f "$PROJECT_ROOT/Podfile" ]]; then
    log "[ERROR] 未找到本工程 Podfile：$PROJECT_ROOT/Podfile"
    exit 1
  fi
  if ! cd -- "$PROJECT_ROOT"; then
    log "[ERROR] 无法进入项目目录：$PROJECT_ROOT"
    exit 1
  fi
  log "[INFO] 项目目录：$PROJECT_ROOT"
}
# 优先使用终端现有 pod，缺失时才补充常见 Homebrew 路径并复检。
check_pod_environment() {
  POD_EXECUTABLE="$(command -v pod)"
  if [[ -z "$POD_EXECUTABLE" ]]; then
    export PATH="${PATH:-/usr/bin:/bin}:/opt/homebrew/bin:/usr/local/bin"
    rehash
    POD_EXECUTABLE="$(command -v pod)"
  fi
  if [[ -z "$POD_EXECUTABLE" ]]; then
    log '[ERROR] 未找到 pod；请先在普通终端配置 CocoaPods 后重试。'
    exit 127
  fi
  log "[INFO] CocoaPods 入口：$POD_EXECUTABLE"
  "$POD_EXECUTABLE" --version 2>&1 | /usr/bin/tee -a "$LOG_FILE"
  local -a check_codes=("${pipestatus[@]}")
  if (( check_codes[1] != 0 || check_codes[2] != 0 )); then
    log "[ERROR] pod --version 健康检查失败：pod=${check_codes[1]}，日志=${check_codes[2]}。"
    exit 1
  fi
}
# 实时保存安装输出，报告并返回 pod 的真实退出码。
run_pod_install() {
  log '[INFO] 开始执行：pod install'
  "$POD_EXECUTABLE" install 2>&1 | /usr/bin/tee -a "$LOG_FILE"
  local -a install_codes=("${pipestatus[@]}")
  local install_exit="${install_codes[1]}"
  if (( install_codes[2] != 0 )); then
    printf '[ERROR] 安装日志写入失败：%s\n' "$LOG_FILE" >&2
    (( install_exit == 0 )) && install_exit=1
  fi
  if (( install_exit == 0 )); then
    log '[OK] pod install 已完成，退出码：0。'
  else
    log "[ERROR] pod install 失败，退出码：$install_exit。"
  fi
  log "[INFO] 完整安装日志：$LOG_FILE"
  exit "$install_exit"
}
# 编排手动入口、确认、环境检查和依赖安装。
main() {
  show_script_intro_and_wait "$@" # 打印内置自述，转发 Xcode 入口或等待终端确认。
  initialize_script_runtime # 确认后初始化 zsh 选项与安装日志。
  resolve_project_directory # 按脚本位置定位并校验 iOS 项目。
  check_pod_environment # 检查当前终端的 CocoaPods 可执行性。
  run_pod_install # 安装依赖并显示真实结果与日志位置。
}

main "$@"
