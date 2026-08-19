#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：恢复 Xcode PIF 构建会话
# - 核心用途：在 pod install 集成结束后，安全回收空闲的 Xcode 构建服务，并验证工作区依赖图可重新计算。
# - 影响范围：仅当前用户的空闲 SWBBuildService / XCBBuildService；不关闭 Xcode，不删除 DerivedData。
# - 运行提示：Podfile 钩子无交互运行；终端独立运行需输入 YES；--check-only 只诊断不修改进程。

SCRIPT_PATH="${0:A}"
SCRIPT_DIR="${SCRIPT_PATH:h}"
SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
TEMP_ROOT="${TMPDIR:-/tmp}"
DEFAULT_PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
LOG_FILE="${TEMP_ROOT%/}/${SCRIPT_BASENAME}.log"
VERIFY_LOG="${TEMP_ROOT%/}/${SCRIPT_BASENAME}.xcodebuild-list.log"
PROCESS_SNAPSHOT="${TEMP_ROOT%/}/${SCRIPT_BASENAME}.$$.processes"
LOCK_FILE="${TEMP_ROOT%/}/jobs-xcode-pif-session-recovery.lock"
PROJECT_ROOT="${DEFAULT_PROJECT_ROOT}"
CURRENT_UID=""
XCODEBUILD_BIN=""
WORKSPACE_PATH=""
CHECK_ONLY=0
SKIP_VERIFY=0
ACTIVE_BUILD_DETECTED=0
SERVICE_COUNT=0
RECOVERED_COUNT=0
SKIPPED_COUNT=0
FAILURE_COUNT=0
LOCK_ACQUIRED=0

# 判断环境变量是否表达启用状态。
is_truthy() {
  case "${1:-}" in
    1|true|TRUE|yes|YES|on|ON) return 0 ;;
    *) return 1 ;;
  esac
}

# 判断参数列表中是否包含指定开关。
has_argument() {
  local expected="$1"
  shift
  local argument
  for argument in "$@"; do
    [[ "${argument}" == "${expected}" ]] && return 0
  done
  return 1
}

# 第一屏说明风险边界，并在独立修复模式下要求明确确认。
show_script_intro_and_wait() {
  print -r -- ""
  print -r -- "【恢复 Xcode PIF 构建会话】"
  print -r -- "用途：处理 unable to initiate PIF transfer session (operation in progress?)。"
  print -r -- "边界：不关闭 Xcode、不删除 DerivedData、不打断可识别的活动构建。"

  if is_truthy "${JOBS_POD_INSTALL_HOOK:-}" || is_truthy "${JOBS_SKIP_README:-}"; then
    print -r -- "模式：pod install 后置钩子，无交互执行。"
    return 0
  fi

  if has_argument "--check-only" "$@"; then
    print -r -- "模式：只读诊断，不修改进程。"
    return 0
  fi

  print -r -- "即将仅向当前用户的空闲 Xcode 构建服务发送 TERM。"
  print -n -r -- "输入 YES 继续："
  local answer=""
  read -r answer
  if [[ "${answer}" != "YES" ]]; then
    print -r -- "已取消，未修改任何进程。"
    exit 0
  fi
}

# 输出脚本参数说明。
print_usage() {
  print -r -- "用法：$(basename "${(%):-%x}") [--check-only] [--skip-verify] [--project-root 路径]"
}

# 清理本脚本创建的进程快照和跨工程互斥锁。
cleanup_runtime_artifacts() {
  /bin/rm -f -- "${PROCESS_SNAPSHOT}"
  if (( LOCK_ACQUIRED == 1 )); then
    local owner_pid=""
    if [[ -r "${LOCK_FILE}" ]]; then
      read -r owner_pid < "${LOCK_FILE}"
    fi
    if [[ "${owner_pid}" == "$$" ]]; then
      /bin/rm -f -- "${LOCK_FILE}"
    fi
  fi
}

# 在 zsh 全局退出阶段调用清理，避免函数局部 EXIT trap 提前失效。
TRAPEXIT() {
  cleanup_runtime_artifacts
}

# 初始化参数、日志和临时文件清理动作。
initialize_runtime() {
  setopt NO_NOMATCH

  while (( $# > 0 )); do
    case "$1" in
      --check-only)
        CHECK_ONLY=1
        ;;
      --skip-verify)
        SKIP_VERIFY=1
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
}

# 获取三套 iOS 工程共用的恢复锁，避免多个 pod install 并行操作 PIF 会话。
acquire_cross_project_lock() {
  local attempt=1

  while (( attempt <= 30 )); do
    if /usr/bin/shlock -p "$$" -f "${LOCK_FILE}" 2>/dev/null; then
      : > "${LOG_FILE}"
      : > "${VERIFY_LOG}"
      LOCK_ACQUIRED=1
      log_message "已获取跨工程 PIF 恢复锁。"
      return 0
    fi

    if (( attempt == 1 )); then
      warn_message "另一套 iOS 工程正在执行 PIF 恢复，最多等待 15 秒。"
    fi
    /bin/sleep 0.5
    attempt=$((attempt + 1))
  done

  warn_message "跨工程 PIF 恢复锁仍被占用，本次安全跳过。"
  exit 0
}

# 写入普通日志并同步显示到终端。
log_message() {
  print -r -- "[$(/bin/date '+%Y-%m-%d %H:%M:%S')] $1" | /usr/bin/tee -a "${LOG_FILE}"
}

# 写入警告日志但不中断流程。
warn_message() {
  log_message "警告：$1"
}

# 写入错误日志并累计失败次数。
error_message() {
  FAILURE_COUNT=$((FAILURE_COUNT + 1))
  log_message "错误：$1"
}

# 校验运行环境和当前工程目录。
validate_environment() {
  CURRENT_UID="$(/usr/bin/id -u)"
  XCODEBUILD_BIN="$(/usr/bin/xcrun --find xcodebuild 2>/dev/null)"

  if [[ -z "${XCODEBUILD_BIN}" || ! -x "${XCODEBUILD_BIN}" ]]; then
    error_message "未找到可执行的 xcodebuild。"
  fi
  if [[ ! -x /usr/bin/shlock ]]; then
    error_message "未找到 macOS 进程互斥工具 shlock。"
  fi
  if [[ ! -d "${PROJECT_ROOT}" ]]; then
    error_message "工程目录不存在：${PROJECT_ROOT}"
  else
    PROJECT_ROOT="$(cd "${PROJECT_ROOT}" && pwd)"
  fi

  log_message "工程目录：${PROJECT_ROOT}"
  log_message "运行模式：$([[ ${CHECK_ONLY} -eq 1 ]] && print '只读诊断' || print '安全恢复')"
  (( FAILURE_COUNT == 0 )) || exit 1
}

# 采集一次进程快照，保证后续判断基于同一时刻的数据。
capture_process_snapshot() {
  if ! /bin/ps -axo pid=,ppid=,uid=,comm= > "${PROCESS_SNAPSHOT}"; then
    error_message "无法读取当前进程列表。"
    exit 1
  fi
}

# 判断指定进程当前是否仍然存在。
process_is_alive() {
  /bin/kill -0 "$1" 2>/dev/null
}

# 判断快照中的指定进程是否拥有直接子进程。
process_has_child() {
  /usr/bin/awk -v parent_pid="$1" '$2 == parent_pid { found = 1 } END { exit found ? 0 : 1 }' "${PROCESS_SNAPSHOT}"
}

# 统计当前用户正在运行的 xcodebuild，作为活动构建保护信号。
count_active_xcodebuild() {
  /usr/bin/awk -v current_uid="${CURRENT_UID}" '
    $3 == current_uid && ($4 == "xcodebuild" || $4 ~ /\/xcodebuild$/) { count += 1 }
    END { print count + 0 }
  ' "${PROCESS_SNAPSHOT}"
}

# 输出当前用户的 Xcode 构建服务进程号。
collect_build_service_pids() {
  /usr/bin/awk -v current_uid="${CURRENT_UID}" '
    $3 == current_uid && ($4 == "SWBBuildService" || $4 ~ /\/SWBBuildService$/ || $4 == "XCBBuildService" || $4 ~ /\/XCBBuildService$/) { print $1 }
  ' "${PROCESS_SNAPSHOT}"
}

# 在限定时间内等待指定进程退出。
wait_for_process_exit() {
  local process_id="$1"
  local attempt=0
  while process_is_alive "${process_id}" && (( attempt < 25 )); do
    /bin/sleep 0.2
    attempt=$((attempt + 1))
  done
  ! process_is_alive "${process_id}"
}

# 仅回收没有活动构建信号、也没有子进程的构建服务。
recover_idle_build_services() {
  local active_xcodebuild_count=""
  local service_pids=""
  local -a service_pid_list
  local process_id
  local child_status=0

  if ! active_xcodebuild_count="$(count_active_xcodebuild)"; then
    ACTIVE_BUILD_DETECTED=1
    error_message "无法判断 xcodebuild 活动状态；为保证安全，跳过构建服务回收。"
    return 1
  fi
  if ! service_pids="$(collect_build_service_pids)"; then
    ACTIVE_BUILD_DETECTED=1
    error_message "无法读取 Xcode 构建服务；为保证安全，跳过构建服务回收。"
    return 1
  fi
  service_pid_list=(${(f)service_pids})
  SERVICE_COUNT=${#service_pid_list[@]}

  if (( active_xcodebuild_count > 0 )); then
    ACTIVE_BUILD_DETECTED=1
    SKIPPED_COUNT=${SERVICE_COUNT}
    warn_message "检测到 ${active_xcodebuild_count} 个 xcodebuild，跳过构建服务回收。"
    return 0
  fi

  if (( SERVICE_COUNT == 0 )); then
    log_message "未发现当前用户的 SWBBuildService / XCBBuildService，无需回收。"
    return 0
  fi

  for process_id in ${service_pid_list[@]}; do
    process_is_alive "${process_id}" || continue
    process_has_child "${process_id}"
    child_status=$?
    if (( child_status == 0 )); then
      ACTIVE_BUILD_DETECTED=1
      warn_message "构建服务 PID ${process_id} 存在子进程，按活动构建处理并跳过。"
    elif (( child_status != 1 )); then
      ACTIVE_BUILD_DETECTED=1
      error_message "无法判断构建服务 PID ${process_id} 的子进程状态；为保证安全，已跳过。"
    fi
  done

  if (( ACTIVE_BUILD_DETECTED == 1 )); then
    SKIPPED_COUNT=${SERVICE_COUNT}
    warn_message "存在活动构建信号，本轮不会回收任何 Xcode 构建服务。"
    return 0
  fi

  for process_id in ${service_pid_list[@]}; do
    if ! process_is_alive "${process_id}"; then
      SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
      continue
    fi
    if (( CHECK_ONLY == 1 )); then
      SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
      log_message "只读诊断：构建服务 PID ${process_id} 当前可安全回收。"
      continue
    fi

    log_message "正在向空闲构建服务 PID ${process_id} 发送 TERM。"
    if ! /bin/kill -TERM "${process_id}" 2>/dev/null; then
      error_message "无法向构建服务 PID ${process_id} 发送 TERM。"
      continue
    fi
    if wait_for_process_exit "${process_id}"; then
      RECOVERED_COUNT=$((RECOVERED_COUNT + 1))
      log_message "构建服务 PID ${process_id} 已退出，Xcode 将按需重建会话。"
    else
      error_message "构建服务 PID ${process_id} 在 5 秒内未退出；为避免破坏性操作，不升级为 KILL。"
    fi
  done
}

# 解析工程根目录下唯一或排序最靠前的工作区。
resolve_workspace_path() {
  local workspace_count
  WORKSPACE_PATH="$(/usr/bin/find "${PROJECT_ROOT}" -maxdepth 1 -type d -name '*.xcworkspace' -print | /usr/bin/sort | /usr/bin/head -n 1)"
  workspace_count="$(/usr/bin/find "${PROJECT_ROOT}" -maxdepth 1 -type d -name '*.xcworkspace' -print | /usr/bin/wc -l | /usr/bin/tr -d ' ')"

  if [[ -z "${WORKSPACE_PATH}" ]]; then
    warn_message "工程根目录没有找到 .xcworkspace，跳过依赖图验证。"
    return 1
  fi
  if (( workspace_count > 1 )); then
    warn_message "发现 ${workspace_count} 个工作区，将验证排序最靠前的：${WORKSPACE_PATH}"
  else
    log_message "待验证工作区：${WORKSPACE_PATH}"
  fi
  return 0
}

# 终止本脚本启动的超时 xcodebuild 及其直接子进程。
terminate_verification_processes() {
  local process_id="$1"
  local child_id
  local child_ids="$(/bin/ps -axo pid=,ppid= | /usr/bin/awk -v parent_pid="${process_id}" '$2 == parent_pid { print $1 }')"
  for child_id in ${(f)child_ids}; do
    /bin/kill -TERM "${child_id}" 2>/dev/null || true
  done
  /bin/kill -TERM "${process_id}" 2>/dev/null || true
}

# 以 60 秒上限运行 xcodebuild -list，验证 PIF 依赖图入口。
run_workspace_verification() {
  "${XCODEBUILD_BIN}" -workspace "${WORKSPACE_PATH}" -list > "${VERIFY_LOG}" 2>&1 &
  local verification_pid=$!
  local elapsed_seconds=0
  local verification_status=0

  while process_is_alive "${verification_pid}" && (( elapsed_seconds < 60 )); do
    /bin/sleep 1
    elapsed_seconds=$((elapsed_seconds + 1))
  done

  if process_is_alive "${verification_pid}"; then
    terminate_verification_processes "${verification_pid}"
    wait "${verification_pid}" 2>/dev/null || true
    error_message "xcodebuild -list 超过 60 秒，已仅终止本脚本启动的验证进程。详见 ${VERIFY_LOG}"
    return 1
  fi

  wait "${verification_pid}"
  verification_status=$?
  if (( verification_status != 0 )); then
    error_message "工作区依赖图验证失败（状态码 ${verification_status}）。详见 ${VERIFY_LOG}"
    return 1
  fi

  log_message "工作区依赖图验证通过。"
  return 0
}

# 根据安全状态决定是否执行工作区依赖图验证。
verify_workspace_dependency_graph() {
  if (( CHECK_ONLY == 1 )); then
    log_message "只读诊断模式：跳过会创建新构建服务的 xcodebuild 验证。"
    return 0
  fi
  if (( SKIP_VERIFY == 1 )); then
    log_message "已按 --skip-verify 跳过工作区依赖图验证。"
    return 0
  fi
  if (( ACTIVE_BUILD_DETECTED == 1 )); then
    warn_message "存在活动构建信号，跳过工作区依赖图验证，避免与现有 PIF 会话并行。"
    return 0
  fi
  resolve_workspace_path || return 0
  run_workspace_verification
}

# 汇总结果、日志位置和最终退出码。
print_run_summary() {
  log_message "汇总：发现服务 ${SERVICE_COUNT} 个，已恢复 ${RECOVERED_COUNT} 个，已跳过 ${SKIPPED_COUNT} 个，失败 ${FAILURE_COUNT} 项。"
  log_message "运行日志：${LOG_FILE}"
  if (( FAILURE_COUNT > 0 )); then
    exit 1
  fi
  exit 0
}

# 编排脚本主流程。
main() {
  show_script_intro_and_wait "$@" # 第一屏说明并按入口决定是否确认。
  initialize_runtime "$@" # 初始化参数、日志和临时文件。
  validate_environment # 校验 Xcode 工具链与工程目录。
  acquire_cross_project_lock # 串行化三套工程的 PIF 会话操作。
  capture_process_snapshot # 采集一致的构建进程快照。
  recover_idle_build_services # 安全回收可确认空闲的构建服务。
  verify_workspace_dependency_graph # 在安全条件下验证工作区依赖图。
  print_run_summary # 输出结果并返回标准退出码。
}

main "$@"
