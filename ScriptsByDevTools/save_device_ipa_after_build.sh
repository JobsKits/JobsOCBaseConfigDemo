#!/usr/bin/env zsh
# shell: zsh
# 脚本自述：主 App 的真机 / 模拟器构建自动生成真机.ipa / 模拟器.ipa；打包成功后清空工程 build/ 全部内容，只放入本次产物。
# 运行提示：Xcode Build Phase 无交互执行；终端手动运行先确认。build/ 仅存放一次性产物，不能兼作 DerivedData。

typeset -g SCRIPT_PATH="${${(%):-%x}:A}"
typeset -g SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
typeset -g LOG_FILE=""
typeset -g STAGING_ROOT=""
typeset -g BUILD_KIND=""

# 展示清理范围；Xcode 自动执行，终端手动入口保留确认。
show_script_intro_and_wait() {
  print -r -- "ℹ 脚本：${SCRIPT_PATH:t}；真机 / 模拟器 App → Payload → 真机.ipa / 模拟器.ipa。"
  print -r -- "ℹ 影响范围：打包成功后清空工程 build/（含隐藏文件、子目录和旧平台包），仅保留本次 IPA。"
  print -r -- "ℹ 模拟器 IPA 是模拟器 App 快照，不能安装到真机；日志在系统临时目录的 ${SCRIPT_BASENAME}.log。"
  if [[ -n "${XCODE_VERSION_ACTUAL:-}" && -n "${TARGET_BUILD_DIR:-}" ]]; then
    print -r -- "ℹ Xcode 构建阶段无交互执行；可取消当前构建。"
    return 0
  fi
  [[ -t 0 ]] || {
    print -r -- "✖ 未识别为 Xcode 构建环境且没有可交互输入，请从 Xcode 或终端运行。"
    return 1
  }
  read -r "?👉 已了解用途和清理范围，按回车继续；按 Ctrl+C 取消：" _
}
# 初始化日志和 Shell 的运行策略。
initialize_runtime() {
  set -e
  setopt NO_NOMATCH PIPE_FAIL
  LOG_FILE="${TMPDIR:-/tmp}/${SCRIPT_BASENAME}.log"
  : >| "$LOG_FILE"
}
# 同步输出 Xcode 构建日志和临时日志文件。
log() {
  print -r -- "$*" | tee -a "$LOG_FILE"
}
# 仅移除本脚本创建的临时快照，失败时也不遗留大文件。
cleanup_staging() {
  if [[ -n "$STAGING_ROOT" && -d "$STAGING_ROOT" ]]; then
    /bin/rm -rf -- "$STAGING_ROOT"
  fi
}
# 定义脚本级退出钩子；zsh 函数内注册 EXIT 会在该函数结束时提前触发。
TRAPEXIT() {
  cleanup_staging
}
# zsh 的 ERR_EXIT 在函数失败时可能不触发 EXIT，因此单独清理失败快照。
TRAPZERR() {
  cleanup_staging
}
# 用户取消构建时清理快照，并保留中断退出状态。
TRAPINT() {
  cleanup_staging
  return 130
}
# Xcode 终止构建进程时清理快照，并保留终止退出状态。
TRAPTERM() {
  cleanup_staging
  return 143
}
# 判断当前是否为 iOS 主 App 构建，并解析产物平台名称。
is_ios_app_build() {
  [[ "${ACTION:-build}" != "clean" && "${WRAPPER_NAME:-}" == *.app ]] || return 1
  [[ -z "${PRODUCT_TYPE:-}" || "$PRODUCT_TYPE" == "com.apple.product-type.application" ]] || return 1
  case "${PLATFORM_NAME:-}" in
    iphoneos) BUILD_KIND="真机" ;;
    iphonesimulator) BUILD_KIND="模拟器" ;;
    *) return 1 ;;
  esac
}
# 定位 App 与固定 build/，拒绝清理软链接目录或正在使用的构建工作目录。
resolve_build_paths() {
  typeset project_root="${SRCROOT:-${PROJECT_DIR:-}}"
  [[ -n "$project_root" && -d "$project_root" && "${project_root:A}" != "/" ]] || {
    log "✖ 无法定位有效工程根目录：${project_root:-<empty>}"
    return 1
  }
  [[ -n "${TARGET_BUILD_DIR:-}" && "$WRAPPER_NAME" == "${WRAPPER_NAME:t}" ]] || {
    log "✖ 缺少 TARGET_BUILD_DIR 或 WRAPPER_NAME 不是 App 文件名。"
    return 1
  }
  typeset -g SOURCE_APP="${TARGET_BUILD_DIR}/${WRAPPER_NAME}"
  typeset -g OUTPUT_DIR="${project_root:A}/build"
  typeset -g OUTPUT_IPA="${OUTPUT_DIR}/${BUILD_KIND}.ipa"
  [[ -d "$SOURCE_APP" ]] || {
    log "✖ ${BUILD_KIND} App 不存在：${SOURCE_APP}"
    return 1
  }
  [[ ! -L "$OUTPUT_DIR" && ( ! -e "$OUTPUT_DIR" || -d "$OUTPUT_DIR" ) ]] || {
    log "✖ build/ 必须是工程内的真实目录，不能是软链接或普通文件：${OUTPUT_DIR}"
    return 1
  }
  typeset active_path
  for active_path in "$SOURCE_APP" "${PROJECT_TEMP_DIR:-}" "${BUILD_DIR:-}" "${OBJROOT:-}" "${SYMROOT:-}" "${DERIVED_DATA_DIR:-}" "$LOG_FILE" "${TMPDIR:-/tmp}"; do
    [[ -n "$active_path" ]] || continue
    active_path="${active_path:A}"
    if [[ "$active_path" == "$OUTPUT_DIR" || "$active_path" == "$OUTPUT_DIR/"* ]]; then
      log "✖ 构建工作路径位于待清空的 build/：${active_path}；请将 DerivedData / 构建中间目录移到 build/ 外。"
      return 1
    fi
  done
}
# 复制 App 到临时 Payload，模拟器允许 CODE_SIGNING_ALLOWED=NO。
stage_app() {
  STAGING_ROOT="$(mktemp -d "${TMPDIR:-/tmp}/${SCRIPT_BASENAME}.XXXXXX")" || {
    log "✖ 无法创建 IPA 临时目录。"
    return 1
  }
  typeset -g STAGED_APP="${STAGING_ROOT}/Payload/${WRAPPER_NAME}"
  mkdir -p "${STAGING_ROOT}/Payload" || {
    log "✖ 无法创建临时 Payload 目录：${STAGING_ROOT}/Payload"
    return 1
  }
  ditto --norsrc "$SOURCE_APP" "$STAGED_APP" || {
    log "✖ App 复制失败：${SOURCE_APP}"
    return 1
  }
}
# 真机快照保留有效签名；未通过校验时按 Xcode 身份补签再严格验证。
validate_device_signature() {
  if [[ "$BUILD_KIND" == "模拟器" ]]; then
    log "ℹ 模拟器 App 快照不要求真机签名身份。"
    return 0
  fi
  typeset identity="${EXPANDED_CODE_SIGN_IDENTITY:-}"
  [[ "${CODE_SIGNING_ALLOWED:-YES}" == "YES" && -n "$identity" && "$identity" != "-" ]] || {
    log "✖ 当前真机构建没有可用的代码签名身份，拒绝生成不可安装的 IPA。"
    return 1
  }
  if ! /usr/bin/codesign --verify --deep --strict "$STAGED_APP" >/dev/null 2>&1; then
    /usr/bin/codesign --force --sign "$identity" --preserve-metadata=identifier,entitlements,requirements,flags "$STAGED_APP" || {
      log "✖ IPA 快照签名失败：${STAGED_APP}"
      return 1
    }
  else
    log "ℹ Xcode 真机 App 已通过完整签名校验，保留原始签名元数据。"
  fi
  /usr/bin/codesign --verify --deep --strict "$STAGED_APP" || {
    log "✖ IPA 快照签名校验失败：${STAGED_APP}"
    return 1
  }
}
# 先在 build/ 外完成压缩，打包失败时保留旧产物。
package_ipa() {
  typeset -g STAGED_IPA="${STAGING_ROOT}/${BUILD_KIND}.ipa"
  ditto -c -k --norsrc --keepParent "${STAGING_ROOT}/Payload" "$STAGED_IPA" || {
    log "✖ IPA 生成失败：${STAGED_IPA}"
    return 1
  }
  [[ -s "$STAGED_IPA" ]] || {
    log "✖ IPA 为空，保留原 build/：${STAGED_IPA}"
    return 1
  }
}
# 清空 build/ 全部顶层条目（含隐藏项），再放入本次唯一 IPA。
replace_build_contents() {
  mkdir -p "$OUTPUT_DIR" || {
    log "✖ 无法创建 IPA 输出目录：${OUTPUT_DIR}"
    return 1
  }
  typeset old_entry
  for old_entry in "$OUTPUT_DIR"/*(DN); do
    /bin/rm -rf -- "$old_entry" || {
      log "✖ 无法清理 build/ 条目：${old_entry}"
      return 1
    }
  done
  /bin/mv -- "$STAGED_IPA" "$OUTPUT_IPA" || {
    log "✖ 无法写入本次 IPA：${OUTPUT_IPA}"
    return 1
  }
  log "✔ build/ 已清空并更新为本次唯一产物：${OUTPUT_IPA}"
}
# 执行一次 iOS 主 App 的平台分类、快照校验、打包与替换。
save_build_ipa() {
  if ! is_ios_app_build; then
    log "ℹ 当前不是 iOS 主 App 构建，跳过 IPA：PLATFORM_NAME=${PLATFORM_NAME:-<empty>} ACTION=${ACTION:-<empty>} WRAPPER_NAME=${WRAPPER_NAME:-<empty>}"
    return 0
  fi
  resolve_build_paths # 校验固定输出目录，保护正在使用的构建路径。
  stage_app # 复制本次 App 到 build/ 外的临时 Payload。
  validate_device_signature # 真机校验签名，模拟器允许无签名快照。
  package_ipa # 成功压缩后才进入旧产物清理。
  replace_build_contents # 清空 build/ 全部内容，再写入本次 IPA。
}
# 编排自述、运行环境与自动构建产物输出。
main() {
  show_script_intro_and_wait # 展示清理范围，并按 Xcode / 终端入口决定交互。
  initialize_runtime # 初始化日志、Shell 策略和退出清理。
  save_build_ipa # 保存真机或模拟器本次唯一 IPA。
}

main "$@"
