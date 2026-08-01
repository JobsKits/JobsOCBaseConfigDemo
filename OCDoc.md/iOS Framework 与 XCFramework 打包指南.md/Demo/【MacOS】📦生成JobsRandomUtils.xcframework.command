# shell: zsh
# 脚本自述：
# - 脚本名称：【MacOS】📦生成JobsRandomUtils.xcframework.command
# - 核心用途：从当前 OC workspace 的 JobsRandomUtils Pod Scheme 归档真机与模拟器切片，生成可分发 XCFramework。
# - 影响范围：只写入仓库 build/XCFrameworkDemo 忽略目录和系统临时日志，不修改源码、Podfile、Pods 工程或签名配置。
# - 运行提示：运行后会先打印内置自述；按回车确认后才开始归档，可按 Ctrl+C 取消。

readonly SCRIPT_DIR="${0:A:h}"
readonly SCRIPT_PATH="${0:A}"
readonly SCRIPT_BASENAME="${0:t:r}"
readonly REPO_ROOT="${SCRIPT_DIR:h:h:h}"
readonly WORKSPACE_PATH="${REPO_ROOT}/JobsOCBaseConfigDemo.xcworkspace"
readonly SCHEME_NAME="JobsRandomUtils"
readonly PRODUCT_NAME="JobsRandomUtils"
readonly CONSUMER_DEMO_PATH="${SCRIPT_DIR}/JobsRandomUtilsConsumerDemo.m"
readonly LOG_FILE="${TMPDIR:-/tmp}/${SCRIPT_BASENAME}.log"

typeset OUTPUT_BASE=""
typeset RUN_ID=""
typeset RUN_ROOT=""
typeset DEVICE_ARCHIVE_PATH=""
typeset SIMULATOR_ARCHIVE_PATH=""
typeset XCFRAMEWORK_PATH=""
typeset ZIP_PATH=""
typeset CHECKSUM_PATH=""
typeset DEPLOYMENT_TARGET=""
typeset SIMULATOR_FRAMEWORK_DIR=""

# 同步输出到终端与系统临时日志。
log() {
  print -r -- "$1" | tee -a "$LOG_FILE"
}
# 输出信息日志。
info_echo() {
  log "ℹ $1"
}
# 输出成功日志。
success_echo() {
  log "✔ $1"
}
# 输出错误日志。
error_echo() {
  log "✖ $1"
}
# 输出步骤说明。
note_echo() {
  log "➤ $1"
}
# 去除拖入路径可能携带的首尾引号和换行。
strip_outer_quotes() {
  local value="$1"
  value="${value%$'\r'}"
  value="${value%$'\n'}"
  value="${value#\"}"
  value="${value%\"}"
  value="${value#\'}"
  value="${value%\'}"
  print -r -- "$value"
}
# 打印运行时内置自述，并等待用户确认。
show_script_intro_and_wait() {
  print -r -- "============================== 脚本自述 =============================="
  print -r -- "当前脚本：${SCRIPT_PATH}"
  print -r -- "核心用途：归档 JobsRandomUtils 的 iOS 真机与模拟器切片，并生成 XCFramework、ZIP 和 SHA-256。"
  print -r -- "影响范围：只写入仓库 build/XCFrameworkDemo 忽略目录，不修改工程配置或源码。"
  print -r -- "日志位置：${LOG_FILE}"
  print -r -- "取消方式：按 Ctrl+C 终止；确认前不会执行归档或写入构建目录。"
  print -r -- "======================================================================="
  if [[ ! -t 0 ]]; then
    print -r -- "✖ 当前没有可交互输入，请在终端中运行本脚本。"
    return 1
  fi
  read -r "?👉 已了解脚本用途与影响，按回车继续；按 Ctrl+C 取消：" _
}
# 初始化日志、输出目录和本轮构建路径。
initialize_runtime() {
  setopt NO_NOMATCH
  setopt PIPE_FAIL
  : > "$LOG_FILE"
  local requested_output="${1:-${REPO_ROOT}/build/XCFrameworkDemo}"
  OUTPUT_BASE="$(strip_outer_quotes "$requested_output")"
  RUN_ID="$(date '+%Y%m%d-%H%M%S')"
  RUN_ROOT="${OUTPUT_BASE}/${SCHEME_NAME}/${RUN_ID}"
  DEVICE_ARCHIVE_PATH="${RUN_ROOT}/Archives/${PRODUCT_NAME}-iOS.xcarchive"
  SIMULATOR_ARCHIVE_PATH="${RUN_ROOT}/Archives/${PRODUCT_NAME}-iOS-Simulator.xcarchive"
  XCFRAMEWORK_PATH="${RUN_ROOT}/${PRODUCT_NAME}.xcframework"
  ZIP_PATH="${RUN_ROOT}/${PRODUCT_NAME}.xcframework.zip"
  CHECKSUM_PATH="${ZIP_PATH}.sha256"
}
# 检查 Xcode 命令、workspace、Scheme 和消费者示例是否可用。
check_environment() {
  local required_command=""
  for required_command in xcodebuild xcrun ditto shasum plutil file; do
    if ! command -v "$required_command" >/dev/null 2>&1; then
      error_echo "缺少命令：${required_command}"
      return 1
    fi
  done
  if [[ ! -d "$WORKSPACE_PATH" ]]; then
    error_echo "找不到 workspace：${WORKSPACE_PATH}"
    return 1
  fi
  if [[ ! -f "$CONSUMER_DEMO_PATH" ]]; then
    error_echo "找不到消费者 Demo：${CONSUMER_DEMO_PATH}"
    return 1
  fi
  if ! xcodebuild -workspace "$WORKSPACE_PATH" -list 2>>"$LOG_FILE" |
      grep -Eq "^[[:space:]]*${SCHEME_NAME}[[:space:]]*$"; then
    error_echo "workspace 中不存在 Scheme：${SCHEME_NAME}"
    return 1
  fi
  DEPLOYMENT_TARGET="$(
    xcodebuild \
      -workspace "$WORKSPACE_PATH" \
      -scheme "$SCHEME_NAME" \
      -configuration Release \
      -sdk iphonesimulator \
      -showBuildSettings 2>>"$LOG_FILE" |
      awk '/IPHONEOS_DEPLOYMENT_TARGET =/ { print $3; exit }'
  )"
  if [[ -z "$DEPLOYMENT_TARGET" ]]; then
    error_echo "无法读取 IPHONEOS_DEPLOYMENT_TARGET。"
    return 1
  fi
  success_echo "环境检查通过：Xcode $(xcodebuild -version | head -n 1)，iOS ${DEPLOYMENT_TARGET}+。"
}
# 创建本轮独立输出目录，避免覆盖历史产物。
prepare_output_directories() {
  mkdir -p "${RUN_ROOT}/Archives"
  info_echo "本轮输出目录：${RUN_ROOT}"
}
# 归档 iOS 真机 Framework 切片。
archive_device_framework() {
  note_echo "开始归档 iOS 真机切片。"
  xcodebuild archive \
    -workspace "$WORKSPACE_PATH" \
    -scheme "$SCHEME_NAME" \
    -configuration Release \
    -destination "generic/platform=iOS" \
    -archivePath "$DEVICE_ARCHIVE_PATH" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    CODE_SIGNING_ALLOWED=NO \
    ONLY_ACTIVE_ARCH=NO 2>&1 | tee -a "$LOG_FILE"
  local framework_path="${DEVICE_ARCHIVE_PATH}/Products/Library/Frameworks/${PRODUCT_NAME}.framework"
  if [[ ! -d "$framework_path" ]]; then
    error_echo "真机归档中没有找到 ${PRODUCT_NAME}.framework。"
    return 1
  fi
  success_echo "iOS 真机切片归档完成。"
}
# 归档 iOS Simulator Framework 切片。
archive_simulator_framework() {
  note_echo "开始归档 iOS Simulator 切片。"
  xcodebuild archive \
    -workspace "$WORKSPACE_PATH" \
    -scheme "$SCHEME_NAME" \
    -configuration Release \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "$SIMULATOR_ARCHIVE_PATH" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    CODE_SIGNING_ALLOWED=NO \
    ONLY_ACTIVE_ARCH=NO 2>&1 | tee -a "$LOG_FILE"
  local framework_path="${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/${PRODUCT_NAME}.framework"
  if [[ ! -d "$framework_path" ]]; then
    error_echo "模拟器归档中没有找到 ${PRODUCT_NAME}.framework。"
    return 1
  fi
  success_echo "iOS Simulator 切片归档完成。"
}
# 合并真机与模拟器归档，生成 XCFramework。
create_xcframework() {
  note_echo "开始生成 ${PRODUCT_NAME}.xcframework。"
  xcodebuild -create-xcframework \
    -archive "$DEVICE_ARCHIVE_PATH" \
    -framework "${PRODUCT_NAME}.framework" \
    -archive "$SIMULATOR_ARCHIVE_PATH" \
    -framework "${PRODUCT_NAME}.framework" \
    -output "$XCFRAMEWORK_PATH" 2>&1 | tee -a "$LOG_FILE"
  if [[ ! -d "$XCFRAMEWORK_PATH" ]]; then
    error_echo "XCFramework 未生成：${XCFRAMEWORK_PATH}"
    return 1
  fi
  success_echo "XCFramework 生成完成。"
}
# 验证 Info.plist、二进制架构、公开头、模块和消费者导入。
verify_xcframework() {
  note_echo "开始验证 XCFramework 结构与消费者 Demo。"
  plutil -lint "${XCFRAMEWORK_PATH}/Info.plist" 2>&1 | tee -a "$LOG_FILE"
  local binary_path=""
  while IFS= read -r -d '' binary_path; do
    file "$binary_path" | tee -a "$LOG_FILE"
    xcrun lipo -info "$binary_path" 2>&1 | tee -a "$LOG_FILE"
  done < <(find "$XCFRAMEWORK_PATH" -type f -name "$PRODUCT_NAME" -print0)
  if ! find "$XCFRAMEWORK_PATH" -type f -path '*/Headers/*' -print -quit |
      grep -q .; then
    error_echo "没有找到公开 Headers。"
    return 1
  fi
  if ! find "$XCFRAMEWORK_PATH" -type f -path '*/Modules/*' -print -quit |
      grep -q .; then
    error_echo "没有找到 Modules。"
    return 1
  fi
  SIMULATOR_FRAMEWORK_DIR="$(
    find "$XCFRAMEWORK_PATH" \
      -type d \
      -path '*simulator*' \
      -name "${PRODUCT_NAME}.framework" \
      -print \
      -quit
  )"
  if [[ -z "$SIMULATOR_FRAMEWORK_DIR" ]]; then
    error_echo "没有找到模拟器 Framework 切片。"
    return 1
  fi
  local simulator_sdk=""
  local simulator_arch=""
  simulator_sdk="$(xcrun --sdk iphonesimulator --show-sdk-path)"
  simulator_arch="$(uname -m)"
  xcrun clang \
    -fsyntax-only \
    -fmodules \
    -fobjc-arc \
    -isysroot "$simulator_sdk" \
    -target "${simulator_arch}-apple-ios${DEPLOYMENT_TARGET}-simulator" \
    -F "${SIMULATOR_FRAMEWORK_DIR:h}" \
    "$CONSUMER_DEMO_PATH" 2>&1 | tee -a "$LOG_FILE"
  success_echo "Info.plist、架构、公开头、模块与消费者导入验证通过。"
}
# 压缩 XCFramework 并生成 SHA-256 校验文件。
package_xcframework() {
  note_echo "开始压缩 XCFramework 并生成 SHA-256。"
  ditto -c -k --sequesterRsrc --keepParent "$XCFRAMEWORK_PATH" "$ZIP_PATH"
  shasum -a 256 "$ZIP_PATH" > "$CHECKSUM_PATH"
  success_echo "压缩包与校验文件生成完成。"
}
# 打印最终产物和日志位置。
show_summary() {
  success_echo "JobsRandomUtils XCFramework 打包完成。"
  info_echo "XCFramework：${XCFRAMEWORK_PATH}"
  info_echo "ZIP：${ZIP_PATH}"
  info_echo "SHA-256：${CHECKSUM_PATH}"
  info_echo "日志：${LOG_FILE}"
}
# 编排脚本确认、环境检查、双平台归档、合并、验证和打包流程。
main() {
  show_script_intro_and_wait # 先展示影响范围并等待回车，避免误触后直接构建。
  initialize_runtime "$@" # 确认后初始化日志与本轮独立输出路径。
  check_environment # 检查 Xcode、workspace、Scheme 和消费者示例。
  prepare_output_directories # 创建带时间戳的构建目录，保留历史产物。
  archive_device_framework # 生成 iOS 真机 Framework 归档。
  archive_simulator_framework # 生成 iOS Simulator Framework 归档。
  create_xcframework # 将两个平台变体组合为 XCFramework。
  verify_xcframework # 验证切片、公开头、模块并编译消费者示例。
  package_xcframework # 生成便于传输的 ZIP 和 SHA-256。
  show_summary # 输出最终产物和日志的准确位置。
}

main "$@"
