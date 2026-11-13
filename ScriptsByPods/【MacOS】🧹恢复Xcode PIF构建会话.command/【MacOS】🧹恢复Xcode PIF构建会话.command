#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：恢复 Xcode PIF 构建会话
# - 核心用途：在 pod install 集成结束后，安全回收空闲的 Xcode 构建服务，并验证工作区依赖图可重新计算。
# - 影响范围：仅当前用户的空闲 SWBBuildService / XCBBuildService；不关闭 Xcode，不删除 DerivedData。
# - 运行提示：包括 Podfile 调用在内都需终端精确输入 YES；check-only 只诊断，不写日志、快照或锁。

# >>> Jobs terminal style protection v1 >>>
# 临时保护当前终端配色，业务进程自行管理原有退出清理。
jobs_terminal_style_run() {
    # 无法可靠保存原色时，沿用脚本已有的纯文本约定。
    jobs_terminal_style_plain() {
        PLAIN_OUTPUT=1
        NO_COLOR=1
        FORCE_COLOR=0
        CLICOLOR=0
        ANSI_COLORS_DISABLED=1
        npm_config_color=false
        export PLAIN_OUTPUT NO_COLOR FORCE_COLOR CLICOLOR ANSI_COLORS_DISABLED npm_config_color
        if "$@"; then
            jobs_style_exit_status=0
        else
            jobs_style_exit_status=$?
        fi
        exit "$jobs_style_exit_status"
    }
    if [ ! -t 0 ] || [ ! -t 1 ] || [ -z "${TERM:-}" ] ||
       [ "${TERM:-}" = dumb ] || [ "${NO_COLOR+x}" = x ] ||
       [ "${PLAIN_OUTPUT:-0}" = 1 ] || [ "${IS_SOURCETREE_RUNTIME:-0}" = 1 ] ||
       env | LC_ALL=C grep -qiE '^(SOURCETREE|SOURCE_TREE)'; then
        if "$@"; then
            jobs_style_exit_status=0
        else
            jobs_style_exit_status=$?
        fi
        exit "$jobs_style_exit_status"
    fi
    if [ -n "${TMUX:-}${STY:-}" ]; then
        jobs_terminal_style_plain "$@"
    fi
    jobs_style_tty=$(tty 2>/dev/null) || jobs_terminal_style_plain "$@"
    if ! ps -o pgid= -o tpgid= -p "$$" 2>/dev/null |
         LC_ALL=C awk 'NF == 2 && $1 == $2 && $1 > 0 { foreground = 1 } END { exit !foreground }'; then
        jobs_terminal_style_plain "$@"
    fi
    case ${JOBS_TERMINAL_STYLE_OWNER:-} in
        ''|*[!0-9]*) ;;
        *)
            if [ "${JOBS_TERMINAL_STYLE_TTY:-}" = "$jobs_style_tty" ] &&
               kill -0 "$JOBS_TERMINAL_STYLE_OWNER" 2>/dev/null; then
                if "$@"; then
                    jobs_style_exit_status=0
                else
                    jobs_style_exit_status=$?
                fi
                exit "$jobs_style_exit_status"
            fi
            ;;
    esac
    jobs_style_stty=$(stty -g 2>/dev/null < /dev/tty) || jobs_terminal_style_plain "$@"
    jobs_style_saved=''
    jobs_style_saved_rows=''
    jobs_style_applied_rows=''
    jobs_style_changed=0
    jobs_style_applied_complete=0
    jobs_style_query_active=0
    jobs_style_recovery=''
    jobs_style_exit_status=0
    jobs_style_esc=$(printf '\033')
    jobs_style_bel=$(printf '\007')
    # 只接受本次请求对应的 RGB 响应；非协议输入使本次探测失败。
    jobs_terminal_style_query() {
        jobs_style_query_key=$1
        printf '\033]%s;?\007' "$jobs_style_query_key" > /dev/tty || return 1
        jobs_style_reply=''
        for jobs_style_attempt in 1 2 3; do
            jobs_style_piece=$(dd bs=256 count=1 2>/dev/null < /dev/tty)
            jobs_style_reply=$jobs_style_reply$jobs_style_piece
            case $jobs_style_reply in
                *"$jobs_style_bel"|*"$jobs_style_esc\\") break ;;
                '') ;;
                "$jobs_style_esc"*) ;;
                *) break ;;
            esac
        done
        case $jobs_style_reply in
            "$jobs_style_esc]$jobs_style_query_key;rgb:"*"$jobs_style_bel")
                jobs_style_rgb=${jobs_style_reply#"$jobs_style_esc]$jobs_style_query_key;rgb:"}
                jobs_style_rgb=${jobs_style_rgb%"$jobs_style_bel"}
                ;;
            "$jobs_style_esc]$jobs_style_query_key;rgb:"*"$jobs_style_esc\\")
                jobs_style_rgb=${jobs_style_reply#"$jobs_style_esc]$jobs_style_query_key;rgb:"}
                jobs_style_rgb=${jobs_style_rgb%"$jobs_style_esc\\"}
                ;;
            *) return 1 ;;
        esac
        jobs_style_normalized=$(printf '%s\n' "$jobs_style_rgb" | LC_ALL=C awk -F/ '
            NF != 3 { exit 1 }
            {
                for (i = 1; i <= 3; i++) {
                    h = tolower($i)
                    if (length(h) < 1 || length(h) > 4 || h ~ /[^0-9a-f]/) exit 1
                    n = 0
                    for (j = 1; j <= length(h); j++) n = n * 16 + index("0123456789abcdef", substr(h, j, 1)) - 1
                    value[i] = int(n * 65535 / (16 ^ length(h) - 1) + 0.5)
                }
                printf "%d/%d/%d", value[1], value[2], value[3]
            }
        ') || return 1
        [ -n "$jobs_style_normalized" ]
    }
    # 查询可用不代表终端允许改色，按目标值核对实际生效结果。
    jobs_terminal_style_accepts_target() {
        jobs_style_requested_hex=''
        case $1 in
            10|12) jobs_style_requested_hex=ffffff ;;
            11) jobs_style_requested_hex=000000 ;;
            '4;'*)
                jobs_style_requested_index=0
                for jobs_style_requested_color in 000000 ff5f56 5fd787 ffd75f 5fafff d787ff 5fd7ff eeeeee 9e9e9e ff8787 87ffaf ffff87 87bfff ffafff afffff ffffff; do
                    if [ "4;$jobs_style_requested_index" = "$1" ]; then
                        jobs_style_requested_hex=$jobs_style_requested_color
                        break
                    fi
                    jobs_style_requested_index=$((jobs_style_requested_index + 1))
                done
                ;;
        esac
        [ -n "$jobs_style_requested_hex" ] || return 1
        printf '%s|%s\n' "$jobs_style_normalized" "$jobs_style_requested_hex" | LC_ALL=C awk -F'|' '
            function hexbyte(h) {
                return (index("0123456789abcdef", substr(h, 1, 1)) - 1) * 16 + index("0123456789abcdef", substr(h, 2, 1)) - 1
            }
            {
                if (split($1, actual, "/") != 3 || length($2) != 6) exit 1
                for (i = 1; i <= 3; i++) {
                    difference = actual[i] - hexbyte(substr($2, i * 2 - 1, 2)) * 257
                    if (difference < -255 || difference > 255) exit 1
                }
            }
        '
    }
    # 检测到后续改色时只恢复仍由本次保护持有的项，保留独立恢复入口。
    jobs_terminal_style_cleanup() {
        jobs_style_result=$1
        trap '' HUP INT TERM
        if [ "$jobs_style_query_active" = 1 ]; then
            stty "$jobs_style_stty" 2>/dev/null < /dev/tty || :
            jobs_style_query_active=0
        fi
        if [ "$jobs_style_changed" = 1 ]; then
            jobs_style_cleanup_ok=0
            jobs_style_conflicts=''
            jobs_style_restore_safe=''
            if [ "$jobs_style_applied_complete" = 1 ]; then
                jobs_style_stty=$(stty -g 2>/dev/null < /dev/tty) || jobs_style_stty=''
                if [ -n "$jobs_style_stty" ] && stty -echo -icanon min 0 time 1 2>/dev/null < /dev/tty; then
                    jobs_style_query_active=1
                    jobs_style_cleanup_ok=1
                    while IFS='|' read -r jobs_style_key jobs_style_expected jobs_style_original; do
                        [ -n "$jobs_style_key" ] || continue
                        if ! jobs_terminal_style_query "$jobs_style_key"; then
                            jobs_style_cleanup_ok=0
                            break
                        fi
                        if [ "$jobs_style_normalized" = "$jobs_style_expected" ]; then
                            jobs_style_restore_safe=$jobs_style_restore_safe$jobs_style_original
                        else
                            jobs_style_conflicts="$jobs_style_conflicts $jobs_style_key"
                        fi
                    done <<JOBS_STYLE_APPLIED
$jobs_style_applied_rows
JOBS_STYLE_APPLIED
                    stty "$jobs_style_stty" 2>/dev/null < /dev/tty || jobs_style_cleanup_ok=0
                    jobs_style_query_active=0
                fi
            fi
            if [ "$jobs_style_cleanup_ok" = 1 ] && printf '%s\033[0m' "$jobs_style_restore_safe" > /dev/tty; then
                if [ -z "$jobs_style_conflicts" ]; then
                    rm -f "$jobs_style_recovery"
                    rmdir "${jobs_style_recovery%/*}" 2>/dev/null || :
                else
                    printf '检测到运行期间的配色变更，已保留这些项：%s\n' "$jobs_style_conflicts" >&2
                    printf '确认要覆盖后续改色时才使用恢复入口：sh "%s"\n' "$jobs_style_recovery" >&2
                    [ "$jobs_style_result" -ne 0 ] || jobs_style_result=1
                fi
            else
                printf '终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh "%s"\n' "$jobs_style_recovery" >&2
                [ "$jobs_style_result" -ne 0 ] || jobs_style_result=1
            fi
        fi
        if [ "${2:-}" = continue ]; then
            jobs_style_cleanup_status=$jobs_style_result
            return 0
        fi
        exit "$jobs_style_result"
    }
    trap 'jobs_terminal_style_cleanup "$jobs_style_exit_status"' 0
    trap 'jobs_style_exit_status=129; exit 129' HUP
    trap 'jobs_style_exit_status=130; exit 130' INT
    trap 'jobs_style_exit_status=143; exit 143' TERM
    if ! stty -echo -icanon min 0 time 1 2>/dev/null < /dev/tty; then
        jobs_terminal_style_plain "$@"
    fi
    jobs_style_query_active=1
    jobs_style_probe_ok=1
    for jobs_style_key in 10 11 12 '4;0' '4;1' '4;2' '4;3' '4;4' '4;5' '4;6' '4;7' '4;8' '4;9' '4;10' '4;11' '4;12' '4;13' '4;14' '4;15'; do
        if ! jobs_terminal_style_query "$jobs_style_key"; then
            jobs_style_probe_ok=0
            break
        fi
        jobs_style_saved=$jobs_style_saved$jobs_style_reply
        jobs_style_saved_rows="$jobs_style_saved_rows$jobs_style_key|$jobs_style_reply
"
    done
    stty "$jobs_style_stty" 2>/dev/null < /dev/tty || { jobs_style_exit_status=1; exit 1; }
    jobs_style_query_active=0
    if [ "$jobs_style_probe_ok" != 1 ]; then
        printf '%s\n' '终端不支持完整配色保存，或启动时收到其它输入；保留原配色并使用纯文本。' >&2
        jobs_terminal_style_plain "$@"
    fi
    jobs_style_recovery_dir=$(umask 077; mktemp -d "${TMPDIR:-/tmp}/jobs-terminal-style.XXXXXX") || jobs_terminal_style_plain "$@"
    jobs_style_recovery=$jobs_style_recovery_dir/restore.sh
    if ! (umask 077; {
        printf '#!/bin/sh\n'
        printf '[ -t 0 ] && [ "$(tty)" = '\''%s'\'' ] || { printf '\''请在原终端运行恢复入口。\\n'\'' >&2; exit 1; }\n' "$jobs_style_tty"
        printf 'printf '\''本操作会覆盖此终端当前配色。确认恢复脚本启动前的配色，请输入 YES：'\'' >&2\n'
        printf 'IFS= read -r jobs_restore_choice\n[ "$jobs_restore_choice" = YES ] || exit 1\n'
        printf 'printf '\''%%s\\033[0m'\'' '\''%s'\'' > /dev/tty\n' "$jobs_style_saved"
    } > "$jobs_style_recovery"); then
        printf '%s\n' '无法保存终端配色恢复入口；保留原配色并使用纯文本。' >&2
        jobs_terminal_style_plain "$@"
    fi
    printf '正在准备本次终端临时配色；强退后恢复入口：sh "%s"\n' "$jobs_style_recovery" >&2
    jobs_style_changed=1
    printf '\033]10;#ffffff\007\033]11;#000000\007\033]12;#ffffff\007' > /dev/tty
    jobs_style_index=0
    for jobs_style_color in 000000 ff5f56 5fd787 ffd75f 5fafff d787ff 5fd7ff eeeeee 9e9e9e ff8787 87ffaf ffff87 87bfff ffafff afffff ffffff; do
        printf '\033]4;%s;#%s\007' "$jobs_style_index" "$jobs_style_color" > /dev/tty
        jobs_style_index=$((jobs_style_index + 1))
    done
    printf '\033[0m' > /dev/tty
    jobs_style_stty=$(stty -g 2>/dev/null < /dev/tty) || { jobs_style_exit_status=1; exit 1; }
    stty -echo -icanon min 0 time 1 2>/dev/null < /dev/tty || { jobs_style_exit_status=1; exit 1; }
    jobs_style_query_active=1
    jobs_style_probe_ok=1
    jobs_style_targets_ok=1
    while IFS='|' read -r jobs_style_key jobs_style_original; do
        [ -n "$jobs_style_key" ] || continue
        if ! jobs_terminal_style_query "$jobs_style_key"; then
            jobs_style_probe_ok=0
            break
        fi
        jobs_style_applied_rows="$jobs_style_applied_rows$jobs_style_key|$jobs_style_normalized|$jobs_style_original
"
        if ! jobs_terminal_style_accepts_target "$jobs_style_key"; then
            jobs_style_targets_ok=0
        fi
    done <<JOBS_STYLE_ORIGINAL
$jobs_style_saved_rows
JOBS_STYLE_ORIGINAL
    stty "$jobs_style_stty" 2>/dev/null < /dev/tty || { jobs_style_exit_status=1; exit 1; }
    jobs_style_query_active=0
    if [ "$jobs_style_probe_ok" != 1 ]; then
        printf '%s\n' '无法核实本次临时配色，已停止启动业务。' >&2
        jobs_style_exit_status=1
        exit 1
    fi
    jobs_style_applied_complete=1
    if [ "$jobs_style_targets_ok" != 1 ]; then
        jobs_terminal_style_cleanup 0 continue
        jobs_style_changed=0
        if [ "$jobs_style_cleanup_status" != 0 ]; then
            jobs_style_exit_status=1
            exit 1
        fi
        trap 'jobs_style_exit_status=129; exit 129' HUP
        trap 'jobs_style_exit_status=130; exit 130' INT
        trap 'jobs_style_exit_status=143; exit 143' TERM
        printf '%s\n' '终端未接受本次配色，已恢复原配色并使用纯文本。' >&2
        jobs_terminal_style_plain "$@"
    fi
    printf '%s\n' '本次终端已临时使用黑底白字。' >&2
    JOBS_TERMINAL_STYLE_TTY=$jobs_style_tty
    JOBS_TERMINAL_STYLE_OWNER=$$
    export JOBS_TERMINAL_STYLE_TTY JOBS_TERMINAL_STYLE_OWNER
    if "$@"; then
        jobs_style_exit_status=0
    else
        jobs_style_exit_status=$?
    fi
    exit "$jobs_style_exit_status"
}
# 仅监督直接执行的入口；被 source 时不切换配色、不重新执行业务。
jobs_terminal_style_bootstrap() {
    jobs_style_bootstrap_script=$1
    shift
    if [ -n "${ZSH_VERSION:-}" ]; then
        case ${ZSH_EVAL_CONTEXT:-} in
            *:file|*:file:*) return 0 ;;
        esac
    elif [ -n "${BASH_VERSION:-}" ] && [ "${BASH_SOURCE:-$jobs_style_bootstrap_script}" != "$jobs_style_bootstrap_script" ]; then
        return 0
    fi
    if [ "${JOBS_TERMINAL_STYLE_REEXEC:-}" = "$jobs_style_bootstrap_script" ]; then
        unset JOBS_TERMINAL_STYLE_REEXEC
        return 0
    fi
    if [ ! -t 0 ] || [ ! -t 1 ] || [ -z "${TERM:-}" ] ||
       [ "${TERM:-}" = dumb ] || [ "${NO_COLOR+x}" = x ] ||
       [ "${PLAIN_OUTPUT:-0}" = 1 ] || [ "${IS_SOURCETREE_RUNTIME:-0}" = 1 ] ||
       [ -n "${TMUX:-}${STY:-}" ] ||
       env | LC_ALL=C grep -qiE '^(SOURCETREE|SOURCE_TREE)'; then
        return 0
    fi
    case ${JOBS_TERMINAL_STYLE_OWNER:-} in
        ''|*[!0-9]*) ;;
        *)
            if kill -0 "$JOBS_TERMINAL_STYLE_OWNER" 2>/dev/null &&
               [ "${JOBS_TERMINAL_STYLE_TTY:-}" = "$(tty 2>/dev/null)" ]; then
                return 0
            fi
            ;;
    esac
    JOBS_TERMINAL_STYLE_REEXEC=$jobs_style_bootstrap_script
    export JOBS_TERMINAL_STYLE_REEXEC
    jobs_terminal_style_run /bin/zsh "$jobs_style_bootstrap_script" "$@"
    jobs_style_bootstrap_result=$?
    exit "$jobs_style_bootstrap_result"
}
jobs_terminal_style_bootstrap "$0" "$@"
# <<< Jobs terminal style protection v1 <<<

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
LOG_FILE="${TEMP_ROOT%/}/${SCRIPT_BASENAME}.log"
VERIFY_LOG="${TEMP_ROOT%/}/${SCRIPT_BASENAME}.xcodebuild-list.log"
PROCESS_SNAPSHOT_CONTENT=""
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
RUNTIME_STARTED=0

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
  print -r -- "" | jobs_intro_style body
  print -r -- "【恢复 Xcode PIF 构建会话】" | jobs_intro_style body
  print -r -- "用途：处理 unable to initiate PIF transfer session (operation in progress?)。" | jobs_intro_style body
  print -r -- "边界：不关闭 Xcode、不删除 DerivedData、不打断可识别的活动构建。" | jobs_intro_style body

  case "${JOBS_POD_INSTALL_INTERACTION:-interactive}" in
    interactive) ;;
    check-only) CHECK_ONLY=1 ;;
    skip) print -r -- "已显式跳过 PIF 恢复。"; exit 0 ;;
    *) print -r -- "错误：无效的 JOBS_POD_INSTALL_INTERACTION。"; exit 2 ;;
  esac
  if has_argument "--check-only" "$@" || (( CHECK_ONLY == 1 )); then
    CHECK_ONLY=1
    print -r -- "模式：只读诊断，不修改进程。" | jobs_intro_style body
    return 0
  fi
  if has_argument "--help" "$@" || has_argument "-h" "$@"; then
    return 0
  fi
  if [[ ! -t 0 ]]; then
    print -r -- "当前无可交互终端，已跳过 PIF 恢复；可显式选择 check-only 诊断。"
    exit 0
  fi
  print -r -- "即将仅向当前用户的空闲 Xcode 构建服务发送 TERM。" | jobs_intro_style body
  print -n -r -- "输入 YES 继续："
  local answer=""
  if ! read -r answer || [[ "${answer}" != "YES" ]]; then
    print -r -- "已取消，未修改任何进程。" | jobs_intro_style body
    exit 0
  fi
}

# 输出脚本参数说明。
print_usage() {
  print -r -- "用法：$(basename "${(%):-%x}") [--check-only] [--skip-verify] [--project-root 路径]"
}

# 清理本脚本创建的进程快照和跨工程互斥锁。
cleanup_runtime_artifacts() {
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
  local result=$?
  if (( RUNTIME_STARTED == 1 && CHECK_ONLY == 0 )); then
    cleanup_runtime_artifacts
  fi
  return "$result"
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
  if (( CHECK_ONLY == 0 )); then
    local runtime_path=""
    for runtime_path in "$LOG_FILE" "$VERIFY_LOG" "$LOCK_FILE"; do
      if [[ -L "$runtime_path" || ( -e "$runtime_path" && ! -f "$runtime_path" ) ]]; then
        print -r -- "运行路径为链接或非普通文件，已停止：$runtime_path"
        exit 1
      fi
    done
  fi
  RUNTIME_STARTED=1
}

# 获取三套 iOS 工程共用的恢复锁，避免多个 pod install 并行操作 PIF 会话。
acquire_cross_project_lock() {
  (( CHECK_ONLY == 1 )) && return 0
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
  if (( CHECK_ONLY == 1 )); then
    print -r -- "[$(/bin/date '+%Y-%m-%d %H:%M:%S')] $1"
  else
    print -r -- "[$(/bin/date '+%Y-%m-%d %H:%M:%S')] $1" | /usr/bin/tee -a "${LOG_FILE}"
  fi
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
  if ! PROCESS_SNAPSHOT_CONTENT="$(/bin/ps -axo pid=,ppid=,uid=,comm=)"; then
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
  /usr/bin/awk -v parent_pid="$1" '$2 == parent_pid { found = 1 } END { exit found ? 0 : 1 }' <<< "$PROCESS_SNAPSHOT_CONTENT"
}

# 统计当前用户正在运行的 xcodebuild，作为活动构建保护信号。
count_active_xcodebuild() {
  /usr/bin/awk -v current_uid="${CURRENT_UID}" '
    $3 == current_uid && ($4 == "xcodebuild" || $4 ~ /\/xcodebuild$/) { count += 1 }
    END { print count + 0 }
  ' <<< "$PROCESS_SNAPSHOT_CONTENT"
}

# 输出当前用户的 Xcode 构建服务进程号。
collect_build_service_pids() {
  /usr/bin/awk -v current_uid="${CURRENT_UID}" '
    $3 == current_uid && ($4 == "SWBBuildService" || $4 ~ /\/SWBBuildService$/ || $4 == "XCBBuildService" || $4 ~ /\/XCBBuildService$/) { print $1 }
  ' <<< "$PROCESS_SNAPSHOT_CONTENT"
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
  if (( CHECK_ONLY == 1 )); then
    log_message "只读诊断未创建日志、进程快照文件或恢复锁。"
  else
    log_message "运行日志：${LOG_FILE}"
  fi
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
