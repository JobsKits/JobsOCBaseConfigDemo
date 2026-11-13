#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：【MacOS】codegraph_init.command。
# - 核心用途：pod install 集成后体检工具链、补齐缺失组件、更新精确工程的代码地图并导出 Markdown。
# - 影响范围：本工程 .codegraph；必要时经 Brew 准备 Node/npm，再安装官方 CodeGraph npm 包。
# - 运行提示：终端回车确认，各项安装 / 更新回车跳过；check-only 禁止安装和索引写入。
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

typeset SCRIPT_DIR="" PROJECT_ROOT="" CODEGRAPH_TARGET_DIRECTORY=""
typeset CODEGRAPH_LOG_FILE="" CODEGRAPH_STATUS_JSON="" CODEGRAPH_BIN=""
typeset CODEGRAPH_NODE_BIN="" CODEGRAPH_NPM_BIN=""
typeset CODEGRAPH_PREFIX="$HOME/.local/share/jobs-codegraph"
typeset CODEGRAPH_NPM_REGISTRY="https://registry.npmjs.org/"
typeset CHECK_ONLY=0 ALLOW_INSTALL=1 PROJECT_LOCK="" SAMPLE_DIR="" EXPORT_PID=""
typeset TOOLCHAIN_LOCK="" TOOLCHAIN_LOCK_OWNED=0 PROJECT_LOCK_OWNED=0
typeset INDEX_UPDATED=0 CODEGRAPH_INTERACTION="interactive"
# 打印固定自述；独立终端确认前不创建日志或写入工程。
show_script_intro_and_wait() {
  local answer="" argument=""
  codegraph_intro_line title '━━━━━━━━━━ CodeGraph 安装后代码地图 ━━━━━━━━━━'
  codegraph_intro_line body '1、完整体检：系统工具 / CLT → Homebrew → Node/npm → CodeGraph，以及 SQLite / JSON 和隔离样例建图。'
  codegraph_intro_line body '2、地图更新需选择执行；首次 init --yes，已有地图 sync；全量重建须精确输入 YES。'
  codegraph_intro_line body '3、缺失时 Brew 准备 node@24，再安装官方 @colbymchenry/codegraph；当前无该产品的 Brew formula。'
  jobs_prompt_output codegraph_intro_line body '4、各项安装 / 更新直接回车跳过、任意非空输入执行；失败不影响 CocoaPods。'
  codegraph_intro_line body '网络：确认 Brew 维护后短时预检；保留显式代理，否则复用可用系统代理。仅影响该命令及子进程，退出即结束；可能改变流量出口，不写系统 / Git / Shell 配置。'
  codegraph_intro_line body '5、--check-only 只检查、不安装、不建图；离线模式禁止安装。日志在系统临时目录 codegraph_init.<工程摘要>.log。'
  CODEGRAPH_INTERACTION="${JOBS_POD_INSTALL_INTERACTION:-interactive}"
  case "$CODEGRAPH_INTERACTION" in
    interactive) ;;
    check-only) CHECK_ONLY=1 ;;
    skip) codegraph_intro_line body '已明确跳过 CodeGraph，未安装、更新索引或导出。'; exit 0 ;;
    *) print -u2 -r -- 'JOBS_POD_INSTALL_INTERACTION 仅支持 interactive、check-only、skip。'; exit 2 ;;
  esac
  if (( CHECK_ONLY == 1 )); then
    codegraph_intro_line body '自动化只读体检：不安装、不更新索引、不导出；此结果不代表地图已更新。'
    return 0
  fi
  for argument in "$@"; do
    case "$argument" in --check-only|--help|-h) return 0 ;; esac
  done
  [[ -t 0 ]] || { print -u2 -r -- '没有可交互输入，已跳过 CodeGraph 写任务；请在终端运行，或显式选择 check-only。'; exit 0; }
  IFS= read -r "answer?$(jobs_prompt_render '👉 已了解用途与影响，按回车继续；Ctrl+C 取消：')" || exit 1
}
# 普通安装和更新都由终端逐项选择，回车与输入结束均不授权。
codegraph_ask_to_run() {
  local answer=""
  (( CHECK_ONLY == 0 )) && [[ "$CODEGRAPH_INTERACTION" == interactive && -t 0 ]] || return 1
  jobs_prompt_output print -n -r -- "$1（直接回车跳过；任意非空输入后回车执行）："
  IFS= read -r answer || return 1
  [[ -n "$answer" ]]
}
# 确认后解析参数、固定日志，并限定环境变量只作用于本进程。
initialize_runtime() {
  setopt NO_NOMATCH
  SCRIPT_DIR="${${(%):-%x}:A:h}"
  PROJECT_ROOT="${JOBS_CODEGRAPH_PROJECT_ROOT:-${SCRIPT_DIR}/../..}"
  while (( $# )); do
    case "$1" in
      --check-only) CHECK_ONLY=1 ;;
      --project-root)
        shift
        (( $# )) || { print -u2 -r -- '--project-root 缺少路径'; exit 2; }
        PROJECT_ROOT="$1"
        ;;
      --help|-h)
        print -r -- '用法：【MacOS】codegraph_init.command [--check-only] [--project-root 路径]'
        exit 0
        ;;
      *) print -u2 -r -- "未知参数：$1"; exit 2 ;;
    esac
    shift
  done
  [[ "${JOBS_SKIP_CODEGRAPH:-0}" != 1 ]] || { print -r -- 'JOBS_SKIP_CODEGRAPH=1，已跳过。'; exit 0; }
  [[ -d "$PROJECT_ROOT" ]] || { print -u2 -r -- "工程目录不存在：$PROJECT_ROOT"; exit 1; }
  PROJECT_ROOT="$(cd -P -- "$PROJECT_ROOT" && pwd)" || exit 1
  CODEGRAPH_TARGET_DIRECTORY="$PROJECT_ROOT"
  local project_tag="$(print -rn -- "$PROJECT_ROOT" | /usr/bin/cksum | /usr/bin/awk '{print $1}')"
  CODEGRAPH_LOG_FILE="${TMPDIR:-/tmp}/codegraph_init.${project_tag}.log"
  : >> "$CODEGRAPH_LOG_FILE" || exit 1
  ALLOW_INSTALL="${CODEGRAPH_ALLOW_INSTALL:-1}"
  [[ "$ALLOW_INSTALL" == 0 || "$ALLOW_INSTALL" == 1 ]] || codegraph_stop 'CODEGRAPH_ALLOW_INSTALL 只能为 0 或 1'
  [[ "${JOBS_POD_INSTALL_OFFLINE:-0}" != 1 && "$CHECK_ONLY" == 0 ]] || ALLOW_INSTALL=0
  export PATH="$CODEGRAPH_PREFIX/bin:/opt/homebrew/bin:/usr/local/bin:$HOME/.local/bin:$PATH"
  export CODEGRAPH_DIR=.codegraph CODEGRAPH_TELEMETRY=0 DO_NOT_TRACK=1
  export CODEGRAPH_NO_DOWNLOAD=1 CODEGRAPH_NO_WATCH=0 NODE_DISABLE_COMPILE_CACHE=1
  export HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_CLEANUP=1 HOMEBREW_NO_ANALYTICS=1
  codegraph_log "ℹ 工程：$PROJECT_ROOT；check_only=$CHECK_ONLY；允许安装=$ALLOW_INSTALL；日志：$CODEGRAPH_LOG_FILE"
}
# 禁止只读及离线分支隐式安装或修复。
require_installation() {
  [[ "$ALLOW_INSTALL" == 1 ]] || codegraph_stop "$1 缺失或损坏；当前只读 / 离线策略禁止安装，请在终端运行本入口完成配置"
  codegraph_ask_to_run "$1 缺失或损坏，是否安装 / 修复" || codegraph_stop "已跳过 $1 安装 / 修复，本次地图任务未完成"
}
# 用原子目录锁避免同工程重复更新，僵死锁只移除已确认的自身标记。
take_lock() {
  local lock_dir="$1" owner="" current_owner=""
  [[ ! -L "$lock_dir" ]] || return 1
  if /bin/mkdir "$lock_dir" 2>/dev/null; then
    print -r -- "$$" > "$lock_dir/pid" || return 1
    return 0
  fi
  [[ -f "$lock_dir/pid" && ! -L "$lock_dir/pid" ]] || return 1
  IFS= read -r owner < "$lock_dir/pid"
  [[ "$owner" == <-> && "$owner" -gt 1 ]] || return 1
  /bin/kill -0 "$owner" 2>/dev/null && return 1
  [[ "$(/bin/ps -p "$owner" -o pid= 2>/dev/null)" == "" ]] || return 1
  # 僵死锁的回收也要互斥，防止两个进程同时清掉刚被另一方接管的锁。
  /bin/mkdir "$lock_dir/reclaim" 2>/dev/null || return 1
  if [[ -f "$lock_dir/pid" ]]; then
    IFS= read -r current_owner < "$lock_dir/pid"
  fi
  if [[ "$current_owner" != "$owner" ]] || /bin/kill -0 "$current_owner" 2>/dev/null; then
    /bin/rmdir -- "$lock_dir/reclaim" 2>/dev/null
    return 1
  fi
  /bin/rm -f -- "$lock_dir/pid" || return 1
  /bin/rmdir -- "$lock_dir/reclaim" && /bin/rmdir -- "$lock_dir" || return 1
  /bin/mkdir "$lock_dir" 2>/dev/null || return 1
  print -r -- "$$" > "$lock_dir/pid"
}
# 全局安装链共用锁，串行运行不同工程触发的环境体检与缺失安装。
acquire_toolchain_lock() {
  (( CHECK_ONLY == 0 )) || return 0
  TOOLCHAIN_LOCK="${TMPDIR:-/tmp}/jobs-codegraph-toolchain.$UID.lock"
  [[ ! -L "$TOOLCHAIN_LOCK" ]] || codegraph_stop '工具链锁是符号链接，请先排查；未访问链接目标'
  local attempt=0
  until take_lock "$TOOLCHAIN_LOCK"; do
    (( attempt += 1 ))
    (( attempt <= 60 )) || codegraph_stop '其它 CodeGraph 工具链任务仍在运行；等待超过 60 秒，本次停止，请稍后重试'
    /bin/sleep 1
  done
  TOOLCHAIN_LOCK_OWNED=1
}
# 环境安装与样例复检完成后释放工具链锁，保留项目锁覆盖索引和导出。
release_toolchain_lock() {
  (( TOOLCHAIN_LOCK_OWNED == 1 )) || return 0
  /bin/rm -f -- "$TOOLCHAIN_LOCK/pid"
  /bin/rmdir -- "$TOOLCHAIN_LOCK" 2>/dev/null
  TOOLCHAIN_LOCK_OWNED=0
}
# 获取当前工程的更新锁，活跃任务存在时本次安全跳过。
acquire_project_lock() {
  (( CHECK_ONLY == 0 )) || return 0
  /bin/mkdir -p -- "$PROJECT_ROOT/.codegraph" || codegraph_stop '无法创建当前工程地图目录'
  PROJECT_LOCK="$PROJECT_ROOT/.codegraph/.jobs-update.lock"
  [[ ! -L "$PROJECT_LOCK" ]] || codegraph_stop '工程锁是符号链接，请先排查'
  if ! take_lock "$PROJECT_LOCK"; then
    codegraph_log 'ℹ 当前工程已有 CodeGraph 任务或待核查锁，本次跳过；未修改其它进程。'
    exit 0
  fi
  PROJECT_LOCK_OWNED=1
  print -r -- "$$" > "$PROJECT_ROOT/.codegraph/codegraph_init.pid"
}
# 精确清理本次样例与自己持有的锁，不扫描其它任务。
cleanup_runtime() {
  if [[ -n "$EXPORT_PID" ]]; then
    /bin/kill "$EXPORT_PID" 2>/dev/null
    wait "$EXPORT_PID" 2>/dev/null
    EXPORT_PID=""
  fi
  release_toolchain_lock
  if (( PROJECT_LOCK_OWNED == 1 )); then
    /bin/rm -f -- "$PROJECT_LOCK/pid"
    /bin/rmdir -- "$PROJECT_LOCK" 2>/dev/null
    if [[ -f "$PROJECT_ROOT/.codegraph/codegraph_init.pid" && "$(<"$PROJECT_ROOT/.codegraph/codegraph_init.pid")" == "$$" ]]; then
      /bin/rm -f -- "$PROJECT_ROOT/.codegraph/codegraph_init.pid"
    fi
  fi
  if [[ -n "$SAMPLE_DIR" && "$SAMPLE_DIR" == "${TMPDIR:-/tmp}"/jobs-codegraph-health.* && -d "$SAMPLE_DIR" && ! -L "$SAMPLE_DIR" ]]; then
    /bin/rm -r -- "$SAMPLE_DIR"
  fi
}
# 使用全局退出函数，避免 zsh 把函数内 EXIT trap 当成该函数的返回回调。
TRAPEXIT() {
  local result=$?
  cleanup_runtime
  return "$result"
}
# 中断时以对应状态退出，由全局退出函数释放本次资源。
TRAPINT() {
  exit 130
}
# 终止时以对应状态退出，由全局退出函数释放本次资源。
TRAPTERM() {
  exit 143
}
# 真实执行系统引导工具并校验 CLT，失败立即停止下游安装。
check_system_toolchain() {
  /bin/zsh -f -c 'print -r -- "$ZSH_VERSION"' >> "$CODEGRAPH_LOG_FILE" 2>&1 || codegraph_stop 'zsh 运行时失败'
  codegraph_check_installation_tools
  codegraph_run_logged /usr/bin/git --version || codegraph_stop '系统 Git 不可用'
  codegraph_run_logged /usr/bin/make --version || codegraph_stop 'make 不可用，请修复 Command Line Tools'
}
# SQLite 实际执行内存查询，禁用用户 sqliterc，避免只判断可执行文件存在。
check_export_runtime() {
  [[ "$(/usr/bin/sqlite3 -batch -init /dev/null :memory: 'SELECT 2 + 2;' 2>> "$CODEGRAPH_LOG_FILE")" == 4 ]] || codegraph_stop 'SQLite 内存查询失败'
  codegraph_log '✔ SQLite 内存查询与 JSON 工具体检通过。'
}
# 独立体检或修复 Homebrew，不自动更新健康安装。
ensure_brew() {
  codegraph_ensure_homebrew
}
# 体检或定点修复 Node/npm，复检失败停止。
ensure_node_npm() {
  codegraph_ensure_node_npm
}
# 只升级当前实际使用的 Brew Node 公式，不为健康的其它来源强装另一份。
codegraph_offer_node_upgrade() {
  local formula="" prefix="" candidate=""
  [[ "$ALLOW_INSTALL" == 1 ]] || return 0
  for formula in node@24 node node@22; do
    prefix="$("$JOBS_HOMEBREW_BIN" --prefix "$formula" 2>> "$CODEGRAPH_LOG_FILE")" || continue
    candidate="$prefix/bin/node"
    [[ -x "$candidate" && "${candidate:A}" == "${CODEGRAPH_NODE_BIN:A}" ]] || continue
    if codegraph_ask_to_run "是否通过 Homebrew 升级 $formula（包含 npm）"; then
      codegraph_brew_run_network "$JOBS_HOMEBREW_BIN" upgrade "$formula" || codegraph_stop 'Node.js 升级失败'
      codegraph_find_node_npm || codegraph_stop 'Node/npm 升级后复检失败'
    fi
    return 0
  done
  codegraph_log 'ℹ 当前 Node/npm 不属于可确认的 Brew 公式，保留现有来源；需要升级时请使用原安装渠道。'
}
# CLI 每个必需接口都能执行才允许继续。
check_codegraph_cli() {
  codegraph_candidate_ok "$1"
}
# 复用正确 CLI；缺失或损坏时仅安装一次官方包。
ensure_codegraph() {
  if codegraph_find_cli; then
    codegraph_log "✔ 复用 CodeGraph：$CODEGRAPH_BIN；版本：$("$CODEGRAPH_BIN" --version)"
    if [[ "$ALLOW_INSTALL" == 1 ]] && codegraph_ask_to_run '是否从官方 npm Registry 更新 CodeGraph'; then
      codegraph_install_cli approved
    fi
    return 0
  fi
  codegraph_install_cli
}
# 校验自己目标数据库和 JSON，不允许 CLI 回退到父目录冒充成功。
validate_index_status() {
  codegraph_require_target_schema
  codegraph_read_status
  codegraph_validate_status "${1:-complete}"
}
# 临时样例真实建图，验证解析引擎及数据库；不改动业务工程。
check_codegraph_engine() {
  (( CHECK_ONLY == 0 )) || return 0
  SAMPLE_DIR="$(/usr/bin/mktemp -d "${TMPDIR:-/tmp}/jobs-codegraph-health.XXXXXX")" || codegraph_stop '无法创建体检样例目录'
  print -r -- 'export function jobsCodeGraphHealth(value) { return value + 1; }' > "$SAMPLE_DIR/health.js"
  codegraph_run_logged env CODEGRAPH_NO_WATCH=1 "$CODEGRAPH_BIN" init --yes "$SAMPLE_DIR" || codegraph_stop 'CodeGraph 解析引擎样例建图失败'
  (
    CODEGRAPH_TARGET_DIRECTORY="$(cd -P -- "$SAMPLE_DIR" && pwd)"
    validate_index_status complete
    [[ "$(codegraph_status_field nodeCount)" == <-> && "$(codegraph_status_field nodeCount)" -gt 0 ]] || codegraph_stop '样例没有生成符号节点'
  ) || codegraph_stop 'CodeGraph 解析引擎样例数据库复检失败'
  codegraph_log '✔ CodeGraph 隔离样例真实建图与数据库体检通过。'
}
# 全量重建会重建派生数据库并停止已验证的守护进程，必须精确确认。
codegraph_rebuild_index() {
  local answer=""
  codegraph_log '⚠ 全量重建将重建本工程 CodeGraph 数据库；CLI 可能停止本工程地图守护进程，源码不变。'
  [[ "$CODEGRAPH_INTERACTION" == interactive && -t 0 ]] || codegraph_stop '全量重建需要可交互终端，本次未执行'
  print -n -r -- '输入精确大写 YES 重建；其它输入保留现有数据库并停止本次地图任务：'
  IFS= read -r answer || codegraph_stop '未取得全量重建确认'
  [[ "$answer" == YES ]] || codegraph_stop '已取消全量重建，未将旧索引视为完整成功'
  codegraph_run_logged "$CODEGRAPH_BIN" index "$PROJECT_ROOT" || codegraph_stop 'CodeGraph 全量重建失败，未继续导出'
}
# 已有地图先校验身份和旧版本标记，不能把缺少完整标记的旧图当成功。
run_codegraph_index() {
  (( CHECK_ONLY == 0 )) || { codegraph_log '✔ 只读体检完成，未安装、建图或导出；地图更新未执行。'; return 0; }
  local index_state="" reindex_recommended=""
  codegraph_ask_to_run '是否初始化 / 更新当前工程代码地图' || { codegraph_log 'ℹ 已跳过地图更新和导出，现有地图保持原状。'; return 0; }
  if [[ -f "$PROJECT_ROOT/.codegraph/codegraph.db" ]]; then
    validate_index_status identity
    index_state="$(codegraph_status_field index.state 2>/dev/null)"
    reindex_recommended="$(codegraph_status_field index.reindexRecommended 2>/dev/null)"
    if [[ "$reindex_recommended" == true || -z "$index_state" || "$index_state" == null || "$index_state" == partial || "$index_state" == failed || "$index_state" == indexing ]]; then
      codegraph_log "⚠ 现有索引需核实 / 重建：state=${index_state:-缺失}，reindexRecommended=${reindex_recommended:-缺失}。"
      codegraph_rebuild_index
    elif ! codegraph_run_logged "$CODEGRAPH_BIN" sync "$PROJECT_ROOT"; then
      codegraph_log '⚠ 增量同步失败，保留现有数据库，需再次确认才能全量重建。'
      codegraph_rebuild_index
    fi
  else
    codegraph_run_logged "$CODEGRAPH_BIN" init --yes "$PROJECT_ROOT" || codegraph_stop 'CodeGraph 首次初始化失败'
  fi
  validate_index_status complete
  INDEX_UPDATED=1
  codegraph_log "✔ 当前工程代码地图更新通过：$PROJECT_ROOT/.codegraph"
}
# 导出期间提供心跳，超时或失败如实告警；不把导出成功与索引成功混为一谈。
run_export_with_heartbeat() {
  local export_script="$1" child_pid="" elapsed=0 result=0
  local heartbeat="${CODEGRAPH_EXPORT_HEARTBEAT_SECONDS:-10}" timeout="${CODEGRAPH_EXPORT_TIMEOUT_SECONDS:-0}"
  [[ "$heartbeat" == <-> && "$heartbeat" -gt 0 ]] || heartbeat=10
  [[ "$timeout" == <-> ]] || timeout=0
  /bin/zsh "$export_script" --confirmed-by-init "$$" >> "$CODEGRAPH_LOG_FILE" 2>&1 &
  child_pid=$!
  EXPORT_PID="$child_pid"
  while /bin/kill -0 "$child_pid" 2>/dev/null; do
    /bin/sleep 1
    (( elapsed += 1 ))
    if (( elapsed % heartbeat == 0 )); then
      codegraph_log "ℹ Markdown 导出仍在运行：${elapsed}s；PID=$child_pid"
    fi
    if (( timeout > 0 && elapsed >= timeout )); then
      /bin/kill "$child_pid" 2>/dev/null
      /bin/sleep 2
      /bin/kill -9 "$child_pid" 2>/dev/null
      wait "$child_pid" 2>/dev/null
      EXPORT_PID=""
      return 124
    fi
  done
  wait "$child_pid" || result=$?
  EXPORT_PID=""
  return "$result"
}
# 导出前单独确认；心跳只负责显示进度，工程锁覆盖完整导出。
export_codegraph_markdown() {
  (( CHECK_ONLY == 0 && INDEX_UPDATED == 1 )) || return 0
  [[ "${CODEGRAPH_SKIP_EXPORT:-0}" != 1 ]] || { codegraph_log 'ℹ CODEGRAPH_SKIP_EXPORT=1，跳过 Markdown。'; return 0; }
  local export_script="$PROJECT_ROOT/ScriptsByPods/【MacOS】codegraph_export_md.command/【MacOS】codegraph_export_md.command" result=0
  [[ -f "$export_script" ]] || { codegraph_log "⚠ 导出脚本不存在，索引已完成：$export_script"; return 0; }
  codegraph_ask_to_run '是否导出 CodeGraph Markdown / Mermaid 报告（覆盖既有导出文件）' || { codegraph_log 'ℹ 已跳过 Markdown 导出，索引更新结果保留。'; return 0; }
  export CODEGRAPH_MD_OUT_DIR="${CODEGRAPH_MD_OUT_DIR:-.codegraph/codegraph.md}"
  export CODEGRAPH_DB_PATH=.codegraph/codegraph.db
  if [[ "${CODEGRAPH_EXPORT_ASYNC:-0}" == 1 ]]; then
    codegraph_log 'ℹ CODEGRAPH_EXPORT_ASYNC 兼容参数不再切断交互；本任务等待导出完成。'
  fi
  run_export_with_heartbeat "$export_script" || result=$?
  (( result == 0 )) || codegraph_stop "索引已完成，Markdown 导出失败或超时，退出码=$result" "$result"
  codegraph_log "✔ Markdown 导出完成：$CODEGRAPH_MD_OUT_DIR"
}
# 汇总当前项目产物与日志。
print_summary() {
  codegraph_log "ℹ 流程结束：$PROJECT_ROOT/.codegraph；日志：$CODEGRAPH_LOG_FILE"
}
# 为自述提供红色标题、蓝色正文和纯文本降级。
codegraph_intro_line() {
  local role="$1" message="$2"
  if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    if [[ "$role" == title ]]; then
      printf '\033[1;31m%s\033[0m\n' "$message"
    else
      printf '\033[0;34m%s\033[0m\n' "$message"
    fi
  else
    print -r -- "$message"
  fi
}
# 同步输出终端信息与纯文本日志。
codegraph_log() {
  print -r -- "$*" | /usr/bin/tee -a "$CODEGRAPH_LOG_FILE"
}
# 给出具体失败层并停止后续动作。
codegraph_stop() {
  codegraph_log "✖ $1；日志：$CODEGRAPH_LOG_FILE"
  exit "${2:-1}"
}
# 透传命令和日志写入的失败状态。
codegraph_run_logged() {
  local -a results
  codegraph_log "▶ 执行：${(j: :)${(q)@}}"
  "$@" 2>&1 | /usr/bin/tee -a "$CODEGRAPH_LOG_FILE"
  results=( "${pipestatus[@]}" )
  (( results[1] == 0 )) || return "${results[1]}"
  (( results[2] == 0 )) || return "${results[2]}"
}
# 固定精确目标并拒绝地图链接跨目录写入。
codegraph_check_target() {
  local map_entry=""
  [[ -n "$CODEGRAPH_TARGET_DIRECTORY" && -d "$CODEGRAPH_TARGET_DIRECTORY" ]] || codegraph_stop "目标目录不存在：$CODEGRAPH_TARGET_DIRECTORY"
  cd -P -- "$CODEGRAPH_TARGET_DIRECTORY" || codegraph_stop "无法进入目标目录：$CODEGRAPH_TARGET_DIRECTORY"
  CODEGRAPH_TARGET_DIRECTORY="$PWD"
  [[ ! -L "$PWD/.codegraph" ]] || codegraph_stop '目标 .codegraph 是符号链接，已停止以免写入其它位置'
  [[ ! -e "$PWD/.codegraph" || -d "$PWD/.codegraph" ]] || codegraph_stop '目标 .codegraph 已存在但不是目录'
  for map_entry in "$PWD/.codegraph"/*(DN); do
    [[ ! -L "$map_entry" ]] || codegraph_stop "地图直属条目是符号链接，已停止以免数据库、锁文件或内部配置写到其它位置：$map_entry"
  done
  [[ -x /usr/bin/plutil ]] || codegraph_stop '缺少 macOS plutil，无法核对地图 JSON 结果'
  [[ "$(print -r -- '{"health":true}' | /usr/bin/plutil -extract health raw -o - - 2>> "$CODEGRAPH_LOG_FILE")" == true ]] || codegraph_stop '系统 plutil 无法解析 JSON，停止地图操作'
  [[ -x /usr/bin/sqlite3 ]] && /usr/bin/sqlite3 -batch -init /dev/null -version >> "$CODEGRAPH_LOG_FILE" 2>&1 || codegraph_stop '系统 SQLite 不可用，无法在不访问父项目的前提下核对地图数据库'
  codegraph_log '✔ 地图校验工具：SQLite 只读接口、plutil JSON 解析健康。'
}
# 核对 CLI 身份及必需命令能力，禁用 shim 隐式下载。
codegraph_candidate_ok() {
  local candidate="$1"
  [[ -n "$candidate" && -x "$candidate" ]] || return 1
  local help_text=""
  help_text="$("$candidate" --help 2>> "$CODEGRAPH_LOG_FILE")" || return 1
  [[ "$help_text" == *'Code intelligence and knowledge graph'* ]] || return 1
  print -r -- "$help_text" >> "$CODEGRAPH_LOG_FILE"
  "$candidate" --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$candidate" init --help >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$candidate" sync --help >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$candidate" index --help >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$candidate" status --help >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
}
# 搜索当前环境与已知安装前缀，避免 PATH 未加载导致重复安装。
codegraph_find_cli() {
  local candidate=""
  local -a candidates=( "$CODEGRAPH_PREFIX/bin/codegraph" "$(command -v codegraph 2>/dev/null)"
    /opt/homebrew/bin/codegraph /usr/local/bin/codegraph "$HOME/.local/bin/codegraph"
    "$HOME/.npm-global/bin/codegraph" "${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}/bin/codegraph"
    "$HOME/.homebrew/bin/codegraph" )
  for candidate in "${candidates[@]}"; do
    if codegraph_candidate_ok "$candidate"; then
      CODEGRAPH_BIN="$candidate"
      return 0
    fi
  done
  return 1
}
# 实际执行引导工具与 CLT，未就绪时给出人工恢复入口。
codegraph_check_installation_tools() {
  local curl_bin="$(command -v curl 2>/dev/null)" selector_bin="$(command -v xcode-select 2>/dev/null)"
  local xcrun_bin="$(command -v xcrun 2>/dev/null)" clang_bin="" developer_path=""
  [[ -x /bin/bash ]] && /bin/bash --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || codegraph_stop '系统 bash 不可用，无法引导 Homebrew'
  [[ -n "$curl_bin" ]] && "$curl_bin" --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || codegraph_stop 'curl 不可用，请先修复系统下载工具'
  [[ -n "$selector_bin" && -n "$xcrun_bin" ]] || codegraph_stop '缺少 xcode-select/xcrun，请先准备 Apple Command Line Tools'
  developer_path="$("$selector_bin" -p 2>> "$CODEGRAPH_LOG_FILE")"
  clang_bin="$("$xcrun_bin" --find clang 2>> "$CODEGRAPH_LOG_FILE")"
  if [[ -z "$developer_path" || ! -d "$developer_path" || -z "$clang_bin" || ! -x "$clang_bin" ]] ||
     ! "$clang_bin" --version >> "$CODEGRAPH_LOG_FILE" 2>&1; then
    codegraph_log '⚠ Command Line Tools 不可用，请先完成系统安装后重跑本入口。'
    codegraph_log '请在终端运行 xcode-select --install，完成系统安装后重跑。'
    codegraph_stop 'Command Line Tools 尚未就绪，本次未继续安装下游组件'
  fi
  codegraph_log '✔ bash、curl 和 Command Line Tools 健康检查通过。'
}
# 体检已有 Homebrew，缺失时安装一次后重新激活。
codegraph_ensure_homebrew() {
  if ! JOBS_HOMEBREW_BIN="$(jobs_brew_find)"; then
    require_installation Homebrew
    codegraph_log '━━━━━━━━━━ 来源｜Homebrew ━━━━━━━━━━'
    codegraph_log '📥 系统安装器：https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'
    codegraph_log '📥 用户目录来源：https://github.com/Homebrew/brew.git（官方最新稳定发布）'
    jobs_brew_choose_installation || codegraph_stop 'Homebrew 安装路径选择已取消'
    case "$JOBS_HOMEBREW_INSTALL_MODE" in
      system) jobs_brew_install_system || codegraph_stop '系统目录 Homebrew 安装失败' ;;
      user) jobs_brew_install_user || codegraph_stop '用户目录 Homebrew 安装失败' ;;
      *) codegraph_stop 'Homebrew 安装路径选择无效' ;;
    esac
  fi
  jobs_brew_activate || codegraph_stop 'Homebrew 当前进程环境激活失败'
  codegraph_run_logged "$JOBS_HOMEBREW_BIN" --version || codegraph_stop 'Homebrew 版本检查失败'
  codegraph_run_logged "$JOBS_HOMEBREW_BIN" config || codegraph_stop 'Homebrew 配置检查失败'
  if ! codegraph_run_logged "$JOBS_HOMEBREW_BIN" doctor; then
    codegraph_log '⚠ Homebrew doctor 有诊断提示；用户前缀或无关公式警告不等于本次依赖不可用，继续按实际 Node/npm 健康检查判断。'
  fi
  if [[ "$ALLOW_INSTALL" == 1 ]] && codegraph_ask_to_run '是否更新 Homebrew 软件源'; then
    codegraph_brew_run_network "$JOBS_HOMEBREW_BIN" update || codegraph_stop 'Homebrew 更新或网络预检失败，未自动重放；请检查网络后重新运行'
  fi
}
# Node 执行 JS，npm 校验版本与只读配置。
codegraph_node_npm_ok() {
  [[ -x "$CODEGRAPH_NODE_BIN" && -x "$CODEGRAPH_NPM_BIN" ]] || return 1
  "$CODEGRAPH_NODE_BIN" --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$CODEGRAPH_NODE_BIN" -e 'if (Number(process.versions.node.split(".")[0]) < 20) process.exit(1); require("node:fs"); require("node:path");' >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$CODEGRAPH_NPM_BIN" --version >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$CODEGRAPH_NPM_BIN" config get prefix >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
  "$CODEGRAPH_NPM_BIN" root --global >> "$CODEGRAPH_LOG_FILE" 2>&1 || return 1
}
# 搜索当前和 Brew 已有的成套 Node/npm。
codegraph_find_node_npm() {
  local node_path="$(command -v node 2>/dev/null)" candidate="" formula="" prefix=""
  local -a candidates=()
  [[ -z "$node_path" ]] || candidates+=( "${node_path:h}" )
  for formula in node@24 node node@22; do
    [[ -n "${JOBS_HOMEBREW_BIN:-}" && -x "$JOBS_HOMEBREW_BIN" ]] || break
    prefix="$("$JOBS_HOMEBREW_BIN" --prefix "$formula" 2>> "$CODEGRAPH_LOG_FILE")" || continue
    [[ "$prefix" != /* ]] || candidates+=( "$prefix/bin" )
  done
  for candidate in "${candidates[@]}"; do
    CODEGRAPH_NODE_BIN="$candidate/node"
    CODEGRAPH_NPM_BIN="$candidate/npm"
    export PATH="$candidate:$PATH"
    rehash
    codegraph_node_npm_ok && return 0
  done
  return 1
}
# 只修复缺失或损坏层，安装后立即复检。
codegraph_ensure_node_npm() {
  local node_prefix="" operation=install
  if codegraph_find_node_npm; then
    codegraph_log "✔ 复用健康 Node/npm：$CODEGRAPH_NODE_BIN / $CODEGRAPH_NPM_BIN"
    codegraph_offer_node_upgrade
    return 0
  fi
  require_installation Node/npm
  "$JOBS_HOMEBREW_BIN" list --versions node@24 >> "$CODEGRAPH_LOG_FILE" 2>&1 && operation=reinstall
  codegraph_log '━━━━━━━━━━ 来源｜Node.js / npm ━━━━━━━━━━'
  codegraph_log "📥 来源：Homebrew 官方 node@24 公式；动作：$operation；包下载地址由 Homebrew 解析"
  codegraph_brew_run_network "$JOBS_HOMEBREW_BIN" "$operation" node@24 || codegraph_stop 'Homebrew Node.js 安装或修复失败'
  node_prefix="$("$JOBS_HOMEBREW_BIN" --prefix node@24 2>> "$CODEGRAPH_LOG_FILE")" || codegraph_stop '无法读取 node@24 安装前缀'
  [[ "$node_prefix" == /* && -d "$node_prefix" ]] || codegraph_stop 'node@24 返回了无效安装前缀'
  CODEGRAPH_NODE_BIN="$node_prefix/bin/node"
  CODEGRAPH_NPM_BIN="$node_prefix/bin/npm"
  export PATH="$node_prefix/bin:$PATH"
  rehash
  codegraph_node_npm_ok || codegraph_stop 'Node/npm 安装后复检失败；停止，不反复安装'
  codegraph_log '✔ Node/npm 安装后健康检查通过。'
}
# 使用明确官方 Registry 与独立用户前缀安装正确产品。
codegraph_install_cli() {
  [[ "${1:-}" == approved ]] || require_installation CodeGraph
  [[ ! -L "$CODEGRAPH_PREFIX" ]] || codegraph_stop "CodeGraph 安装前缀是符号链接：$CODEGRAPH_PREFIX"
  codegraph_log '━━━━━━━━━━ 来源｜CodeGraph ━━━━━━━━━━'
  codegraph_log '📦 包：@colbymchenry/codegraph@latest（官方 scoped npm 包）'
  codegraph_log "📥 Registry：$CODEGRAPH_NPM_REGISTRY；目标：$CODEGRAPH_PREFIX"
  codegraph_run_logged "$CODEGRAPH_NPM_BIN" ping --registry "$CODEGRAPH_NPM_REGISTRY" --fetch-retries=1 --fetch-timeout=30000 || codegraph_stop 'npm 官方 Registry 不可用，未开始安装 CodeGraph'
  codegraph_run_logged "$CODEGRAPH_NPM_BIN" install --global --prefix "$CODEGRAPH_PREFIX" --registry "$CODEGRAPH_NPM_REGISTRY" --include=optional --engine-strict --fetch-retries=1 --fetch-timeout=60000 '@colbymchenry/codegraph@latest' || codegraph_stop 'CodeGraph 官方 npm 包安装失败'
  CODEGRAPH_BIN="$CODEGRAPH_PREFIX/bin/codegraph"
  export PATH="$CODEGRAPH_PREFIX/bin:$PATH"
  rehash
  codegraph_candidate_ok "$CODEGRAPH_BIN" || codegraph_stop 'CodeGraph 安装后版本或 CLI 接口复检失败；停止，不反复安装'
  codegraph_log "✔ CodeGraph 安装后健康检查通过：$CODEGRAPH_BIN"
}
# 单独收集 JSON，避免 stderr 污染状态解析。
codegraph_read_status() {
  CODEGRAPH_STATUS_JSON="$("$CODEGRAPH_BIN" status --json "$CODEGRAPH_TARGET_DIRECTORY" 2>> "$CODEGRAPH_LOG_FILE")"
  local command_result=$?
  (( command_result == 0 )) || codegraph_stop 'CodeGraph 状态读取失败' "$command_result"
  codegraph_log "$CODEGRAPH_STATUS_JSON"
}
# 先检查目标自身数据库，阻止 CLI 回退父目录。
codegraph_require_target_schema() {
  local database_path="$CODEGRAPH_TARGET_DIRECTORY/.codegraph/codegraph.db" schema_result="" uri_path=""
  [[ -f "$database_path" ]] || codegraph_stop '目标地图数据库尚未生成，未读取可能属于父项目的状态'
  if ! schema_result="$(/usr/bin/sqlite3 -batch -readonly -init /dev/null "$database_path" "SELECT 1 FROM sqlite_master WHERE type='table' AND name='nodes' LIMIT 1;" 2>> "$CODEGRAPH_LOG_FILE")"; then
    # Apple SQLite 在 WAL 库没有 sidecar 时只读打开失败；仅无 WAL 时读取主库 schema，不能忽略活跃 WAL。
    [[ ! -e "${database_path}-wal" ]] || codegraph_stop '目标数据库含 WAL 且无法只读校验，请先排查锁定或权限问题'
    uri_path="$(print -rn -- "$database_path" | /usr/bin/sed -e 's/%/%25/g' -e 's/?/%3F/g' -e 's/#/%23/g')"
    schema_result="$(/usr/bin/sqlite3 -batch -readonly -init /dev/null "file:${uri_path}?mode=ro&immutable=1" "SELECT 1 FROM sqlite_master WHERE type='table' AND name='nodes' LIMIT 1;" 2>> "$CODEGRAPH_LOG_FILE")" || codegraph_stop '目标地图数据库无法只读校验，请先排查数据库损坏或锁定问题'
    [[ ! -e "${database_path}-wal" ]] || codegraph_stop 'schema 兼容检查期间出现 WAL，保留数据库并停止，请重试'
    codegraph_log 'ℹ 已使用无 WAL 主库的只读 schema 兼容检查；完整索引状态仍由 CLI 验证。'
  fi
  [[ "$schema_result" == 1 ]] || codegraph_stop '目标数据库缺少 CodeGraph nodes 表，保留原文件且不访问父项目地图'
}
# 使用系统 JSON 解析器读取必需字段。
codegraph_status_field() {
  /usr/bin/plutil -extract "$1" raw -o - - <<< "$CODEGRAPH_STATUS_JSON" 2>/dev/null
}
# 核对项目身份、产物位置、索引时间和完整状态。
codegraph_validate_status() {
  local initialized="" project_path="" index_path="" last_indexed="" index_state="" field="" count=""
  initialized="$(codegraph_status_field initialized)" || codegraph_stop 'JSON 缺少 initialized 字段'
  project_path="$(codegraph_status_field projectPath)" || codegraph_stop 'JSON 缺少 projectPath 字段'
  index_path="$(codegraph_status_field indexPath)" || codegraph_stop 'JSON 缺少 indexPath 字段'
  [[ "$initialized" == true && "$project_path" == "$CODEGRAPH_TARGET_DIRECTORY" && "$index_path" == "$CODEGRAPH_TARGET_DIRECTORY/.codegraph" ]] || codegraph_stop '地图项目身份或输出位置不匹配，未继续处理其它目录'
  if [[ "${1:-}" == complete ]]; then
    last_indexed="$(codegraph_status_field lastIndexed)" || codegraph_stop 'JSON 缺少索引时间'
    index_state="$(codegraph_status_field index.state)" || codegraph_stop 'JSON 缺少索引完整状态'
    [[ -n "$last_indexed" && "$last_indexed" != null && "$index_state" == complete && -d "$CODEGRAPH_TARGET_DIRECTORY/.codegraph" ]] || codegraph_stop '地图索引未完成或产物不存在'
    [[ "$(codegraph_status_field index.reindexRecommended 2>/dev/null)" != true ]] || codegraph_stop '当前引擎仍建议重建，未把旧索引当完整成功'
    for field in pendingChanges.added pendingChanges.modified pendingChanges.removed index.pendingRefs; do
      count="$(codegraph_status_field "$field")" || codegraph_stop "JSON 缺少索引核验字段：$field"
      [[ "$count" == 0 ]] || codegraph_stop "地图仍存在待处理变更或解析问题：$field=$count"
    done
    for field in index.filesNeedingReindex index.filesWithParseErrors; do
      if count="$(codegraph_status_field "$field")"; then
        [[ "$count" == 0 ]] || codegraph_stop "地图仍存在待处理变更或解析问题：$field=$count"
      fi
    done
  fi
}
# >>> Jobs Homebrew install choice >>>
# >>> Jobs Homebrew network >>>
# Homebrew 网络预检与单次执行；由宿主在用户确认维护后调用，不写持久网络配置。
typeset -g JOBS_BREW_NETWORK_READY=0
typeset -g JOBS_BREW_NETWORK_STATUS=1
typeset -g JOBS_BREW_NETWORK_PROXY=""
typeset -g JOBS_BREW_NETWORK_NO_PROXY=""
typeset -g JOBS_BREW_NETWORK_SYSTEM_EXCEPTIONS=""
typeset -g JOBS_BREW_NETWORK_GIT_REPOSITORY=""
typeset -ga JOBS_BREW_NETWORK_PROBE_URLS=()
typeset -ga JOBS_BREW_NETWORK_PROBE_GIT_URLS=()
typeset -ga JOBS_BREW_NETWORK_GIT_SOURCE_URLS=()
# 提取无凭据的 HTTP 站点根地址；SSH、本地及未知协议不套用 HTTP 选路。
jobs_brew_probe_url_root() {
  local value="$1" scheme="" authority=""
  case "$value" in
    http://*|https://*) ;;
    *) return 1 ;;
  esac
  [[ "$value" != *[[:space:][:cntrl:]]* ]] || return 1
  scheme="${value%%://*}"
  authority="${${value#*://}%%/*}"
  authority="${authority##*@}"
  [[ -n "$authority" && "$authority" != *[\?\#]* ]] || return 1
  print -r -- "${scheme}://${authority}/"
}
# 使用调用方传入的实际来源；未传入时读取本机 Brew origin 与 API 配置。
jobs_brew_collect_probe_urls() {
  local origin="${HOMEBREW_BREW_GIT_REMOTE:-}" repository="" value="" root="" source_index=0
  local -a sources=() kinds=()
  JOBS_BREW_NETWORK_PROBE_URLS=()
  JOBS_BREW_NETWORK_PROBE_GIT_URLS=()
  JOBS_BREW_NETWORK_GIT_SOURCE_URLS=()
  if [[ -n "${JOBS_HOMEBREW_BIN:-}" ]]; then
    repository="$("$JOBS_HOMEBREW_BIN" --repository 2>/dev/null)"
    [[ -n "$repository" && -d "$repository" ]] && JOBS_BREW_NETWORK_GIT_REPOSITORY="$repository"
  fi
  if (( ${+parameters[JOBS_BREW_NETWORK_SOURCE_URLS]} )); then
    sources=("${JOBS_BREW_NETWORK_SOURCE_URLS[@]}")
    if (( ${+parameters[JOBS_BREW_NETWORK_SOURCE_KINDS]} )); then
      kinds=("${JOBS_BREW_NETWORK_SOURCE_KINDS[@]}")
    else
      kinds=(git)
    fi
  else
    if [[ -z "$origin" && -n "${JOBS_HOMEBREW_BIN:-}" ]]; then
      if [[ -n "$repository" && -d "$repository" ]]; then
        origin="$(/usr/bin/git -C "$repository" remote get-url origin 2>/dev/null)"
      fi
    fi
    sources=("${origin:-https://github.com/Homebrew/brew.git}")
    kinds=(git)
    if [[ "${HOMEBREW_NO_INSTALL_FROM_API:-0}" != 1 ]]; then
      sources+=("${HOMEBREW_API_DOMAIN:-https://formulae.brew.sh/api}")
      kinds+=(http)
    fi
  fi
  for value in "${sources[@]}"; do
    source_index=$((source_index + 1))
    root="$(jobs_brew_probe_url_root "$value")" || continue
    JOBS_BREW_NETWORK_PROBE_URLS+=("$root")
    if [[ "${kinds[$source_index]:-http}" == git ]]; then
      JOBS_BREW_NETWORK_PROBE_GIT_URLS+=("$value")
      JOBS_BREW_NETWORK_GIT_SOURCE_URLS+=("$value")
    else
      JOBS_BREW_NETWORK_PROBE_GIT_URLS+=("")
    fi
  done
}
# 任何显式代理变量（包括空字符串）均由调用方决定，不用系统代理覆盖。
jobs_brew_proxy_environment_is_explicit() {
  local variable=""
  for variable in http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY; do
    (( ${+parameters[$variable]} )) && return 0
  done
  return 1
}
# 在实际 Brew 仓库读取生效代理，避免受调用目录的无关仓库配置影响。
jobs_brew_git_proxy_value() {
  /usr/bin/git -C "${JOBS_BREW_NETWORK_GIT_REPOSITORY:-/}" config --get-urlmatch http.proxy "$1"
}
# 保留实际目标上已经生效的 Git 代理，包含显式配置的空代理。
jobs_brew_git_proxy_is_explicit() {
  local target=""
  for target in "${JOBS_BREW_NETWORK_GIT_SOURCE_URLS[@]}"; do
    jobs_brew_git_proxy_value "$target" >/dev/null 2>&1 && return 0
  done
  return 1
}
# 仅读取已经启用的系统代理；此函数单独保留，便于隔离测试替换。
jobs_brew_system_proxy_snapshot() {
  /usr/sbin/scutil --proxy
}
# 解析根层手工代理开关，不执行 PAC、不扫描端口、不推测代理地址。
jobs_brew_system_proxy_rows() {
  /usr/bin/awk '
    {
      if (depth<=1 && $1 ~ /^(HTTPSEnable|HTTPSProxy|HTTPSPort|HTTPEnable|HTTPProxy|HTTPPort|SOCKSEnable|SOCKSProxy|SOCKSPort)$/) {
        key=$1; value=$0; sub(/^[^:]*:[[:space:]]*/, "", value); sub(/[[:space:]]*$/, "", value); values[key]=value
      }
      depth+=gsub(/\{/, "{")-gsub(/\}/, "}")
    }
    END {
      split("HTTPS HTTP SOCKS", kinds, " ")
      for (i=1;i<=3;i++) {
        kind=kinds[i]
        if (values[kind "Enable"]=="1") printf "%s\t%s\t%s\n", kind, values[kind "Proxy"], values[kind "Port"]
      }
    }'
}
# 按完整系统通配规则逐项检查本次来源，无法精确判断的 IPv6 CIDR 保守旁路。
jobs_brew_sources_match_bypass_rule() {
  emulate -L zsh
  local rule="${1:l}" target="" authority="" host=""
  for target in "${JOBS_BREW_NETWORK_PROBE_URLS[@]}"; do
    authority="${${target#*://}%%/*}"
    if [[ "$authority" == \[* ]]; then
      host="${${authority%%\]*}#\[}"
    else
      host="${authority%%:*}"
    fi
    host="${host:l}"
    if [[ "$rule" == '<local>' ]]; then
      [[ "$host" != *[.:]* ]] && return 0
    elif [[ "$rule" == *:*/* && "$host" == *:* ]]; then
      return 0
    elif [[ "$host" == ${~rule} ]]; then
      return 0
    fi
  done
  return 1
}
# 合并可表达的系统旁路；复杂规则只对本次来源检查，不冒充全系统等价重放。
jobs_brew_collect_system_bypass() {
  local snapshot="$1" rows="" rule="" normalized="" combined="${no_proxy:-}" complex_checked=0
  [[ -z "${NO_PROXY:-}" ]] || combined="${combined:+${combined},}${NO_PROXY}"
  if print -r -- "$snapshot" | /usr/bin/grep -Eq '^[[:space:]]*ExcludeSimpleHostnames[[:space:]]*:[[:space:]]*1[[:space:]]*$'; then
    if jobs_brew_sources_match_bypass_rule '<local>'; then
      jobs_brew_note "本次来源命中系统简单主机旁路；保留当前链路，不自动注入代理。"
      return 1
    fi
    complex_checked=1
  fi
  rows="$(print -r -- "$snapshot" | /usr/bin/awk '
    /ExceptionsList[[:space:]]*:[[:space:]]*<array>/ { inside=1; next }
    inside && /^[[:space:]]*}/ { inside=0 }
    inside && /^[[:space:]]*[0-9]+[[:space:]]*:/ {
      sub(/^[^:]*:[[:space:]]*/, ""); count=split($0,rules,",")
      for (i=1;i<=count;i++) { gsub(/^[[:space:]]+|[[:space:]]+$/,"",rules[i]); print rules[i] }
    }
  ')"
  JOBS_BREW_NETWORK_SYSTEM_EXCEPTIONS="$rows"
  while IFS= read -r rule; do
    [[ -n "$rule" ]] || continue
    normalized="$rule"
    [[ "$normalized" == \*.* ]] && normalized="${normalized#\*}"
    if [[ "$normalized" =~ '^[0-9]{1,3}(\.[0-9]{1,3}){0,2}\.\*$' ]]; then
      normalized="$(print -r -- "${normalized%.\*}" | /usr/bin/awk -F . '
        {
          for (i=1;i<=NF;i++) if ($i>255) exit 1
          printf "%d.%d.%d.%d/%d",$1,$2,$3,0,NF*8
        }')" || normalized=""
    fi
    if [[ "$normalized" =~ '^([0-9]{1,3}\.){0,3}[0-9]{1,3}/[0-9]{1,2}$' ]]; then
      normalized="$(print -r -- "$normalized" | /usr/bin/awk -F / '
        {
          if ($2>32) exit 1
          count=split($1,octets,".")
          for (i=1;i<=count;i++) if (octets[i]>255) exit 1
          printf "%d.%d.%d.%d/%d",octets[1],octets[2],octets[3],octets[4],$2
        }')" || normalized=""
    fi
    if [[ "$normalized" == */* && ! "$normalized" =~ '^([0-9]{1,3}\.){3}[0-9]{1,3}/[0-9]{1,2}$' ]]; then
      normalized=""
    fi
    if [[ -z "$normalized" || ( "$normalized" != '*' && ! "$normalized" =~ '^([A-Za-z0-9._:/-]+|\[[0-9A-Fa-f:]+\])$' ) ]]; then
      if jobs_brew_sources_match_bypass_rule "$rule"; then
        jobs_brew_note "本次来源命中不能忠实转换的系统旁路规则；保留当前链路，不自动注入代理。"
        return 1
      fi
      complex_checked=1
      continue
    fi
    combined="${combined:+${combined},}${normalized}"
  done <<< "$rows"
  if (( complex_checked == 1 )); then
    jobs_brew_note "系统复杂旁路已按本次来源检查；后续下载地址不在预检保证内，未将其改写为其它匹配规则。"
  fi
  JOBS_BREW_NETWORK_NO_PROXY="$combined"
  return 0
}
# 仅以短 HEAD 请求检查连接与 TLS；不携带 Git 凭据，不代表安装一定成功。
jobs_brew_probe_route() {
  local proxy="$1" target="$2" code="" result=0 git_proxy="" git_source="${3:-}" source_index=0
  local connect_timeout="${JOBS_BREW_NETWORK_CONNECT_TIMEOUT:-2}"
  local probe_timeout="${JOBS_BREW_NETWORK_PROBE_TIMEOUT:-4}"
  local -a command=(/usr/bin/curl --disable --silent --head --output /dev/null --write-out '%{http_code}' --proto '=http,https')
  [[ "$connect_timeout" =~ '^[0-9]{1,2}$' ]] && (( 10#$connect_timeout >= 1 && 10#$connect_timeout <= 30 )) || connect_timeout=2
  [[ "$probe_timeout" =~ '^[0-9]{1,2}$' ]] && (( 10#$probe_timeout >= 1 && 10#$probe_timeout <= 60 )) || probe_timeout=4
  command+=(--connect-timeout "$connect_timeout" --max-time "$probe_timeout")
  if [[ -n "$proxy" ]]; then
    code="$(no_proxy="$JOBS_BREW_NETWORK_NO_PROXY" NO_PROXY="$JOBS_BREW_NETWORK_NO_PROXY" "${command[@]}" --proxy "$proxy" "$target" 2>/dev/null)" || result=$?
  else
    if (( $# < 3 )); then
      source_index=${JOBS_BREW_NETWORK_PROBE_URLS[(Ie)$target]}
      if (( source_index > 0 )); then
        git_source="${JOBS_BREW_NETWORK_PROBE_GIT_URLS[$source_index]:-}"
      else
        git_source="$target"
      fi
    fi
    if [[ -n "$git_source" ]] && git_proxy="$(jobs_brew_git_proxy_value "$git_source" 2>/dev/null)"; then
      command+=(--proxy "$git_proxy")
    fi
    code="$("${command[@]}" "$target" 2>/dev/null)" || result=$?
  fi
  (( result == 0 )) && [[ "$code" =~ '^[1-5][0-9][0-9]$' && "$code" != 407 ]]
}
# 所有本次实际 HTTP 来源都通过才接受候选；每个候选最多探测一次。
jobs_brew_probe_all_sources() {
  local proxy="$1" target="" source_index=0
  for target in "${JOBS_BREW_NETWORK_PROBE_URLS[@]}"; do
    source_index=$((source_index + 1))
    jobs_brew_probe_route "$proxy" "$target" "${JOBS_BREW_NETWORK_PROBE_GIT_URLS[$source_index]:-}" || return 1
  done
  return 0
}
# 确认后的有界预检缓存结果；全失败时明确阻止本次维护，不重放真实业务。
jobs_brew_prepare_network() {
  local snapshot="" rows="" kind="" host="" port="" scheme="" proxy=""
  local -a candidates=()
  if [[ "$JOBS_BREW_NETWORK_READY" == 1 ]]; then
    return "$JOBS_BREW_NETWORK_STATUS"
  fi
  JOBS_BREW_NETWORK_READY=1
  JOBS_BREW_NETWORK_STATUS=1
  JOBS_BREW_NETWORK_PROXY=""
  jobs_brew_collect_probe_urls
  if (( ${#JOBS_BREW_NETWORK_PROBE_URLS} == 0 )); then
    jobs_brew_note "本次来源无需 HTTP 预检；保留既有协议与配置，仅执行一次维护命令。"
    JOBS_BREW_NETWORK_STATUS=0
    return 0
  fi
  local probe_source=""
  for probe_source in "${JOBS_BREW_NETWORK_PROBE_URLS[@]}"; do
    jobs_brew_note "网络预检来源：${probe_source}（无凭据 HEAD，仅验证连接与 TLS）。"
  done
  if jobs_brew_proxy_environment_is_explicit || jobs_brew_git_proxy_is_explicit; then
    jobs_brew_note "保留显式代理或 Git 代理配置（包含显式空值）；只预检当前链路，不自动换路。"
    if jobs_brew_probe_all_sources ""; then
      JOBS_BREW_NETWORK_STATUS=0
      return 0
    fi
    jobs_brew_note "网络预检失败；本次未执行 Homebrew 维护。检查既有代理或网络后重新运行。"
    return 1
  fi
  snapshot="$(jobs_brew_system_proxy_snapshot 2>/dev/null)"
  if [[ -n "$snapshot" ]] && jobs_brew_collect_system_bypass "$snapshot"; then
    rows="$(print -r -- "$snapshot" | jobs_brew_system_proxy_rows)"
    while IFS=$'\t' read -r kind host port; do
      [[ -n "$kind" && "$port" =~ '^[0-9]{1,5}$' ]] || continue
      (( 10#$port >= 1 && 10#$port <= 65535 )) || continue
      [[ "$host" =~ '^([A-Za-z0-9_.-]+|[0-9A-Fa-f:]+|\[[0-9A-Fa-f:]+\])$' ]] || continue
      [[ "$host" == *:* && "$host" != \[*\] ]] && host="[$host]"
      scheme=http
      [[ "$kind" == SOCKS ]] && scheme=socks5h
      proxy="${scheme}://${host}:${port}"
      (( ${candidates[(Ie)$proxy]} )) && continue
      candidates+=("$proxy")
      if jobs_brew_probe_all_sources "$proxy"; then
        JOBS_BREW_NETWORK_PROXY="$proxy"
        JOBS_BREW_NETWORK_STATUS=0
        jobs_brew_note "已验证系统 ${kind} 代理；仅本次 Homebrew 及其子进程临时使用，退出即撤回，父环境及系统配置不变。"
        return 0
      fi
    done <<< "$rows"
  fi
  jobs_brew_note "系统代理未选中；短时预检当前链路，保留既有旁路与 TLS 校验。"
  if jobs_brew_probe_all_sources ""; then
    JOBS_BREW_NETWORK_STATUS=0
    return 0
  fi
  jobs_brew_note "系统代理与当前链路均未通过网络预检；本次未执行 Homebrew 维护。恢复网络后重新运行。"
  return 1
}
# 仅在目标子进程注入选定路由；保留原退出码，业务失败不自动重放。
jobs_brew_run_network() {
  jobs_brew_prepare_network || return 1
  (
    if [[ -n "$JOBS_BREW_NETWORK_PROXY" ]]; then
      local count="${GIT_CONFIG_COUNT:-0}" variable=""
      if [[ ! "$count" =~ '^[0-9]{1,6}$' ]]; then
        jobs_brew_note "GIT_CONFIG_COUNT 无效，未覆盖既有 Git 环境；本次未执行维护。"
        return 1
      fi
      count="$((10#$count))"
      for variable in http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY; do
        export "$variable=$JOBS_BREW_NETWORK_PROXY"
      done
      export no_proxy="$JOBS_BREW_NETWORK_NO_PROXY" NO_PROXY="$JOBS_BREW_NETWORK_NO_PROXY"
      export "GIT_CONFIG_KEY_${count}=http.proxy" "GIT_CONFIG_VALUE_${count}=$JOBS_BREW_NETWORK_PROXY"
      export GIT_CONFIG_COUNT="$((count + 1))"
    fi
    "$@"
  )
}
# <<< Jobs Homebrew network <<<
# 确认后准备网络，在日志管道外缓存选路，避免子进程丢失准备结果。
codegraph_brew_run_network() {
  jobs_brew_prepare_network || return $?
  codegraph_run_logged jobs_brew_run_network "$@"
}
# 输出安装诊断，避免混入返回的命令路径。
jobs_brew_note() {
  codegraph_log "ℹ $*" >&2
}
# 验证候选能够执行；共享安装只读不代表未安装。
jobs_brew_candidate_ok() {
  local candidate="$1" prefix
  [[ -n "$candidate" && -x "$candidate" ]] || return 1
  HOMEBREW_NO_AUTO_UPDATE=1 "$candidate" --version >/dev/null 2>&1 || return 1
  prefix="$("$candidate" --prefix 2>/dev/null)" || return 1
  [[ "$prefix" == /* && -d "$prefix" ]]
}
# 发现既有健康安装，不以目录可写性决定是否重新安装。
jobs_brew_find() {
  local candidate
  local -a candidates
  candidates=("${JOBS_HOMEBREW_BIN:-}" "$(command -v brew 2>/dev/null)" /opt/homebrew/bin/brew /usr/local/bin/brew
    "${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}/bin/brew" "$HOME/.homebrew/bin/brew")
  for candidate in "${candidates[@]}"; do
    if jobs_brew_candidate_ok "$candidate"; then
      print -r -- "$candidate"
      return 0
    fi
  done
  return 1
}
# 计算官方系统目录；实际支持范围和授权交由官方安装器处理。
jobs_brew_system_prefix() {
  case "$(/usr/bin/uname -m)" in
    arm64) print -r -- /opt/homebrew ;;
    *) print -r -- /usr/local ;;
  esac
}
# 缺失时强提示选择安装路径；YES 只表示选择系统目录，不验证密码或权限。
jobs_brew_choose_installation() {
  local answer="" system_prefix="$(jobs_brew_system_prefix)"
  if [[ ! -t 0 || ! -t 2 || "${IS_SOURCETREE_RUNTIME:-0}" == 1 ]]; then
    jobs_brew_note "缺少 Homebrew，需要人工选择安装路径；请在可交互终端重新运行，未执行安装。"
    return 1
  fi
  print -u2 -r -- "⚠ Homebrew 尚未就绪，必须先选择安装路径："
  print -u2 -r -- "1、输入精确大写 YES：选择系统标准目录 $system_prefix（Apple Silicon：/opt/homebrew；Intel：/usr/local）。"
  print -u2 -r -- "   这表示你准备向系统目录安装；官方安装器可能随后要求管理员密码，并自行验证权限。"
  jobs_prompt_output print -r -- "2、其它输入或直接回车：选择用户目录 ${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}，不使用 sudo；有管理员权限也可选此路径。" >&2
  print -u2 -r -- "本步骤只选择路径，不收集或验证密码；选定路径失败就停止，不自动切换。按 Ctrl+C 取消整个任务。"
  print -u2 -n -r -- "➤ 安装路径选择："
  if ! IFS= read -r answer; then
    jobs_brew_note "输入已取消或结束，停止安装。"
    return 1
  fi
  if [[ "$answer" == YES ]]; then
    typeset -g JOBS_HOMEBREW_INSTALL_MODE=system
    jobs_brew_note "已选择系统安装目录：$system_prefix"
  else
    typeset -g JOBS_HOMEBREW_INSTALL_MODE=user
    jobs_brew_note "已选择用户安装目录：${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}"
  fi
}
# 将官方系统安装器下载到临时文件后执行，失败不自动改装到用户目录。
jobs_brew_install_system() {
  local JOBS_BREW_NETWORK_READY=0
  local -a JOBS_BREW_NETWORK_SOURCE_URLS=(
    https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    "${HOMEBREW_BREW_GIT_REMOTE:-https://github.com/Homebrew/brew.git}"
    "${HOMEBREW_API_DOMAIN:-https://formulae.brew.sh/api}"
  )
  local -a JOBS_BREW_NETWORK_SOURCE_KINDS=(http git http)
  local installer system_prefix="$(jobs_brew_system_prefix)" installer_result=0
  command -v curl >/dev/null 2>&1 || { jobs_brew_note "缺少 curl，无法获取官方安装器。"; return 1; }
  installer="$(mktemp "${TMPDIR:-/tmp}/jobs-homebrew-install.XXXXXX")" || return 1
  if codegraph_brew_run_network curl -fsSL --connect-timeout 10 --max-time 120 https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o "$installer"; then
    codegraph_brew_run_network /bin/bash "$installer" || installer_result=$?
  else
    installer_result=1
  fi
  rm -- "$installer"
  if (( installer_result != 0 )); then
    jobs_brew_note "系统目录安装失败（退出码 $installer_result）；停止，不自动切换安装路径。"
    return 1
  fi
  typeset -g JOBS_HOMEBREW_BIN="$system_prefix/bin/brew"
  jobs_brew_candidate_ok "$JOBS_HOMEBREW_BIN" || { jobs_brew_note "官方安装器结束后未找到健康 Homebrew：$JOBS_HOMEBREW_BIN"; return 1; }
}
# 克隆官方稳定版本到用户目录；不覆盖非空目录，不调用 sudo。
jobs_brew_install_user() {
  local JOBS_BREW_NETWORK_READY=0
  local -a JOBS_BREW_NETWORK_SOURCE_URLS=(
    https://api.github.com/repos/Homebrew/brew/releases/latest
    https://github.com/Homebrew/brew.git
  )
  local -a JOBS_BREW_NETWORK_SOURCE_KINDS=(http git)
  local prefix="${JOBS_HOMEBREW_INSTALL_PREFIX:-$HOME/.local/homebrew}" stage release_tag git_bin
  [[ "$prefix" == /* && "$prefix" != / && "$prefix" != *[[:space:]:]* ]] || {
    jobs_brew_note "Homebrew 用户前缀须为不含空白或冒号的绝对目录：$prefix"
    return 1
  }
  if [[ -L "$prefix" || ( -e "$prefix" && ! -d "$prefix" ) || ( -d "$prefix" && -n "$(ls -A "$prefix" 2>/dev/null)" ) ]]; then
    jobs_brew_note "用户安装目标非空或不是普通目录，不覆盖：$prefix"
    return 1
  fi
  git_bin="$(command -v git 2>/dev/null)"
  [[ -n "$git_bin" ]] && "$git_bin" --version >/dev/null 2>&1 || { jobs_brew_note "用户目录安装需要可用 Git；请先准备 Git / Command Line Tools。"; return 1; }
  command -v curl >/dev/null 2>&1 || { jobs_brew_note "缺少 curl，无法获取官方稳定版本。"; return 1; }
  export HOMEBREW_NO_SUDO=1
  mkdir -p "${prefix:h}" || return 1
  stage="$(mktemp -d "${prefix:h}/.jobs-homebrew.XXXXXX")" || return 1
  if ! codegraph_brew_run_network curl -fsSL --connect-timeout 10 --max-time 60 https://api.github.com/repos/Homebrew/brew/releases/latest -o "$stage/release.json"; then
    rm -r -- "$stage"
    jobs_brew_note "获取官方稳定版本失败，停止安装。"
    return 1
  fi
  release_tag="$(/usr/bin/plutil -extract tag_name raw -o - "$stage/release.json" 2>/dev/null)"
  if [[ ! "$release_tag" =~ '^[0-9]+\.[0-9]+\.[0-9]+$' ]] ||
     ! GIT_TERMINAL_PROMPT=0 codegraph_brew_run_network "$git_bin" -c http.lowSpeedLimit=1 -c http.lowSpeedTime=60 clone --depth 1 --branch "$release_tag" --single-branch https://github.com/Homebrew/brew.git "$stage/brew" ||
     ! "$git_bin" -C "$stage/brew" checkout -b stable ||
     ! "$git_bin" -C "$stage/brew" config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*' ||
     ! mkdir -p "$stage/brew/Cellar" "$stage/brew/Caskroom" "$stage/brew/etc" "$stage/brew/var"; then
    rm -r -- "$stage"
    jobs_brew_note "Homebrew 用户目录初始化失败，停止安装。"
    return 1
  fi
  # 空目录也只在下载成功后移除，避免提前改动用户的目标目录。
  if [[ -d "$prefix" ]] && ! rmdir -- "$prefix"; then
    rm -r -- "$stage"
    return 1
  fi
  if ! mv "$stage/brew" "$prefix"; then
    rm -r -- "$stage"
    return 1
  fi
  rm -r -- "$stage"
  typeset -g JOBS_HOMEBREW_BIN="$prefix/bin/brew"
  jobs_brew_candidate_ok "$JOBS_HOMEBREW_BIN" || { jobs_brew_note "用户目录安装后复检失败：$prefix"; return 1; }
}
# 仅激活当前子进程，不持久化用户 Shell 或其它全局配置。
jobs_brew_activate() {
  local brew_env
  brew_env="$("$JOBS_HOMEBREW_BIN" shellenv)" || return 1
  eval "$brew_env" || return 1
  typeset -g JOBS_HOMEBREW_PREFIX="$("$JOBS_HOMEBREW_BIN" --prefix)"
  [[ "$JOBS_HOMEBREW_PREFIX" == /* && -d "$JOBS_HOMEBREW_PREFIX" ]] || return 1
  export PATH="$JOBS_HOMEBREW_PREFIX/bin:$JOBS_HOMEBREW_PREFIX/sbin:$PATH"
  rehash
  HOMEBREW_NO_AUTO_UPDATE=1 "$JOBS_HOMEBREW_BIN" config >/dev/null || return 1
}
# <<< Jobs Homebrew install choice <<<

# 编排确认、依赖体检和安装后地图更新。
main() {
  show_script_intro_and_wait "$@" # 首先展示用途、安装范围与取消方式。
  initialize_runtime "$@" # 确认后解析参数与初始化独立日志。
  codegraph_check_target # 拒绝跨项目地图链接并检查结果校验工具。
  acquire_project_lock # 同工程已有活跃任务时安全跳过。
  acquire_toolchain_lock # 串行化跨工程的环境安装与修复。
  check_system_toolchain # 验证安装引导依赖和 Apple 工具链。
  check_export_runtime # 验证 SQLite 实际执行能力。
  ensure_brew # 体检 Homebrew，缺失时按既有路径规则处理。
  ensure_node_npm # 复用健康 Node/npm，必要时 Brew 安装修复。
  ensure_codegraph # 复用健康 CLI 或安装官方 scoped npm 包。
  check_codegraph_engine # 用隔离样例验证解析器和数据库写入。
  release_toolchain_lock # 样例复检通过后允许其它工程检查环境。
  run_codegraph_index # 更新当前工程并核对完整索引状态。
  export_codegraph_markdown # 沿用现有 Markdown 导出能力。
  print_summary # 输出产物和日志位置。
}
main "$@"
