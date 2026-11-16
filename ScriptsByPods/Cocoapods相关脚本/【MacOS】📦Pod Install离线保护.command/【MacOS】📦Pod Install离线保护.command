#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：Pod Install 离线保护
# - 核心用途：前台生成依赖报告，集成完成后逐项确认 PIF 恢复及 CodeGraph 更新。
# - 影响范围：依赖报告、CodeGraph 工具链与地图、Xcode 空闲构建服务；不安装或删除 Pods。
# - 运行提示：终端先阅读自述并回车，业务选择由各子脚本确认；--check-only 不生成产物。

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
SCRIPT_PATH="${0:A}"
SCRIPT_DIR="${SCRIPT_PATH:h}"
SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
TEMP_ROOT="${TMPDIR:-/tmp}"
DEFAULT_PROJECT_ROOT="${SCRIPT_DIR}/../../.."
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
  jobs_prompt_output print -n -r -- "已了解辅助脚本用途，按回车继续；输入其它内容取消："
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
    if (( OFFLINE_MODE == 1 )); then
      log_message "前置任务策略：显式离线，仅复用本机已有工具，不安装或升级。"
    else
      log_message "前置任务策略：保留报告子脚本的安装 / 升级选择；确认后才预检网络并执行维护。"
    fi
  fi
}

# 根据同名目录结构定位 ScriptsByPods 子脚本。
resolve_script_path() {
  local script_name="$1" category='Cocoapods相关脚本'
  case "$script_name" in
    '【MacOS】codegraph_init.command'|'【MacOS】codegraph_export_md.command'|'【MacOS】🧹恢复Xcode PIF构建会话.command')
      category='自动化测试相关脚本'
      ;;
  esac
  print -r -- "${PROJECT_ROOT}/ScriptsByPods/${category}/${script_name}/${script_name}"
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
  local script_name="【MacOS】codegraph_init.command"
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
