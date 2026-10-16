#!/bin/zsh
# shell: zsh
# 脚本自述：
# - 脚本名称：CocoaPods 源自动选择。
# - 核心用途：同时测试 CDN 与 GitHub Specs 的真实 podspec，依据可用性和耗时选择本次 source。
# - 影响范围：仅发送只读网络请求、写临时探测文件及项目独立日志；不修改 Podfile、锁文件或全局代理。
# - 运行提示：Podfile 在解析依赖前通过 --podfile-hook 同步调用；独立运行先阅读自述并回车确认。

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
      intro_line title "$intro_row"
    else
      intro_line body "$intro_row"
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
  print -n -r -- '👉 已了解用途与影响，按回车开始；按 Ctrl+C 取消：' >&2
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
