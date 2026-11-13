#!/bin/zsh
# 脚本自述：
# - 脚本名称：【MacOS】codegraph_export_md.command
# - 核心用途：将已有 CodeGraph 数据库导出为 Markdown 文档和关系图。
# - 影响范围：脚本指定文件或缓存的删除 / 清理；脚本所在工程或指定目标中的文件。
# - 运行提示：先阅读自述并按回车确认，按 Ctrl+C 取消。
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

JOBS_COMMAND_ENTRY_ARG0="$0"
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
# 打印固定自述，确认后才进入原有脚本流程。
show_script_intro_and_wait() {
  printf '%s\n' 【MacOS】codegraph_export_md.command | jobs_intro_style title
  printf '%s\n' '1、核心用途：将已有 CodeGraph 数据库导出为 Markdown 文档和关系图。' | jobs_intro_style body
  printf '%s\n' '2、影响范围：脚本指定文件或缓存的删除 / 清理；脚本所在工程或指定目标中的文件。' | jobs_intro_style body
  printf '%s\n' '3、运行策略：确认后执行原有流程；后续危险操作的确认保持原样。' | jobs_intro_style body
  printf '%s\n' '4、取消方式：按 Ctrl+C 终止；确认前不执行真实业务。' | jobs_intro_style body
  case "${JOBS_POD_INSTALL_INTERACTION:-interactive}" in
    interactive) ;;
    check-only|skip)
      printf '%s\n' '当前为只读 / 跳过模式，Markdown 导出会覆盖报告，本次不执行。'
      exit 0
      ;;
    *) printf '%s\n' 'JOBS_POD_INSTALL_INTERACTION 仅支持 interactive、check-only、skip。' >&2; exit 2 ;;
  esac
  if (( $# > 0 )); then
    if [[ $# == 2 && "$1" == --confirmed-by-init && "$2" == "$PPID" ]]; then
      printf '%s\n' '已由直接父进程的初始化入口取得本次导出确认，继续执行并保留进度心跳。'
      return 0
    fi
    printf '%s\n' '无效导出参数；请直接运行，或由初始化入口确认后调用。' >&2
    exit 2
  fi
  if [ ! -t 0 ]; then
    printf '%s\n' '当前没有可交互输入，已跳过 Markdown 导出；请在终端中重新运行。' >&2
    exit 0
  fi
  jobs_prompt_output printf '%s' '已了解脚本用途与影响，按回车继续；按 Ctrl+C 取消：'
  IFS= read -r jobs_intro_answer || exit 1
}
# 确认后执行原有业务，保留原来的参数、交互和退出策略。
jobs_run_original_script() {
  0="$JOBS_COMMAND_ENTRY_ARG0"
set -u
setopt NO_NOMATCH

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
SCRIPT_BASENAME="$(basename "$0" | sed 's/\.[^.]*$//')"
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"
: > "$LOG_FILE"

log()            { echo -e "$1" | jobs_prompt_tee "$LOG_FILE"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }

fail() {
  error_echo "$1"
  exit 1
}

resolve_project_root() {
  cd "$SCRIPT_DIR/../.." && pwd
}

has_cmd() {
  command -v "$1" >/dev/null 2>&1
}

md_escape() {
  printf '%s' "$1" | sed 's/|/\\|/g; s/`/'"'"'/g'
}

clean_csv() {
  printf '%s' "$1" | tr -cd 'A-Za-z0-9_,-'
}

csv_to_sql_list() {
  local csv="$(clean_csv "$1")"
  printf '%s' "$csv" | awk -F',' '
    BEGIN { out="" }
    {
      for (i=1; i<=NF; i++) {
        if ($i == "") continue
        if (out != "") out = out ","
        out = out "\047" $i "\047"
      }
    }
    END { print out }
  '
}

write_md_header() {
  local file_path="$1"
  local title="$2"
  cat > "$file_path" <<MD
# \`${title}\`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

MD
}

write_md_footer() {
  local file_path="$1"
  cat >> "$file_path" <<'MD'

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
MD
}

run_sql() {
  sqlite3 "$DB_PATH" "$@"
}

run_sql_file() {
  local sql_file="$1"
  sqlite3 "$DB_PATH" < "$sql_file"
}

make_tmp_dir() {
  TMP_DIR="$(mktemp -d "/tmp/codegraph_md.XXXXXX")"
}

cleanup_tmp_dir() {
  [[ -n "${TMP_DIR:-}" && -d "$TMP_DIR" ]] && rm -rf "$TMP_DIR"
}

trap cleanup_tmp_dir EXIT

build_edge_kind_selection() {
  info_echo "统计实际 edge kind..."

  EDGE_KIND_STATS_TSV="$TMP_DIR/edge-kind-stats.tsv"
  sqlite3 -header -tabs "$DB_PATH" <<'SQL' > "$EDGE_KIND_STATS_TSV"
SELECT kind, COUNT(*) AS count
FROM edges
GROUP BY kind
ORDER BY count DESC, kind ASC;
SQL

  ACTUAL_EDGE_KIND_COUNT="$(awk 'NR > 1 { c++ } END { print c + 0 }' "$EDGE_KIND_STATS_TSV")"

  if [[ "${CODEGRAPH_MD_EDGE_KINDS:-auto}" == "auto" || -z "${CODEGRAPH_MD_EDGE_KINDS:-}" ]]; then
    ACTIVE_EDGE_KINDS="$(awk -F'\t' 'NR > 1 && $1 != "contains" && $1 != "defines" && $1 != "defined_in" { if (out != "") out = out ","; out = out $1 } END { print out }' "$EDGE_KIND_STATS_TSV")"

    if [[ -z "$ACTIVE_EDGE_KINDS" ]]; then
      ACTIVE_EDGE_KINDS="$(awk -F'\t' 'NR > 1 { if (out != "") out = out ","; out = out $1 } END { print out }' "$EDGE_KIND_STATS_TSV")"
    fi
  else
    ACTIVE_EDGE_KINDS="$(clean_csv "$CODEGRAPH_MD_EDGE_KINDS")"
  fi

  [[ -n "$ACTIVE_EDGE_KINDS" ]] || fail "edges 表没有任何可导出的 kind。"

  EDGE_KIND_SQL_LIST="$(csv_to_sql_list "$ACTIVE_EDGE_KINDS")"
  [[ -n "$EDGE_KIND_SQL_LIST" ]] || fail "edge kind 为空，无法导出。"

  success_echo "实际 edge kind 数量：$ACTUAL_EDGE_KIND_COUNT"
  info_echo "本次参与导出的 edge kind：$ACTIVE_EDGE_KINDS"
}

write_schema_snapshot() {
  info_echo "写入 DB Schema 快照..."
  local file_path="$OUT_DIR/99-DB-Schema.md"
  write_md_header "$file_path" "CodeGraph DB Schema"
  cat >> "$file_path" <<MD
本文件用于排查 \`codegraph.db\` 的表结构，不直接作为架构文档阅读。

## 一、数据表

\`\`\`text
$(sqlite3 "$DB_PATH" '.tables' 2>&1)
\`\`\`

## 二、Schema

\`\`\`sql
$(sqlite3 "$DB_PATH" "SELECT sql FROM sqlite_master WHERE type IN ('table','index','trigger','view') AND sql IS NOT NULL ORDER BY type, name;" 2>&1)
\`\`\`
MD
  write_md_footer "$file_path"
}

write_health_report() {
  info_echo "写入数据库体检报告..."
  local file_path="$OUT_DIR/00-数据库体检.md"
  write_md_header "$file_path" "CodeGraph 数据库体检"

  local node_count edge_count file_count unresolved_count
  node_count="$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM nodes;" 2>/dev/null || echo 0)"
  edge_count="$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM edges;" 2>/dev/null || echo 0)"
  file_count="$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM files;" 2>/dev/null || echo 0)"
  unresolved_count="$(sqlite3 "$DB_PATH" "SELECT COUNT(*) FROM unresolved_refs;" 2>/dev/null || echo 0)"

  cat >> "$file_path" <<MD
这份体检是后续所有图谱是否有营养的基础。先看这里，不要先看 Mermaid。

## 一、总量概览 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 数量 |
| --- | ---: |
| nodes | \`${node_count}\` |
| edges | \`${edge_count}\` |
| files | \`${file_count}\` |
| unresolved_refs | \`${unresolved_count}\` |

## 二、Edge Kind 实际分布 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| edge kind | 数量 |
| --- | ---: |
MD

  awk -F'\t' 'NR > 1 { printf("| `%s` | `%s` |\n", $1, $2) }' "$EDGE_KIND_STATS_TSV" >> "$file_path"

  cat >> "$file_path" <<MD

## 三、Node Kind 分布 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| node kind | 数量 |
| --- | ---: |
MD

  sqlite3 -tabs "$DB_PATH" "SELECT kind, COUNT(*) FROM nodes GROUP BY kind ORDER BY COUNT(*) DESC, kind ASC LIMIT 80;" |
    awk -F'\t' '{ printf("| `%s` | `%s` |\n", $1, $2) }' >> "$file_path"

  cat >> "$file_path" <<MD

## 四、语言分布 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| language | 文件数 | 节点数 |
| --- | ---: | ---: |
MD

  sqlite3 -tabs "$DB_PATH" <<'SQL' |
SELECT f.language, COUNT(*) AS file_count, COALESCE(SUM(f.node_count), 0) AS node_count
FROM files f
GROUP BY f.language
ORDER BY file_count DESC, f.language ASC
LIMIT 80;
SQL
    awk -F'\t' '{ printf("| `%s` | `%s` | `%s` |\n", $1, $2, $3) }' >> "$file_path"

  cat >> "$file_path" <<MD

## 五、诊断结论 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 如果这里没有 \`calls\`，那就不是导出脚本漏了，而是当前 CodeGraph 对本项目没有沉淀调用边。
- 如果 \`references\` / \`imports\` 很多，后续模块关联图会基于这些实际存在的边做聚合。
- 如果 \`unresolved_refs\` 很高，说明有大量引用没有被解析成确定目标，后续图谱需要按模块聚合看，不要强求方法级调用图。
MD

  write_md_footer "$file_path"
}

write_project_overview() {
  info_echo "写入项目概览..."
  local file_path="$OUT_DIR/01-项目概览.md"
  write_md_header "$file_path" "CodeGraph 项目概览"

  cat >> "$file_path" <<MD
本目录由 \`【MacOS】codegraph_export_md.command\` 从 \`.codegraph/codegraph.db\` 导出。重点不是堆文件列表，而是把 CodeGraph 已经索引到的项目内在关系变成人能读的结构报告。

## 一、导出信息 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 值 |
| --- | --- |
| 生成时间 | \`$(date '+%Y-%m-%d %H:%M:%S')\` |
| 项目根目录 | \`$PROJECT_ROOT\` |
| 数据库 | \`$DB_PATH\` |
| 输出目录 | \`$OUT_DIR\` |
| 本次导出 edge kind | \`$ACTIVE_EDGE_KINDS\` |
| 扫描上限 | \`$EDGE_SCAN_LIMIT\` |
| 明细导出上限 | \`$EDGE_EXPORT_LIMIT\` |
| 单图边数 | \`$GRAPH_EDGE_LIMIT\` |

## 二、推荐阅读顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 顺序 | 文件 | 用途 |
| --- | --- | --- |
| 1 | \`00-数据库体检.md\` | 判断 CodeGraph 实际有哪些边，不再盲猜 \`calls\` 是否存在 |
| 2 | \`02-模块关联.md\` | 看项目内部模块 / Pod / 目录之间的耦合 |
| 3 | \`03-核心符号.md\` | 看入度、出度最高的符号，快速定位核心类和热点方法 |
| 4 | \`04-边明细.md\` | 看符号级关系明细 |
| 5 | \`graphs/\` | 看拆分后的 Mermaid 图 |

MD

  write_md_footer "$file_path"
}

module_expr_for() {
  local alias="$1"
  cat <<SQL
CASE
  WHEN ${alias}.file_path LIKE 'Pods/%' OR ${alias}.file_path LIKE './Pods/%' THEN 'Pods'
  WHEN ${alias}.file_path LIKE 'JobsByPods/%/%' THEN 'JobsByPods/' || substr(substr(${alias}.file_path, length('JobsByPods/') + 1), 1, instr(substr(${alias}.file_path, length('JobsByPods/') + 1), '/') - 1)
  WHEN ${alias}.file_path LIKE 'JobsByPods/%' THEN 'JobsByPods/' || substr(${alias}.file_path, length('JobsByPods/') + 1)
  WHEN ${alias}.file_path LIKE 'JobsOCBaseConfigDemo/%' THEN 'App/JobsOCBaseConfigDemo'
  WHEN instr(${alias}.file_path, '/') > 0 THEN substr(${alias}.file_path, 1, instr(${alias}.file_path, '/') - 1)
  ELSE ${alias}.file_path
END
SQL
}

write_edges_tsv() {
  info_echo "导出符号边明细 TSV，扫描上限：$EDGE_SCAN_LIMIT，导出上限：$EDGE_EXPORT_LIMIT..."
  EDGES_TSV="$EDGE_DIR/codegraph-edges.tsv"
  cat > "$TMP_DIR/export_edges.sql" <<SQL
.headers on
.mode tabs
PRAGMA query_only=ON;
PRAGMA temp_store=MEMORY;
PRAGMA cache_size=-200000;
WITH edge_pick AS (
  SELECT id, source, target, kind, line, col
  FROM edges INDEXED BY idx_edges_kind
  WHERE kind IN ($EDGE_KIND_SQL_LIST)
  ORDER BY kind, id
  LIMIT $EDGE_SCAN_LIMIT
), joined AS (
  SELECT
    e.kind AS edge_kind,
    s.kind AS source_kind,
    COALESCE(NULLIF(s.qualified_name, ''), s.name) AS source_name,
    s.file_path AS source_file,
    s.start_line AS source_line,
    t.kind AS target_kind,
    COALESCE(NULLIF(t.qualified_name, ''), t.name) AS target_name,
    t.file_path AS target_file,
    t.start_line AS target_line,
    e.line AS edge_line
  FROM edge_pick e
  JOIN nodes s ON s.id = e.source
  JOIN nodes t ON t.id = e.target
  WHERE s.file_path NOT LIKE '.git/%'
    AND t.file_path NOT LIKE '.git/%'
    AND s.file_path NOT LIKE '.codegraph/%'
    AND t.file_path NOT LIKE '.codegraph/%'
    AND s.file_path NOT LIKE 'build/%'
    AND t.file_path NOT LIKE 'build/%'
    AND s.file_path NOT LIKE '%/DerivedData/%'
    AND t.file_path NOT LIKE '%/DerivedData/%'
)
SELECT
  edge_kind,
  source_kind || ':' || source_name AS source,
  target_kind || ':' || target_name AS target,
  source_file,
  target_file,
  COALESCE(source_line, '') AS source_line,
  COALESCE(target_line, '') AS target_line,
  COALESCE(edge_line, '') AS edge_line
FROM joined
LIMIT $EDGE_EXPORT_LIMIT;
SQL
  run_sql_file "$TMP_DIR/export_edges.sql" > "$EDGES_TSV"
  EXPORTED_EDGE_COUNT="$(awk 'NR > 1 { c++ } END { print c + 0 }' "$EDGES_TSV")"
  success_echo "符号边明细已导出：$EXPORTED_EDGE_COUNT 条"
}

write_module_coupling() {
  info_echo "生成模块关联报告..."
  MODULE_TSV="$EDGE_DIR/module-coupling.tsv"
  local smodule="$(module_expr_for s)"
  local tmodule="$(module_expr_for t)"

  cat > "$TMP_DIR/module_coupling.sql" <<SQL
.headers on
.mode tabs
PRAGMA query_only=ON;
PRAGMA temp_store=MEMORY;
PRAGMA cache_size=-200000;
WITH edge_pick AS (
  SELECT source, target, kind
  FROM edges INDEXED BY idx_edges_kind
  WHERE kind IN ($EDGE_KIND_SQL_LIST)
  ORDER BY kind, id
  LIMIT $EDGE_SCAN_LIMIT
), joined AS (
  SELECT
    e.kind AS edge_kind,
    $smodule AS source_module,
    $tmodule AS target_module,
    s.file_path AS source_file,
    t.file_path AS target_file
  FROM edge_pick e
  JOIN nodes s ON s.id = e.source
  JOIN nodes t ON t.id = e.target
  WHERE s.file_path NOT LIKE '.git/%'
    AND t.file_path NOT LIKE '.git/%'
    AND s.file_path NOT LIKE '.codegraph/%'
    AND t.file_path NOT LIKE '.codegraph/%'
    AND s.file_path NOT LIKE 'build/%'
    AND t.file_path NOT LIKE 'build/%'
    AND s.file_path NOT LIKE '%/DerivedData/%'
    AND t.file_path NOT LIKE '%/DerivedData/%'
    AND s.file_path != ''
    AND t.file_path != ''
), grouped AS (
  SELECT source_module, target_module, edge_kind, COUNT(*) AS weight
  FROM joined
  WHERE source_module != target_module
    AND source_module != ''
    AND target_module != ''
    AND source_module != 'Pods'
    AND target_module != 'Pods'
  GROUP BY source_module, target_module, edge_kind
)
SELECT source_module, target_module, edge_kind, weight
FROM grouped
ORDER BY weight DESC, source_module ASC, target_module ASC, edge_kind ASC
LIMIT $MODULE_EDGE_EXPORT_LIMIT;
SQL
  run_sql_file "$TMP_DIR/module_coupling.sql" > "$MODULE_TSV"

  local file_path="$OUT_DIR/02-模块关联.md"
  write_md_header "$file_path" "CodeGraph 模块关联"
  cat >> "$file_path" <<MD
这里看的是目录 / Pod / 模块之间的真实边聚合，比单个符号大图更适合判断项目内在耦合。

## 一、模块关联 Top ${MODULE_EDGE_PREVIEW_LIMIT} <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

完整 TSV：\`edges/module-coupling.tsv\`。

| 来源模块 | 目标模块 | 关系 | 权重 |
| --- | --- | --- | ---: |
MD

  awk -F'\t' -v limit="$MODULE_EDGE_PREVIEW_LIMIT" 'NR > 1 && c < limit { printf("| `%s` | `%s` | `%s` | `%s` |\n", $1, $2, $3, $4); c++ }' "$MODULE_TSV" >> "$file_path"

  cat >> "$file_path" <<MD

## 二、阅读判断 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 权重高，不一定就是坏；它代表当前索引视角下两个模块之间关系密集。
- 如果一个基础模块被大量模块指向，说明它是公共依赖。
- 如果业务模块之间互相指向很多，后续改动风险会更高。
MD
  write_md_footer "$file_path"
}

write_core_symbols() {
  info_echo "生成核心符号报告..."
  INBOUND_TSV="$EDGE_DIR/top-inbound-symbols.tsv"
  OUTBOUND_TSV="$EDGE_DIR/top-outbound-symbols.tsv"

  cat > "$TMP_DIR/top_inbound.sql" <<SQL
.headers on
.mode tabs
PRAGMA query_only=ON;
PRAGMA temp_store=MEMORY;
WITH edge_pick AS (
  SELECT source, target, kind
  FROM edges INDEXED BY idx_edges_kind
  WHERE kind IN ($EDGE_KIND_SQL_LIST)
  ORDER BY kind, id
  LIMIT $EDGE_SCAN_LIMIT
)
SELECT
  t.kind AS node_kind,
  COALESCE(NULLIF(t.qualified_name, ''), t.name) AS node_name,
  t.file_path,
  t.start_line,
  COUNT(*) AS inbound_count,
  GROUP_CONCAT(DISTINCT e.kind) AS edge_kinds
FROM edge_pick e
JOIN nodes t ON t.id = e.target
WHERE t.file_path NOT LIKE '.git/%'
  AND t.file_path NOT LIKE '.codegraph/%'
  AND t.file_path NOT LIKE 'build/%'
  AND t.file_path NOT LIKE '%/DerivedData/%'
GROUP BY t.id
ORDER BY inbound_count DESC, node_name ASC
LIMIT $CORE_SYMBOL_LIMIT;
SQL
  run_sql_file "$TMP_DIR/top_inbound.sql" > "$INBOUND_TSV"

  cat > "$TMP_DIR/top_outbound.sql" <<SQL
.headers on
.mode tabs
PRAGMA query_only=ON;
PRAGMA temp_store=MEMORY;
WITH edge_pick AS (
  SELECT source, target, kind
  FROM edges INDEXED BY idx_edges_kind
  WHERE kind IN ($EDGE_KIND_SQL_LIST)
  ORDER BY kind, id
  LIMIT $EDGE_SCAN_LIMIT
)
SELECT
  s.kind AS node_kind,
  COALESCE(NULLIF(s.qualified_name, ''), s.name) AS node_name,
  s.file_path,
  s.start_line,
  COUNT(*) AS outbound_count,
  GROUP_CONCAT(DISTINCT e.kind) AS edge_kinds
FROM edge_pick e
JOIN nodes s ON s.id = e.source
WHERE s.file_path NOT LIKE '.git/%'
  AND s.file_path NOT LIKE '.codegraph/%'
  AND s.file_path NOT LIKE 'build/%'
  AND s.file_path NOT LIKE '%/DerivedData/%'
GROUP BY s.id
ORDER BY outbound_count DESC, node_name ASC
LIMIT $CORE_SYMBOL_LIMIT;
SQL
  run_sql_file "$TMP_DIR/top_outbound.sql" > "$OUTBOUND_TSV"

  local file_path="$OUT_DIR/03-核心符号.md"
  write_md_header "$file_path" "CodeGraph 核心符号"
  cat >> "$file_path" <<MD
核心符号不是按名字猜出来的，而是按 CodeGraph 边的入度 / 出度统计出来的。

## 一、被依赖最多的符号 Top ${CORE_SYMBOL_LIMIT} <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

完整 TSV：\`edges/top-inbound-symbols.tsv\`。

| 类型 | 符号 | 文件 | 行 | 入度 | 关系 |
| --- | --- | --- | ---: | ---: | --- |
MD
  awk -F'\t' 'NR > 1 { printf("| `%s` | `%s` | `%s` | `%s` | `%s` | `%s` |\n", $1, $2, $3, $4, $5, $6) }' "$INBOUND_TSV" >> "$file_path"

  cat >> "$file_path" <<MD

## 二、依赖外部最多的符号 Top ${CORE_SYMBOL_LIMIT} <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

完整 TSV：\`edges/top-outbound-symbols.tsv\`。

| 类型 | 符号 | 文件 | 行 | 出度 | 关系 |
| --- | --- | --- | ---: | ---: | --- |
MD
  awk -F'\t' 'NR > 1 { printf("| `%s` | `%s` | `%s` | `%s` | `%s` | `%s` |\n", $1, $2, $3, $4, $5, $6) }' "$OUTBOUND_TSV" >> "$file_path"

  write_md_footer "$file_path"
}

write_edge_details_md() {
  info_echo "生成边明细报告..."
  local file_path="$OUT_DIR/04-边明细.md"
  write_md_header "$file_path" "CodeGraph 边明细"
  cat >> "$file_path" <<MD
完整符号关系已经同步写入：\`edges/codegraph-edges.tsv\`。

## 一、导出结果 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 值 |
| --- | ---: |
| 导出边数 | \`${EXPORTED_EDGE_COUNT}\` |
| 扫描上限 | \`${EDGE_SCAN_LIMIT}\` |
| 明细上限 | \`${EDGE_EXPORT_LIMIT}\` |

## 二、导出边类型统计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 类型 | 数量 |
| --- | ---: |
MD

  awk -F'\t' 'NR > 1 { count[$1]++ } END { for (k in count) printf("%s\t%s\n", k, count[k]) }' "$EDGES_TSV" |
    sort -k2,2nr |
    awk -F'\t' '{ printf("| `%s` | `%s` |\n", $1, $2) }' >> "$file_path"

  cat >> "$file_path" <<MD

## 三、符号关系预览 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

这里只展示前 \`${EDGE_PREVIEW_LIMIT}\` 条，完整内容看 TSV。

| 类型 | 来源 | 目标 | 来源文件 | 目标文件 |
| --- | --- | --- | --- | --- |
MD

  awk -F'\t' -v limit="$EDGE_PREVIEW_LIMIT" 'NR > 1 && c < limit { printf("| `%s` | `%s` | `%s` | `%s` | `%s` |\n", $1, $2, $3, $4, $5); c++ }' "$EDGES_TSV" >> "$file_path"

  write_md_footer "$file_path"
}

generate_module_graph() {
  info_echo "生成模块 Mermaid 图..."
  local graph_file="$GRAPH_DIR/模块关联-Top.md"
  write_md_header "$graph_file" "模块关联 Top 图"
  cat >> "$graph_file" <<MD
模块级关系图来自 \`edges/module-coupling.tsv\`，每条边的数字是聚合权重。

\`\`\`mermaid
flowchart ${GRAPH_DIRECTION}
MD

  cat > "$TMP_DIR/module_graph.awk" <<'AWK'
function esc(s) {
  gsub(/"/, "'", s)
  gsub(/\[/, "(", s)
  gsub(/\]/, ")", s)
  gsub(/\|/, "/", s)
  return s
}
NR > 1 && count < limit {
  s=$1; t=$2; k=$3; w=$4
  if (!(s in id)) { id[s]="M" ++n; label[n]=s }
  if (!(t in id)) { id[t]="M" ++n; label[n]=t }
  edge[++m]=id[s] " -->|" esc(k) ":" w "| " id[t]
  count++
}
END {
  for (i=1; i<=n; i++) print "  M" i "[\"" esc(label[i]) "\"]"
  for (i=1; i<=m; i++) print "  " edge[i]
}
AWK

  awk -F'\t' -v limit="$MODULE_GRAPH_EDGE_LIMIT" -f "$TMP_DIR/module_graph.awk" "$MODULE_TSV" >> "$graph_file"

  cat >> "$graph_file" <<'MD'
```
MD
  write_md_footer "$graph_file"
}

safe_file_part() {
  printf '%s' "$1" | tr -cd 'A-Za-z0-9_-' | cut -c1-80
}

write_symbol_graph_file_header() {
  local graph_file="$1"
  local title="$2"
  write_md_header "$graph_file" "$title"
  cat >> "$graph_file" <<MD
这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

\`\`\`mermaid
flowchart ${GRAPH_DIRECTION}
MD
}

write_symbol_graph_file_footer() {
  local graph_file="$1"
  cat >> "$graph_file" <<'MD'
```
MD
  write_md_footer "$graph_file"
}

generate_symbol_graphs() {
  info_echo "生成符号关系 Mermaid 分片图..."

  local current_kind=""
  local chunk_index=0
  local line_in_chunk=0
  local graph_file=""
  local graph_count=0

  tail -n +2 "$EDGES_TSV" | while IFS=$'\t' read -r edge_kind source target source_file target_file source_line target_line edge_line; do
    [[ -n "$edge_kind" ]] || continue

    if [[ "$edge_kind" != "$current_kind" || "$line_in_chunk" -ge "$GRAPH_EDGE_LIMIT" ]]; then
      if [[ -n "$graph_file" ]]; then
        write_symbol_graph_file_footer "$graph_file"
      fi

      if [[ "$edge_kind" != "$current_kind" ]]; then
        current_kind="$edge_kind"
        chunk_index=1
      else
        chunk_index=$((chunk_index + 1))
      fi

      line_in_chunk=0
      graph_count=$((graph_count + 1))
      local kind_part="$(safe_file_part "$current_kind")"
      graph_file="$GRAPH_DIR/${kind_part}-$(printf '%03d' "$chunk_index").md"
      write_symbol_graph_file_header "$graph_file" "${current_kind} 符号关系 - $(printf '%03d' "$chunk_index")"
    fi

    line_in_chunk=$((line_in_chunk + 1))
    local source_label target_label
    source_label="$(printf '%s<br/>%s:%s' "$source" "$source_file" "$source_line" | sed 's/"/'"'"'/g; s/\[/(/g; s/\]/)/g; s/|/\//g')"
    target_label="$(printf '%s<br/>%s:%s' "$target" "$target_file" "$target_line" | sed 's/"/'"'"'/g; s/\[/(/g; s/\]/)/g; s/|/\//g')"

    {
      printf '  S%s["%s"]\n' "$line_in_chunk" "$source_label"
      printf '  T%s["%s"]\n' "$line_in_chunk" "$target_label"
      printf '  S%s -->|%s| T%s\n' "$line_in_chunk" "$edge_kind" "$line_in_chunk"
    } >> "$graph_file"
  done

  if [[ -n "$graph_file" ]]; then
    write_symbol_graph_file_footer "$graph_file"
  fi
}

write_graph_index() {
  info_echo "生成图谱索引..."
  local file_path="$OUT_DIR/05-图谱索引.md"
  write_md_header "$file_path" "CodeGraph 图谱索引"

  cat >> "$file_path" <<MD
图谱已经按用途和边类型拆开，不再把所有关系塞进一张图。

## 一、图谱入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 图谱 | 说明 |
| --- | --- |
MD

  if [[ -f "$GRAPH_DIR/模块关联-Top.md" ]]; then
    echo "| [\`模块关联-Top.md\`](./graphs/模块关联-Top.md) | 模块 / Pod / 目录之间的聚合关系 |" >> "$file_path"
  fi

  find "$GRAPH_DIR" -maxdepth 1 -type f -name '*.md' ! -name '模块关联-Top.md' | sort | while IFS= read -r graph_path; do
    local name="$(basename "$graph_path")"
    echo "| [\`${name}\`](./graphs/${name}) | 符号关系分片图 |" >> "$file_path"
  done

  cat >> "$file_path" <<MD

## 二、参数建议 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 看项目内在关联：优先看 \`02-模块关联.md\` 和 \`graphs/模块关联-Top.md\`。
- 看核心符号：优先看 \`03-核心符号.md\`。
- 如果 \`calls\` 不存在，不要硬筛 \`calls\`；先看 \`00-数据库体检.md\` 里的实际 \`edge kind\`。
- 如果需要更全，调大 \`CODEGRAPH_MD_EDGE_SCAN_LIMIT\` 和 \`CODEGRAPH_MD_EDGE_EXPORT_LIMIT\`。
MD
  write_md_footer "$file_path"
}

write_readme() {
  info_echo "生成 README..."
  local file_path="$OUT_DIR/README.md"
  write_md_header "$file_path" "CodeGraph Markdown 可视化"
  cat >> "$file_path" <<MD
这里是 \`.codegraph/codegraph.md/\`，用于集中保存 CodeGraph 的可读文档和 [**Mermaid**](https://mermaid.js.org) 拆分图。

## 一、目录说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件 / 目录 | 说明 |
| --- | --- |
| \`00-数据库体检.md\` | 实际 edge kind、node kind、语言分布，判断 CodeGraph 到底索引出了什么 |
| \`01-项目概览.md\` | 导出参数和推荐阅读顺序 |
| \`02-模块关联.md\` | 模块 / Pod / 目录之间的关系聚合，优先看这里 |
| \`03-核心符号.md\` | 入度 / 出度最高的符号，定位核心类和热点方法 |
| \`04-边明细.md\` | 符号级关系明细预览 |
| \`05-图谱索引.md\` | Mermaid 分片图入口 |
| \`99-DB-Schema.md\` | CodeGraph DB 表结构快照 |
| \`graphs/\` | 拆分后的 Mermaid 图 |
| \`edges/\` | 完整 TSV 数据 |

## 二、推荐入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1. 先打开 \`00-数据库体检.md\`，确认实际存在的 \`edge kind\`。
2. 再打开 \`02-模块关联.md\`，看项目内部模块耦合。
3. 然后打开 \`03-核心符号.md\`，看高入度 / 高出度符号。
4. 最后再看 \`graphs/\`，不要一上来盯 Mermaid。
MD
  write_md_footer "$file_path"
}

write_file_structure() {
  info_echo "生成精简文件结构..."
  local file_path="$OUT_DIR/06-文件结构.md"
  write_md_header "$file_path" "CodeGraph 文件结构"
  cat >> "$file_path" <<MD
这里记录当前工程的文件结构快照，优先排除 \`.git\`、\`Pods\`、\`.codegraph\`、\`build\`、\`DerivedData\` 等目录。

## 一、文件结构

\`\`\`text
MD
  find . \
    -path './.git' -prune -o \
    -path './Pods' -prune -o \
    -path './.codegraph' -prune -o \
    -path './build' -prune -o \
    -path './DerivedData' -prune -o \
    -type f -print |
    sed 's#^./##' |
    sort |
    head -n "$FILE_STRUCTURE_LIMIT" >> "$file_path"
  cat >> "$file_path" <<'MD'
```
MD
  write_md_footer "$file_path"
}

main() {
  PROJECT_ROOT="$(resolve_project_root)" || fail "无法定位工程根目录。"
  cd "$PROJECT_ROOT" || fail "无法进入工程根目录：$PROJECT_ROOT"

  DB_PATH="${CODEGRAPH_DB_PATH:-.codegraph/codegraph.db}"
  OUT_DIR="${CODEGRAPH_MD_OUT_DIR:-${CODEGRAPH_MD_OUTPUT_DIR:-${CODEGRAPH_EXPORT_OUT_DIR:-.codegraph/codegraph.md}}}"
  GRAPH_DIR="$OUT_DIR/graphs"
  EDGE_DIR="$OUT_DIR/edges"

  EDGE_SCAN_LIMIT="${CODEGRAPH_MD_EDGE_SCAN_LIMIT:-20000}"
  EDGE_EXPORT_LIMIT="${CODEGRAPH_MD_EDGE_EXPORT_LIMIT:-5000}"
  GRAPH_EDGE_LIMIT="${CODEGRAPH_MD_GRAPH_EDGE_LIMIT:-25}"
  GRAPH_DIRECTION="${CODEGRAPH_MD_GRAPH_DIRECTION:-LR}"
  MODULE_EDGE_EXPORT_LIMIT="${CODEGRAPH_MD_MODULE_EDGE_EXPORT_LIMIT:-500}"
  MODULE_EDGE_PREVIEW_LIMIT="${CODEGRAPH_MD_MODULE_EDGE_PREVIEW_LIMIT:-80}"
  MODULE_GRAPH_EDGE_LIMIT="${CODEGRAPH_MD_MODULE_GRAPH_EDGE_LIMIT:-80}"
  CORE_SYMBOL_LIMIT="${CODEGRAPH_MD_CORE_SYMBOL_LIMIT:-80}"
  EDGE_PREVIEW_LIMIT="${CODEGRAPH_MD_EDGE_PREVIEW_LIMIT:-300}"
  FILE_STRUCTURE_LIMIT="${CODEGRAPH_MD_FILE_STRUCTURE_LIMIT:-2000}"

  [[ "$EDGE_SCAN_LIMIT" == <-> ]] || EDGE_SCAN_LIMIT=20000
  [[ "$EDGE_EXPORT_LIMIT" == <-> ]] || EDGE_EXPORT_LIMIT=5000
  [[ "$GRAPH_EDGE_LIMIT" == <-> ]] || GRAPH_EDGE_LIMIT=25

  highlight_echo "CodeGraph Markdown 深度导出"
  info_echo "项目根目录：$PROJECT_ROOT"
  info_echo "输出目录：$OUT_DIR"
  info_echo "日志文件：$LOG_FILE"

  [[ -f "$DB_PATH" ]] || fail "找不到 CodeGraph 数据库：$DB_PATH"
  has_cmd sqlite3 || fail "未找到 sqlite3，无法读取 CodeGraph 数据库。"

  mkdir -p "$OUT_DIR" "$GRAPH_DIR" "$EDGE_DIR"
  rm -f "$OUT_DIR"/*.md "$GRAPH_DIR"/*.md "$EDGE_DIR"/*.tsv 2>/dev/null || true

  make_tmp_dir
  sqlite3 "$DB_PATH" 'PRAGMA wal_checkpoint(PASSIVE);' >/dev/null 2>&1 || true

  build_edge_kind_selection
  write_schema_snapshot
  write_health_report
  write_project_overview
  write_edges_tsv
  write_module_coupling
  write_core_symbols
  write_edge_details_md
  generate_module_graph
  generate_symbol_graphs
  write_graph_index
  write_file_structure
  write_readme

  success_echo "CodeGraph Markdown 深度导出完成：$OUT_DIR"
}

main "$@"
}
# 编排自述确认与原有业务。
main() {
  show_script_intro_and_wait "$@" # 展示用途并确认，或核对直接父进程的本次导出授权。
  jobs_run_original_script "$@" # 继续执行原有脚本流程。
}
main "$@"
