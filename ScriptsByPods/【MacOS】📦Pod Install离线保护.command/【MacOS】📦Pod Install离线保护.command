#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：Pod Install 离线保护
# - 核心用途：前台生成依赖报告，集成完成后逐项确认 PIF 恢复及 CodeGraph 更新。
# - 影响范围：依赖报告、CodeGraph 工具链与地图、Xcode 空闲构建服务；不安装或删除 Pods。
# - 运行提示：终端先阅读自述并回车，业务选择由各子脚本确认；--check-only 不生成产物。

# 仅渲染自述：标题红色加粗，编号正文蓝色常规字重；非彩色终端输出纯文本。
jobs_intro_style() {
  local intro_color=0
  if [ -t 1 ] && [ -n "${TERM:-}" ] && [ "${TERM:-}" != dumb ] &&
     [ -z "${NO_COLOR+x}" ] && [ "${PLAIN_OUTPUT:-0}" != 1 ] &&
     [ "${IS_SOURCETREE_RUNTIME:-0}" != 1 ]; then
    intro_color=1
  fi
  /usr/bin/awk -v color="$intro_color" -v role="${1:-body}" '
    BEGIN { esc = sprintf("%c", 27) }
    {
      gsub(esc "\\[[0-9;]*m", "")
      gsub(/\\(033|e|x1[bB])\[[0-9;]*m/, "")
      if (!color || $0 ~ /^[[:space:]]*$/) { print; next }
      numbered = ($0 ~ /^[[:space:]➤ℹ🔹✔⚠]*([0-9]+[、.)）]|[0-9]+️⃣|[-•])/)
      heading = ($0 ~ /^[[:space:]]*#{1,6}[[:space:]]/ || $0 ~ /[：:][[:space:]]*$/ || $0 ~ /^[[:space:]]*[=━─-]{3}/)
      title = (!numbered && (role == "title" || heading))
      if (role == "auto" && !seen && !numbered) title = 1
      if ($0 !~ /^[[:space:]]*[=━─-]+[[:space:]]*$/) seen = 1
      printf "%s%s%s\n", esc (title ? "[1;31m" : "[0;34m"), $0, esc "[0m"
    }
  '
}
SCRIPT_PATH="${0:A}"
SCRIPT_DIR="${SCRIPT_PATH:h}"
SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
TEMP_ROOT="${TMPDIR:-/tmp}"
DEFAULT_PROJECT_ROOT="${SCRIPT_DIR}/../.."
PROJECT_ROOT="${DEFAULT_PROJECT_ROOT}"
PROJECT_LOG_TAG=""
LOG_FILE=""
OFFLINE_MODE=0
CHECK_ONLY=0
RUN_PREFLIGHT=0
RUN_POST_INTEGRATE=0
MODE_SELECTED=0
FAILURE_COUNT=0
SKIPPED_COUNT=0
STARTED_COUNT=0
INTERACTION_MODE="interactive"

# 判断环境变量是否表达启用状态。
is_truthy() {
  case "${1:-}" in
    1|true|TRUE|yes|YES|on|ON) return 0 ;;
    *) return 1 ;;
  esac
}

# 输出脚本参数说明。
print_usage() {
  print -r -- "用法：$(basename "${(%):-%x}") [--preflight] [--post-integrate] [--offline] [--check-only] [--project-root 路径]"
}

# 只解析参数和模式，不在确认前写文件或修改环境。
parse_arguments() {
  while (( $# > 0 )); do
    case "$1" in
      --preflight)
        RUN_PREFLIGHT=1
        MODE_SELECTED=1
        ;;
      --post-integrate)
        RUN_POST_INTEGRATE=1
        MODE_SELECTED=1
        ;;
      --offline)
        OFFLINE_MODE=1
        ;;
      --check-only)
        CHECK_ONLY=1
        ;;
      --project-root)
        shift
        if (( $# == 0 )); then
          print -r -- "错误：--project-root 缺少路径。"
          print_usage
          exit 2
        fi
        PROJECT_ROOT="$1"
        ;;
      --help|-h)
        print_usage
        exit 0
        ;;
      *)
        print -r -- "错误：未知参数 $1"
        print_usage
        exit 2
        ;;
    esac
    shift
  done

  if (( MODE_SELECTED == 0 )); then
    RUN_PREFLIGHT=1
    RUN_POST_INTEGRATE=1
  fi
  is_truthy "${JOBS_POD_INSTALL_OFFLINE:-}" && OFFLINE_MODE=1
  INTERACTION_MODE="${JOBS_POD_INSTALL_INTERACTION:-interactive}"
  is_truthy "${JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY:-}" && CHECK_ONLY=1
  case "${INTERACTION_MODE}" in
    interactive) ;;
    check-only) CHECK_ONLY=1 ;;
    skip) print -r -- "已显式跳过辅助脚本。"; exit 0 ;;
    *) print -r -- "错误：JOBS_POD_INSTALL_INTERACTION 仅支持 interactive、check-only、skip。"; exit 2 ;;
  esac
  if is_truthy "${JOBS_POD_INSTALL_PURE:-}" || is_truthy "${JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS:-}"; then
    print -r -- "纯净模式：已跳过前置和收尾辅助脚本。"
    exit 0
  fi
  (( CHECK_ONLY == 1 )) && INTERACTION_MODE="check-only"
  export JOBS_POD_INSTALL_INTERACTION="${INTERACTION_MODE}"
  return 0
}

# 用户确认或钩子允许执行后，再初始化项目级日志和运行环境。
initialize_runtime() {
  setopt NO_NOMATCH
  if [[ -d "${PROJECT_ROOT}" ]]; then
    PROJECT_ROOT="$(cd "${PROJECT_ROOT}" && pwd)"
  fi
  PROJECT_LOG_TAG="$(print -rn -- "${PROJECT_ROOT}" | /usr/bin/cksum | /usr/bin/awk '{print $1}')"
  LOG_FILE="${TEMP_ROOT%/}/${SCRIPT_BASENAME}.${PROJECT_LOG_TAG}.log"
  export PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"
  (( CHECK_ONLY == 1 )) || : > "${LOG_FILE}"
  return 0
}

# 第一屏说明行为边界，并在独立执行时要求明确确认。
show_script_intro_and_wait() {
  print -r -- "" | jobs_intro_style body
  print -r -- "【Pod Install 本地脚本保护】" | jobs_intro_style body
  print -r -- "用途：前台生成依赖报告；集成完成后逐项确认 PIF 恢复和 CodeGraph 更新。" | jobs_intro_style body
  print -r -- "边界：安装、更新和恢复由各子脚本确认；--offline 禁止工具安装；不删除 Pods、锁文件、工作空间或 DerivedData。" | jobs_intro_style body
  print -r -- "取消：按 Ctrl+C 退出；无终端时跳过，CI 请显式选择 check-only 或 skip。" | jobs_intro_style body

  parse_arguments "$@"

  if (( CHECK_ONLY == 1 )); then
    print -r -- "模式：只读检查，不生成报告、不启动后台任务。" | jobs_intro_style body
    return 0
  fi

  if [[ ! -t 0 ]]; then
    print -r -- "当前无可交互终端，已跳过辅助任务；请在终端重新运行。"
    exit 0
  fi
  print -n -r -- "已了解辅助脚本用途，按回车继续；输入其它内容取消："
  local answer=""
  if ! read -r answer || [[ -n "${answer}" ]]; then
    print -r -- "已取消，未执行本地脚本。" | jobs_intro_style body
    exit 0
  fi
}

# 写入普通日志并同步显示到终端。
log_message() {
  if (( CHECK_ONLY == 1 )); then
    print -r -- "[$(/bin/date '+%Y-%m-%d %H:%M:%S')] $1"
  else
    print -r -- "[$(/bin/date '+%Y-%m-%d %H:%M:%S')] $1" | /usr/bin/tee -a "${LOG_FILE}"
  fi
}

# 写入警告并累计失败数，但不改变 pod install 结果。
warn_message() {
  FAILURE_COUNT=$((FAILURE_COUNT + 1))
  log_message "警告：$1"
}

# 统计安全跳过项。
skip_message() {
  SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
  log_message "跳过：$1"
}

# 校验工程根目录和 Podfile；失败时后续子任务只跳过。
validate_environment() {
  if [[ ! -d "${PROJECT_ROOT}" ]]; then
    warn_message "工程目录不存在：${PROJECT_ROOT}"
    return 0
  fi
  if [[ ! -f "${PROJECT_ROOT}/Podfile" ]]; then
    warn_message "工程根目录没有 Podfile：${PROJECT_ROOT}"
  fi

  log_message "工程目录：${PROJECT_ROOT}"
  log_message "执行阶段：preflight=${RUN_PREFLIGHT}，post_integrate=${RUN_POST_INTEGRATE}，check_only=${CHECK_ONLY}。"
  if (( RUN_PREFLIGHT == 1 )); then
    log_message "前置任务策略：只使用本机已有工具与源码，不发起工具安装。"
  fi
}

# 根据同名目录结构定位 ScriptsByPods 子脚本。
resolve_script_path() {
  local script_name="$1"
  print -r -- "${PROJECT_ROOT}/ScriptsByPods/${script_name}/${script_name}"
}

# 检查指定脚本是否存在。
script_is_ready() {
  local label="$1"
  local script_path="$2"
  if [[ ! -f "${script_path}" ]]; then
    skip_message "${label} 脚本不存在：${script_path}"
    return 1
  fi
  return 0
}

# 生成本地依赖报告，保留自述、工具安装及升级选择。
run_dependency_report() {
  local script_name="【MacOS】🔍查询Xcode工程依赖关系.command"
  local script_path="$(resolve_script_path "${script_name}")"
  script_is_ready "PodspecDependencyReport" "${script_path}" || return 0

  if (( CHECK_ONLY == 1 )); then
    log_message "检查通过：PodspecDependencyReport 脚本可用。"
    return 0
  fi

  log_message "执行：PodspecDependencyReport"
  JOBS_PROJECT_ROOT="${PROJECT_ROOT}" \
  JOBS_POD_INSTALL_HOOK=1 \
  JOBS_POD_INSTALL_OFFLINE="${OFFLINE_MODE}" \
    /bin/zsh "${script_path}"
  local report_status=$?
  if (( report_status == 0 )); then
    STARTED_COUNT=$((STARTED_COUNT + 1))
    log_message "依赖报告流程结束，生成或跳过结果见上方子脚本输出。"
  else
    warn_message "PodspecDependencyReport 退出码=${report_status}，不影响 pod install。"
  fi
}

# 集成成功后前台执行 CodeGraph，安装及地图操作由子脚本确认。
run_codegraph_task() {
  local script_name="codegraph_init.command"
  local script_path="$(resolve_script_path "${script_name}")"
  local allow_install="${CODEGRAPH_ALLOW_INSTALL:-1}"
  if [[ "${JOBS_SKIP_CODEGRAPH:-0}" == 1 ]]; then
    skip_message "JOBS_SKIP_CODEGRAPH=1，已跳过 CodeGraph。"
    return 0
  fi
  script_is_ready "CodeGraph" "${script_path}" || return 0
  (( OFFLINE_MODE == 1 )) && allow_install=0

  if (( CHECK_ONLY == 1 )); then
    log_message "执行：CodeGraph 工具链只读体检，不安装、不建图。"
    CODEGRAPH_ALLOW_INSTALL=0 \
    JOBS_CODEGRAPH_PROJECT_ROOT="${PROJECT_ROOT}" \
      /bin/zsh "${script_path}" --check-only
    local check_status=$?
    (( check_status == 0 )) || warn_message "CodeGraph 体检退出码=${check_status}，不影响 pod install。"
    return 0
  fi

  JOBS_POD_INSTALL_HOOK=1 \
  JOBS_CODEGRAPH_PROJECT_ROOT="${PROJECT_ROOT}" \
  CODEGRAPH_ALLOW_INSTALL="${allow_install}" \
  CODEGRAPH_EXPORT_ASYNC=0 \
    /bin/zsh "${script_path}"
  local codegraph_status=$?
  if (( codegraph_status == 0 )); then
    STARTED_COUNT=$((STARTED_COUNT + 1))
    log_message "CodeGraph 流程结束，执行或跳过结果见上方子脚本输出。"
  else
    warn_message "CodeGraph 退出码=${codegraph_status}，不影响 pod install。"
  fi
}

# 执行 PIF 会话安全检查；只读模式向子脚本透传 --check-only。
run_pif_session_recovery() {
  local script_name="【MacOS】🧹恢复Xcode PIF构建会话.command"
  local script_path="$(resolve_script_path "${script_name}")"
  local -a arguments
  script_is_ready "XcodePIFSessionRecovery" "${script_path}" || return 0

  arguments=("${script_path}" '--project-root' "${PROJECT_ROOT}")
  (( CHECK_ONLY == 1 )) && arguments+=('--check-only')

  log_message "执行：XcodePIFSessionRecovery"
  JOBS_POD_INSTALL_HOOK=1 /bin/zsh "${arguments[@]}"
  local pif_status=$?
  if (( pif_status == 0 )); then
    STARTED_COUNT=$((STARTED_COUNT + 1))
    log_message "PIF 流程结束，恢复或跳过结果见上方子脚本输出。"
  else
    warn_message "XcodePIFSessionRecovery 退出码=${pif_status}，不影响 pod install。"
  fi
}

# 运行不依赖 CocoaPods 网络结果的前置本地任务。
run_preflight_tasks() {
  (( RUN_PREFLIGHT == 1 )) || return 0
  run_dependency_report
}

# 只在 CocoaPods 集成完成后依次执行 PIF 和 CodeGraph。
run_post_integrate_tasks() {
  (( RUN_POST_INTEGRATE == 1 )) || return 0
  run_pif_session_recovery
  run_codegraph_task
}

# 汇总辅助任务真实状态，供 Podfile 告警而不覆盖安装结果。
print_summary_and_return_status() {
  log_message "汇总：已调用=${STARTED_COUNT}，跳过=${SKIPPED_COUNT}，警告=${FAILURE_COUNT}。"
  log_message "本地脚本采用非阻断策略，不改变 CocoaPods 自身的成功或失败结果。"
  (( FAILURE_COUNT == 0 ))
}

# 编排 Pod Install 本地脚本。
main() {
  show_script_intro_and_wait "$@" # 先显示用途，再解析模式并处理执行确认。
  initialize_runtime # 确认后再初始化日志和运行环境。
  validate_environment # 校验工程根目录和 Podfile。
  run_preflight_tasks # 前台生成本地依赖报告并保留工具选择。
  run_post_integrate_tasks # 安装完成后依次确认 PIF 和地图操作。
  print_summary_and_return_status # 返回辅助任务状态，由 Podfile 保留安装结果。
}

main "$@"
