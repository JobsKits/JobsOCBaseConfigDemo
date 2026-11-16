#!/bin/zsh
# 脚本自述：
# - 脚本名称：save_device_ipa_after_build.command
# - 核心用途：为主 App 的真机 / 模拟器构建生成对应 IPA。
# - 影响范围：打包成功后清空工程 build/ 全部内容，仅保留本次产物。
# - 运行提示：Xcode 构建阶段自动执行；终端先回车，再输入 YES 确认清理，Ctrl+C 取消。
# shell: zsh

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

# JOBS_INPUT_CHOICE_STYLE_BEGIN
# 只展示提示选项；不读取答案、不改变默认值、返回码或业务环境。
jobs_prompt_color_ready() {
  [ -z "${NO_COLOR+x}" ] && [ -n "${TERM:-}" ] && [ "${TERM:-}" != dumb ] &&
    [ "${PLAIN_OUTPUT:-0}" != 1 ] && [ "${IS_SOURCETREE_RUNTIME:-0}" != 1 ]
}
# 原生 awk 分段着色；任意/非空输入优先，括号内外沿用同一个选项。
jobs_prompt_format() {
  /usr/bin/awk -v color="${1:-0}" -v lines="${2:-0}" -v keep="${3:-0}" '
    function typedEnter(value, start, prefix) {
      prefix = substr(value, 1, start - 1)
      gsub(/[“”‘’「」『』"]/, "", prefix)
      gsub(sprintf("%c", 39), "", prefix)
      if (prefix ~ /(空格|[Ss][Pp][Aa][Cc][Ee])[[:space:]]*(后|再|并|[Tt][Hh][Ee][Nn])?[[:space:]]*$/) return 1
      return prefix ~ /(输入|键入|填写|[Tt]ype)[^；;|]*[[:alnum:]_+-]+[[:space:]]*(后|再|并)?[[:space:]]*$/
    }
    function greenPosition(value, token, start) {
      if (match(value, /(直接|仅|只需|只|按下|按)?[[:space:]]*(回车|回車)/)) {
        start = RSTART
        return typedEnter(value, start) ? 0 : start
      }
      if (!match(value, /(^|[^[:alnum:]_])([Ee][Nn][Tt][Ee][Rr]|[Rr][Ee][Tt][Uu][Rr][Nn])([^[:alnum:]_]|$)/)) return 0
      start = RSTART
      token = substr(value, RSTART, RLENGTH)
      match(token, /[Ee][Nn][Tt][Ee][Rr]|[Rr][Ee][Tt][Uu][Rr][Nn]/)
      start += RSTART - 1
      return typedEnter(value, start) ? 0 : start
    }
    function segment(value, inherited, start, kind, prefix, body, red, green, connector, left, right, splitAt) {
      if (value == "") return value
      kind = inherited
      start = 1
      if (!kind) {
        if (match(value, /(输入)?(任意|任何)(非空)?(字符|内容|输入|键)|非空(字符|内容|输入)?|其它输入|其他输入|[Tt]ype (anything|any[^ ]*)|[Pp]ress any key/)) {
          red = RSTART
        }
        green = greenPosition(value)
        if (red && green && green < red) {
          left = substr(value, 1, red - 1)
          right = substr(value, red)
          connector = ""
          if (match(left, /(或者|或)[[:space:]]*$/)) {
            connector = substr(left, RSTART)
            left = substr(left, 1, RSTART - 1)
          }
          return segment(left, 0) connector segment(right, 31)
        }
        if (red && green && red < green && match(value, /或[[:space:]]*(直接|仅|只需|只|按下|按)?(回车|回車)/)) {
          splitAt = RSTART
          return segment(substr(value, 1, splitAt - 1), 31) "或" segment(substr(value, splitAt + length("或")), 0)
        }
        if (red) {
          kind = 31
          start = red
        } else if (green) {
          kind = 32
          start = green
        }
      }
      if (!kind || !color) return value
      prefix = substr(value, 1, start - 1)
      body = substr(value, start)
      return prefix esc "[1;" kind "m" body esc "[0m"
    }
    function render(value, output, part, boundary, inherited, kind, consumed, depth, original) {
      original = value
      gsub(esc "\\[[0-9;]*m", "", value)
      if (color && keep && !greenPosition(value) && value !~ /(任意|任何|非空|其它输入|其他输入|[Tt]ype (anything|any[^ ]*)|[Pp]ress any key)/) return original
      output = ""
      inherited = 0
      depth = 0
      while (match(value, /[；;\/|，,、？?：:=＝（）()\[\]【】]/)) {
        part = substr(value, 1, RSTART - 1)
        boundary = substr(value, RSTART, RLENGTH)
        consumed = RSTART + RLENGTH
        output = output segment(part, inherited) boundary
        if (boundary ~ /[（(\[【]/) {
          depth++
          if (part ~ /(任意|任何|非空|其它输入|其他输入|[Tt]ype (anything|any[^ ]*)|[Pp]ress any key)/) inherited = 31
          else if (greenPosition(part)) inherited = 32
        } else if (boundary ~ /[）)\]】]/) {
          if (depth) depth--
        } else if (boundary ~ /[：:=＝]/) {
          if (!inherited) {
            if (part ~ /(任意|任何|非空|其它输入|其他输入)/) inherited = 31
            else if (greenPosition(part)) inherited = 32
          }
        } else if (!depth) inherited = 0
        value = substr(value, consumed)
      }
      return output segment(value, inherited)
    }
    BEGIN { esc = sprintf("%c", 27); first = 1 }
    {
      if (lines == 2) {
        if (!first) printf "%s\n", render(pending)
        pending = $0
        first = 0
        next
      }
      if (!lines && !first) printf "\n"
      printf "%s", render($0)
      if (lines) printf "\n"
      first = 0
    }
    END {
      if (lines == 2 && !first) {
        sub(sprintf("%c", 1) "$", "", pending)
        printf "%s", render(pending)
      }
    }
  '
}
# read 的命令替换会使 stdout 成为管道，按输入与提示所在 stderr 判断终端。
jobs_prompt_render() {
  local jobs_prompt_color=0
  if [ -t 0 ] && [ -t 2 ] && jobs_prompt_color_ready; then jobs_prompt_color=1; fi
  printf "%s" "$1" | jobs_prompt_format "$jobs_prompt_color" 0
}
# 仅放在显示链末端；tee 在此函数之前接收纯文本，不把 ANSI 写入日志。
jobs_prompt_stream() {
  local jobs_prompt_color=0
  if [ -t 1 ] && jobs_prompt_color_ready; then jobs_prompt_color=1; fi
  jobs_prompt_format "$jobs_prompt_color" 1 1
}
# 显示管道保留原末尾换行；只删除本轮追加的最后一个结束标记。
jobs_prompt_filter() {
  local jobs_prompt_color=0
  if [ -t 1 ] && jobs_prompt_color_ready; then jobs_prompt_color=1; fi
  { /bin/cat; printf '\001'; } | jobs_prompt_format "$jobs_prompt_color" 2 1
}
# 仅包装原 printf/echo/print 展示，原参数、尾换行与显示命令退出码保持不变。
jobs_prompt_output() {
  local jobs_prompt_status=0 jobs_prompt_stderr=0 jobs_prompt_arg="" jobs_prompt_previous=""
  if [ "${1:-}" = print ]; then
    for jobs_prompt_arg in "$@"; do
      case "$jobs_prompt_arg" in -?*u2*|-u2) jobs_prompt_stderr=1 ;; esac
      if [ "$jobs_prompt_previous" = -u ] && [ "$jobs_prompt_arg" = 2 ]; then jobs_prompt_stderr=1; fi
      jobs_prompt_previous="$jobs_prompt_arg"
      [ "$jobs_prompt_arg" != -- ] || break
    done
  fi
  if [ -n "${ZSH_VERSION:-}" ]; then
    if [ "$jobs_prompt_stderr" = 1 ]; then
      "$@" 2>&1 | jobs_prompt_filter >&2
      jobs_prompt_status=$(( ${pipestatus[1]} != 0 ? ${pipestatus[1]} : ${pipestatus[2]} ))
    else
      "$@" | jobs_prompt_filter
      jobs_prompt_status=$(( ${pipestatus[1]} != 0 ? ${pipestatus[1]} : ${pipestatus[2]} ))
    fi
  elif [ -n "${BASH_VERSION:-}" ]; then
    "$@" | jobs_prompt_filter
    jobs_prompt_status=$(( ${PIPESTATUS[0]} != 0 ? ${PIPESTATUS[0]} : ${PIPESTATUS[1]} ))
  else
    "$@" | jobs_prompt_filter
    jobs_prompt_status=$?
  fi
  return "$jobs_prompt_status"
}
# 仅替换日志 primitive 的 tee：磁盘同步追加纯文，终端保留非选项原色。
jobs_prompt_tee() {
  local jobs_prompt_log="$1" jobs_prompt_line="" jobs_prompt_newline=0
  while :; do
    jobs_prompt_line=""
    if IFS= read -r jobs_prompt_line; then jobs_prompt_newline=1; else jobs_prompt_newline=0; [ -n "$jobs_prompt_line" ] || break; fi
    if [ "$jobs_prompt_newline" = 1 ]; then
      { printf '%s\n' "$jobs_prompt_line"; printf '\001'; } | jobs_prompt_format 0 2 >> "$jobs_prompt_log" || return $?
      printf '%s\n' "$jobs_prompt_line" | jobs_prompt_filter || return $?
    else
      { printf '%s' "$jobs_prompt_line"; printf '\001'; } | jobs_prompt_format 0 2 >> "$jobs_prompt_log" || return $?
      printf '%s' "$jobs_prompt_line" | jobs_prompt_filter || return $?
    fi
  done
}
# JOBS_INPUT_CHOICE_STYLE_END

typeset -g SCRIPT_PATH="${${(%):-%x}:A}"
typeset -g SCRIPT_DIR="${SCRIPT_PATH:h}"
typeset -g SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
typeset -g LOG_FILE=""
typeset -g STAGING_ROOT=""
typeset -g BUILD_KIND=""

# 自述标题红色加粗、正文蓝色常规；无彩色终端时输出纯文本。
print_intro_line() {
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" && "${PLAIN_OUTPUT:-0}" != 1 && "${IS_SOURCETREE_RUNTIME:-0}" != 1 ]]; then
    if [[ "$1" == title ]]; then
      printf '\033[1;31m%s\033[0m\n' "$2"
    else
      printf '\033[0;34m%s\033[0m\n' "$2"
    fi
  else
    printf '%s\n' "$2"
  fi
}
# 展示清理范围；Xcode 自动执行，终端确认后才能进入业务。
show_script_intro_and_wait() {
  print_intro_line title "📦 ${SCRIPT_PATH:t}"
  print_intro_line body '1、用途：真机 / 模拟器 App → Payload → 真机.ipa / 模拟器.ipa。'
  print_intro_line body '2、影响范围：打包成功后清空工程 build/（含隐藏文件、子目录和旧平台包），仅保留本次 IPA。'
  print_intro_line body "3、模拟器 IPA 不能安装到真机；日志在系统临时目录的 ${SCRIPT_BASENAME}.log（确认后写入）。"
  if [[ -n "${XCODE_VERSION_ACTUAL:-}" && -n "${TARGET_BUILD_DIR:-}" ]]; then
    print_intro_line body '4、Xcode 构建阶段无交互执行；取消当前构建可终止脚本。'
    return 0
  fi
  jobs_prompt_output print_intro_line body '4、终端先按回车，再输入 YES 授权清理；Ctrl+C 随时取消。'
  if [[ ! -t 0 ]]; then
    print -r -- '✖ 未识别为 Xcode 构建环境且没有可交互输入，请从 Xcode 或终端运行。' >&2
    exit 1
  fi
  if ! read -r "?$(jobs_prompt_render '👉 已了解用途和清理范围，按回车继续；按 Ctrl+C 取消：')" _; then
    exit 130
  fi
  typeset cleanup_confirmation=''
  if ! read -r '?⚠ 打包成功将清空 build/ 全部内容；输入 YES 继续，其它输入取消：' cleanup_confirmation; then
    exit 130
  fi
  if [[ "$cleanup_confirmation" != YES ]]; then
    print -r -- 'ℹ 未授权清理，已取消；未初始化日志或执行打包。'
    exit 0
  fi
}
# 初始化日志和 Shell 的运行策略。
initialize_runtime() {
  set -e
  setopt NO_NOMATCH PIPE_FAIL
  LOG_FILE="${TMPDIR:-/tmp}/${SCRIPT_BASENAME}.log"
  : >| "$LOG_FILE"
}
# 同步输出 Xcode 构建日志和临时日志文件。
log() {
  print -r -- "$*" | jobs_prompt_tee "$LOG_FILE"
}
# 仅移除本脚本创建的临时快照，失败时也不遗留大文件。
cleanup_staging() {
  if [[ -n "$STAGING_ROOT" && -d "$STAGING_ROOT" ]]; then
    /bin/rm -rf -- "$STAGING_ROOT"
  fi
}
# 定义脚本级退出钩子；zsh 函数内注册 EXIT 会在该函数结束时提前触发。
TRAPEXIT() {
  cleanup_staging
}
# zsh 的 ERR_EXIT 在函数失败时可能不触发 EXIT，因此单独清理失败快照。
TRAPZERR() {
  cleanup_staging
}
# 用户取消构建时清理快照，并保留中断退出状态。
TRAPINT() {
  cleanup_staging
  return 130
}
# Xcode 终止构建进程时清理快照，并保留终止退出状态。
TRAPTERM() {
  cleanup_staging
  return 143
}
# 判断当前是否为 iOS 主 App 构建，并解析产物平台名称。
is_ios_app_build() {
  [[ "${ACTION:-build}" != "clean" && "${WRAPPER_NAME:-}" == *.app ]] || return 1
  [[ -z "${PRODUCT_TYPE:-}" || "$PRODUCT_TYPE" == "com.apple.product-type.application" ]] || return 1
  case "${PLATFORM_NAME:-}" in
    iphoneos) BUILD_KIND="真机" ;;
    iphonesimulator) BUILD_KIND="模拟器" ;;
    *) return 1 ;;
  esac
}
# 定位 App 与固定 build/，拒绝清理软链接目录或正在使用的构建工作目录。
resolve_build_paths() {
  typeset project_root="${SRCROOT:-${PROJECT_DIR:-}}"
  [[ -n "$project_root" && -d "$project_root" && "${project_root:A}" != "/" ]] || {
    log "✖ 无法定位有效工程根目录：${project_root:-<empty>}"
    return 1
  }
  [[ -n "${TARGET_BUILD_DIR:-}" && "$WRAPPER_NAME" == "${WRAPPER_NAME:t}" ]] || {
    log "✖ 缺少 TARGET_BUILD_DIR 或 WRAPPER_NAME 不是 App 文件名。"
    return 1
  }
  typeset -g SOURCE_APP="${TARGET_BUILD_DIR}/${WRAPPER_NAME}"
  typeset -g OUTPUT_DIR="${project_root:A}/build"
  typeset -g OUTPUT_IPA="${OUTPUT_DIR}/${BUILD_KIND}.ipa"
  [[ -d "$SOURCE_APP" ]] || {
    log "✖ ${BUILD_KIND} App 不存在：${SOURCE_APP}"
    return 1
  }
  [[ ! -L "$OUTPUT_DIR" && ( ! -e "$OUTPUT_DIR" || -d "$OUTPUT_DIR" ) ]] || {
    log "✖ build/ 必须是工程内的真实目录，不能是软链接或普通文件：${OUTPUT_DIR}"
    return 1
  }
  typeset active_path
  for active_path in "$SOURCE_APP" "${PROJECT_TEMP_DIR:-}" "${BUILD_DIR:-}" "${OBJROOT:-}" "${SYMROOT:-}" "${DERIVED_DATA_DIR:-}" "$LOG_FILE" "${TMPDIR:-/tmp}"; do
    [[ -n "$active_path" ]] || continue
    active_path="${active_path:A}"
    if [[ "$active_path" == "$OUTPUT_DIR" || "$active_path" == "$OUTPUT_DIR/"* ]]; then
      log "✖ 构建工作路径位于待清空的 build/：${active_path}；请将 DerivedData / 构建中间目录移到 build/ 外。"
      return 1
    fi
  done
}
# 复制 App 到临时 Payload，模拟器允许 CODE_SIGNING_ALLOWED=NO。
stage_app() {
  STAGING_ROOT="$(mktemp -d "${TMPDIR:-/tmp}/${SCRIPT_BASENAME}.XXXXXX")" || {
    log "✖ 无法创建 IPA 临时目录。"
    return 1
  }
  typeset -g STAGED_APP="${STAGING_ROOT}/Payload/${WRAPPER_NAME}"
  mkdir -p "${STAGING_ROOT}/Payload" || {
    log "✖ 无法创建临时 Payload 目录：${STAGING_ROOT}/Payload"
    return 1
  }
  ditto --norsrc "$SOURCE_APP" "$STAGED_APP" || {
    log "✖ App 复制失败：${SOURCE_APP}"
    return 1
  }
}
# 真机快照保留有效签名；未通过校验时按 Xcode 身份补签再严格验证。
validate_device_signature() {
  if [[ "$BUILD_KIND" == "模拟器" ]]; then
    log "ℹ 模拟器 App 快照不要求真机签名身份。"
    return 0
  fi
  typeset identity="${EXPANDED_CODE_SIGN_IDENTITY:-}"
  [[ "${CODE_SIGNING_ALLOWED:-YES}" == "YES" && -n "$identity" && "$identity" != "-" ]] || {
    log "✖ 当前真机构建没有可用的代码签名身份，拒绝生成不可安装的 IPA。"
    return 1
  }
  if ! /usr/bin/codesign --verify --deep --strict "$STAGED_APP" >/dev/null 2>&1; then
    /usr/bin/codesign --force --sign "$identity" --preserve-metadata=identifier,entitlements,requirements,flags "$STAGED_APP" || {
      log "✖ IPA 快照签名失败：${STAGED_APP}"
      return 1
    }
  else
    log "ℹ Xcode 真机 App 已通过完整签名校验，保留原始签名元数据。"
  fi
  /usr/bin/codesign --verify --deep --strict "$STAGED_APP" || {
    log "✖ IPA 快照签名校验失败：${STAGED_APP}"
    return 1
  }
}
# 先在 build/ 外完成压缩，打包失败时保留旧产物。
package_ipa() {
  typeset -g STAGED_IPA="${STAGING_ROOT}/${BUILD_KIND}.ipa"
  ditto -c -k --norsrc --keepParent "${STAGING_ROOT}/Payload" "$STAGED_IPA" || {
    log "✖ IPA 生成失败：${STAGED_IPA}"
    return 1
  }
  [[ -s "$STAGED_IPA" ]] || {
    log "✖ IPA 为空，保留原 build/：${STAGED_IPA}"
    return 1
  }
}
# 清空 build/ 全部顶层条目（含隐藏项），再放入本次唯一 IPA。
replace_build_contents() {
  mkdir -p "$OUTPUT_DIR" || {
    log "✖ 无法创建 IPA 输出目录：${OUTPUT_DIR}"
    return 1
  }
  typeset old_entry
  for old_entry in "$OUTPUT_DIR"/*(DN); do
    /bin/rm -rf -- "$old_entry" || {
      log "✖ 无法清理 build/ 条目：${old_entry}"
      return 1
    }
  done
  /bin/mv -- "$STAGED_IPA" "$OUTPUT_IPA" || {
    log "✖ 无法写入本次 IPA：${OUTPUT_IPA}"
    return 1
  }
  log "✔ build/ 已清空并更新为本次唯一产物：${OUTPUT_IPA}"
}
# 执行一次 iOS 主 App 的平台分类、快照校验、打包与替换。
save_build_ipa() {
  if ! is_ios_app_build; then
    log "ℹ 当前不是 iOS 主 App 构建，跳过 IPA：PLATFORM_NAME=${PLATFORM_NAME:-<empty>} ACTION=${ACTION:-<empty>} WRAPPER_NAME=${WRAPPER_NAME:-<empty>}"
    return 0
  fi
  resolve_build_paths # 校验固定输出目录，保护正在使用的构建路径。
  stage_app # 复制本次 App 到 build/ 外的临时 Payload。
  validate_device_signature # 真机校验签名，模拟器允许无签名快照。
  package_ipa # 成功压缩后才进入旧产物清理。
  replace_build_contents # 清空 build/ 全部内容，再写入本次 IPA。
}
# 编排自述、运行环境与自动构建产物输出。
main() {
  show_script_intro_and_wait # 展示清理范围，并按 Xcode / 终端入口决定交互。
  initialize_runtime # 初始化日志、Shell 策略和退出清理。
  save_build_ipa # 保存真机或模拟器本次唯一 IPA。
}

main "$@"
