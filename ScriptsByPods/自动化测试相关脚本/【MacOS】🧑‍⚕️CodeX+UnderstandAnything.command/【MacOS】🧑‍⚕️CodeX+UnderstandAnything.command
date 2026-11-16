#!/bin/zsh
# ==============================================================================
# CodeX+UnderstandAnything.command
# 用途：体检 Codex 与 Understand Anything，为 Xcode/iOS 工程生成中文知识图谱。
# 边界：只在用户确认后安装或升级；不挂接 pod install，不自动分析工程。
# 风险：安装流程会下载官方安装脚本，/understand 会消耗 Codex/AI 额度。
# 日志：通过内置自述后，终端输出同步写入系统临时目录中的同名 .log 文件。
# ==============================================================================

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
  print -r -- "============================== 脚本内置自述 ==============================" | jobs_intro_style title
  print -r -- "脚本名称：${SCRIPT_BASENAME}" | jobs_intro_style title
  print -r -- "核心用途：体检 Codex 与 Understand Anything，并为指定 Xcode/iOS 工程准备代码图谱命令。" | jobs_intro_style body
  print -r -- "默认行为：不会自动安装、升级、生成图谱或启动 Codex；相关动作都会再次询问。" | jobs_intro_style body
  print -r -- "可能影响：用户确认后，可能下载官方安装脚本并更新用户级 Understand Anything Skills。" | jobs_intro_style body
  print -r -- "额度提醒：真正执行 /understand 时会消耗 Codex/AI 额度，本脚本不把它挂到 pod install。" | jobs_intro_style body
  print -r -- "日志位置：确认继续后，输出写入系统临时目录中的 ${SCRIPT_BASENAME}.log。" | jobs_intro_style body
  print -r -- "取消方式：此时按 Ctrl+C 终止，不会进入后续业务。" | jobs_intro_style body
  print -r -- "============================================================================" | jobs_intro_style title
  if [[ ! -t 0 ]]; then
    print -u2 -r -- "当前没有可交互终端，请双击脚本或在 Terminal 中运行。"
    exit 1
  fi
  read -r "?$(jobs_prompt_render "👉 已了解脚本用途与影响，按回车继续；按 Ctrl+C 取消：")" _
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
  read -r "?$(jobs_prompt_render "直接回车确认；输入任意字符后回车继续选择：")" answer
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

# 从脚本目录逐层向上寻找工程，修复脚本位于 ScriptsByPods/自动化测试相关脚本 时只查一级的问题。
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
  read -r "?$(jobs_prompt_render "${message}（直接回车跳过；输入任意字符后回车执行）：")" answer
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
  read -r "?$(jobs_prompt_render "按回车退出：")" _
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
