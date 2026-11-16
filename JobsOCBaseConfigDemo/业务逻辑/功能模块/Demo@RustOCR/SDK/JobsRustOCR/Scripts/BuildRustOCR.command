#!/bin/zsh
# 用途：从本SDK随附Rust源码构建Apple OCR核心；第三方ORT使用锁定的官方发布。
# 影响：写SDK的Frameworks与.build-rust-ocr，首次下载Cargo依赖／ORT并准备Rust目标。
# 交互：默认回车确认；--yes／--non-interactive为显式自动化授权；Ctrl+C取消。
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
    jobs_style_original_rows=''
    jobs_style_applied_rows=''
    jobs_style_changed=0
    jobs_style_applied_complete=0
    jobs_style_query_active=0
    jobs_style_recovery=''
    jobs_style_exit_status=0
    jobs_style_esc=$(printf '\033')
    jobs_style_bel=$(printf '\007')
    # 完整颜色帧有界重发；设置核验与退出恢复容忍帧外回车和明确方向键。
    jobs_terminal_style_query() {
        jobs_style_query_key=$1
        jobs_style_reply=''
        jobs_style_query_buffer=''
        jobs_style_query_target_reply=''
        jobs_style_query_target_normalized=''
        jobs_style_query_target_rgb=''
        jobs_style_query_st="${jobs_style_esc}\\"
        jobs_style_query_stale_count=0
        jobs_style_query_phase=${2:-strict}
        jobs_style_query_cr=$(printf '\r')
        jobs_style_query_lf=$(printf '\n.')
        jobs_style_query_lf=${jobs_style_query_lf%.}
        jobs_style_query_failure='未收到目标颜色的完整答复（最多 3 次查询，每次约 2 秒）'
        for jobs_style_query_round in 1 2 3; do
            printf '\033]%s;?\007' "$jobs_style_query_key" > /dev/tty || {
                jobs_style_query_failure='无法向原终端发送配色查询'
                return 1
            }
            for jobs_style_attempt in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20; do
                # 哨兵保留末尾换行，不能把只有回车的键盘输入误当成无答复。
                jobs_style_piece=$(dd bs=256 count=1 2>/dev/null < /dev/tty; printf '.')
                jobs_style_piece=${jobs_style_piece%.}
                jobs_style_query_buffer=$jobs_style_query_buffer$jobs_style_piece
                while [ -n "$jobs_style_query_buffer" ]; do
                    # 设置核验与退出恢复阶段允许帧外的明确控制键，普通文字仍然失败。
                    if [ "$jobs_style_query_phase" = cleanup ] || [ "$jobs_style_query_phase" = applied ]; then
                        jobs_style_query_control_sequence=''
                        jobs_style_query_control_partial=0
                        case $jobs_style_query_buffer in
                            "$jobs_style_query_cr"*) jobs_style_query_control_sequence=$jobs_style_query_cr ;;
                            "$jobs_style_query_lf"*) jobs_style_query_control_sequence=$jobs_style_query_lf ;;
                        esac
                        if [ -z "$jobs_style_query_control_sequence" ]; then
                            for jobs_style_query_direction in A B C D; do
                                for jobs_style_query_control_candidate in \
                                    "${jobs_style_esc}[${jobs_style_query_direction}" \
                                    "${jobs_style_esc}O${jobs_style_query_direction}" \
                                    "${jobs_style_esc}[1;2${jobs_style_query_direction}" \
                                    "${jobs_style_esc}[1;3${jobs_style_query_direction}" \
                                    "${jobs_style_esc}[1;4${jobs_style_query_direction}" \
                                    "${jobs_style_esc}[1;5${jobs_style_query_direction}" \
                                    "${jobs_style_esc}[1;6${jobs_style_query_direction}" \
                                    "${jobs_style_esc}[1;7${jobs_style_query_direction}" \
                                    "${jobs_style_esc}[1;8${jobs_style_query_direction}"; do
                                    case $jobs_style_query_buffer in
                                        "$jobs_style_query_control_candidate"*)
                                            jobs_style_query_control_sequence=$jobs_style_query_control_candidate
                                            break 2
                                            ;;
                                    esac
                                    case $jobs_style_query_control_candidate in
                                        "$jobs_style_query_buffer"*) jobs_style_query_control_partial=1 ;;
                                    esac
                                done
                            done
                        fi
                        if [ -n "$jobs_style_query_control_sequence" ]; then
                            jobs_style_phase_control_keys=$(( ${jobs_style_phase_control_keys:-0} + 1 ))
                            if [ "$jobs_style_phase_control_keys" -gt 64 ]; then
                                jobs_style_query_failure='本阶段已识别控制键超过 64 个，已停止自动恢复'
                                return 1
                            fi
                            jobs_style_query_buffer=${jobs_style_query_buffer#"$jobs_style_query_control_sequence"}
                            continue
                        fi
                        if [ "$jobs_style_query_control_partial" = 1 ]; then
                            break
                        fi
                    fi
                    case $jobs_style_query_buffer in
                        "$jobs_style_esc"|"$jobs_style_esc]") break ;;
                        "$jobs_style_esc]"*) ;;
                        *) jobs_style_query_failure='收到非配色查询输入，已停止读取'; return 1 ;;
                    esac
                    jobs_style_query_head=''
                    jobs_style_query_terminator=''
                    case $jobs_style_query_buffer in
                        *"$jobs_style_bel"*)
                            jobs_style_query_head=${jobs_style_query_buffer%%"$jobs_style_bel"*}
                            jobs_style_query_terminator=$jobs_style_bel
                            ;;
                    esac
                    case $jobs_style_query_buffer in
                        *"$jobs_style_query_st"*)
                            jobs_style_query_st_head=${jobs_style_query_buffer%%"$jobs_style_query_st"*}
                            if [ -z "$jobs_style_query_terminator" ] ||
                               [ "${#jobs_style_query_st_head}" -lt "${#jobs_style_query_head}" ]; then
                                jobs_style_query_head=$jobs_style_query_st_head
                                jobs_style_query_terminator=$jobs_style_query_st
                            fi
                            ;;
                    esac
                    [ -n "$jobs_style_query_terminator" ] || break
                    jobs_style_query_frame=$jobs_style_query_head$jobs_style_query_terminator
                    jobs_style_query_buffer=${jobs_style_query_buffer#"$jobs_style_query_frame"}
                    jobs_style_query_body=${jobs_style_query_head#"$jobs_style_esc]"}
                    case $jobs_style_query_body in
                        *';rgb:'*) ;;
                        *) jobs_style_query_failure='配色答复格式或 RGB 数据无效'; return 1 ;;
                    esac
                    jobs_style_query_frame_key=${jobs_style_query_body%%';rgb:'*}
                    case $jobs_style_query_frame_key in
                        10|11|12|'4;'[0-9]|'4;1'[0-5]) ;;
                        *) jobs_style_query_failure='收到不属于本次颜色协议的答复'; return 1 ;;
                    esac
                    jobs_style_query_frame_rgb=${jobs_style_query_body#"$jobs_style_query_frame_key;rgb:"}
                    jobs_style_query_frame_normalized=$(printf '%s\n' "$jobs_style_query_frame_rgb" | LC_ALL=C awk -F/ '
                        BEGIN { valid = 1 }
                        NR != 1 || NF != 3 { valid = 0; exit }
                        {
                            for (i = 1; i <= 3; i++) {
                                h = tolower($i)
                                if (length(h) < 1 || length(h) > 4 || h ~ /[^0-9a-f]/) {
                                    valid = 0
                                    exit
                                }
                                n = 0
                                for (j = 1; j <= length(h); j++) n = n * 16 + index("0123456789abcdef", substr(h, j, 1)) - 1
                                value[i] = int(n * 65535 / (16 ^ length(h) - 1) + 0.5)
                            }
                        }
                        END {
                            if (!valid || NR != 1) exit 1
                            printf "%d/%d/%d", value[1], value[2], value[3]
                        }
                    ')
                    if [ -z "$jobs_style_query_frame_normalized" ]; then
                        jobs_style_query_failure='配色答复格式或 RGB 数据无效'
                        return 1
                    fi
                    if [ "$jobs_style_query_frame_key" = "$jobs_style_query_key" ]; then
                        if [ -n "$jobs_style_query_target_reply" ] &&
                           [ "$jobs_style_query_target_normalized" != "$jobs_style_query_frame_normalized" ]; then
                            jobs_style_query_failure='同一颜色的重复答复不一致，已停止自动恢复'
                            return 1
                        fi
                        jobs_style_query_target_reply=$jobs_style_query_frame
                        jobs_style_query_target_normalized=$jobs_style_query_frame_normalized
                        jobs_style_query_target_rgb=$jobs_style_query_frame_rgb
                    else
                        jobs_style_query_stale_count=$((jobs_style_query_stale_count + 1))
                        if [ "$jobs_style_query_stale_count" -gt 128 ]; then
                            jobs_style_query_failure='收到过多旧颜色答复，已停止读取'
                            return 1
                        fi
                    fi
                done
                if [ -n "$jobs_style_query_target_reply" ] && [ -z "$jobs_style_query_buffer" ]; then
                    jobs_style_reply=$jobs_style_query_target_reply
                    jobs_style_normalized=$jobs_style_query_target_normalized
                    jobs_style_rgb=$jobs_style_query_target_rgb
                    return 0
                fi
            done
            # 残缺帧不能通过重发拼成另一个答复，更不能被当成键盘空输入。
            if [ -n "$jobs_style_query_buffer" ]; then
                jobs_style_query_failure='配色答复帧不完整，已停止自动恢复'
                return 1
            fi
        done
        return 1
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
    # 核验中断时重新读取当前值，只撤回仍等于本轮目标值的颜色。
    jobs_terminal_style_rollback() {
        jobs_style_rollback_issue='无法读取或设置原终端输入模式'
        jobs_style_rollback_safe=''
        jobs_style_rollback_conflicts=''
        jobs_style_phase_control_keys=0
        jobs_style_stty=$(stty -g 2>/dev/null < /dev/tty) || jobs_style_stty=''
        if [ -n "$jobs_style_stty" ] && stty -echo -icanon min 0 time 1 2>/dev/null < /dev/tty; then
            jobs_style_query_active=1
            jobs_style_rollback_ok=1
            while IFS='|' read -r jobs_style_key jobs_style_original_normalized jobs_style_original; do
                [ -n "$jobs_style_key" ] || continue
                if ! jobs_terminal_style_query "$jobs_style_key" cleanup; then
                    jobs_style_rollback_ok=0
                    jobs_style_rollback_issue="回退颜色项 $jobs_style_key：$jobs_style_query_failure"
                    break
                fi
                if [ "$jobs_style_normalized" = "$jobs_style_original_normalized" ]; then
                    continue
                elif jobs_terminal_style_accepts_target "$jobs_style_key"; then
                    jobs_style_rollback_safe=$jobs_style_rollback_safe$jobs_style_original
                else
                    jobs_style_rollback_conflicts="$jobs_style_rollback_conflicts $jobs_style_key"
                fi
            done <<JOBS_STYLE_ROLLBACK
$jobs_style_original_rows
JOBS_STYLE_ROLLBACK
            stty "$jobs_style_stty" 2>/dev/null < /dev/tty || { jobs_style_rollback_ok=0; jobs_style_rollback_issue='无法恢复原终端输入模式'; }
            jobs_style_query_active=0
            if [ "$jobs_style_rollback_ok" = 1 ] && printf '%s\033[0m' "$jobs_style_rollback_safe" > /dev/tty; then
                if [ -z "$jobs_style_rollback_conflicts" ]; then
                    rm -f "$jobs_style_recovery"
                    rmdir "${jobs_style_recovery%/*}" 2>/dev/null || :
                    return 0
                fi
                printf '检测到运行期间的配色变更，已保留这些项：%s\n' "$jobs_style_rollback_conflicts" >&2
                jobs_style_rollback_issue="核验中断后检测到其它配色变更：$jobs_style_rollback_conflicts"
            fi
        fi
        printf '终端配色未能安全自动恢复（%s）；确认覆盖当前配色后可运行：sh "%s"\n' "$jobs_style_rollback_issue" "$jobs_style_recovery" >&2
        return 1
    }
    # 检测到后续改色时只恢复仍由本次保护持有的项，保留独立恢复入口。
    jobs_terminal_style_cleanup() {
        jobs_style_result=$1
        trap '' HUP INT TERM
        if [ "$jobs_style_query_active" = 1 ]; then
            stty "$jobs_style_stty" 2>/dev/null < /dev/tty || :
            jobs_style_query_active=0
        fi
        if [ "$jobs_style_changed" = 1 ] && [ "$jobs_style_applied_complete" != 1 ]; then
            if jobs_terminal_style_rollback; then
                jobs_style_changed=0
            else
                [ "$jobs_style_result" -ne 0 ] || jobs_style_result=1
            fi
            if [ "${2:-}" = continue ]; then
                jobs_style_cleanup_status=$jobs_style_result
                return 0
            fi
            exit "$jobs_style_result"
        fi
        if [ "$jobs_style_changed" = 1 ]; then
            jobs_style_cleanup_ok=0
            jobs_style_cleanup_issue='无法读取或设置原终端输入模式，或临时配色未完成核验'
            jobs_style_conflicts=''
            jobs_style_restore_safe=''
            jobs_style_phase_control_keys=0
            if [ "$jobs_style_applied_complete" = 1 ]; then
                jobs_style_stty=$(stty -g 2>/dev/null < /dev/tty) || jobs_style_stty=''
                if [ -n "$jobs_style_stty" ] && stty -echo -icanon min 0 time 1 2>/dev/null < /dev/tty; then
                    jobs_style_query_active=1
                    jobs_style_cleanup_ok=1
                    while IFS='|' read -r jobs_style_key jobs_style_expected jobs_style_original; do
                        [ -n "$jobs_style_key" ] || continue
                        if ! jobs_terminal_style_query "$jobs_style_key" cleanup; then
                            jobs_style_cleanup_ok=0
                            jobs_style_cleanup_issue="颜色项 $jobs_style_key：$jobs_style_query_failure"
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
                    stty "$jobs_style_stty" 2>/dev/null < /dev/tty || { jobs_style_cleanup_ok=0; jobs_style_cleanup_issue='无法恢复原终端输入模式'; }
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
                printf '终端配色未能安全自动恢复（%s）；确认覆盖当前配色后可运行：sh "%s"\n' "$jobs_style_cleanup_issue" "$jobs_style_recovery" >&2
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
    trap 'jobs_style_exit_status=129; jobs_terminal_style_cleanup 129 continue; jobs_style_changed=0; exit 129' HUP
    trap 'jobs_style_exit_status=130; jobs_terminal_style_cleanup 130 continue; jobs_style_changed=0; exit 130' INT
    trap 'jobs_style_exit_status=143; jobs_terminal_style_cleanup 143 continue; jobs_style_changed=0; exit 143' TERM
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
        jobs_style_original_rows="$jobs_style_original_rows$jobs_style_key|$jobs_style_normalized|$jobs_style_reply
"
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
    jobs_style_phase_control_keys=0
    while IFS='|' read -r jobs_style_key jobs_style_original; do
        [ -n "$jobs_style_key" ] || continue
        if ! jobs_terminal_style_query "$jobs_style_key" applied; then
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
        printf '临时配色核验失败（颜色项 %s：%s），正在核对原色恢复。\n' "$jobs_style_key" "$jobs_style_query_failure" >&2
        jobs_terminal_style_cleanup 0 continue
        jobs_style_changed=0
        if [ "$jobs_style_cleanup_status" != 0 ]; then
            jobs_style_exit_status=1
            exit 1
        fi
        trap 'jobs_style_exit_status=129; jobs_terminal_style_cleanup 129 continue; jobs_style_changed=0; exit 129' HUP
        trap 'jobs_style_exit_status=130; jobs_terminal_style_cleanup 130 continue; jobs_style_changed=0; exit 130' INT
        trap 'jobs_style_exit_status=143; jobs_terminal_style_cleanup 143 continue; jobs_style_changed=0; exit 143' TERM
        printf '%s\n' '已恢复原配色并使用纯文本。' >&2
        jobs_terminal_style_plain "$@"
    fi
    if [ "$jobs_style_targets_ok" != 1 ]; then
        jobs_terminal_style_cleanup 0 continue
        jobs_style_changed=0
        if [ "$jobs_style_cleanup_status" != 0 ]; then
            jobs_style_exit_status=1
            exit 1
        fi
        trap 'jobs_style_exit_status=129; jobs_terminal_style_cleanup 129 continue; jobs_style_changed=0; exit 129' HUP
        trap 'jobs_style_exit_status=130; jobs_terminal_style_cleanup 130 continue; jobs_style_changed=0; exit 130' INT
        trap 'jobs_style_exit_status=143; jobs_terminal_style_cleanup 143 continue; jobs_style_changed=0; exit 143' TERM
        printf '%s\n' '终端未接受本次配色，已恢复原配色并使用纯文本。' >&2
        jobs_terminal_style_plain "$@"
    fi
    jobs_style_applied_complete=1
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

ENTRY_PATH="${0:A}"
SDK_ROOT=""
SOURCE_ROOT=""
CACHE_ROOT=""
ORT_ARCHIVE=""
ORT_ROOT=""
LOG_FILE=""
STAGING_ROOT=""
LOCK_DIR=""
LOCK_HELD=0
ASSUME_YES=0
CHECK_ONLY=0
OFFLINE=0
ARM64_ONLY=0
FORCE_BUILD=0
HELP_ONLY=0
USE_COLOR=0
CARGO_BIN=""
RUSTUP_BIN=""
INPUT_SHA=""
ORT_VERSION="1.24.2"
ORT_URL="https://download.onnxruntime.ai/pod-archive-onnxruntime-c-1.24.2.zip"
ORT_SHA="f7100a992d2a8135168c8afd831e6a58b465349101982aa58b3e11d36e600b54"
typeset -a BUILD_TARGETS

show_intro_and_authorize() {
    local argument
    for argument in "$@"; do
        case "$argument" in
            --yes|--non-interactive) ASSUME_YES=1 ;;
            --check-only) CHECK_ONLY=1 ;;
            --offline) OFFLINE=1 ;;
            --arm64-only) ARM64_ONLY=1 ;;
            --force) FORCE_BUILD=1 ;;
            --help|-h) HELP_ONLY=1 ;;
            *) printf '未知参数：%s\n' "$argument" >&2; return 2 ;;
        esac
    done
    if (( HELP_ONLY )); then
        printf '%s\n' '用法：/bin/zsh Scripts/BuildRustOCR.command [--yes] [--check-only] [--offline] [--arm64-only] [--force]'
        printf '%s\n' '默认五目标；--arm64-only仅三个ARM64平台slice；--check-only不下载、不安装、不构建。'
        printf '%s\n' '缓存：JOBS_OCR_CACHE_DIR；可复用JOBS_OCR_ORT_ARCHIVE与JOBS_OCR_CARGO_TARGET_DIR。'
        return 10
    fi
    if [[ -t 1 && -n "${TERM:-}" && "${TERM:-}" != dumb && -z "${NO_COLOR+x}" ]]; then
        USE_COLOR=1
        printf '\033[1;31m%s\033[0m\n' 'Rust OCR 源码构建'
    else
        printf '%s\n' 'Rust OCR 源码构建'
    fi
    printf '%s\n' '用途：编译随SDK提供的Rust源码，生成当前SDK的Frameworks/JobsOCRCore.xcframework。'
    printf '%s\n' '影响：写本SDK缓存与生成库；首次使用下载锁定的Cargo依赖和官方ORT，缺少的Rust目标通过rustup准备。'
    printf '%s\n' '已有库先保留备份；不安装Pod、不改系统代理、不改Git索引或历史。日志在确认后显示。'
    (( ASSUME_YES )) && return 0
    [[ -t 0 && -t 1 ]] || { printf '%s\n' '无人值守运行必须显式传 --yes 或 --non-interactive。' >&2; return 2; }
    local answer=""
    if (( USE_COLOR )); then
        printf '\033[1;32m%s\033[0m\033[1;31m%s\033[0m' '按回车继续；' '输入任意字符后回车取消：'
    else
        printf '%s' '按回车继续；输入任意字符后回车取消：'
    fi
    IFS= read -r answer || return 130
    [[ -z "$answer" ]] || return 10
}

initialize_runtime() {
    setopt NO_NOMATCH PIPE_FAIL
    SDK_ROOT="${ENTRY_PATH:h:h}"
    SOURCE_ROOT="$SDK_ROOT/Source/JobsOCR"
    CACHE_ROOT="${JOBS_OCR_CACHE_DIR:-$SDK_ROOT/.build-rust-ocr}"
    [[ "$CACHE_ROOT" == /* ]] || CACHE_ROOT="$SDK_ROOT/$CACHE_ROOT"
    [[ ! -L "$CACHE_ROOT" && ! -L "$SDK_ROOT/Frameworks" ]] || return 1
    LOG_FILE="$(umask 077; mktemp "${TMPDIR:-/tmp}/JobsOCR-SourceBuild.XXXXXXXX")" || return 1
    trap 'exit 130' INT
    trap 'exit 143' TERM
    BUILD_TARGETS=(aarch64-apple-darwin aarch64-apple-ios aarch64-apple-ios-sim)
    (( ARM64_ONLY )) || BUILD_TARGETS+=(x86_64-apple-darwin x86_64-apple-ios)
    log_message INFO "SDK：$SDK_ROOT"
    log_message INFO "源码：$SOURCE_ROOT"
    log_message INFO "缓存：$CACHE_ROOT；日志：$LOG_FILE"
}

log_message() {
    printf '[%s] %s\n' "$1" "$2" | tee -a "$LOG_FILE"
}

fail() {
    log_message ERROR "$*" >&2
    return 1
}

run_logged() {
    local -a stage_codes
    "$@" 2>&1 | tee -a "$LOG_FILE"
    stage_codes=("${pipestatus[@]}")
    (( stage_codes[1] == 0 )) || return "${stage_codes[1]}"
    (( stage_codes[2] == 0 )) || return "${stage_codes[2]}"
}

sha256_of() {
    local digest
    digest="$(/usr/bin/shasum -a 256 -- "$1")" || return 1
    print -r -- "${digest%% *}"
}

show_source() {
    log_message INFO "来源｜$1"
    if (( USE_COLOR )); then
        printf '\033[32;4m%s\033[0m\n' "$2"
        printf '%s\n' "$2" >> "$LOG_FILE"
    else
        log_message INFO "$2"
    fi
}

verify_inputs() {
    [[ "$(uname -s)" == Darwin ]] || { fail 'Apple构建仅支持MacOS。'; return 1; }
    local tool
    for tool in xcrun xcodebuild curl shasum plutil ditto; do
        command -v "$tool" >/dev/null || { fail "缺少工具：$tool"; return 1; }
    done
    xcrun --find libtool >/dev/null || return 1
    xcrun --sdk iphoneos --show-sdk-path >/dev/null || return 1
    xcrun --sdk iphonesimulator --show-sdk-path >/dev/null || return 1
    CARGO_BIN="$(command -v cargo)"
    [[ -n "$CARGO_BIN" ]] || CARGO_BIN="${CARGO_HOME:-$HOME/.cargo}/bin/cargo"
    RUSTUP_BIN="$(command -v rustup)"
    [[ -n "$RUSTUP_BIN" ]] || RUSTUP_BIN="${CARGO_HOME:-$HOME/.cargo}/bin/rustup"
    [[ -x "$CARGO_BIN" && -x "$RUSTUP_BIN" ]] || { fail '需要Rust 1.92或更新版本及rustup，请先从https://rustup.rs准备工具链。'; return 1; }
    run_logged "$CARGO_BIN" --version || return 1
    [[ -f "$SOURCE_ROOT/Cargo.toml" && -f "$SOURCE_ROOT/Cargo.lock" && -f "$SOURCE_ROOT/src/lib.rs" && -f "$SOURCE_ROOT/include/JobsOCRCore.h" ]] || { fail 'Source/JobsOCR源码包不完整。'; return 1; }
    [[ -f "$SOURCE_ROOT/tests/core_contract.rs" && -f "$SOURCE_ROOT/tests/layout_contract.rs" && -f "$SOURCE_ROOT/tests/lm_contract.rs" ]] || { fail '源码包缺少可独立运行的测试。'; return 1; }
    local target installed
    installed="$("$RUSTUP_BIN" target list --installed)" || return 1
    for target in "${BUILD_TARGETS[@]}"; do
        if ! print -r -- "$installed" | /usr/bin/grep -Fxq -- "$target"; then
            if (( OFFLINE || CHECK_ONLY )); then
                fail "缺少Rust目标：$target；运行 rustup target add $target 后重试。"
                return 1
            fi
            show_source "Rust目标 $target（rustup当前工具链）" 'https://static.rust-lang.org' || return 1
            run_logged "$RUSTUP_BIN" target add "$target" || return 1
        fi
    done
    log_message SUCCESS "源码、工具链及目标检查通过：${(j:, :)BUILD_TARGETS}"
}

acquire_lock() {
    mkdir -p "$CACHE_ROOT" || return 1
    LOCK_DIR="$CACHE_ROOT/Build.lock"
    mkdir "$LOCK_DIR" 2>/dev/null || { fail "构建锁已存在，保留并停止：$LOCK_DIR"; return 1; }
    print -r -- "$$" > "$LOCK_DIR/owner" || return 1
    LOCK_HELD=1
    STAGING_ROOT="$(mktemp -d "$CACHE_ROOT/staging.XXXXXXXX")" || return 1
}

prepare_runtime() {
    ORT_ARCHIVE="${JOBS_OCR_ORT_ARCHIVE:-$CACHE_ROOT/pod-archive-onnxruntime-c-$ORT_VERSION.zip}"
    [[ "$ORT_ARCHIVE" == /* ]] || ORT_ARCHIVE="$SDK_ROOT/$ORT_ARCHIVE"
    if [[ ! -f "$ORT_ARCHIVE" ]]; then
        (( ! OFFLINE )) || { fail "离线模式缺少ORT原始ZIP：$ORT_ARCHIVE"; return 1; }
        [[ -z "${JOBS_OCR_ORT_ARCHIVE:-}" ]] || { fail "指定的ORT ZIP不存在：$ORT_ARCHIVE"; return 1; }
        show_source "Microsoft ONNX Runtime $ORT_VERSION（官方第三方二进制依赖）" "$ORT_URL" || return 1
        local download="$STAGING_ROOT/onnxruntime.partial"
        run_logged curl --fail --location --retry 2 --connect-timeout 15 --max-time 600 "$ORT_URL" -o "$download" || return 1
        [[ "$(sha256_of "$download")" == "$ORT_SHA" ]] || { fail '下载的ORT ZIP SHA256不符；保留下载证据，不解包。'; return 1; }
        mv "$download" "$ORT_ARCHIVE" || return 1
    fi
    [[ ! -L "$ORT_ARCHIVE" && "$(sha256_of "$ORT_ARCHIVE")" == "$ORT_SHA" ]] || { fail "ORT原始ZIP SHA256不符：$ORT_ARCHIVE"; return 1; }
    ORT_ROOT="$STAGING_ROOT/onnxruntime"
    mkdir "$ORT_ROOT" || return 1
    run_logged ditto -x -k "$ORT_ARCHIVE" "$ORT_ROOT" || return 1
    [[ -f "$ORT_ROOT/LICENSE" && -d "$ORT_ROOT/Headers" ]] || { fail '已校验ORT归档布局不符合预期。'; return 1; }
    log_message SUCCESS "已校验官方ORT $ORT_VERSION SHA256：$ORT_SHA"
}

calculate_input_sha() {
    local item digest digest_file="$STAGING_ROOT/Source.sha256"
    : > "$digest_file" || return 1
    for item in "$SOURCE_ROOT"/*(.N) "$SOURCE_ROOT"/src/**/*(.N) "$SOURCE_ROOT"/include/**/*(.N) "$SOURCE_ROOT"/tests/**/*(.N) "$SOURCE_ROOT"/.cargo/**/*(.DN); do
        digest="$(sha256_of "$item")" || return 1
        printf '%s  %s\n' "$digest" "${item#$SOURCE_ROOT/}" >> "$digest_file" || return 1
    done
    printf '%s  builder\n%s  ort\n%s  targets\n' "$(sha256_of "$ENTRY_PATH")" "$ORT_SHA" "${(j:,:)BUILD_TARGETS}" >> "$digest_file" || return 1
    INPUT_SHA="$(sha256_of "$digest_file")" || return 1
}

verify_generated_framework() {
    local framework="$1" platform expected arch library
    [[ -f "$framework/Info.plist" ]] || return 1
    for platform in ios-arm64 ios-arm64_x86_64-simulator macos-arm64_x86_64; do
        if (( ARM64_ONLY )); then
            [[ "$platform" == ios-arm64_x86_64-simulator ]] && platform=ios-arm64-simulator
            [[ "$platform" == macos-arm64_x86_64 ]] && platform=macos-arm64
        fi
        library="$framework/$platform/libJobsOCRCore.a"
        [[ -f "$library" && -f "$framework/$platform/Headers/JobsOCRCore.h" ]] || return 1
        xcrun lipo -verify_arch arm64 "$library" >/dev/null || return 1
        if (( ! ARM64_ONLY )) && [[ "$platform" != ios-arm64 ]]; then
            xcrun lipo -verify_arch x86_64 "$library" >/dev/null || return 1
        fi
    done
}

is_current() {
    (( ! FORCE_BUILD )) || return 1
    local receipt="$SDK_ROOT/Frameworks/.JobsOCRCore-build.sha256"
    [[ -f "$receipt" && "$(head -n 1 "$receipt")" == "$INPUT_SHA" ]] || return 1
    verify_generated_framework "$SDK_ROOT/Frameworks/JobsOCRCore.xcframework" || return 1
    make_receipt "$SDK_ROOT/Frameworks/JobsOCRCore.xcframework" "$STAGING_ROOT/CurrentReceipt.sha256" || return 1
    /usr/bin/cmp -s "$receipt" "$STAGING_ROOT/CurrentReceipt.sha256" || return 1
    log_message SUCCESS '源码和生成库摘要未变化，复用本地编译结果。'
}

make_receipt() {
    local framework="$1" receipt="$2" item digest
    print -r -- "$INPUT_SHA" > "$receipt" || return 1
    for item in "$framework"/**/*(.N); do
        digest="$(sha256_of "$item")" || return 1
        printf '%s  JobsOCRCore.xcframework/%s\n' "$digest" "${item#$framework/}" >> "$receipt" || return 1
    done
}

verify_source_unchanged() {
    local initial_sha="$INPUT_SHA"
    calculate_input_sha || return 1
    [[ "$initial_sha" == "$INPUT_SHA" ]] || { fail '编译期间源码或构建器发生变化；保留现场，不发布混合产物。'; return 1; }
}

build_rust_targets() {
    local triple target_cache="${JOBS_OCR_CARGO_TARGET_DIR:-$CACHE_ROOT/cargo}"
    [[ "$target_cache" == /* ]] || target_cache="$SDK_ROOT/$target_cache"
    local -a cargo_flags=(--locked)
    (( OFFLINE )) && cargo_flags+=(--offline)
    for triple in "${BUILD_TARGETS[@]}"; do
        log_message INFO "编译Jobs Rust源码：$triple"
        run_logged env CARGO_PROFILE_RELEASE_STRIP=false "$CARGO_BIN" build "${cargo_flags[@]}" --manifest-path "$SOURCE_ROOT/Cargo.toml" --target-dir "$target_cache" --release --lib --target "$triple" || return 1
    done
}

thin_archive() {
    local input="$1" architecture="$2" output="$3" architectures
    architectures="$(xcrun lipo -archs "$input")" || return 1
    xcrun lipo -verify_arch "$architecture" "$input" || return 1
    if [[ "$architectures" == "$architecture" ]]; then
        cp "$input" "$output" || return 1
    else
        run_logged xcrun lipo "$input" -thin "$architecture" -output "$output" || return 1
    fi
}

merge_target() {
    local triple="$1" platform="$2" architecture="$3" runtime="$4"
    local target_cache="${JOBS_OCR_CARGO_TARGET_DIR:-$CACHE_ROOT/cargo}"
    [[ "$target_cache" == /* ]] || target_cache="$SDK_ROOT/$target_cache"
    local archive="$target_cache/$triple/release/libjobs_ocr.a" before
    before="$(sha256_of "$archive")" || return 1
    thin_archive "$archive" "$architecture" "$STAGING_ROOT/Thin/rust-$platform-$architecture.a" || return 1
    thin_archive "$runtime" "$architecture" "$STAGING_ROOT/Thin/ort-$platform-$architecture.a" || return 1
    run_logged xcrun libtool -static -o "$STAGING_ROOT/Merged/$platform-$architecture.a" "$STAGING_ROOT/Thin/rust-$platform-$architecture.a" "$STAGING_ROOT/Thin/ort-$platform-$architecture.a" || return 1
    [[ "$before" == "$(sha256_of "$archive")" ]] || { fail "Rust归档在合并时被并发修改：$triple"; return 1; }
}

assemble_framework() {
    mkdir -p "$STAGING_ROOT/Thin" "$STAGING_ROOT/Merged" "$STAGING_ROOT/Headers" "$STAGING_ROOT/Libraries/macos" "$STAGING_ROOT/Libraries/ios" "$STAGING_ROOT/Libraries/simulator" || return 1
    ditto "$ORT_ROOT/Headers" "$STAGING_ROOT/Headers" || return 1
    cp "$SOURCE_ROOT/include/JobsOCRCore.h" "$STAGING_ROOT/Headers/JobsOCRCore.h" || return 1
    local xcf="$ORT_ROOT/onnxruntime.xcframework"
    merge_target aarch64-apple-darwin macos arm64 "$xcf/macos-arm64_x86_64/onnxruntime.framework/Versions/A/onnxruntime" || return 1
    merge_target aarch64-apple-ios ios arm64 "$xcf/ios-arm64/onnxruntime.framework/onnxruntime" || return 1
    merge_target aarch64-apple-ios-sim simulator arm64 "$xcf/ios-arm64_x86_64-simulator/onnxruntime.framework/onnxruntime" || return 1
    if (( ARM64_ONLY )); then
        cp "$STAGING_ROOT/Merged/macos-arm64.a" "$STAGING_ROOT/Libraries/macos/libJobsOCRCore.a" || return 1
        cp "$STAGING_ROOT/Merged/simulator-arm64.a" "$STAGING_ROOT/Libraries/simulator/libJobsOCRCore.a" || return 1
    else
        merge_target x86_64-apple-darwin macos x86_64 "$xcf/macos-arm64_x86_64/onnxruntime.framework/Versions/A/onnxruntime" || return 1
        merge_target x86_64-apple-ios simulator x86_64 "$xcf/ios-arm64_x86_64-simulator/onnxruntime.framework/onnxruntime" || return 1
        run_logged xcrun lipo -create "$STAGING_ROOT/Merged/macos-arm64.a" "$STAGING_ROOT/Merged/macos-x86_64.a" -output "$STAGING_ROOT/Libraries/macos/libJobsOCRCore.a" || return 1
        run_logged xcrun lipo -create "$STAGING_ROOT/Merged/simulator-arm64.a" "$STAGING_ROOT/Merged/simulator-x86_64.a" -output "$STAGING_ROOT/Libraries/simulator/libJobsOCRCore.a" || return 1
    fi
    cp "$STAGING_ROOT/Merged/ios-arm64.a" "$STAGING_ROOT/Libraries/ios/libJobsOCRCore.a" || return 1
    run_logged xcodebuild -create-xcframework -library "$STAGING_ROOT/Libraries/macos/libJobsOCRCore.a" -headers "$STAGING_ROOT/Headers" -library "$STAGING_ROOT/Libraries/ios/libJobsOCRCore.a" -headers "$STAGING_ROOT/Headers" -library "$STAGING_ROOT/Libraries/simulator/libJobsOCRCore.a" -headers "$STAGING_ROOT/Headers" -output "$STAGING_ROOT/JobsOCRCore.xcframework" || return 1
    verify_generated_framework "$STAGING_ROOT/JobsOCRCore.xcframework" || { fail '新生成XCFramework平台／头文件／架构检查失败。'; return 1; }
}

publish_framework() {
    local destination="$SDK_ROOT/Frameworks/JobsOCRCore.xcframework" backup="" item relative
    mkdir -p "$SDK_ROOT/Frameworks" || return 1
    [[ ! -L "$destination" ]] || { fail '生成目标不能为符号链接。'; return 1; }
    if [[ -e "$destination" ]]; then
        backup="$CACHE_ROOT/JobsOCRCore.previous-$(date '+%Y.%m.%d-%H%M%S')-$$.xcframework"
        mv "$destination" "$backup" || return 1
        log_message INFO "原本地库保留：$backup"
    fi
    if ! mv "$STAGING_ROOT/JobsOCRCore.xcframework" "$destination"; then
        [[ -z "$backup" || -e "$destination" ]] || mv "$backup" "$destination"
        return 1
    fi
    make_receipt "$destination" "$STAGING_ROOT/Receipt.sha256" || return 1
    mv "$STAGING_ROOT/Receipt.sha256" "$SDK_ROOT/Frameworks/.JobsOCRCore-build.sha256" || return 1
    log_message SUCCESS "已从本地源码生成：$destination"
}

TRAPEXIT() {
    local result_code=$?
    (( ZSH_SUBSHELL == 0 )) || return "$result_code"
    if (( LOCK_HELD )) && [[ -f "$LOCK_DIR/owner" && "$(cat "$LOCK_DIR/owner")" == "$$" ]]; then
        /bin/rm "$LOCK_DIR/owner"
        /bin/rmdir "$LOCK_DIR" 2>/dev/null
    fi
    [[ -z "$LOG_FILE" ]] || printf '退出码：%s；日志：%s\n' "$result_code" "$LOG_FILE" >&2
    return "$result_code"
}

main() {
    show_intro_and_authorize "$@" # 先自述并取得本次构建授权。
    local authorization_code=$?
    (( authorization_code == 10 )) && return 0
    (( authorization_code == 0 )) || return "$authorization_code"
    initialize_runtime || return 1 # 按脚本实际位置解析SDK及本次日志。
    verify_inputs || return 1 # 核对完整源码、Apple工具及Rust目标。
    (( CHECK_ONLY )) && return 0
    acquire_lock || return 1 # 独占构建缓存并保留失败证据。
    calculate_input_sha || return 1 # 缓存同时绑定源码、构建器和目标集合。
    is_current && return 0
    prepare_runtime || return 1 # 校验或获取锁定的第三方ORT运行时。
    build_rust_targets || return 1 # 逐目标真实编译Jobs源码，失败立即停止。
    assemble_framework || return 1 # 组合各架构并核对XCFramework成员。
    verify_source_unchanged || return 1 # 防止多目标编译期间源码变化后发布混合版本。
    publish_framework || return 1 # 保留旧库后发布本地产物和摘要回执。
}

main "$@"
