#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：Pod Install 离线保护
# - 核心用途：将 Jobs 本地任务与 CocoaPods 网络阶段解耦，并在集成完成后检查 Xcode PIF 会话。
# - 影响范围：依赖报告、CodeGraph 后台任务、Xcode PIF 安全检查；不安装或删除 Pods。
# - 运行提示：Podfile 钩子无交互运行；终端独立运行需输入 YES；--check-only 只检查不生成产物。

SCRIPT_PATH="${0:A}"
SCRIPT_DIR="${SCRIPT_PATH:h}"
SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
TEMP_ROOT="${TMPDIR:-/tmp}"
DEFAULT_PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
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

# 解析运行阶段和工程路径，并初始化项目级日志。
initialize_runtime() {
  setopt NO_NOMATCH

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
  (( RUN_PREFLIGHT == 1 )) && OFFLINE_MODE=1

  if [[ -d "${PROJECT_ROOT}" ]]; then
    PROJECT_ROOT="$(cd "${PROJECT_ROOT}" && pwd)"
  fi
  PROJECT_LOG_TAG="$(print -rn -- "${PROJECT_ROOT}" | /usr/bin/cksum | /usr/bin/awk '{print $1}')"
  LOG_FILE="${TEMP_ROOT%/}/${SCRIPT_BASENAME}.${PROJECT_LOG_TAG}.log"
  export PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"
  : > "${LOG_FILE}"
}

# 第一屏说明行为边界，并在独立执行时要求明确确认。
show_script_intro_and_wait() {
  print -r -- ""
  print -r -- "【Pod Install 本地脚本保护】"
  print -r -- "用途：前置本地任务不等待 CocoaPods 网络；安装完成后单独检查 Xcode PIF 会话。"
  print -r -- "边界：不探测网络，不跳过 pod install，不删除 Pods、Podfile.lock、xcworkspace 或 DerivedData。"

  if is_truthy "${JOBS_POD_INSTALL_HOOK:-}"; then
    print -r -- "模式：Podfile 自动钩子，无交互执行。"
    return 0
  fi
  if (( CHECK_ONLY == 1 )); then
    print -r -- "模式：只读检查，不生成报告、不启动后台任务。"
    return 0
  fi

  print -n -r -- "输入 YES 继续执行本地脚本："
  local answer=""
  read -r answer
  if [[ "${answer}" != "YES" ]]; then
    print -r -- "已取消，未执行本地脚本。"
    exit 0
  fi
}

# 写入普通日志并同步显示到终端。
log_message() {
  print -r -- "[$(/bin/date '+%Y-%m-%d %H:%M:%S')] $1" | /usr/bin/tee -a "${LOG_FILE}"
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

# 生成本地 Podspec 依赖报告；Podfile 钩子禁止安装 Homebrew 或 Graphviz。
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
  JOBS_POD_INSTALL_OFFLINE=1 \
  JOBS_SKIP_README=1 \
    /bin/zsh "${script_path}"
  local report_status=$?
  if (( report_status == 0 )); then
    STARTED_COUNT=$((STARTED_COUNT + 1))
    log_message "完成：PodspecDependencyReport"
  else
    warn_message "PodspecDependencyReport 退出码=${report_status}，不影响 pod install。"
  fi
}

# 判断记录的后台进程是否仍存在。
process_is_alive() {
  /bin/kill -0 "$1" 2>/dev/null
}

# 确认 CodeGraph 所需工具都已在本机安装，缺少时不触发联网安装。
offline_codegraph_runtime_ready() {
  local command_name
  for command_name in brew npm codegraph; do
    if ! command -v "${command_name}" >/dev/null 2>&1; then
      skip_message "本机缺少 ${command_name}，不触发任何联网安装。"
      return 1
    fi
  done
  return 0
}

# 后台启动 CodeGraph，避免索引和导出阻塞 CocoaPods 网络阶段。
start_codegraph_background() {
  local script_name="codegraph_init.command"
  local script_path="$(resolve_script_path "${script_name}")"
  local pid_dir="${PROJECT_ROOT}/.codegraph"
  local pid_path="${pid_dir}/codegraph_init.pid"
  local async_log="${TEMP_ROOT%/}/codegraph_init.${PROJECT_LOG_TAG}.async.log"
  local existing_pid=""
  local child_pid=""
  script_is_ready "CodeGraph" "${script_path}" || return 0

  if (( CHECK_ONLY == 1 )); then
    log_message "检查通过：CodeGraph 脚本可用。"
    return 0
  fi
  offline_codegraph_runtime_ready || return 0

  if [[ -r "${pid_path}" ]]; then
    read -r existing_pid < "${pid_path}"
  fi
  if [[ "${existing_pid}" == <-> ]] && process_is_alive "${existing_pid}"; then
    skip_message "CodeGraph 后台同步已在运行，PID=${existing_pid}。"
    return 0
  fi

  /bin/mkdir -p "${pid_dir}"
  JOBS_POD_INSTALL_HOOK=1 \
  JOBS_POD_INSTALL_OFFLINE=1 \
  JOBS_SKIP_README=1 \
  CODEGRAPH_AUTO_INIT=1 \
  CODEGRAPH_EXPORT_ASYNC=0 \
    /usr/bin/nohup /bin/zsh "${script_path}" > "${async_log}" 2>&1 &
  child_pid=$!
  print -r -- "${child_pid}" > "${pid_path}"
  STARTED_COUNT=$((STARTED_COUNT + 1))
  log_message "已后台启动：CodeGraph，PID=${child_pid}，日志=${async_log}"
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
  JOBS_POD_INSTALL_HOOK=1 JOBS_SKIP_README=1 /bin/zsh "${arguments[@]}"
  local pif_status=$?
  if (( pif_status == 0 )); then
    STARTED_COUNT=$((STARTED_COUNT + 1))
    log_message "完成：XcodePIFSessionRecovery"
  else
    warn_message "XcodePIFSessionRecovery 退出码=${pif_status}，不影响 pod install。"
  fi
}

# 运行不依赖 CocoaPods 网络结果的前置本地任务。
run_preflight_tasks() {
  (( RUN_PREFLIGHT == 1 )) || return 0
  run_dependency_report
  start_codegraph_background
}

# 只在 CocoaPods 集成完成后执行 PIF 会话检查。
run_post_integrate_tasks() {
  (( RUN_POST_INTEGRATE == 1 )) || return 0
  run_pif_session_recovery
}

# 汇总所有本地脚本结果并固定返回成功。
print_summary_and_succeed() {
  log_message "汇总：已执行或启动=${STARTED_COUNT}，跳过=${SKIPPED_COUNT}，警告=${FAILURE_COUNT}。"
  log_message "本地脚本采用非阻断策略，不改变 CocoaPods 自身的成功或失败结果。"
  return 0
}

# 编排 Pod Install 本地脚本。
main() {
  initialize_runtime "$@" # 解析阶段、只读和工程路径参数。
  show_script_intro_and_wait # 输出边界并处理独立执行确认。
  validate_environment # 校验工程根目录和 Podfile。
  run_preflight_tasks # 异步钩子内执行本地报告与 CodeGraph 启动。
  run_post_integrate_tasks # 安装完成后检查 Xcode PIF 会话。
  print_summary_and_succeed # 汇总并固定返回成功。
}

main "$@"
