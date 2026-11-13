#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：CocoaPods 源自动选择。
# - 核心用途：同时测试 CDN 与 GitHub Specs 的真实 podspec，依据可用性和耗时选择本次 source。
# - 影响范围：仅发送只读网络请求、写临时探测文件及项目独立日志；不修改 Podfile、锁文件或全局代理。
# - 运行提示：Podfile 在解析依赖前通过 --podfile-hook 同步调用；独立运行先阅读自述并回车确认。

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

typeset -gr CDN_URL='https://cdn.cocoapods.org/'
typeset -gr GIT_URL='https://github.com/CocoaPods/Specs.git'
typeset -g SCRIPT_PATH=''
typeset -g SCRIPT_DIR=''
typeset -g SCRIPT_BASENAME=''
typeset -g LOG_FILE=''
typeset -g WORK_DIR=''
typeset -g INTRO_TEXT=''
typeset -g SOURCE_MODE='auto'
typeset -g SAMPLE_PATH=''
typeset -g SAMPLE_NAME=''
typeset -g SAMPLE_VERSION=''
typeset -g FALLBACK_URL=''
typeset -g SELECTED_URL=''
typeset -g CURL_BIN=''
typeset -g GIT_BIN=''
typeset -gi PROBE_TIMEOUT=8
typeset -gi CONNECT_TIMEOUT=2
typeset -ga PROBE_PIDS=()

# 渲染自述的标题与正文，并在非彩色终端保持纯文本。
intro_line() {
  local role="$1"
  local message="$2"
  if [[ -t 2 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
    if [[ "$role" == title ]]; then
      print -r -- $'\033[1;31m'"$message"$'\033[0m' >&2
    else
      print -r -- $'\033[0;34m'"$message"$'\033[0m' >&2
    fi
  else
    print -r -- "$message" >&2
  fi
}
# 输出只读帮助，不创建文件、不探测网络。
print_usage() {
  print -r -- '用法：/bin/zsh <本脚本> [--podfile-hook | --help]' >&2
  print -r -- '环境：JOBS_SPECS_SOURCE=auto|cdn|git，JOBS_SPECS_PROBE_TIMEOUT=1..30（默认 8），JOBS_SPECS_CONNECT_TIMEOUT=1..30（默认 2）。' >&2
  print -r -- '可选：JOBS_SPECS_SAMPLE_PATH、JOBS_SPECS_FALLBACK_URL、JOBS_SPECS_LOG_PATH。' >&2
}
# 先展示固定自述；仅明确的 Podfile 入口跳过确认，帮助入口立即结束。
show_script_intro_and_wait() {
  local entry_arg=''
  local hook_entry=0
  local help_entry=0
  for entry_arg in "$@"; do
    [[ "$entry_arg" == --podfile-hook ]] && hook_entry=1
    [[ "$entry_arg" == --help || "$entry_arg" == -h ]] && help_entry=1
  done
  INTRO_TEXT=$'【CocoaPods 源自动选择】\n1、用途：同时读取 CDN 与 GitHub 上的相同 podspec，GitHub 额外验证 Git 协议。\n2、边界：只读网络探测；仅写临时文件与日志，不改 Podfile、Podfile.lock、Pods 或全局代理。\n3、策略：比较成功请求的耗时；都失败时沿用调用方锁定源或默认 CDN，交回 CocoaPods 尝试缓存。\n4、限制：小文件与 ls-remote 成功不保证整个 Specs 大仓库能够克隆成功。\n5、日志：默认写系统临时目录下带工程路径摘要的独立日志，可用 JOBS_SPECS_LOG_PATH 指定。\n6、取消：独立运行按回车开始，Ctrl+C 取消；--podfile-hook 由 Podfile 同步无交互调用。'
  local intro_row=''
  local row_number=0
  for intro_row in "${(@f)INTRO_TEXT}"; do
    (( row_number += 1 ))
    if (( row_number == 1 )); then
      jobs_prompt_output intro_line title "$intro_row"
    else
      jobs_prompt_output intro_line body "$intro_row"
    fi
  done
  if (( help_entry == 1 )); then
    print_usage
    exit 0
  fi
  if (( hook_entry == 1 )); then
    return 0
  fi
  if [[ ! -t 0 ]]; then
    print -r -- '✖ 当前没有可交互输入；请在终端独立运行，或由 Podfile 使用 --podfile-hook 调用。' >&2
    exit 2
  fi
  local answer=''
  jobs_prompt_output print -n -r -- '👉 已了解用途与影响，按回车开始；按 Ctrl+C 取消：' >&2
  if ! IFS= read -r answer; then
    print -r -- '已取消，未创建日志或开始网络探测。' >&2
    exit 2
  fi
  if [[ -n "$answer" ]]; then
    print -r -- '已取消，未创建日志或开始网络探测。' >&2
    exit 0
  fi
}
# 同步记录纯文本业务日志与诊断，保留 stdout 给调用方读取唯一 URL。
log_message() {
  local message="[$(/bin/date '+%Y-%m-%d %H:%M:%S')] $1"
  print -r -- "$message" >&2
  print -r -- "$message" >> "$LOG_FILE"
}
# 确认后初始化路径与项目独立日志。
initialize_runtime() {
  setopt NO_NOMATCH
  local entry_arg=''
  for entry_arg in "$@"; do
    if [[ "$entry_arg" != --podfile-hook ]]; then
      print -r -- "✖ 未知参数：$entry_arg" >&2
      print_usage
      exit 2
    fi
  done
  SCRIPT_PATH="${(%):-%x}"
  SCRIPT_PATH="${SCRIPT_PATH:A}"
  SCRIPT_DIR="${SCRIPT_PATH:h}"
  SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
  local project_root="${SCRIPT_DIR:h:h}"
  local project_tag=''
  project_tag="$(print -rn -- "$project_root" | /usr/bin/cksum | /usr/bin/awk '{print $1}')"
  local temporary_root="${TMPDIR:-/tmp}"
  LOG_FILE="${JOBS_SPECS_LOG_PATH:-${temporary_root%/}/${SCRIPT_BASENAME}.${project_tag}.log}"
  if [[ ! -d "${LOG_FILE:h}" || -d "$LOG_FILE" || -L "$LOG_FILE" ]]; then
    print -r -- "✖ 日志父目录不存在、目标为目录或符号链接：$LOG_FILE" >&2
    exit 2
  fi
  if ! : >> "$LOG_FILE"; then
    print -r -- "✖ 无法写入探测日志：$LOG_FILE" >&2
    exit 2
  fi
  print -r -- "$INTRO_TEXT" >> "$LOG_FILE"
  log_message "ℹ 日志：$LOG_FILE"
}
# 为本次探测创建专属目录，生命周期由完整探测流程统一管理。
create_probe_workspace() {
  local temporary_root="${TMPDIR:-/tmp}"
  WORK_DIR="$(/usr/bin/mktemp -d "${temporary_root%/}/jobs-specs-probe.XXXXXXXX")"
  if [[ -z "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
    log_message '✖ 无法创建本次专属临时目录，网络探测尚未开始。'
    exit 2
  fi
}
# 校验白名单源，避免回退参数成为任意 URL。
is_specs_url() {
  [[ "$1" == "$CDN_URL" || "$1" == "$GIT_URL" ]]
}
# 校验超时整数范围，并转换为十进制值供 zsh 运算。
read_timeout() {
  local setting_name="$1"
  local setting_value="$2"
  if [[ "$setting_value" != <-> || ${#setting_value} -gt 2 ]]; then
    log_message "✖ $setting_name 必须是 1 到 30 的整数。"
    exit 2
  fi
  local integer_value=$(( 10#$setting_value ))
  if (( integer_value < 1 || integer_value > 30 )); then
    log_message "✖ $setting_name 必须是 1 到 30 的整数。"
    exit 2
  fi
  REPLY="$integer_value"
}
# 校验模式、样本相对路径与超时；不修正用户明确指定的源。
configure_probe() {
  SOURCE_MODE="${JOBS_SPECS_SOURCE:-auto}"
  case "$SOURCE_MODE" in
    auto|cdn|git) ;;
    *) log_message '✖ JOBS_SPECS_SOURCE 仅支持 auto、cdn、git。'; exit 2 ;;
  esac
  read_timeout JOBS_SPECS_PROBE_TIMEOUT "${JOBS_SPECS_PROBE_TIMEOUT:-8}"
  PROBE_TIMEOUT="$REPLY"
  read_timeout JOBS_SPECS_CONNECT_TIMEOUT "${JOBS_SPECS_CONNECT_TIMEOUT:-2}"
  CONNECT_TIMEOUT="$REPLY"
  (( CONNECT_TIMEOUT > PROBE_TIMEOUT )) && CONNECT_TIMEOUT="$PROBE_TIMEOUT"
  SAMPLE_PATH="${JOBS_SPECS_SAMPLE_PATH:-Specs/a/7/5/AFNetworking/4.0.1/AFNetworking.podspec.json}"
  if [[ ! "$SAMPLE_PATH" =~ '^Specs/[0-9a-f]/[0-9a-f]/[0-9a-f]/[A-Za-z0-9_.+-]+/[A-Za-z0-9_.+-]+/[A-Za-z0-9_.+-]+[.]podspec[.]json$' || "$SAMPLE_PATH" == *'..'* ]]; then
    log_message '✖ JOBS_SPECS_SAMPLE_PATH 必须是 Specs 下的 podspec 相对路径，且不能包含路径穿越或 URL 参数。'
    exit 2
  fi
  SAMPLE_NAME="${SAMPLE_PATH:t}"
  SAMPLE_NAME="${SAMPLE_NAME%.podspec.json}"
  SAMPLE_VERSION="${SAMPLE_PATH:h:t}"
  local sample_pod_directory="${SAMPLE_PATH:h:h:t}"
  if [[ "$SAMPLE_NAME" != "$sample_pod_directory" ]]; then
    log_message '✖ podspec 文件名与 pod 目录名不匹配。'
    exit 2
  fi
  FALLBACK_URL="${JOBS_SPECS_FALLBACK_URL:-$CDN_URL}"
  if ! is_specs_url "$FALLBACK_URL"; then
    log_message '✖ JOBS_SPECS_FALLBACK_URL 必须是两种官方源之一。'
    exit 2
  fi
  log_message "ℹ 模式：$SOURCE_MODE；同一探测样本：$SAMPLE_PATH；每个候选整体限时：${PROBE_TIMEOUT}s。"
}
# 只发现并验证本次需要的现有工具，不安装工具或改写 PATH。
check_environment() {
  CURL_BIN="$(command -v curl 2>/dev/null)"
  GIT_BIN="$(command -v git 2>/dev/null)"
  if [[ -z "$CURL_BIN" ]] || ! "$CURL_BIN" --version >/dev/null 2>&1; then
    CURL_BIN=''
    log_message '⚠ curl 不可用，两个 HTTP 探测均记为失败；不会安装工具。'
  fi
  if [[ -z "$GIT_BIN" ]] || ! "$GIT_BIN" --version >/dev/null 2>&1; then
    GIT_BIN=''
    log_message '⚠ git 不可用，GitHub 候选记为失败；CDN 仍继续探测。'
  fi
}
# 终止本次创建的进程树，避免 Git 的传输子进程越过整体超时继续驻留。
terminate_process_tree() {
  local process_id="$1"
  [[ "$process_id" == <-> && "$process_id" -gt 1 ]] || return 0
  local child_id=''
  local child_list=''
  child_list="$(/bin/ps -axo pid=,ppid= | /usr/bin/awk -v parent="$process_id" '$2 == parent {print $1}')"
  for child_id in "${(@f)child_list}"; do
    [[ -n "$child_id" ]] && terminate_process_tree "$child_id"
  done
  kill -KILL "$process_id" 2>/dev/null || true
}
# 仅清理本次专属临时目录以及仍在运行的探测子进程。
cleanup_runtime() {
  local process_id=''
  for process_id in "${PROBE_PIDS[@]}"; do
    terminate_process_tree "$process_id"
    wait "$process_id" 2>/dev/null || true
  done
  PROBE_PIDS=()
  if [[ -n "$WORK_DIR" && -d "$WORK_DIR" && "${WORK_DIR:t}" == jobs-specs-probe.* ]]; then
    /bin/rm -r -- "$WORK_DIR"
  fi
}
# 中断时保留诊断并通过 EXIT 统一回收本次进程与临时文件。
handle_signal() {
  log_message '⚠ 探测收到取消信号，正在回收本次子进程。'
  if [[ "$1" == INT ]]; then
    exit 130
  fi
  exit 143
}
# 记录候选失败原因，不把网络工具的潜在敏感输出写入公共日志。
candidate_failure() {
  print -r -- "$2" > "$WORK_DIR/$1.reason"
  return 1
}
# 验证完整 JSON 以及样本名称和版本，拒绝 HTML、空响应及伪造的普通 JSON。
validate_podspec() {
  local payload_path="$1"
  [[ -s "$payload_path" ]] || return 1
  /usr/bin/plutil -convert xml1 -o /dev/null -- "$payload_path" >/dev/null 2>&1 || return 1
  local payload_name=''
  local payload_version=''
  payload_name="$(/usr/bin/plutil -extract name raw -o - -- "$payload_path" 2>/dev/null)" || return 1
  payload_version="$(/usr/bin/plutil -extract version raw -o - -- "$payload_path" 2>/dev/null)" || return 1
  [[ "$payload_name" == "$SAMPLE_NAME" && "$payload_version" == "$SAMPLE_VERSION" ]]
}
# 通过真实 GET 测量相同 podspec 的传输耗时，关闭 curlrc 但保留当前代理环境。
probe_podspec() {
  local candidate="$1"
  local sample_url="$2"
  local curl_result=0
  if [[ -z "$CURL_BIN" ]]; then
    candidate_failure "$candidate" 'curl 不可用。'
    return 1
  fi
  "$CURL_BIN" -q --silent --show-error --fail --location \
    --connect-timeout "$CONNECT_TIMEOUT" \
    --max-time "$PROBE_TIMEOUT" \
    --output "$WORK_DIR/$candidate.podspec.json" \
    --write-out '%{time_total}' \
    "$sample_url" > "$WORK_DIR/$candidate.time" 2> "$WORK_DIR/$candidate.curl.error"
  curl_result=$?
  if (( curl_result != 0 )); then
    candidate_failure "$candidate" "podspec GET 失败，curl 退出码：$curl_result。"
    return 1
  fi
  if ! validate_podspec "$WORK_DIR/$candidate.podspec.json"; then
    candidate_failure "$candidate" '响应不是完整有效的目标 podspec JSON，或 name/version 不匹配。'
    return 1
  fi
  local duration=''
  duration="$(< "$WORK_DIR/$candidate.time")"
  if [[ ${#duration} -gt 20 || ! "$duration" =~ '^[0-9]+([.][0-9]+)?$' ]]; then
    candidate_failure "$candidate" 'curl 未返回有效的 time_total，无法比较耗时。'
    return 1
  fi
}
# 检查 GitHub 的同一样本与 Git 协议，保留已有 Git 配置并禁止交互式凭据提示。
probe_candidate() {
  local candidate="$1"
  if [[ "$candidate" == cdn ]]; then
    probe_podspec cdn "${CDN_URL}${SAMPLE_PATH}" || return 1
  else
    probe_podspec git "https://raw.githubusercontent.com/CocoaPods/Specs/master/${SAMPLE_PATH}" || return 1
    if [[ -z "$GIT_BIN" ]]; then
      candidate_failure git 'git 不可用，不能验证 GitHub Specs 协议。'
      return 1
    fi
    GIT_TERMINAL_PROMPT=0 GIT_ASKPASS=/usr/bin/false GCM_INTERACTIVE=never \
      "$GIT_BIN" -c credential.interactive=false ls-remote --exit-code "$GIT_URL" HEAD \
      > "$WORK_DIR/git.head" 2> "$WORK_DIR/git.protocol.error"
    local protocol_result=$?
    if (( protocol_result != 0 )); then
      candidate_failure git "Git ls-remote 失败，退出码：$protocol_result。"
      return 1
    fi
    if ! /usr/bin/grep -Eq '^[0-9a-fA-F]{40,64}[[:space:]]+HEAD$' "$WORK_DIR/git.head"; then
      candidate_failure git 'Git ls-remote 未返回有效的 HEAD 引用。'
      return 1
    fi
  fi
  print -r -- "$(< "$WORK_DIR/$candidate.time")" > "$WORK_DIR/$candidate.result.tmp"
  /bin/mv -- "$WORK_DIR/$candidate.result.tmp" "$WORK_DIR/$candidate.result"
}
# 为整个候选流程设置真实墙钟超时；成功和失败路径均主动回收看门狗。
run_bounded_candidate() {
  trap - EXIT INT TERM
  local candidate="$1"
  probe_candidate "$candidate" &
  local worker_pid=$!
  (
    /bin/sleep "$PROBE_TIMEOUT"
    print -r -- "候选整体超过 ${PROBE_TIMEOUT}s，已终止 HTTP/Git 子进程。" > "$WORK_DIR/$candidate.timeout"
    terminate_process_tree "$worker_pid"
  ) &
  local timer_pid=$!
  wait "$worker_pid" 2>/dev/null
  local candidate_result=$?
  terminate_process_tree "$timer_pid"
  wait "$timer_pid" 2>/dev/null || true
  if [[ -f "$WORK_DIR/$candidate.timeout" ]]; then
    /bin/mv -- "$WORK_DIR/$candidate.timeout" "$WORK_DIR/$candidate.reason"
    /bin/rm -f -- "$WORK_DIR/$candidate.result"
    return 1
  fi
  return "$candidate_result"
}
# 同时探测两个候选，不让前一项失败的等待时间串行累加。
probe_sources() {
  run_bounded_candidate cdn &
  PROBE_PIDS+=("$!")
  run_bounded_candidate git &
  PROBE_PIDS+=("$!")
  local process_id=''
  for process_id in "${PROBE_PIDS[@]}"; do
    wait "$process_id" 2>/dev/null || true
  done
  PROBE_PIDS=()
}
# 汇总每一候选的可用性和相同样本的下载耗时。
report_probe_results() {
  local candidate=''
  local candidate_label=''
  local failure_reason=''
  for candidate in cdn git; do
    candidate_label=CDN
    [[ "$candidate" == git ]] && candidate_label='GitHub Specs'
    if [[ -f "$WORK_DIR/$candidate.result" ]]; then
      log_message "✔ $candidate_label 可用，相同 podspec GET 耗时：$(< "$WORK_DIR/$candidate.result")s。"
    else
      failure_reason='探测失败，未产生成功结果。'
      [[ -f "$WORK_DIR/$candidate.reason" ]] && failure_reason="$(< "$WORK_DIR/$candidate.reason")"
      log_message "⚠ $candidate_label 不可用：$failure_reason"
    fi
  done
}
# 依据本次实测选择可用且更快的源，仅在双方接近时给 CDN 15% 去抖空间。
select_source() {
  local -F cdn_duration=0
  local -F git_duration=0
  if [[ "$SOURCE_MODE" == cdn || "$SOURCE_MODE" == git ]]; then
    SELECTED_URL="$CDN_URL"
    [[ "$SOURCE_MODE" == git ]] && SELECTED_URL="$GIT_URL"
    if [[ ! -f "$WORK_DIR/$SOURCE_MODE.result" ]]; then
      log_message "⚠ 手动指定的 $SOURCE_MODE 未通过探测；保留明确选择，交回 CocoaPods 尝试缓存或报告实际安装错误。"
    else
      log_message "ℹ 使用手动指定且通过探测的 $SOURCE_MODE。"
    fi
  elif [[ -f "$WORK_DIR/cdn.result" && -f "$WORK_DIR/git.result" ]]; then
    cdn_duration="$(< "$WORK_DIR/cdn.result")"
    git_duration="$(< "$WORK_DIR/git.result")"
    if (( git_duration < cdn_duration * 0.85 )); then
      SELECTED_URL="$GIT_URL"
      log_message '✔ GitHub 相同样本下载明显更快且 Git 协议可用，本次选择 Git 源。'
    else
      SELECTED_URL="$CDN_URL"
      log_message '✔ CDN 更快或双方差异小于 15%，本次选择 CDN，避免接近时触发巨大 Specs 仓库冷克隆。'
    fi
  elif [[ -f "$WORK_DIR/cdn.result" ]]; then
    SELECTED_URL="$CDN_URL"
    log_message '✔ 仅 CDN 通过探测，本次选择 CDN。'
  elif [[ -f "$WORK_DIR/git.result" ]]; then
    SELECTED_URL="$GIT_URL"
    log_message '✔ 仅 GitHub 通过探测，本次选择 Git 源。'
  else
    SELECTED_URL="$FALLBACK_URL"
    log_message "⚠ 两种源均未通过网络探测；回退 $FALLBACK_URL，交回 CocoaPods 尝试已有缓存。此结果不代表网络恢复。"
  fi
  log_message 'ℹ GitHub 小文件与 ls-remote 探测无法保证整个 Specs 仓库克隆成功；本模块不执行 clone 或自动安装重试。'
}
# 仅向 stdout 输出允许的一个 URL，便于 Podfile 安全同步读取。
emit_selected_source() {
  if ! is_specs_url "$SELECTED_URL"; then
    log_message '✖ 内部选源结果不在官方源白名单中。'
    exit 2
  fi
  log_message "✔ 本次 source：$SELECTED_URL"
  print -r -- "$SELECTED_URL"
}
# 管理探测的完整临时资源生命周期，避免 zsh 在初始化函数返回时提前触发 EXIT 清理。
run_selection_workflow() {
  trap cleanup_runtime EXIT
  trap 'handle_signal INT' INT
  trap 'handle_signal TERM' TERM
  create_probe_workspace # 为本次网络请求创建可安全回收的专属目录。
  probe_sources # 同时实测两个官方源，墙钟超时后终止传输进程树。
  report_probe_results # 汇总可用性与同一 podspec 的下载耗时。
  select_source # 根据测量结果、指定模式与缓存回退规则选源。
  emit_selected_source # 输出唯一 URL 后随当前流程返回回收临时资源。
}
# 按先自述、后初始化、再同步探测与返回结果的顺序执行。
main() {
  show_script_intro_and_wait "$@" # 首先展示用途，独立运行经回车确认后继续。
  initialize_runtime "$@" # 确认后初始化路径与本次探测日志。
  configure_probe # 校验来源模式、样本与短超时配置。
  check_environment # 复用并检查现有 curl/git，不安装任何工具。
  run_selection_workflow # 完成本次探测与选源，并在正常结束或中断时统一回收。
}

main "$@"
