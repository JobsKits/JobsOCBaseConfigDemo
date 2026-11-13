#!/bin/zsh
# 脚本自述：
# - 脚本名称：gitee_snapshot.command（shell: zsh）。
# - 核心用途：GitHub 保留 byPods 全部历史，Gitee 从当前已提交内容建立独立历史。
# - 影响范围：仅创建 Git 对象并更新本地快照分支，不切换分支、不改索引或工作区、不推送。
# - 运行提示：默认执行需回车确认；--check 只读；--hook 由 Git 无交互调用；--install 安装配套钩子。

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

SCRIPT_DIR=''
PROJECT_ROOT=''
LOG_FILE=''
MODE='refresh'
HOOK_NAME=''
SOURCE_BRANCH='byPods'
SNAPSHOT_BRANCH='Gitee@snapshot'
TARGET_REMOTE='gitee'
TARGET_BRANCH='byPods'
ENABLED='false'
SOURCE_OID=''
SOURCE_TREE=''
SNAPSHOT_OID=''
LOCK_DIR=''
LOCK_OWNED=0
# 展示固定自述；普通入口等待回车，Git 钩子和只读检查无需交互。
show_script_intro_and_wait() {
  SCRIPT_DIR="$(cd "$(dirname "${(%):-%x}")" && pwd)"
  PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
  LOG_FILE="${TMPDIR:-/tmp}/gitee_snapshot.log"
  case "${1:-}" in
    --check) MODE='check' ;;
    --hook) MODE='hook' ;;
    --install) MODE='install' ;;
    '') MODE='refresh' ;;
    *) print -u2 -- "错误：不支持参数 $1；可用 --check、--hook 或 --install。"; exit 1 ;;
  esac
  local title='gitee_snapshot.command：Gitee 独立历史'
  [[ "$MODE" == hook ]] && return 0
  local body="1、默认同步当前已提交文件；GitHub 原历史保留。\n2、默认快照名为 Gitee@snapshot；已有快照沿用当前名称，远端清理、源分支提交和推送由你操作。\n3、--install 安装本仓库钩子；--check 只读；Git 钩子自动执行。\n4、日志：$LOG_FILE；按 Ctrl+C 取消。"
  if [[ "$MODE" != hook && -t 1 && -n "${TERM:-}" && "$TERM" != dumb && -z "${NO_COLOR+x}" ]]; then
    printf '\033[1;31m%s\033[0m\n' "$title"
    printf '\033[0;34m%b\033[0m\n' "$body"
  else
    print -r -- "$title"
    printf '%b\n' "$body"
  fi
  if [[ "$MODE" == refresh || "$MODE" == install ]]; then
    [[ -t 0 ]] || { print -u2 -- '错误：请在可交互终端运行；自动同步由 Git 钩子完成。'; exit 1; }
    read -r "?$(jobs_prompt_render '已了解用途，按回车继续；按 Ctrl+C 取消：')" _ || {
      print -u2 -- '已取消：没有读取到确认输入。'
      exit 1
    }
  fi
}
# 统一输出并追加诊断日志，只读检查不写日志。
log() {
  print -r -- "$1"
  [[ "$MODE" == check ]] || print -r -- "$1" >> "$LOG_FILE"
  return 0
}
# 报告失败并终止，避免错误后继续更新引用。
fail() {
  log "错误：$1" >&2
  exit 1
}
# 固定 Git 工作目录，避免依赖调用方当前目录。
repo_git() {
  git -C "$PROJECT_ROOT" "$@"
}
# 检查仓库和本地配置，不改写用户配置。
check_environment() {
  setopt NO_NOMATCH
  command -v git >/dev/null || fail '未找到 Git。'
  [[ "$(repo_git rev-parse --is-inside-work-tree 2>/dev/null)" == true ]] || fail "项目目录不是 Git 工作区：$PROJECT_ROOT"
  ENABLED="$(repo_git config --local --bool --get jobs.giteeSnapshot.enabled 2>/dev/null || print false)"
  SOURCE_BRANCH="$(repo_git config --local --get jobs.giteeSnapshot.sourceBranch || print byPods)"
  TARGET_REMOTE="$(repo_git config --local --get jobs.giteeSnapshot.remote || print gitee)"
  TARGET_BRANCH="$(repo_git config --local --get jobs.giteeSnapshot.targetBranch || print byPods)"
  [[ -f "$SCRIPT_DIR/gitee_snapshot_setup.zsh" ]] || fail '缺少配套配置函数库 gitee_snapshot_setup.zsh。'
  source "$SCRIPT_DIR/gitee_snapshot_setup.zsh" || fail '加载配置函数库失败。'
  SNAPSHOT_BRANCH="$(jobs_resolve_gitee_snapshot_branch "$PROJECT_ROOT" "$SOURCE_BRANCH")" || fail '无法确定当前快照分支。'
  local branch_name
  for branch_name in "$SOURCE_BRANCH" "$SNAPSHOT_BRANCH" "$TARGET_BRANCH"; do
    repo_git check-ref-format "refs/heads/$branch_name" >/dev/null || fail "分支配置无效：$branch_name"
  done
  [[ "$SOURCE_BRANCH" != "$SNAPSHOT_BRANCH" && -n "$TARGET_REMOTE" ]] || fail '源分支和快照分支必须不同，远端名称不得为空。'
}
# 读取源分支已提交的树和快照引用，未提交文件始终不参与。
read_refs() {
  SOURCE_OID="$(repo_git rev-parse --verify "refs/heads/$SOURCE_BRANCH^{commit}" 2>/dev/null)" || fail "源分支不存在：$SOURCE_BRANCH"
  SOURCE_TREE="$(repo_git rev-parse "$SOURCE_OID^{tree}")" || fail '读取源分支文件树失败。'
  SNAPSHOT_OID="$(repo_git rev-parse --verify "refs/heads/$SNAPSHOT_BRANCH^{commit}" 2>/dev/null || true)"
}
# 校验单根、无合并、带标记且与 GitHub 历史没有共同祖先的快照链。
validate_snapshot_chain() {
  [[ -n "$SNAPSHOT_OID" ]] || return 0
  local roots root_message root_count
  roots="$(repo_git rev-list --max-parents=0 "$SNAPSHOT_OID")" || fail '读取快照根提交失败。'
  root_count="$(print -r -- "$roots" | wc -l | tr -d ' ')"
  [[ "$root_count" == 1 ]] || fail '快照存在多个根提交，请检查分支，未覆盖它。'
  root_message="$(repo_git show -s --format=%B "$roots")" || fail '读取快照标记失败。'
  print -r -- "$root_message" | grep -Fxq "Jobs-Gitee-Snapshot: $SOURCE_BRANCH" || fail '快照根提交没有 Jobs 标记，拒绝接管已有分支。'
  [[ -z "$(repo_git rev-list --min-parents=2 "$SNAPSHOT_OID")" ]] || fail '快照含合并提交，不能继承完整历史。'
  if repo_git merge-base "$SOURCE_OID" "$SNAPSHOT_OID" >/dev/null 2>&1; then
    fail '快照与源分支共享祖先，已停止同步以防携带完整历史。'
  fi
}
# 仅持锁实例回收自己的锁，失败时不清理其它进程的锁。
release_lock() {
  if [[ "$LOCK_OWNED" == 1 ]]; then
    rmdir "$LOCK_DIR" 2>/dev/null || true
    LOCK_OWNED=0
  fi
}
# 在脚本退出时回收锁；zsh 函数内注册 EXIT 会提前在函数返回时执行。
TRAPEXIT() {
  release_lock
}
# 中断后按标准退出码退出，由退出陷阱回收当前实例的锁。
TRAPINT() {
  exit 130
}
# 终止后按标准退出码退出，由退出陷阱回收当前实例的锁。
TRAPTERM() {
  exit 143
}
# 使用仓库 Git 目录串行生成快照，避免并行钩子互相覆盖。
acquire_lock() {
  LOCK_DIR="$(repo_git rev-parse --absolute-git-dir)/jobs-gitee-snapshot.lock"
  mkdir "$LOCK_DIR" 2>/dev/null || fail "快照正在同步或上次中断遗留锁：$LOCK_DIR；确认无运行进程后再手动移除锁目录。"
  LOCK_OWNED=1
}
# 以已提交树生成首次无父节点的快照，后续只延续快照历史。
refresh_snapshot() {
  [[ "$ENABLED" == true ]] || fail '尚未启用，请先运行本脚本 --install。'
  acquire_lock
  read_refs
  validate_snapshot_chain
  if [[ -n "$SNAPSHOT_OID" && "$(repo_git rev-parse "$SNAPSHOT_OID^{tree}")" == "$SOURCE_TREE" ]]; then
    log "成功：$SNAPSHOT_BRANCH 已同步，文件内容没有变化，无需新提交。"
    return 0
  fi
  local new_oid expected_old="$SNAPSHOT_OID"
  local -a parent_args=()
  [[ -n "$SNAPSHOT_OID" ]] && parent_args=(-p "$SNAPSHOT_OID")
  new_oid="$(printf '%s\n\n%s\n%s\n' "Gitee 当前快照：$SOURCE_BRANCH" "Jobs-Gitee-Snapshot: $SOURCE_BRANCH" "Source-Commit: $SOURCE_OID" | repo_git commit-tree --no-gpg-sign "$SOURCE_TREE" "${parent_args[@]}")" || fail '创建快照对象失败，请检查 Git 作者配置。'
  [[ "$(repo_git rev-parse "refs/heads/$SOURCE_BRANCH")" == "$SOURCE_OID" ]] || fail '源分支在同步时发生变化，请重新运行。'
  [[ -n "$expected_old" ]] || expected_old="${SOURCE_OID//?/0}"
  repo_git update-ref -m 'Jobs Gitee snapshot' "refs/heads/$SNAPSHOT_BRANCH" "$new_oid" "$expected_old" || fail '快照引用被其它操作修改，本次未覆盖，请重新运行。'
  log "成功：$SNAPSHOT_BRANCH -> $new_oid；在 Sourcetree 选择此源分支，Gitee 目标分支为 $TARGET_BRANCH。"
}
# 只读显示配置和快照状态，不生成 Git 对象或更新引用。
check_snapshot() {
  log "配置：enabled=$ENABLED；GitHub 源=$SOURCE_BRANCH；Gitee 源=$SNAPSHOT_BRANCH；目标=$TARGET_REMOTE/$TARGET_BRANCH。"
  read_refs
  validate_snapshot_chain
  if [[ -z "$SNAPSHOT_OID" ]]; then
    log '提示：尚未建立快照；启用后在源分支提交，或手动运行本脚本生成。'
    return 0
  fi
  [[ "$(repo_git rev-parse "$SNAPSHOT_OID^{tree}")" == "$SOURCE_TREE" ]] || fail '快照落后于已提交内容，请手动运行本脚本后再推送。'
  log "成功：独立快照结构有效，文件树与 $SOURCE_BRANCH 一致。"
}
# 按配置名称及取回、推送 URL 识别 Gitee，覆盖直接 URL 推送。
is_gitee_target() {
  [[ "$1" == "$TARGET_REMOTE" ]] && return 0
  local destination_url
  for destination_url in "$1" "$2"; do
    case "$destination_url" in
      https://gitee.com|https://gitee.com/*|https://gitee.com:*|http://gitee.com|http://gitee.com/*|http://gitee.com:*|ssh://gitee.com/*|ssh://gitee.com:*|ssh://*@gitee.com/*|ssh://*@gitee.com:*|*@gitee.com:*|gitee.com:*)
        return 0
        ;;
    esac
  done
  local configured_url
  while IFS= read -r configured_url; do
    [[ -n "$configured_url" && ( "${1%/}" == "${configured_url%/}" || "${2%/}" == "${configured_url%/}" ) ]] && return 0
  done < <(repo_git remote get-url --all "$TARGET_REMOTE" 2>/dev/null; repo_git remote get-url --push --all "$TARGET_REMOTE" 2>/dev/null)
  return 1
}
# 放行所有远端删除；普通推送仍检查快照、历史和目标引用。
check_push() {
  local push_is_gitee=0 local_ref local_oid remote_ref remote_oid extra
  is_gitee_target "$1" "$2" && push_is_gitee=1
  while IFS=' ' read -r local_ref local_oid remote_ref remote_oid extra; do
    [[ -z "$local_ref" && -z "$local_oid" ]] && continue
    [[ -n "$remote_ref" && -n "$remote_oid" && -z "$extra" ]] || fail 'pre-push 引用输入无效。'
    if [[ "$local_ref" == '(delete)' && -n "$local_oid" && -z "${local_oid//0/}" ]]; then
      log "通过检查：允许删除远端引用 $remote_ref。"
      continue
    fi
    if [[ "$push_is_gitee" == 0 ]]; then
      [[ "$local_ref" != "refs/heads/$SNAPSHOT_BRANCH" ]] || fail "快照分支只供 $TARGET_REMOTE 推送；GitHub 请推 $SOURCE_BRANCH。"
      continue
    fi
    [[ "$ENABLED" == true ]] || fail 'Gitee 快照保护尚未启用，请运行本脚本 --install。'
    [[ "$local_ref" == "refs/heads/$SNAPSHOT_BRANCH" && "$remote_ref" == "refs/heads/$TARGET_BRANCH" && -n "${local_oid//0/}" ]] || fail "Gitee 普通推送只接受 $SNAPSHOT_BRANCH -> $TARGET_BRANCH；请取消其它分支与标签。"
    read_refs
    validate_snapshot_chain
    [[ -n "$SNAPSHOT_OID" && "$local_oid" == "$SNAPSHOT_OID" ]] || fail '待推送对象不是当前快照，请重新选择快照分支。'
    [[ "$(repo_git rev-parse "$SNAPSHOT_OID^{tree}")" == "$SOURCE_TREE" ]] || fail '快照尚未同步最新提交，请先手动运行本脚本。'
  done
}
# 安装逻辑由配套函数库执行，安装时不创建快照提交。
install_hooks() {
  [[ -f "$SCRIPT_DIR/gitee_snapshot_setup.zsh" ]] || fail '缺少配套安装函数库 gitee_snapshot_setup.zsh。'
  source "$SCRIPT_DIR/gitee_snapshot_setup.zsh" || fail '加载安装函数库失败。'
  jobs_install_gitee_snapshot "$PROJECT_ROOT"
}
# 分发独立入口和 Git 钩子，钩子只在指定源分支自动同步。
run_business() {
  case "$MODE" in
    check) [[ "$#" == 1 ]] || fail '--check 不接受其它参数。'; check_snapshot ;;
    install) [[ "$#" == 1 ]] || fail '--install 不接受其它参数。'; install_hooks ;;
    refresh) refresh_snapshot ;;
    hook)
      HOOK_NAME="${2:-}"
      case "$HOOK_NAME" in
        pre-push) [[ "$#" == 4 ]] || fail 'pre-push 缺少远端名称或 URL。'; check_push "$3" "$4" ;;
        post-commit|post-merge|post-rewrite)
          [[ "$ENABLED" == true ]] || return 0
          [[ "$(repo_git symbolic-ref --quiet --short HEAD 2>/dev/null)" == "$SOURCE_BRANCH" ]] || return 0
          refresh_snapshot ;;
        *) fail "不支持钩子：$HOOK_NAME" ;;
      esac ;;
  esac
}
# 依次展示用途、检查环境并执行指定业务。
main() {
  show_script_intro_and_wait "$@" # 首先展示内置自述，写操作等待回车确认。
  check_environment # 检查仓库及快照配置，失败立即停止。
  run_business "$@" # 按只读、安装、手动同步或 Git 钩子入口执行业务。
}

main "$@"
