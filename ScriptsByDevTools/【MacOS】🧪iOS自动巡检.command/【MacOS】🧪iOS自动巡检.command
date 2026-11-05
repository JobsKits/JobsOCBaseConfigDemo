#!/bin/zsh
# 脚本自述：
# - 脚本名称：【MacOS】🧪iOS自动巡检.command
# - 核心用途：在 iPhone 真机或 iOS 模拟器自动操作当前工程 App，保存异常线索。
# - 影响范围：只构建独立测试 Runner；会操作测试 App、改变其测试数据并生成报告。
# - 运行提示：先回车阅读确认，再选择平台、设备和强度；Ctrl+C 停止，结果保存在本包 Reports/。
# shell: zsh

typeset -g SCRIPT_PATH="$0" SCRIPT_DIR=""
typeset -g LOG_FILE=""
typeset -g RUN_DIR=""
typeset -g PLATFORM="" DEVICE="" PROFILE="" SEED="" STEPS="" SECONDS_LIMIT=""
typeset -g TEAM="" RUNNER_ID="" ALLOW_PROVISIONING=0
typeset -g TEAM_SOURCE="" SIGNING_MODE="" HOST_PROJECT="" HOST_TARGET="" HOST_ROOT=""
typeset -g TARGET_NAME="" PROJECT_ID="" BUNDLE_ID="" APP_PATH="" APP_READY=0
typeset -g CHECK_ONLY=0 FZF="" SELECTION="" CURRENT_BUNDLE=""
typeset -g FINAL_CODE=0 COVERAGE_RUNNER_STOP_BLOCKED=0
typeset -g TEST_PID="" DISPLAY_PID=""
typeset -g STARTUP_MONITOR_PID="" SIMULATOR_UI_PATH="" SIMULATOR_UI_KIND=""
typeset -g COVERAGE_TOOL="" COVERAGE_MANIFEST="" COVERAGE_DIGEST="" COVERAGE_MAP=""
typeset -g COVERAGE_PROJECT="" COVERAGE_EVENTS="" COVERAGE_FILTER="" COVERAGE_ATTEMPT_FOLDER=""
typeset -g RUNNER_START_TIMEOUT=180 RUNNER_HEARTBEAT_INTERVAL=30 RUNNER_MONITOR_INTERVAL=2 RUNNER_FINALIZATION_TIMEOUT=600

# 以红色标题和蓝色正文展示自述，普通管道保持纯文本。
intro_line() {
  if [[ -t 1 && -n "${TERM:-}" && "$TERM" != dumb && -z "${NO_COLOR+x}" ]]; then
    if [[ "$1" == title ]]; then
      printf '\033[1;31m%s\033[0m\n' "$2"
    else
      printf '\033[0;34m%s\033[0m\n' "$2"
    fi
  else
    print -r -- "$2"
  fi
}
# 首先说明实际操作范围；帮助只展示文本，其余入口先确认。
show_script_intro_and_wait() {
  intro_line title '🧪 iOS 自动巡检｜当前工程'
  intro_line body '• 支持 iPhone 真机与 iOS 模拟器；默认完整清单逐页面、流程和手势验证，补充探索另选。'
  intro_line body '• iPhone 的 Automation Running 系统浮层意为“自动化正在运行”；同时按住音量加、音量减键可停止。'
  intro_line body '• 先用 Xcode 在所选设备运行当前 App；真机自动读取工程签名配置，多个候选用菜单选择。'
  intro_line body '• 会操作手机上的测试 App、改变数据并可能触发网络请求；只使用测试账号和测试数据。'
  intro_line body '• 只构建本包 Runner；默认不更新 Apple 签名资产，不卸载 App 或清空设备。Ctrl+C 停止。'
  intro_line body '• 结果：本包 Reports/；会话日志：系统临时目录/iOS自动巡检.随机值/session.log。'
  if [[ "$#" == 1 && ( "$1" == --help || "$1" == -h ) ]]; then
    print -r -- '用法：双击本脚本，或 zsh 脚本路径 [参数]'
    print -r -- '参数：--check；--platform simulator|device；--device 模拟器UUID或真机UDID'
    print -r -- '      --profile coverage|quick|standard|stress；--seed 整数；--steps 1..10000；--seconds 30..7200'
    print -r -- '完整清单逐项执行；--seconds按单场景计，--steps仅用于补充探索。'
    print -r -- '真机：自动读取主 App 的 Debug 签名；高级覆盖 --team / --runner-id；--signing existing|automatic。'
    print -r -- '--allow-provisioning-updates 等同 --signing automatic，仍需默认取消菜单和空格授权。'
    print -r -- '默认：只测当前工程；交互选择平台/设备/完整清单或补充探索；--check 默认检查模拟器，可显式选device；种子为当前时间。'
    exit 0
  fi
  if [[ ! -t 0 ]]; then
    print -r -- '✖ 请在终端或双击运行；无交互输入时不会执行巡检。' >&2
    exit 2
  fi
  local confirmation=""
  IFS= read -r 'confirmation?回车继续；空格后回车取消（也可 Ctrl+C）：' || exit 130
  [[ -z "$confirmation" ]] || exit 130
}
# 确认后才初始化运行选项和本次私有日志。
initialize_runtime() {
  setopt NO_NOMATCH PIPE_FAIL
  export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  SCRIPT_PATH="${SCRIPT_PATH:A}"
  SCRIPT_DIR="${SCRIPT_PATH:h}"
  local log_dir
  log_dir="$(mktemp -d "${TMPDIR:-/tmp}/iOS自动巡检.XXXXXX")" || exit 1
  LOG_FILE="${log_dir}/session.log"
  : > "$LOG_FILE"
  trap 'stop_run 130' INT
  trap 'stop_run 143' TERM
  log "ℹ 会话日志：$LOG_FILE"
}
# 将普通状态同步写入终端和本次会话日志。
log() {
  print -r -- "$*" | tee -a "$LOG_FILE"
}
# 报出错误并保留明确的非零退出码。
die() {
  log "✖ $*"
  log "➤ 完整日志：$LOG_FILE"
  if [[ -n "$RUN_DIR" ]]; then
    print -r -- "失败：$*；本轮未完成。" >> "${RUN_DIR}/总览.txt"
    cp "$LOG_FILE" "${RUN_DIR}/session.log"
  fi
  exit 1
}
# 只终止本次启动的进程及其后代，不按进程名批量结束其它构建。
stop_process_tree() {
  local parent_pid="$1" child_pid
  [[ "$parent_pid" == <-> ]] || return 0
  local -a child_pids
  child_pids=("${(@f)$(/bin/ps -axo pid=,ppid= | /usr/bin/awk -v parent="$parent_pid" '$2 == parent {print $1}')}" )
  for child_pid in "${child_pids[@]}"; do
    [[ "$child_pid" == <-> ]] && stop_process_tree "$child_pid"
  done
  kill -TERM "$parent_pid" 2>/dev/null
  return 0
}
# 中止当前测试并保留已有证据，不清理用户 App 数据。
stop_run() {
  trap '' INT TERM
  [[ -z "$STARTUP_MONITOR_PID" ]] || stop_process_tree "$STARTUP_MONITOR_PID"
  [[ -z "$TEST_PID" ]] || stop_process_tree "$TEST_PID"
  [[ -z "$DISPLAY_PID" ]] || stop_process_tree "$DISPLAY_PID"
  if [[ -n "$CURRENT_BUNDLE" && -n "$DEVICE" ]]; then
    if [[ "$PLATFORM" == simulator ]]; then
      xcrun simctl terminate "$DEVICE" "$CURRENT_BUNDLE" >> "$LOG_FILE" 2>&1
      local runner_info="${RUN_DIR}/DerivedData/Build/Products/Debug-iphonesimulator/JobsCrashCrawler-Runner.app/Info.plist" runner_id
      if [[ -f "$runner_info" ]]; then
        runner_id="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "$runner_info")"
        [[ -z "$runner_id" ]] || xcrun simctl terminate "$DEVICE" "$runner_id" >> "$LOG_FILE" 2>&1
      fi
    else
      stop_device_runner
    fi
  fi
  log "⚠ 已中止。已有结果保留在：${RUN_DIR:-${LOG_FILE:h}}"
  if [[ -n "$RUN_DIR" ]]; then
    print -r -- '中止：本轮未完成，不能视为通过。' >> "${RUN_DIR}/总览.txt"
    local partial_log
    for partial_log in "${RUN_DIR}"/*/xcodebuild.log(N) "${RUN_DIR}"/CoverageAttempts/*/xcodebuild.log(N); do
      /usr/bin/sed -n 's/^.*JOBS_CRAWL_EVENT //p' "$partial_log" > "${partial_log:h}/events.jsonl"
    done
    cp "$LOG_FILE" "${RUN_DIR}/session.log"
  fi
  exit "$1"
}
# 只结束当前测试已报告的 Runner PID，不扫描或终止手机上的其它进程。
stop_device_runner() {
  local event_file="${LOG_FILE:h}/runner-started.json" runner_pid
  local active_log="${COVERAGE_ATTEMPT_FOLDER:-${RUN_DIR}/app}/xcodebuild.log"
  if [[ ! -f "$active_log" ]]; then
    log '⚠ 没有本批 Runner 日志，无法确认真机测试进程已经停止。'
    return 1
  fi
  /usr/bin/sed -n 's/^.*JOBS_CRAWL_EVENT //p' "$active_log" | /usr/bin/grep '"event":"started"' | /usr/bin/tail -n 1 > "$event_file"
  runner_pid="$(/usr/bin/plutil -extract runnerPID raw -o - "$event_file" 2>/dev/null)"
  if [[ "$runner_pid" != <-> ]] || (( runner_pid <= 0 )); then
    log '⚠ 本批没有有效的真机 Runner PID；无法确认测试进程已经停止，请在 Xcode 停止本轮测试。'
    return 1
  fi
  if ! xcrun devicectl device process terminate --device "$DEVICE" --pid "$runner_pid" --timeout 5 >> "$LOG_FILE" 2>&1; then
    log '⚠ 本批真机 Runner 未确认停止；不再启动后续批次，请在 Xcode 停止本轮测试后再使用手机。'
    return 1
  fi
  return 0
}
# 校验所有输入，防止把错误参数带入真实测试。
parse_arguments() {
  while (( $# )); do
    case "$1" in
      --check) CHECK_ONLY=1; shift ;;
      --allow-provisioning-updates) ALLOW_PROVISIONING=1; SIGNING_MODE=automatic; shift ;;
      --platform|--device|--profile|--seed|--steps|--seconds|--team|--runner-id|--signing)
        (( $# >= 2 )) || die "参数缺值：$1"
        case "$1" in
          --platform) PLATFORM="$2" ;;
          --device) DEVICE="$2" ;;
          --profile) PROFILE="$2" ;;
          --seed) SEED="$2" ;;
          --steps) STEPS="$2" ;;
          --seconds) SECONDS_LIMIT="$2" ;;
          --team) TEAM="$2" ;;
          --runner-id) RUNNER_ID="$2" ;;
          --signing) SIGNING_MODE="$2" ;;
        esac
        shift 2
        ;;
      *) die "未知参数：$1；使用 --help 查看用法。" ;;
    esac
  done
  [[ -z "$PROFILE" || "$PROFILE" == (coverage|quick|standard|stress) ]] || die '强度只能为 coverage、quick、standard、stress。'
  [[ -z "$PLATFORM" || "$PLATFORM" == (simulator|device) ]] || die '平台只能为 simulator 或 device。'
  [[ -z "$SIGNING_MODE" || "$SIGNING_MODE" == (existing|automatic) ]] || die '签名方式只能为 existing 或 automatic。'
  if [[ "$SIGNING_MODE" == automatic ]]; then
    ALLOW_PROVISIONING=1
  elif [[ "$SIGNING_MODE" == existing ]]; then
    ALLOW_PROVISIONING=0
  fi
  [[ -z "$DEVICE" || "$DEVICE" =~ '^[A-Za-z0-9-]{8,64}$' ]] || die '设备 ID 格式错误。'
  [[ -z "$TEAM" || "$TEAM" =~ '^[A-Z0-9]{10}$' ]] || die '开发团队 ID 应为10位大写字母或数字。'
  [[ -z "$RUNNER_ID" || "$RUNNER_ID" =~ '^[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)+$' ]] || die 'Runner Bundle ID 格式错误。'
  [[ -n "$SEED" ]] || SEED="$(date +%s)"
  [[ "$SEED" == <-> && ${#SEED} -le 10 ]] || die '种子必须为 0..4294967295 的整数。'
  (( 10#$SEED <= 4294967295 )) || die '种子超出范围。'
  if [[ -n "$STEPS" ]]; then
    [[ "$STEPS" == <-> && ${#STEPS} -le 5 ]] || die '步数必须为 1..10000 的整数。'
    (( 10#$STEPS >= 1 && 10#$STEPS <= 10000 )) || die '步数超出范围。'
  fi
  if [[ -n "$SECONDS_LIMIT" ]]; then
    [[ "$SECONDS_LIMIT" == <-> && ${#SECONDS_LIMIT} -le 4 ]] || die '秒数必须为 30..7200 的整数。'
    (( 10#$SECONDS_LIMIT >= 30 && 10#$SECONDS_LIMIT <= 7200 )) || die '秒数超出范围。'
  fi
}
# 逐层确认 Xcode、SDK、模拟器和选择器可用，不自动修改开发环境。
check_environment() {
  [[ "$(uname -s)" == Darwin ]] || die '需要 macOS 和完整 Xcode 驱动 iPhone 真机或 iOS 模拟器。'
  local developer_path
  developer_path="$(xcode-select -p 2>> "$LOG_FILE")" || die '请先安装并打开完整 Xcode。'
  [[ -d "${developer_path}/Platforms/iPhoneSimulator.platform" ]] || die "当前未选择完整 Xcode：${developer_path}。在 Xcode → Settings → Locations 选择 Command Line Tools。"
  xcrun xcodebuild -version >> "$LOG_FILE" 2>&1 || die 'Xcode 不可用；先打开 Xcode 完成许可和组件安装。'
  [[ -f "${SCRIPT_DIR}/Runner/JobsCrashCrawler.xcodeproj/project.pbxproj" ]] || die '缺少配套 Runner；请保留整个脚本包。'
  [[ -f "${SCRIPT_DIR}/Target.plist" ]] || die '缺少配套 Target.plist。'
  /usr/bin/plutil -lint "${SCRIPT_DIR}/Target.plist" >> "$LOG_FILE" 2>&1 || die 'Target.plist 格式错误。'
  load_target_config
  if (( CHECK_ONLY )); then
    PLATFORM="${PLATFORM:-simulator}"
    check_platform_tools
    log "✔ Xcode、${PLATFORM} 工具链和当前工程配套文件可用。"
    local options
    options="$(device_options)" || die '读取设备清单失败，请查看会话日志。'
    [[ -z "$options" ]] && log '⚠ 没有符合条件的设备；真机需要已连接、已配对且开启开发者模式。'
    [[ -n "$options" ]] && print -r -- "$options" | tee -a "$LOG_FILE"
    [[ "$PLATFORM" != device ]] || inspect_signing_team
    log "ℹ 本次仅检查 ${PLATFORM} 工具链和设备清单，未构建、安装或操作 App，也未验证签名。日志：$LOG_FILE"
    exit 0
  fi
  if [[ -z "$PLATFORM" || -z "$DEVICE" || -z "$PROFILE" ]]; then
    ensure_selector
  fi
}
# 只读检查也展示团队发现结果，不弹菜单或安装 Runner。
inspect_signing_team() {
  local configured_team candidates
  configured_team="${TEAM:-$(/usr/libexec/PlistBuddy -c 'Print :DevelopmentTeam' "${SCRIPT_DIR}/Target.plist" 2>/dev/null)}"
  if [[ "$configured_team" =~ '^[A-Z0-9]{10}$' ]]; then
    log "✔ 签名团队已明确配置：${configured_team}；Runner 签名资产仍需实际构建验证。"
    return 0
  fi
  candidates="$(host_signing_candidates | /usr/bin/awk -F '\t' '!seen[$1]++')"
  if [[ -n "$candidates" ]]; then
    log '✔ 可自动识别当前主 App 的签名团队；常规运行唯一候选直接复用，多个候选用菜单。'
    print -r -- "$candidates" | tee -a "$LOG_FILE"
  else
    log '⚠ 当前主 App 未发现可用签名团队，常规运行将提供原生设置和重新检测菜单。'
  fi
}
# 所有后续候选和确认菜单按需复用同一选择器，不回退到文字输入。
ensure_selector() {
  [[ -z "$FZF" ]] || return 0
  FZF="$(command -v fzf)"
  [[ -n "$FZF" ]] || FZF=/opt/homebrew/bin/fzf
  [[ -x "$FZF" ]] || FZF=/usr/local/bin/fzf
  [[ -x "$FZF" ]] || die '缺少 fzf。已有 Homebrew 时可执行 brew install fzf；安装后重新运行。'
  "$FZF" --version >> "$LOG_FILE" 2>&1 || die 'fzf 不可用，请修复后重试。'
  "$FZF" --help | /usr/bin/grep -q -- '--expect' || die 'fzf 缺少所需 --expect 功能，请更新后重试。'
}
# 按已选平台检查依赖，真机缺工具时不影响模拟器入口。
check_platform_tools() {
  if [[ "$PLATFORM" == simulator ]]; then
    xcrun --sdk iphonesimulator --show-sdk-path >> "$LOG_FILE" 2>&1 || die '缺少模拟器 SDK。'
    xcrun simctl list devices available >> "$LOG_FILE" 2>&1 || die '模拟器服务不可用。'
  else
    xcrun --sdk iphoneos --show-sdk-path >> "$LOG_FILE" 2>&1 || die '缺少 iPhoneOS SDK。'
    xcrun --find devicectl >> "$LOG_FILE" 2>&1 || die '当前 Xcode 缺少 devicectl，请选择完整且支持手机系统版本的 Xcode。'
    xcrun devicectl device info apps --help 2>> "$LOG_FILE" | /usr/bin/grep -q -- '--bundle-id' || die '当前 devicectl 缺少精确 App 查询能力，请升级匹配的 Xcode。'
  fi
}
# 仅从当前包读取工程身份，不探测或依赖父仓、兄弟工程。
load_target_config() {
  TARGET_NAME="$(/usr/libexec/PlistBuddy -c 'Print :Name' "${SCRIPT_DIR}/Target.plist" 2>> "$LOG_FILE")" || die 'Target.plist 缺少 Name。'
  PROJECT_ID="$(/usr/libexec/PlistBuddy -c 'Print :Project' "${SCRIPT_DIR}/Target.plist" 2>> "$LOG_FILE")" || die 'Target.plist 缺少 Project。'
  BUNDLE_ID="$(/usr/libexec/PlistBuddy -c 'Print :BundleID' "${SCRIPT_DIR}/Target.plist" 2>> "$LOG_FILE")" || die 'Target.plist 缺少 BundleID。'
  [[ -n "$TARGET_NAME" && "$PROJECT_ID" =~ '^[A-Za-z0-9_-]+$' ]] || die '当前工程名称或 Project 标识无效。'
  [[ "$BUNDLE_ID" =~ '^[A-Za-z0-9.-]+$' ]] || die "无效 Bundle ID：$BUNDLE_ID"
  HOST_ROOT="${SCRIPT_DIR:h:h}"
  HOST_PROJECT="$(/usr/libexec/PlistBuddy -c 'Print :HostProject' "${SCRIPT_DIR}/Target.plist" 2>/dev/null)"
  HOST_TARGET="$(/usr/libexec/PlistBuddy -c 'Print :HostTarget' "${SCRIPT_DIR}/Target.plist" 2>/dev/null)"
  if [[ -n "$HOST_PROJECT" ]]; then
    [[ "$HOST_PROJECT" == *.xcodeproj && "$HOST_PROJECT" != */* ]] || die 'HostProject 必须是本工程根目录内的 xcodeproj 名称。'
    HOST_PROJECT="${HOST_ROOT}/${HOST_PROJECT}"
  fi
  log "➤ 当前工程：${TARGET_NAME}（${PROJECT_ID}）；App：${BUNDLE_ID}"
}
# 从当前输入清单选择一项，单独区分左键返回、取消和错误。
pick_one() {
  local title="$1" allow_back="$2" output pick_code
  local -a options
  ensure_selector
  options=(--no-multi --height=80% --layout=reverse --prompt="${title}> " --delimiter=$'\t' --with-nth=2.. --bind='tab:down,btab:up,space:accept')
  if [[ "$allow_back" == yes ]]; then
    options+=(--expect=left --header='↑↓ / Tab 选择，回车或空格确认；← 返回上一层；可选择取消本轮')
  else
    options+=(--header='↑↓ / Tab 选择，回车或空格确认；可选择取消本轮（Esc 也可取消）')
  fi
  output="$(/usr/bin/awk 'NF {print} END {print "__cancel__\t取消本轮（不执行）"}' | "$FZF" "${options[@]}")"
  pick_code=$?
  if [[ "$allow_back" == yes && "${output%%$'\n'*}" == left ]]; then
    return 10
  fi
  (( pick_code == 130 )) && return 130
  (( pick_code == 1 )) && return 11
  (( pick_code == 0 )) || return 12
  [[ "$allow_back" == no ]] || output="${output#*$'\n'}"
  [[ -n "$output" ]] || return 11
  SELECTION="${output%%$'\t'*}"
  [[ "$SELECTION" != __cancel__ ]] || return 130
  return 0
}
# 列出可运行的 iOS 设备，避免误选 watchOS 或不可用运行时。
device_options() {
  if [[ "$PLATFORM" == device ]]; then
    physical_device_options
    return $?
  fi
  xcrun simctl list devices available | /usr/bin/awk '
    /^-- / { split($3, version, "."); ios = ($0 ~ /^-- iOS / && version[1]+0 >= 17); runtime=$0; next }
    ios && /\([0-9A-Fa-f-]{36}\)/ {
      line=$0; match(line, /\([0-9A-Fa-f-]{36}\)/)
      uuid=substr(line,RSTART+1,36); sub(/^[[:space:]]+/, "",line)
      printf "%s\t%s %s\n",uuid,line,runtime
    }'
}
# 兼容新旧 CoreDevice 元数据字段，只读取当前条目的已知属性。
device_field() {
  json_value "$1" "result.devices.$2.${3//:/.}" || json_value "$1" "result.devices.$2.${4//:/.}"
}
# 直接提取 JSON 标量，避免 devicectl 的 null 字段无法转换为 XML plist。
json_value() {
  local value
  local -a expected_type
  [[ -z "${3:-}" ]] || expected_type=(-expect "$3")
  value="$(/usr/bin/plutil -extract "$2" raw "${expected_type[@]}" -o - "$1" 2>/dev/null)" || return 1
  print -r -- "$value"
}
# 仅列出已连接、已配对、开发者模式启用的 iOS 17+ iPhone。
physical_device_options() {
  local metadata="${LOG_FILE:h}/devices.json" index=0 count reality platform kind pairing connection mode udid name version
  xcrun devicectl list devices --timeout 10 --json-output "$metadata" >> "$LOG_FILE" 2>&1 || return 1
  [[ "$(json_value "$metadata" info.outcome)" == success ]] || return 1
  count="$(json_value "$metadata" result.devices array)" || return 1
  [[ "$count" == <-> ]] || return 1
  while (( index < count )); do
    reality="$(device_field "$metadata" "$index" properties:hardware:reality hardwareProperties:reality)"
    platform="$(device_field "$metadata" "$index" properties:hardware:platform hardwareProperties:platform)"
    kind="$(device_field "$metadata" "$index" properties:hardware:deviceType hardwareProperties:deviceType)"
    pairing="$(device_field "$metadata" "$index" properties:connection:pairingState connectionProperties:pairingState)"
    connection="$(device_field "$metadata" "$index" properties:connection:state connectionProperties:tunnelState)"
    if /usr/bin/plutil -extract "result.devices.${index}.properties.state.developerModeStatus" json -o /dev/null "$metadata" >/dev/null 2>&1; then
      mode=disabled
      /usr/bin/plutil -extract "result.devices.${index}.properties.state.developerModeStatus.enabled" json -o /dev/null "$metadata" >/dev/null 2>&1 && mode=enabled
    else
      mode="$(json_value "$metadata" "result.devices.${index}.deviceProperties.developerModeStatus")"
    fi
    if [[ "$reality" == physical && "$platform" == iOS && "$kind" == iPhone && "$pairing" == paired && "$connection" == connected && "$mode" == enabled ]]; then
      udid="$(device_field "$metadata" "$index" properties:hardware:udid hardwareProperties:udid)"
      name="$(device_field "$metadata" "$index" properties:state:name deviceProperties:name | tr '\t\r\n' '   ')"
      version="$(json_value "$metadata" "result.devices.${index}.properties.software.osVersionNumber.stringValue" || device_field "$metadata" "$index" properties:software:osVersionNumber deviceProperties:osVersionNumber)"
      if [[ "$udid" =~ '^[A-Za-z0-9-]{8,64}$' && "${version%%.*}" == <-> ]] && (( ${version%%.*} >= 17 )); then
        printf '%s\t%s｜iOS %s｜iPhone 真机（运行前保持解锁）\n' "$udid" "$name" "$version"
      fi
    fi
    (( index += 1 ))
  done
  return 0
}
# 循环编排平台、设备与强度三层选择；返回只调整计划，不启动业务。
select_plan() {
  local stage=1 choice_code device_list
  while (( stage <= 3 )); do
    case "$stage" in
      1)
        if [[ -z "$PLATFORM" ]]; then
          printf 'simulator\tiOS 模拟器\ndevice\tiPhone 真机\n' | pick_one '测试平台' no
          choice_code=$?
          (( choice_code == 0 )) || cancel_selection "$choice_code"
          PLATFORM="$SELECTION"
        fi
        check_platform_tools
        stage=2
        ;;
      2)
        if [[ -z "$DEVICE" ]]; then
          device_list="$(device_options)" || die '读取设备失败；检查连接、配对或模拟器运行时，详情见日志。'
          [[ -n "$device_list" ]] || die "没有可用 ${PLATFORM} 设备。模拟器需安装运行时；iPhone 需连接、信任配对并启用开发者模式，系统版本至少 iOS 17。"
          print -r -- "$device_list" | pick_one '测试设备' yes
          choice_code=$?
          if (( choice_code == 10 )); then
            PLATFORM=""; DEVICE=""; stage=1; continue
          fi
          (( choice_code == 0 )) || cancel_selection "$choice_code"
          DEVICE="$SELECTION"
        fi
        stage=3
        ;;
      3)
        if [[ -z "$PROFILE" ]]; then
          printf 'coverage\t完整清单｜逐页面、流程和手势验证（建议）\nquick\t补充探索·快速｜最多100步 / 3分钟\nstandard\t标准｜最多500步 / 15分钟\nstress\t压力｜最多2000步 / 60分钟\n' | pick_one '巡检强度' yes
          choice_code=$?
          if (( choice_code == 10 )); then
            DEVICE=""; stage=2; continue
          fi
          (( choice_code == 0 )) || cancel_selection "$choice_code"
          PROFILE="$SELECTION"
        fi
        stage=4
        ;;
    esac
  done
  case "$PROFILE" in
    coverage) STEPS="${STEPS:-100}"; SECONDS_LIMIT="${SECONDS_LIMIT:-180}" ;;
    quick) STEPS="${STEPS:-100}"; SECONDS_LIMIT="${SECONDS_LIMIT:-180}" ;;
    standard) STEPS="${STEPS:-500}"; SECONDS_LIMIT="${SECONDS_LIMIT:-900}" ;;
    stress) STEPS="${STEPS:-2000}"; SECONDS_LIMIT="${SECONDS_LIMIT:-3600}" ;;
  esac
  device_options | /usr/bin/awk -F '\t' -v selected="$DEVICE" '$1 == selected {found=1} END {exit !found}' || die '所选设备当前不可用，请重新选择。'
}
# 读取指定配置的字段，避免把 Widget 或测试 Target 的团队当作主 App。
configuration_value() {
  local project_file="$1" configuration_list="$2" key="$3" index=0 configuration_id configuration_name
  while configuration_id="$(/usr/libexec/PlistBuddy -c "Print :objects:${configuration_list}:buildConfigurations:${index}" "$project_file" 2>/dev/null)"; do
    configuration_name="$(/usr/libexec/PlistBuddy -c "Print :objects:${configuration_id}:name" "$project_file" 2>/dev/null)"
    if [[ "$configuration_name" == Debug ]]; then
      /usr/libexec/PlistBuddy -c "Print :objects:${configuration_id}:buildSettings:${key}" "$project_file" 2>/dev/null
      return $?
    fi
    (( index += 1 ))
  done
  return 1
}
# 仅在工程使用变量或 xcconfig 时请求只读设置，禁用自动包更新与解析。
resolved_host_team() {
  local project="$1" target_name="$2" result="${LOG_FILE:h}/host-build-settings.json" index=0 entry_target resolved_bundle resolved_team
  xcrun xcodebuild -project "$project" -target "$target_name" -configuration Debug -sdk iphoneos -showBuildSettings -json -disableAutomaticPackageResolution -skipPackageUpdates > "$result" 2>> "$LOG_FILE" || return 1
  while entry_target="$(json_value "$result" "${index}.target")"; do
    if [[ "$entry_target" == "$target_name" ]]; then
      resolved_bundle="$(json_value "$result" "${index}.buildSettings.PRODUCT_BUNDLE_IDENTIFIER")"
      resolved_team="$(json_value "$result" "${index}.buildSettings.DEVELOPMENT_TEAM")"
      [[ "$resolved_bundle" == "$BUNDLE_ID" && "$resolved_team" =~ '^[A-Z0-9]{10}$' ]] || return 1
      print -r -- "$resolved_team"
      return 0
    fi
    (( index += 1 ))
  done
  return 1
}
# 按主 App、Bundle ID 和 Debug 配置发现团队，只扫描当前工程根目录。
host_signing_candidates() {
  local project project_file root_id target_id target_name product_type configuration_list bundle team index
  local -a projects
  if [[ -n "$HOST_PROJECT" ]]; then
    projects=("$HOST_PROJECT")
  else
    projects=("${HOST_ROOT}"/*.xcodeproj(N))
  fi
  for project in "${projects[@]}"; do
    project_file="${project}/project.pbxproj"
    [[ -f "$project_file" ]] || continue
    root_id="$(/usr/libexec/PlistBuddy -c 'Print :rootObject' "$project_file" 2>/dev/null)" || continue
    index=0
    while target_id="$(/usr/libexec/PlistBuddy -c "Print :objects:${root_id}:targets:${index}" "$project_file" 2>/dev/null)"; do
      (( index += 1 ))
      target_name="$(/usr/libexec/PlistBuddy -c "Print :objects:${target_id}:name" "$project_file" 2>/dev/null)"
      product_type="$(/usr/libexec/PlistBuddy -c "Print :objects:${target_id}:productType" "$project_file" 2>/dev/null)"
      [[ "$product_type" == com.apple.product-type.application ]] || continue
      [[ -z "$HOST_TARGET" || "$HOST_TARGET" == "$target_name" ]] || continue
      configuration_list="$(/usr/libexec/PlistBuddy -c "Print :objects:${target_id}:buildConfigurationList" "$project_file" 2>/dev/null)" || continue
      bundle="$(configuration_value "$project_file" "$configuration_list" PRODUCT_BUNDLE_IDENTIFIER)"
      team="$(configuration_value "$project_file" "$configuration_list" DEVELOPMENT_TEAM)"
      if [[ "$bundle" == "$BUNDLE_ID" && "$team" =~ '^[A-Z0-9]{10}$' ]]; then
        printf '%s\t%s｜%s / %s / Debug\n' "$team" "$team" "${project:t}" "$target_name"
      elif [[ "$bundle" == "$BUNDLE_ID" || "$bundle" == *'$('* || "$bundle" == *'${'* ]]; then
        team="$(resolved_host_team "$project" "$target_name")" || continue
        printf '%s\t%s｜%s / %s / Debug（已解析设置）\n' "$team" "$team" "${project:t}" "$target_name"
      fi
    done
  done
}
# 候选唯一时复用，多候选仅用菜单；缺信息时允许打开原生配置后重新检测。
discover_signing_team() {
  local candidates code choice
  local -a lines
  while [[ -z "$TEAM" ]]; do
    candidates="$(host_signing_candidates | /usr/bin/awk -F '\t' '!seen[$1]++')"
    if [[ -z "$candidates" ]]; then
      local runner_file runner_team
      for runner_file in "${LOG_FILE:h}/RunnerSetup/JobsCrashCrawler.xcodeproj/project.pbxproj" "${SCRIPT_DIR}/Runner/JobsCrashCrawler.xcodeproj/project.pbxproj"; do
        [[ -f "$runner_file" ]] || continue
        runner_team="$(configuration_value "$runner_file" 100000000000000000000020 DEVELOPMENT_TEAM)"
        if [[ "$runner_team" =~ '^[A-Z0-9]{10}$' ]]; then
          candidates="${runner_team}"$'\t'"${runner_team}｜已保存的 Runner / Debug 签名"
          break
        fi
      done
    fi
    lines=("${(@f)candidates}")
    if [[ -n "$candidates" && ${#lines} == 1 ]]; then
      TEAM="${lines[1]%%$'\t'*}"
      TEAM_SOURCE="${lines[1]#*$'\t'}"
      break
    elif [[ -n "$candidates" ]]; then
      print -r -- "$candidates" | pick_one '开发团队（来源已列出）' no
      code=$?
      (( code == 0 )) || cancel_selection "$code"
      TEAM="$SELECTION"
      TEAM_SOURCE='用户从本工程团队候选菜单选择'
      break
    fi
    log '⚠ 未发现本工程主 App 的有效 Debug 签名团队；不会要求手抄 Team ID。'
    printf 'retry\t重新检测（可先在 Xcode 选择 Team）\nopen-host\t打开当前主 App 工程配置签名\nopen-runner\t打开已填好 Runner 身份的原生准备工程\n' | pick_one '签名准备' no
    code=$?
    (( code == 0 )) || cancel_selection "$code"
    choice="$SELECTION"
    if [[ "$choice" == open-runner ]]; then
      open_runner_setup
    elif [[ "$choice" == open-host ]]; then
      [[ -d "$HOST_PROJECT" ]] || die '当前包找不到宿主工程；请从原工程的 ScriptsByDevTools 入口运行，或使用已明确的高级签名配置。'
      local workspace="${HOST_PROJECT:r}.xcworkspace"
      if [[ -d "$workspace" ]]; then
        open "$workspace" >> "$LOG_FILE" 2>&1 || die '无法打开当前工作区。'
      else
        open "$HOST_PROJECT" >> "$LOG_FILE" 2>&1 || die '无法打开当前工程。'
      fi
    fi
  done
}
# 生成已填好当前签名值的原生准备工程，保留原 Runner 和业务工程配置。
open_runner_setup() {
  local setup_root="${LOG_FILE:h}/RunnerSetup" project_file configuration
  if [[ ! -d "$setup_root" ]]; then
    cp -R "${SCRIPT_DIR}/Runner" "$setup_root" || die '无法创建本次 Runner 签名准备副本。'
  fi
  project_file="${setup_root}/JobsCrashCrawler.xcodeproj/project.pbxproj"
  for configuration in 100000000000000000000032 100000000000000000000033; do
    /usr/libexec/PlistBuddy -c "Set :objects:${configuration}:buildSettings:PRODUCT_BUNDLE_IDENTIFIER ${RUNNER_ID}" "$project_file" || die '无法填入 Runner 身份。'
    if [[ -n "$TEAM" ]]; then
      /usr/libexec/PlistBuddy -c "Delete :objects:${configuration}:buildSettings:DEVELOPMENT_TEAM" "$project_file" >/dev/null 2>&1
      /usr/libexec/PlistBuddy -c "Add :objects:${configuration}:buildSettings:DEVELOPMENT_TEAM string ${TEAM}" "$project_file" || die '无法填入 Runner 团队。'
    fi
  done
  log "➤ Runner 准备副本：${setup_root}/JobsCrashCrawler.xcodeproj；Team=${TEAM:-在 Xcode 团队菜单中选择}；Runner=${RUNNER_ID}。选择真机后执行 Product → Build For → Testing。"
  open "${setup_root}/JobsCrashCrawler.xcodeproj" >> "$LOG_FILE" 2>&1 || die '无法打开 Runner 签名准备副本。'
}
# 从键盘菜单选择使用已有签名、授权自动准备，或打开已填好的原生设置。
choose_signing_mode() {
  local code
  while [[ -z "$SIGNING_MODE" ]]; do
    printf 'existing\t使用本机已有 Runner 签名（首次可能缺描述文件）\nautomatic\t首次准备｜允许 Xcode 自动准备 Runner 签名（下一屏空格授权）\nsetup\t打开已填好团队和身份的 Runner 工程准备签名\n' | pick_one 'Runner 签名方式' no
    code=$?
    (( code == 0 )) || cancel_selection "$code"
    if [[ "$SELECTION" == setup ]]; then
      open_runner_setup
    else
      SIGNING_MODE="$SELECTION"
    fi
  done
  if [[ "$SIGNING_MODE" == automatic ]]; then
    ALLOW_PROVISIONING=1
  else
    ALLOW_PROVISIONING=0
  fi
}
# 优先复用明确配置或当前主 App 的团队，普通运行不要求文字输入。
prepare_signing() {
  if [[ "$PLATFORM" == simulator ]]; then
    (( ALLOW_PROVISIONING == 0 )) || die '模拟器不需要签名更新；请去掉 --allow-provisioning-updates。'
    return 0
  fi
  if [[ -n "$TEAM" ]]; then
    TEAM_SOURCE='高级命令行覆盖'
  else
    TEAM="$(/usr/libexec/PlistBuddy -c 'Print :DevelopmentTeam' "${SCRIPT_DIR}/Target.plist" 2>/dev/null)"
    [[ -z "$TEAM" ]] || TEAM_SOURCE='本包 Target.plist 明确配置'
  fi
  [[ -n "$RUNNER_ID" ]] || RUNNER_ID="$(/usr/libexec/PlistBuddy -c 'Print :RunnerBundleID' "${SCRIPT_DIR}/Target.plist" 2>/dev/null)"
  if [[ -z "$RUNNER_ID" ]]; then
    local project_runner_id
    project_runner_id="$(configuration_value "${SCRIPT_DIR}/Runner/JobsCrashCrawler.xcodeproj/project.pbxproj" 100000000000000000000020 PRODUCT_BUNDLE_IDENTIFIER)"
    if [[ "$project_runner_id" != com.jobs.JobsCrashCrawler && "$project_runner_id" =~ '^[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)+$' ]]; then
      RUNNER_ID="$project_runner_id"
    fi
  fi
  RUNNER_ID="${RUNNER_ID:-${BUNDLE_ID}.JobsCrashCrawler}"
  [[ -n "$TEAM" ]] || discover_signing_team
  [[ "$TEAM" =~ '^[A-Z0-9]{10}$' ]] || die 'Team ID 格式错误。'
  [[ "$RUNNER_ID" =~ '^[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)+$' ]] || die 'Runner Bundle ID 格式错误。'
  [[ "$RUNNER_ID" != "$BUNDLE_ID" && "${RUNNER_ID}.xctrunner" != "$BUNDLE_ID" ]] || die 'Runner 身份必须与待测 App 分开，避免安装覆盖业务 App。'
  log "✔ 签名计划：Team=${TEAM}；来源=${TEAM_SOURCE}；Runner=${RUNNER_ID}"
  choose_signing_mode
}
# 签名后台更新默认取消，方向键选择后必须按空格复核。
confirm_signing_updates() {
  local decision code
  log "➤ 授权对象：当前 Team=${TEAM}；Runner=${RUNNER_ID}；设备=${DEVICE}。"
  log '⚠ 允许 Xcode 联系 Apple 创建/更新签名描述文件、App ID 或证书；不自动注册设备。取消本轮不会撤回已经完成的 Apple 后台变更。'
  ensure_selector
  decision="$(printf 'cancel\t取消本轮（默认，不执行）\nauthorize\t授权本轮 Apple 签名资产更新并开始测试\n' | "$FZF" --no-multi --height=60% --layout=reverse --delimiter=$'\t' --with-nth=2.. --prompt='签名更新授权> ' --header='↑↓ / Tab 选择；只用空格确认；默认取消，回车不执行' --bind='enter:ignore,space:accept,tab:down,btab:up')"
  code=$?
  (( code == 0 )) || cancel_selection "$code"
  [[ "${decision%%$'\t'*}" == authorize ]] || cancel_selection 130
}
# 取消、空选均不执行计划，选择器故障保持错误退出。
cancel_selection() {
  case "$1" in
    130|11)
      if [[ -n "$RUN_DIR" ]]; then
        log 'ℹ 已取消后续签名准备与重试；本轮未完成，已有报告保留。'
        stop_run 130
      fi
      log 'ℹ 已取消或没有选择；未启动巡检。'
      exit 130
      ;;
    *) die "选择器失败（状态 $1）。" ;;
  esac
}
# 展示预算、模拟器与来源，获得本轮执行确认后才创建报告。
confirm_plan() {
  log "➤ 当前工程：${TARGET_NAME}；App：${BUNDLE_ID}；平台：${PLATFORM}；设备：${DEVICE}"
  if [[ "$PROFILE" == coverage ]]; then
    log "➤ 完整清单：每场景独立执行，单场景最多 ${SECONDS_LIMIT} 秒；不会用总步数截掉后续页面。"
  else
    log "➤ 补充探索：最多 ${STEPS} 步 / ${SECONDS_LIMIT} 秒；种子：${SEED}"
  fi
  log "➤ Runner 源码：${SCRIPT_DIR}/Runner；构建及报告：${SCRIPT_DIR}/Reports/"
  if [[ "$PLATFORM" == device ]]; then
    log "➤ 真机签名：Team=${TEAM}；Runner=${RUNNER_ID}；会在手机安装或更新测试 Runner，请保持解锁并使用测试数据。"
  fi
  local answer=""
  if (( ALLOW_PROVISIONING )); then
    confirm_signing_updates
  else
    log '⚠ 即将自动操作所选设备上的测试 App；默认仅使用已有签名资产。Ctrl+C 取消。'
    IFS= read -r 'answer?回车确认执行；空格后回车取消：' || exit 130
    [[ -z "$answer" ]] || exit 130
  fi
  mkdir -p "${SCRIPT_DIR}/Reports" || die '报告目录不可写。'
  RUN_DIR="$(mktemp -d "${SCRIPT_DIR}/Reports/$(date +%Y%m%d-%H%M%S).XXXXXX")" || die '无法创建报告目录。'
  printf 'iOS 自动巡检结果｜%s\n请检查下方当前工程状态及文末最终状态；没有最终状态表示未完成。\n' "$TARGET_NAME" > "${RUN_DIR}/总览.txt"
  log "ℹ 本轮报告：$RUN_DIR"
}
# 只从当前 Xcode 查找界面入口，兼容 Device Hub 与旧 Simulator。
resolve_simulator_ui() {
  local simctl_path developer_root candidate bundle_id
  SIMULATOR_UI_PATH=""; SIMULATOR_UI_KIND=""
  simctl_path="$(xcrun --find simctl 2>> "$LOG_FILE")" || return 1
  developer_root="${simctl_path:h:h:h}"
  for candidate in "${developer_root:h}/Applications/DeviceHub.app" "${developer_root}/Applications/Simulator.app" "${developer_root:h}/Applications/Simulator.app"; do
    [[ -f "${candidate}/Contents/Info.plist" ]] || continue
    bundle_id="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleIdentifier' "${candidate}/Contents/Info.plist" 2>/dev/null)"
    case "$bundle_id" in
      com.apple.dt.Devices) SIMULATOR_UI_KIND=devicehub ;;
      com.apple.iphonesimulator) SIMULATOR_UI_KIND=simulator ;;
      *) continue ;;
    esac
    SIMULATOR_UI_PATH="$candidate"
    return 0
  done
  return 1
}
# 打开管理窗口只负责显示，实际测试始终使用所选 UUID。
open_simulator_ui() {
  resolve_simulator_ui || { log '⚠ 当前 Xcode 未发现 Device Hub 或 Simulator 界面入口；已启动的模拟器仍按 UUID 测试，详情见会话日志。'; return 0; }
  if [[ "$SIMULATOR_UI_KIND" == devicehub ]]; then
    if open -a "$SIMULATOR_UI_PATH" >> "$LOG_FILE" 2>&1; then
      log 'ℹ 已打开当前 Xcode 的 Device Hub；界面当前展示的设备与本轮测试 UUID 分别核对。'
    else
      log '⚠ Device Hub 窗口未能打开；后台模拟器仍按所选 UUID 测试，详情见会话日志。'
    fi
  elif open -a "$SIMULATOR_UI_PATH" --args -CurrentDeviceUDID "$DEVICE" >> "$LOG_FILE" 2>&1; then
    log 'ℹ 已打开当前 Xcode 的 Simulator 界面。'
  else
    log '⚠ Simulator 窗口未能打开；后台模拟器仍按所选 UUID 测试，详情见会话日志。'
  fi
}
# 启动指定模拟器，预检安装状态；缺 App 时只记录，不编译业务工程。
prepare_app() {
  if [[ "$PLATFORM" == device ]]; then
    prepare_device_app
    return $?
  fi
  if ! xcrun simctl list devices booted | /usr/bin/grep -q "$DEVICE"; then
    xcrun simctl boot "$DEVICE" >> "$LOG_FILE" 2>&1 || die "无法启动模拟器 $DEVICE。"
  fi
  xcrun simctl bootstatus "$DEVICE" -b >> "$LOG_FILE" 2>&1 || die '模拟器未能完成启动。'
  open_simulator_ui
  APP_PATH="$(xcrun simctl get_app_container "$DEVICE" "$BUNDLE_ID" app 2>> "$LOG_FILE")"
  if [[ -d "$APP_PATH" ]]; then
    APP_READY=1
    log "✔ ${TARGET_NAME} 已安装：${BUNDLE_ID}"
  else
    log "⚠ ${TARGET_NAME} 未安装（${BUNDLE_ID}）。先在 Xcode 选择这台模拟器，按 ▶ 运行本工程。"
    print -r -- "${TARGET_NAME}：未测试，所选模拟器未安装 App（${BUNDLE_ID}）。" >> "${RUN_DIR}/总览.txt"
    FINAL_CODE=1
  fi
}
# 精确查询当前 App，不枚举私人应用或读取手机沙盒。
prepare_device_app() {
  local metadata="${LOG_FILE:h}/installed-app.json" installed_bundle count
  xcrun devicectl device info apps --device "$DEVICE" --bundle-id "$BUNDLE_ID" --include-all-apps --timeout 10 --json-output "$metadata" >> "$LOG_FILE" 2>&1 || die '真机 App 预检失败；请解锁并检查信任、连接和开发者模式，不能据此认定 App 未安装。'
  [[ "$(json_value "$metadata" info.outcome)" == success ]] || die '真机 App 预检未成功或元数据无法解析，请查看连接或权限错误。'
  count="$(json_value "$metadata" result.apps array)" || die '真机 App 元数据缺少有效 apps 数组，不能认定 App 未安装。'
  [[ "$count" == <-> ]] || die '真机 App 元数据格式不正确。'
  if (( count > 0 )); then
    installed_bundle="$(json_value "$metadata" result.apps.0.bundleIdentifier)" || die '真机 App 条目缺少身份信息。'
    [[ "$installed_bundle" == "$BUNDLE_ID" ]] || die '精确查询返回了不同 App，停止以避免操作错误目标。'
  fi
  if [[ "$installed_bundle" == "$BUNDLE_ID" ]]; then
    APP_READY=1
    log "✔ iPhone 已安装 ${TARGET_NAME}；请保持手机解锁，接下来由 Xcode 安装或更新签名 Runner。"
  else
    FINAL_CODE=1
    log "⚠ 真机未找到 ${BUNDLE_ID}；先用 Xcode 在该手机运行当前工程。"
    print -r -- "${TARGET_NAME}：未测试，真机未找到当前工程 App。" >> "${RUN_DIR}/总览.txt"
  fi
}
# 将测试动作前缀提取为 JSONL，退出码和开始/完成标记共同决定结果。
summarize_target() {
  local key="$TARGET_NAME" test_code="$1" folder="${RUN_DIR}/app" action_count="" completed_count
  /usr/bin/sed -n 's/^.*JOBS_CRAWL_EVENT //p' "${folder}/xcodebuild.log" > "${folder}/events.jsonl"
  /usr/bin/grep '"event":"summary"' "${folder}/events.jsonl" | /usr/bin/tail -n 1 > "${folder}/summary.json"
  action_count="$(/usr/bin/plutil -extract actions raw -o - "${folder}/summary.json" 2>/dev/null)"
  completed_count="$(completed_action_count "${folder}/events.jsonl")"
  if (( test_code == 0 )) && [[ "$action_count" == <-> ]] && (( action_count > 0 )) && /usr/bin/grep -q '"event":"started"' "${folder}/events.jsonl"; then
    log "✔ ${key}：本轮已完成；已执行范围内未发现导致测试失败的问题。"
    print -r -- "${key}：本轮完成；详见 app/events.jsonl 与 app/TestResults.xcresult。" >> "${RUN_DIR}/总览.txt"
  elif runner_initialization_failed "$test_code" "${folder}/xcodebuild.log"; then
    FINAL_CODE=1
    log "⚠ ${key}：未测试；Runner 初始化失败或启动等待超时，尚未收到巡检 started 事件，不能视为业务 App 崩溃。"
    print -r -- "${key}：未测试，测试 Runner 初始化未完成；xcodebuild=${test_code}，未开始自动点击。详见 xcodebuild.log、结果包及可能生成的 Runner启动超时.txt。" >> "${RUN_DIR}/总览.txt"
  elif target_launch_timed_out "$test_code" "${folder}/xcodebuild.log"; then
    FINAL_CODE=1
    log "⚠ ${key}：巡检未完成；目标 App 启动或重启超时，日志记录已完成动作=${completed_count}。需结合系统诊断判断，不能直接认定 App 崩溃。"
    print -r -- "${key}：巡检未完成，目标 App 启动或重启超时；xcodebuild=${test_code}，日志记录已完成动作=${completed_count}。最终汇总=${action_count:-未产生}，保留最后操作与结果包。" >> "${RUN_DIR}/总览.txt"
  elif free_profile_install_limit "$test_code" "${folder}/xcodebuild.log"; then
    FINAL_CODE=1
    log "⚠ ${key}：未测试；免费开发签名的 App 安装名额已满，Runner 安装受限，自动点击尚未开始。"
    log "➤ 请保留待测 App（${BUNDLE_ID}），手动删除一个不再需要的免费签名测试 App，为 Runner 腾出位置；删除会清除该 App 本地数据。现有 Runner 签名有效时可选择已有签名重新运行，也可使用模拟器。"
    print -r -- "${key}：未测试，免费签名 App 安装名额已满；Runner 尚未安装成功，xcodebuild=${test_code}，未开始自动点击。请保留待测 App，并按教程手动处理安装名额后重跑。" >> "${RUN_DIR}/总览.txt"
  elif missing_runner_profile "$test_code" "${folder}/xcodebuild.log"; then
    FINAL_CODE=1
    log "⚠ ${key}：未测试；独立 Runner 缺少描述文件，自动点击尚未开始。这不是 App 崩溃结论。"
    print -r -- "${key}：未测试，Runner 缺少描述文件；xcodebuild=${test_code}，未开始自动点击。" >> "${RUN_DIR}/总览.txt"
  else
    FINAL_CODE=1
    log "⚠ ${key}：未通过或未完成（xcodebuild=${test_code}，最终汇总动作=${action_count:-未产生}，日志记录已完成动作=${completed_count}）；请检查最后步骤和结果包。"
    print -r -- "${key}：未通过或未完成，xcodebuild=${test_code}，最终汇总动作=${action_count:-未产生}，日志记录已完成动作=${completed_count}；不能直接等同于 App 崩溃。" >> "${RUN_DIR}/总览.txt"
  fi
}
# 来源附带设备范围，便于将主机候选与所选模拟器自己的日志区分。
simulator_crash_report_sources() {
  printf 'host\t%s\0device\t%s\0' \
    "${HOME}/Library/Logs/DiagnosticReports" \
    "${HOME}/Library/Developer/CoreSimulator/Devices/${DEVICE}/data/Library/Logs/CrashReporter"
}
# 0 为目标 App 与设备均确认，1 为明确不匹配，2 为无法确认；只解析数据，不执行报告内容。
crash_report_ownership() {
  local report_file="$1" scratch="$2" source_kind="$3"
  local report_bundle="" header_bundle="" body_bundle="" reported_path="" reported_device="" suffix=""
  case "$report_file" in
    *.ips)
      /usr/bin/head -n 1 "$report_file" > "${scratch}/header.json" || return 2
      /usr/bin/tail -n +2 "$report_file" > "${scratch}/body.json" || return 2
      header_bundle="$(json_value "${scratch}/header.json" bundleID string)" || header_bundle=""
      body_bundle="$(json_value "${scratch}/body.json" bundleInfo.CFBundleIdentifier string)" || body_bundle=""
      reported_path="$(json_value "${scratch}/body.json" procPath string)" || reported_path=""
      if [[ -n "$header_bundle" && -n "$body_bundle" && "$header_bundle" != "$body_bundle" ]]; then
        print -r -- 'IPS 头与正文 Bundle ID 冲突，不能确认归属。'
        return 2
      fi
      report_bundle="${header_bundle:-$body_bundle}"
      ;;
    *.crash)
      report_bundle="$(/usr/bin/awk '/^Identifier:/ {sub(/^Identifier:[[:space:]]*/, ""); sub(/[[:space:]]+$/, ""); print; exit}' "$report_file")"
      reported_path="$(/usr/bin/awk '/^Path:/ {sub(/^Path:[[:space:]]*/, ""); sub(/[[:space:]]+$/, ""); print; exit}' "$report_file")"
      ;;
    *)
      print -r -- '报告格式不支持，不能确认归属。'
      return 2
      ;;
  esac
  if [[ -z "$BUNDLE_ID" ]]; then
    print -r -- '当前计划缺少目标 Bundle ID，不能确认归属。'
    return 2
  fi
  if [[ -n "$report_bundle" && "$report_bundle" != "$BUNDLE_ID" ]]; then
    print -r -- 'Bundle ID 与当前目标不匹配。'
    return 1
  fi
  if [[ "$reported_path" == *'/CoreSimulator/Devices/'* ]]; then
    suffix="${reported_path#*/CoreSimulator/Devices/}"
    reported_device="${suffix%%/*}"
    if [[ ! "$reported_device" =~ '^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{4}-[0-9A-Fa-f]{12}$' ]]; then
      print -r -- 'procPath 中的模拟器标识无法解析。'
      return 2
    fi
    if [[ "${(U)reported_device}" != "${(U)DEVICE}" ]]; then
      print -r -- '报告来自另一台模拟器。'
      return 1
    fi
  elif [[ -n "$reported_path" ]]; then
    print -r -- '报告进程路径不能确认属于所选模拟器。'
    return 2
  fi
  if [[ -z "$report_bundle" || -z "$BUNDLE_ID" ]]; then
    print -r -- '报告缺少可确认的 Bundle ID。'
    return 2
  fi
  if [[ -z "$reported_device" && "$source_kind" != device ]]; then
    print -r -- '报告没有设备路径，且不在所选模拟器自己的日志目录。'
    return 2
  fi
  print -r -- 'Bundle ID 与所选模拟器归属已确认。'
  return 0
}
# 文件名和时间仅发现候选；无法确认归属的报告分开放置，不当作当前 App 崩溃。
collect_crash_reports() {
  local folder="$1" app_path="$2" executable source_file source_entry source_kind source_root
  local identity_scratch owner_reason owner_code uncertain_folder
  if [[ "$PLATFORM" == device ]]; then
    mkdir -p "${folder}/CrashReports"
    printf '%s\n' '真机诊断请结合本轮 xcresult、步骤和截图判断。' '本工具不读取整机系统日志或保证自动取得外部 App 的完整崩溃栈。' '从 Xcode Device Hub（旧版 Devices and Simulators）或手机“设置→隐私与安全性→分析与改进→分析数据”导出当前 App、当前时间对应的诊断。' '没有 .ips 文件不能证明没有崩溃。' > "${folder}/CrashReports/真机日志获取.txt"
    return 0
  fi
  executable="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleExecutable' "${app_path}/Info.plist" 2>> "$LOG_FILE")"
  [[ -n "$executable" ]] || return 0
  mkdir -p "${folder}/CrashReports"
  identity_scratch="$(/usr/bin/mktemp -d "${folder}/.crash-identity.XXXXXX")" || {
    log '⚠ 无法创建诊断归属核对临时目录，本次不收集候选报告。'
    return 0
  }
  while IFS= read -r -d '' source_entry; do
    source_kind="${source_entry%%$'\t'*}"
    source_root="${source_entry#*$'\t'}"
    [[ -d "$source_root" ]] || continue
    /usr/bin/find "$source_root" -type f \( -name "${executable}*.ips" -o -name "${executable}*.crash" \) -newer "${folder}/started.marker" -print0 2>> "$LOG_FILE" |
      while IFS= read -r -d '' source_file; do
        owner_code=0
        owner_reason="$(crash_report_ownership "$source_file" "$identity_scratch" "$source_kind")" || owner_code=$?
        case "$owner_code" in
          0)
            log "➤ 已确认目标 App 诊断来源：${source_file} → ${folder}/CrashReports/"
            cp -p "$source_file" "${folder}/CrashReports/" || log "⚠ 复制诊断报告失败：$source_file"
            ;;
          1)
            log "ℹ 跳过非本次目标的诊断报告：${source_file}；${owner_reason}"
            ;;
          *)
            uncertain_folder="${folder}/CrashReports/归属未确认"
            mkdir -p "$uncertain_folder" || {
              log "⚠ 无法创建归属未确认目录，未复制候选：$source_file"
              continue
            }
            if [[ ! -f "${uncertain_folder}/归属说明.txt" ]]; then
              printf '%s\n' '此处仅为文件名与时间匹配的候选报告，尚未确认目标 App 与所选模拟器归属。' '不能据此自动认定当前 App 崩溃；需结合 Bundle ID、设备、时间和本轮步骤人工核对。' > "${uncertain_folder}/归属说明.txt"
            fi
            log "⚠ 诊断归属未确认，单独保留候选：${source_file}；${owner_reason}"
            if cp -p "$source_file" "$uncertain_folder/"; then
              printf '%s\t%s\t%s\n' "${source_file:t}" "$owner_reason" "$source_file" >> "${uncertain_folder}/归属说明.txt"
            else
              log "⚠ 复制归属未确认报告失败：$source_file"
            fi
            ;;
        esac
      done
  done < <(simulator_crash_report_sources)
  /bin/rm -f "${identity_scratch}/header.json" "${identity_scratch}/body.json"
  /bin/rmdir "$identity_scratch" 2>/dev/null || log "⚠ 诊断核对临时目录未清理：$identity_scratch"
  return 0
}
# 只接受本轮 Runner 发出的开始事件；框架的 Running tests 不是此标记。
has_runner_started() {
  [[ -f "$1" ]] || return 1
  /usr/bin/grep -q 'JOBS_CRAWL_EVENT .*"event"[[:space:]]*:[[:space:]]*"started"' "$1"
}
# 最终汇总缺失时仍显示已完成动作，不能用这个计数替代完成条件。
completed_action_count() {
  local events_file="$1" entry scratch="${LOG_FILE:h}/count-event.json" count=0 kind
  while IFS= read -r entry || [[ -n "$entry" ]]; do
    print -r -- "$entry" > "$scratch"
    [[ "$(json_value "$scratch" event string)" == action && "$(json_value "$scratch" phase string)" == completed ]] || continue
    kind="$(json_value "$scratch" action.kind string)" || continue
    [[ -n "$kind" && "$kind" != launch ]] || continue
    (( count += 1 ))
  done < <(/usr/bin/grep -E '"event"[[:space:]]*:[[:space:]]*"action"' "$events_file" | /usr/bin/grep -E '"phase"[[:space:]]*:[[:space:]]*"completed"')
  print -r -- "$count"
}
# 初始化故障没有进入测试方法，不把 Runner 的系统崩溃归到业务 App。
runner_initialization_failed() {
  local test_code="$1" build_log="$2"
  [[ "$test_code" == <-> && "$test_code" != 0 && -f "$build_log" ]] || return 1
  has_runner_started "$build_log" && return 1
  [[ ! -f "${build_log:h}/Runner启动超时.txt" ]] || return 0
  /usr/bin/grep -F -q -e 'The test runner crashed while preparing to run tests:' -e 'Test crashed with signal kill before establishing connection.' "$build_log"
}
# 仅在巡检已开始时识别当前 App 的明确启动超时，保留既有点击证据。
target_launch_timed_out() {
  local test_code="$1" build_log="$2"
  [[ "$test_code" == <-> && "$test_code" != 0 && -f "$build_log" ]] || return 1
  has_runner_started "$build_log" || return 1
  /usr/bin/grep -F -q "Failed to launch ${BUNDLE_ID}: Timed out attempting to launch app." "$build_log"
}
# 等待 Runner 时定期说明阶段；只约束 Running tests 后的预测试初始化。
monitor_runner_startup() {
  local tracked_pid="$1" build_log="$2" finished_marker="$3" now next_notice=0 waiting_since=0 entered=0 timed_out=0
  local progress_file="${4:-}" expected_cases="${5:-0}" progress_time=0 progress_phase="" progress_done=0 entered_at=0 progress_limit
  while [[ ! -f "$finished_marker" ]] && kill -0 "$tracked_pid" 2>/dev/null; do
    now="$(/bin/date +%s)"
    if has_runner_started "$build_log"; then
      if (( entered == 0 )); then
        log '✔ 已进入巡检逻辑；接下来以动作记录和最终结果判断完成状态。'
        entered=1
        entered_at="$now"
      fi
      if [[ "$PROFILE" == coverage ]] && (( timed_out == 0 )); then
        progress_time="$entered_at"
        progress_phase=unknown
        if [[ -n "$progress_file" && -f "$progress_file" ]]; then
          IFS=$'\t' read -r progress_time progress_phase progress_done < "$progress_file"
          [[ "$progress_time" == <-> && "$progress_phase" == (started|finished) ]] || return 1
        fi
        progress_limit="$RUNNER_START_TIMEOUT"
        if [[ "$progress_phase" == started ]]; then
          progress_limit=$(( 10#$SECONDS_LIMIT + 120 + RUNNER_START_TIMEOUT ))
        elif [[ "$progress_done" == <-> && "$expected_cases" == <-> ]] && (( expected_cases > 0 && progress_done >= expected_cases )); then
          progress_limit="$RUNNER_FINALIZATION_TIMEOUT"
        fi
        if (( now - progress_time >= progress_limit )); then
          print -r -- "确定性场景调度等待超时（阶段=${progress_phase}，等待=${progress_limit}秒）；停止本批主机测试进程树，未开始场景仍保留，不将它们记作通过。" > "${build_log:h}/场景调度超时.txt"
          log '⚠ 完整清单的场景进度等待到限；结束当前批次并保留独立证据。'
          stop_process_tree "$tracked_pid"
          timed_out=1
        fi
      fi
    elif (( entered == 0 && timed_out == 0 )); then
      if (( waiting_since == 0 )) && /usr/bin/grep -F -q 'Running tests...' "$build_log"; then
        waiting_since="$now"
      fi
      if (( now >= next_notice )); then
        if (( waiting_since > 0 )); then
          log "ℹ 正在等待 Runner 初始化与测试连接（${RUNNER_START_TIMEOUT} 秒上限）；尚未开始自动点击。"
        else
          log 'ℹ 正在构建、安装或启动测试 Runner；尚未收到巡检 started 事件。'
        fi
        next_notice=$(( now + RUNNER_HEARTBEAT_INTERVAL ))
      fi
      if (( waiting_since > 0 && now - waiting_since >= RUNNER_START_TIMEOUT )) && ! has_runner_started "$build_log"; then
        print -r -- "Runner 启动等待超时：框架 Running tests 后 ${RUNNER_START_TIMEOUT} 秒仍无巡检 started；仅停止本次主机测试进程树，已有结果保留，不能视为业务 App 崩溃。" > "${build_log:h}/Runner启动超时.txt"
        log '⚠ Runner 初始化等待超时；正在结束本次测试并保留已有日志。'
        stop_process_tree "$tracked_pid"
        timed_out=1
      fi
    fi
    sleep "$RUNNER_MONITOR_INTERVAL"
  done
}
# 实时显示日志并单独落场景进度，避免大日志滚动后丢失最后的结构化事件。
stream_test_log() {
  local build_log="$1" progress_file="$2" line phase completed_count=0
  trap - INT TERM
  /usr/bin/tail -n +1 -f "$build_log" |
    while IFS= read -r line; do
      print -r -- "$line"
      [[ "$PROFILE" == coverage && "$line" == *'JOBS_CRAWL_EVENT '* ]] || continue
      if [[ "$line" == *'"event":"scene_started"'* ]]; then
        phase=started
      elif [[ "$line" == *'"event":"scene_finished"'* ]]; then
        phase=finished
        (( completed_count += 1 ))
      else
        continue
      fi
      printf '%s\t%s\t%s\n' "$(/bin/date +%s)" "$phase" "$completed_count" > "${progress_file}.tmp"
      /bin/mv -f "${progress_file}.tmp" "$progress_file"
    done
}

# 只在同一安装错误块确认免费签名名额限制，不把普通安装失败算作此类。
free_profile_install_limit() {
  local test_code="$1" build_log="$2"
  [[ "$PLATFORM" == device && "$test_code" == <-> && "$test_code" != 0 && -f "$build_log" ]] || return 1
  /usr/bin/grep -q 'JOBS_CRAWL_EVENT .*"event"[[:space:]]*:[[:space:]]*"started"' "$build_log" && return 1
  /usr/bin/awk '
    /^--[[:space:]]*$/ { domain=0; code=0; limit=0 }
    /^Domain:/ { domain=($0 ~ /^Domain: MIInstallerErrorDomain[[:space:]]*$/); code=0 }
    /^Code:/ { code=($0 ~ /^Code: 13[[:space:]]*$/) }
    index($0, "This device has reached the maximum number of installed apps using a free developer profile") { limit=1 }
    domain && code && limit { found=1 }
    END { exit !found }
  ' "$build_log"
}
# 只识别当前 Runner 在测试开始前缺少描述文件的明确构建错误。
missing_runner_profile() {
  local test_code="$1" build_log="$2" line found=0 expected="No profiles for '${RUNNER_ID}.xctrunner' were found:"
  local alternate="No profiles for '${RUNNER_ID}' were found:"
  [[ "$PLATFORM" == device && "$test_code" == 65 && -f "$build_log" ]] || return 1
  /usr/bin/grep -q 'JOBS_CRAWL_EVENT .*"event"[[:space:]]*:[[:space:]]*"started"' "$build_log" && return 1
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ "$line" == *"$expected"* || "$line" == *"$alternate"* ]] || return 1
    [[ "$line" != *'Automatic signing is disabled and unable to generate a profile.'* ]] || found=1
  done < <(/usr/bin/grep -F 'error:' "$build_log")
  (( found ))
}
# 保持已确认的团队和 Runner 身份，不能把原生设置改动静默带入重试。
runner_setup_matches_plan() {
  local project_file="${LOG_FILE:h}/RunnerSetup/JobsCrashCrawler.xcodeproj/project.pbxproj" setup_team setup_id
  [[ -f "$project_file" ]] || return 0
  setup_team="$(configuration_value "$project_file" 100000000000000000000020 DEVELOPMENT_TEAM)"
  setup_id="$(configuration_value "$project_file" 100000000000000000000020 PRODUCT_BUNDLE_IDENTIFIER)"
  if [[ "$setup_team" != "$TEAM" || "$setup_id" != "$RUNNER_ID" ]]; then
    log '⚠ 准备副本的团队或 Runner 身份已改变；请重新打开预填副本，按当前计划完成准备后再重试。'
    return 1
  fi
  return 0
}
# 签名准备失败后提供同会话修复；权限不升级，除非再次明确授权。
recover_runner_signing() {
  local code
  log '⚠ 本机没有当前独立 Runner 的描述文件，尚未开始自动点击；主 App 已安装不代表 Runner 签名已准备好。'
  log '➤ 可以在本轮准备签名后重试一次；原始失败结果将完整保留，不需要重选工程、手机和强度。'
  while true; do
    printf 'automatic\t允许 Xcode 自动准备签名并重试（下一屏空格授权）\nsetup\t打开已预填的 Runner 工程，用 Xcode 准备签名\nexisting\t已在 Xcode 完成签名准备，使用已有签名重试一次\n' | pick_one 'Runner 描述文件缺失，选择修复方式' no
    code=$?
    (( code == 0 )) || cancel_selection "$code"
    case "$SELECTION" in
      automatic)
        confirm_signing_updates
        SIGNING_MODE=automatic
        ALLOW_PROVISIONING=1
        return 0
        ;;
      setup) open_runner_setup ;;
      existing)
        runner_setup_matches_plan || continue
        SIGNING_MODE=existing
        ALLOW_PROVISIONING=0
        return 0
        ;;
      *) die '签名修复菜单返回了未知选项。' ;;
    esac
  done
}
# 每次使用独立结果路径；第一次准备失败的证据不覆盖、不删除。
archive_signing_attempt() {
  local archive="${RUN_DIR}/SigningAttempts/attempt-1"
  [[ ! -e "$archive" ]] || die '本轮已有签名恢复记录，停止以避免覆盖。'
  mkdir -p "${archive:h}" || die '无法创建签名恢复记录目录。'
  mv "${RUN_DIR}/app" "$archive" || die '无法保留原始签名失败结果。'
  /usr/bin/sed -n 's/^.*JOBS_CRAWL_EVENT //p' "${archive}/xcodebuild.log" > "${archive}/events.jsonl"
  print -r -- '准备失败：Runner 描述文件缺失，自动点击尚未开始；原始结果保留于 SigningAttempts/attempt-1/，接下来最多重试一次。' >> "${RUN_DIR}/总览.txt"
  log "➤ 首次签名失败证据：$archive；即将进行本轮唯一一次重试。"
}
# 单次构建与测试共享原计划，退出码交给调用方判断是否允许恢复。
run_test_attempt() {
  local folder test_code timeout_limit
  local -a platform_args case_args
  local runner_project="${SCRIPT_DIR}/Runner/JobsCrashCrawler.xcodeproj"
  if [[ "$PROFILE" == coverage ]]; then
    runner_project="$COVERAGE_PROJECT"
    [[ -s "$COVERAGE_FILTER" && -d "$runner_project" ]] || die '确定性 Runner 或筛选清单缺失。'
    case_args=("${(@f)$(cat "$COVERAGE_FILTER")}")
    local filter
    for filter in "${case_args[@]}"; do
      [[ "$filter" =~ '^-only-testing:JobsCrashCrawler/JobsCrashCrawlerTests/testCoverage_[0-9]+$' ]] || die '场景筛选参数无效。'
    done
  fi
  if [[ "$PLATFORM" == simulator ]]; then
    platform_args=(-sdk iphonesimulator -destination "platform=iOS Simulator,id=${DEVICE}" CODE_SIGNING_ALLOWED=NO)
  else
    platform_args=(-sdk iphoneos -destination "platform=iOS,id=${DEVICE}" CODE_SIGNING_ALLOWED=YES CODE_SIGN_STYLE=Automatic "DEVELOPMENT_TEAM=${TEAM}" "PRODUCT_BUNDLE_IDENTIFIER=${RUNNER_ID}")
    (( ALLOW_PROVISIONING == 0 )) || platform_args+=(-allowProvisioningUpdates)
  fi
  timeout_limit=$(( 10#$SECONDS_LIMIT + 120 ))
  folder="${COVERAGE_ATTEMPT_FOLDER:-${RUN_DIR}/app}"
  mkdir -p "$folder" || die "无法创建 $folder"
  [[ ! -e "${folder}/host-finished.marker" && ! -e "${folder}/Runner启动超时.txt" ]] || die '本次结果目录已有启动监控标记，停止以避免混用旧状态。'
  touch "${folder}/started.marker"
  : > "${folder}/xcodebuild.log"
  CURRENT_BUNDLE="$BUNDLE_ID"
  printf 'project=%s\nname=%s\nbundleID=%s\nplatform=%s\ndevice=%s\nteam=%s\nrunnerID=%s\nallowProvisioningUpdates=%s\nseed=%s\nsteps=%s\nseconds=%s\n' "$PROJECT_ID" "$TARGET_NAME" "$BUNDLE_ID" "$PLATFORM" "$DEVICE" "$TEAM" "$RUNNER_ID" "$ALLOW_PROVISIONING" "$SEED" "$STEPS" "$SECONDS_LIMIT" > "${folder}/参数.txt"
  log "➤ 开始 ${TARGET_NAME}；实时日志和结果保存到 ${folder}"
  /usr/bin/env "TEST_RUNNER_JOBS_CRAWL_BUNDLE_ID=${BUNDLE_ID}" "TEST_RUNNER_JOBS_CRAWL_STEPS=${STEPS}" \
    "TEST_RUNNER_JOBS_CRAWL_SEED=${SEED}" "TEST_RUNNER_JOBS_CRAWL_SECONDS=${SECONDS_LIMIT}" "TEST_RUNNER_JOBS_CRAWL_DEPTH=8" "TEST_RUNNER_JOBS_COVERAGE_MANIFEST_DIGEST=${COVERAGE_DIGEST}" \
    xcrun xcodebuild test -project "$runner_project" -scheme JobsCrashCrawler \
    -configuration Debug "${platform_args[@]}" "${case_args[@]}" -destination-timeout 60 \
    -derivedDataPath "${RUN_DIR}/DerivedData" -resultBundlePath "${folder}/TestResults.xcresult" \
    -parallel-testing-enabled NO -maximum-concurrent-test-simulator-destinations 1 \
    -test-timeouts-enabled YES -default-test-execution-time-allowance "$timeout_limit" \
    -maximum-test-execution-time-allowance "$timeout_limit" \
    > "${folder}/xcodebuild.log" 2>&1 &
  TEST_PID=$!
  stream_test_log "${folder}/xcodebuild.log" "${folder}/场景进度.txt" &
  DISPLAY_PID=$!
  monitor_runner_startup "$TEST_PID" "${folder}/xcodebuild.log" "${folder}/host-finished.marker" "${folder}/场景进度.txt" "${#case_args}" &
  STARTUP_MONITOR_PID=$!
  wait "$TEST_PID"
  test_code=$?
  TEST_PID=""
  touch "${folder}/host-finished.marker"
  wait "$STARTUP_MONITOR_PID" 2>/dev/null
  STARTUP_MONITOR_PID=""
  stop_process_tree "$DISPLAY_PID"
  wait "$DISPLAY_PID" 2>/dev/null
  DISPLAY_PID=""
  cat "${folder}/xcodebuild.log" >> "$LOG_FILE"
  print -r -- "$test_code" > "${folder}/退出状态.txt"
  if [[ "$PLATFORM" == device && ( -f "${folder}/场景调度超时.txt" || -f "${folder}/Runner启动超时.txt" ) ]]; then
    if ! stop_device_runner; then
      COVERAGE_RUNNER_STOP_BLOCKED=1
      print -r -- '本批真机 Runner 停止未确认；已有结果保留，禁止继续启动其它批次。' > "${folder}/Runner停止未确认.txt"
    fi
  fi
  CURRENT_BUNDLE=""
  return "$test_code"
}
# 只编译本包原生辅助工具并冻结本轮源码与场景清单，不启动业务 App。
prepare_coverage_plan() {
  [[ "$PROFILE" == coverage ]] || return 0
  local tool_source="${SCRIPT_DIR}/Coverage/CoverageTool.swift/CoverageTool.swift"
  local plan_metadata="${LOG_FILE:h}/CoveragePlanMetadata.json"
  [[ -f "$tool_source" && -f "${SCRIPT_DIR}/Coverage/routes.json" && -f "${SCRIPT_DIR}/Coverage/Flows.json" ]] || die '覆盖清单或本包工具缺失。'
  COVERAGE_TOOL="${LOG_FILE:h}/CoverageTool"
  COVERAGE_MANIFEST="${LOG_FILE:h}/CoverageManifest.json"
  log '➤ 正在核对本工程的页面、流程和手势清单。'
  xcrun swiftc -parse-as-library "$tool_source" -o "$COVERAGE_TOOL" >> "$LOG_FILE" 2>&1 || die '覆盖工具编译失败，详情见会话日志。'
  "$COVERAGE_TOOL" plan --routes "${SCRIPT_DIR}/Coverage/routes.json" --flows "${SCRIPT_DIR}/Coverage/Flows.json" \
    --platform "$PLATFORM" --source-root "$HOST_ROOT" --project "$PROJECT_ID" --output "$COVERAGE_MANIFEST" > "$plan_metadata" 2>> "$LOG_FILE" || die '覆盖计划校验失败；没有启动测试，请查看日志。'
  cat "$plan_metadata" >> "$LOG_FILE"
  local catalog_verified
  catalog_verified="$(/usr/bin/plutil -extract catalogVerified raw -o - "$plan_metadata" 2>/dev/null)"
  [[ "$catalog_verified" == true ]] || die '覆盖清单尚未冻结到当前源码，本次不启动测试；请先同步页面与流程清单。'
  COVERAGE_DIGEST="$(/usr/bin/plutil -extract manifestDigest raw -o - "$plan_metadata" 2>/dev/null)"
  [[ "$COVERAGE_DIGEST" =~ '^[a-f0-9]{64}$' ]] || die '覆盖计划身份缺失。'
  local scene_count pending_count
  scene_count="$(/usr/bin/plutil -extract scenarioCount raw -o - "$plan_metadata" 2>/dev/null)"
  pending_count="$(/usr/bin/plutil -extract pendingCount raw -o - "$plan_metadata" 2>/dev/null)"
  log "➤ 本平台 ${scene_count} 个确定性场景；待适配 ${pending_count} 项。存在待适配项时全量结果不能通过。"
  # 工具在清单之外输出简洁中文计划，原始 JSON 同步保留供复核。
  log "➤ 已生成独立场景计划；完整清单将在本轮报告 CoverageManifest.json 保存。"
}

# 生成的 XCTest 方法只写本轮副本，避免把其它工程的清单带入原始 Runner。
prepare_coverage_runner() {
  local destination="${RUN_DIR}/RunnerPrepared"
  [[ ! -e "$destination" ]] || die '本轮 RunnerPrepared 已存在，停止以避免混用。'
  cp -R "${SCRIPT_DIR}/Runner" "$destination" || die '无法准备本轮独立 Runner。'
  cp "$COVERAGE_MANIFEST" "${RUN_DIR}/CoverageManifest.json" || die '无法保存本轮覆盖计划。'
  COVERAGE_MANIFEST="${RUN_DIR}/CoverageManifest.json"
  COVERAGE_MAP="${RUN_DIR}/CoverageMap.json"
  "$COVERAGE_TOOL" generate --manifest "$COVERAGE_MANIFEST" --project "$PROJECT_ID" --source-root "$HOST_ROOT" \
    --template "${SCRIPT_DIR}/Runner/JobsCrashCrawlerTests.swift" --output "${destination}/JobsCrashCrawlerTests.swift" --map "$COVERAGE_MAP" >> "$LOG_FILE" 2>&1 || die '无法生成逐场景测试。'
  COVERAGE_PROJECT="${destination}/JobsCrashCrawler.xcodeproj"
  COVERAGE_EVENTS="${RUN_DIR}/CoverageEvents.jsonl"
  COVERAGE_FILTER="${RUN_DIR}/CoverageRemaining.txt"
  : > "$COVERAGE_EVENTS"
  "$COVERAGE_TOOL" remaining --manifest "$COVERAGE_MANIFEST" --project "$PROJECT_ID" --events "$COVERAGE_EVENTS" --map "$COVERAGE_MAP" --source-root "$HOST_ROOT" --output "$COVERAGE_FILTER" >> "$LOG_FILE" 2>&1 || die '无法生成待执行场景列表。'
}

# 正常一批执行；批次中断后只调度尚未开始的场景，已经失败的场景不会被重跑掩盖。
run_coverage_tests() {
  prepare_coverage_runner
  local attempt=1 test_code aggregate_code=0 before_count after_count folder report_code
  while [[ -s "$COVERAGE_FILTER" ]]; do
    before_count="$(/usr/bin/wc -l < "$COVERAGE_FILTER" | /usr/bin/tr -d ' ')"
    if (( attempt == 1 )); then
      COVERAGE_ATTEMPT_FOLDER="${RUN_DIR}/app"
    else
      COVERAGE_ATTEMPT_FOLDER="${RUN_DIR}/CoverageAttempts/attempt-${attempt}"
    fi
    folder="$COVERAGE_ATTEMPT_FOLDER"
    log "➤ 第 ${attempt} 批：${before_count} 个尚未开始的独立场景；每个场景单独记录结果。"
    run_test_attempt
    test_code=$?
    if (( attempt == 1 && ALLOW_PROVISIONING == 0 )) && missing_runner_profile "$test_code" "${folder}/xcodebuild.log"; then
      recover_runner_signing || die '签名准备没有完成；覆盖测试未开始。'
      archive_signing_attempt
      run_test_attempt
      test_code=$?
    fi
    (( test_code == 0 )) || aggregate_code=1
    if (( test_code != 0 )) && ! has_runner_started "${folder}/xcodebuild.log"; then
      if free_profile_install_limit "$test_code" "${folder}/xcodebuild.log"; then
        log "⚠ 第 ${attempt} 批未测试：免费开发签名 App 安装名额已满；请按教程处理不再使用的测试 App，本工具不自动删除。"
        print -r -- "第 ${attempt} 批未测试：Runner 安装名额已满，场景尚未开始。" >> "${RUN_DIR}/总览.txt"
      elif runner_initialization_failed "$test_code" "${folder}/xcodebuild.log"; then
        log "⚠ 第 ${attempt} 批未测试：Runner 初始化失败或等待超时，不能认定为业务 App 崩溃。"
        print -r -- "第 ${attempt} 批未测试：Runner 初始化未完成，查看该批原始日志与结果包。" >> "${RUN_DIR}/总览.txt"
      else
        log "⚠ 第 ${attempt} 批未开始场景：请查看构建、签名或设备连接日志，不能将准备失败认定为页面崩溃。"
      fi
    fi
    /usr/bin/sed -n 's/^.*JOBS_CRAWL_EVENT //p' "${folder}/xcodebuild.log" > "${folder}/events.jsonl"
    cat "${folder}/events.jsonl" >> "$COVERAGE_EVENTS"
    collect_crash_reports "$folder" "$APP_PATH"
    "$COVERAGE_TOOL" remaining --manifest "$COVERAGE_MANIFEST" --project "$PROJECT_ID" --events "$COVERAGE_EVENTS" --map "$COVERAGE_MAP" --source-root "$HOST_ROOT" --output "$COVERAGE_FILTER" >> "$LOG_FILE" 2>&1 || die '无法核对尚未执行场景，保留所有已有结果。'
    after_count="$(/usr/bin/wc -l < "$COVERAGE_FILTER" | /usr/bin/tr -d ' ')"
    if (( COVERAGE_RUNNER_STOP_BLOCKED )); then
      aggregate_code=1
      log '⚠ 本批真机 Runner 停止未确认；后续场景保持未开始，已有结果继续生成报告。'
      break
    fi
    (( after_count > 0 )) || break
    if (( after_count >= before_count )); then
      log '⚠ 本批没有新增场景开始事件；停止继续启动 Runner，剩余项保持未测试。'
      break
    fi
    (( attempt += 1 ))
  done
  "$COVERAGE_TOOL" report --manifest "$COVERAGE_MANIFEST" --project "$PROJECT_ID" --source-root "$HOST_ROOT" \
    --events "$COVERAGE_EVENTS" --xcode-exit "$aggregate_code" --output "${RUN_DIR}/CoverageReport.json" >> "$LOG_FILE" 2>&1
  report_code=$?
  print -r -- "$report_code" > "${RUN_DIR}/CoverageReport退出状态.txt"
  if (( report_code == 0 )); then
    log '✔ 本平台声明清单的全部必需场景通过；请查看覆盖报告中的实际页面、流程和手势明细。'
    print -r -- '确定性覆盖：本平台声明清单全部通过；不适用项单列，不算通过。详见 CoverageReport.json。' >> "${RUN_DIR}/总览.txt"
  elif (( report_code == 1 )) && [[ -f "${RUN_DIR}/CoverageReport.json" ]]; then
    FINAL_CODE=1
    log '⚠ 覆盖未完成或发现失败；未开始、失败和待适配项均保留在 CoverageReport.txt，不能算全量通过。'
    print -r -- '确定性覆盖：未完成或失败；请先查看 CoverageReport.txt，不把部分通过当成全部覆盖。' >> "${RUN_DIR}/总览.txt"
  else
    FINAL_CODE=1
    log "⚠ 覆盖报告生成失败（状态 ${report_code}）；请查看 session.log、CoverageEvents.jsonl 和各批原始结果，不能据此认定通过。"
    print -r -- "确定性覆盖：报告生成失败（状态 ${report_code}），请检查会话日志与原始事件；不能算全量通过。" >> "${RUN_DIR}/总览.txt"
  fi
}

# 只运行当前 App；仅未开始测试的明确签名准备失败可恢复一次。
run_tests() {
  (( APP_READY )) || return 0
  if [[ "$PROFILE" == coverage ]]; then
    run_coverage_tests
    return
  fi
  local folder="${RUN_DIR}/app" test_code
  run_test_attempt
  test_code=$?
  if (( ALLOW_PROVISIONING == 0 )) && missing_runner_profile "$test_code" "${folder}/xcodebuild.log"; then
    recover_runner_signing || die '签名准备没有完成；保留原始结果，本轮不重试。'
    archive_signing_attempt
    run_test_attempt
    test_code=$?
  fi
  summarize_target "$test_code"
  if [[ "$PLATFORM" == device && "$test_code" != 0 ]] && ! has_runner_started "${folder}/xcodebuild.log" && ! free_profile_install_limit "$test_code" "${folder}/xcodebuild.log" && ! runner_initialization_failed "$test_code" "${folder}/xcodebuild.log"; then
    log '➤ 本轮已保留失败结果，不再自动重试。签名或安装问题先核对 Xcode 账号、证书与描述文件；不需要手填 Team ID，也不等于 App 崩溃。'
  fi
  collect_crash_reports "$folder" "$APP_PATH"
}
# 保存当前工程的总览和会话日志，打开结果目录并保留失败状态。
finish_run() {
  printf '\n本工程巡检已结束。退出状态：%s（0=所选计划完成，1=未测/未完成/失败）。\n完整清单按 CoverageReport.json 核对；补充探索不提供全量覆盖结论。进程退出和超时均需结合日志判断。\n' "$FINAL_CODE" >> "${RUN_DIR}/总览.txt"
  log "➤ 巡检结束，结果：${RUN_DIR}/总览.txt"
  cp "$LOG_FILE" "${RUN_DIR}/session.log" || die '会话日志复制失败。'
  open "$RUN_DIR" >> "$LOG_FILE" 2>&1 || log '⚠ 结果目录未能自动打开，请按上方路径手动打开。'
  exit "$FINAL_CODE"
}
# 编排自述、只读预检、可返回选择、执行确认和结果保存。
main() {
  show_script_intro_and_wait "$@" # 先说明自动操作范围并阻断误触。
  initialize_runtime # 确认后初始化日志和中止处理。
  parse_arguments "$@" # 校验参数并提供本轮种子。
  check_environment # 验证必要工具链，检查模式在此结束。
  select_plan # 形成可返回的平台、设备与强度计划。
  prepare_coverage_plan # 冻结本工程确定性清单；补充探索不执行。
  prepare_signing # 自动读取真机签名并用菜单选择准备方式，模拟器保持无签名。
  confirm_plan # 展示实际目标和预算，确认后创建报告。
  prepare_app # 按平台预检当前工程 App，模拟器按需启动。
  run_tests # 操作当前工程 App 并保留结果包与动作记录。
  finish_run # 汇总结果并传播真实完成状态。
}

main "$@"
