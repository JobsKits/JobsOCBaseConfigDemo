#!/usr/bin/env zsh
# shell: zsh
# 脚本自述：Xcode 主 App 构建阶段自动筛选真机产物，校验签名并生成工程根目录 build/ 下的最新 IPA；模拟器构建直接跳过。

typeset -g SCRIPT_PATH=""
typeset -g SCRIPT_BASENAME=""
typeset -g LOG_FILE=""

# 初始化脚本路径、日志路径和 zsh 的通配行为。
initialize_runtime() {
  set -e
  setopt NO_NOMATCH
  SCRIPT_PATH="${0:A}"
  SCRIPT_BASENAME="${SCRIPT_PATH:t:r}"
  LOG_FILE="${TMPDIR:-/tmp}/${SCRIPT_BASENAME}.log"
  : >| "$LOG_FILE"
}
# 同步输出 Xcode 构建日志和临时日志文件。
log() {
  print -r -- "$*" | tee -a "$LOG_FILE"
}
# 判断当前构建是否是需要留存的 iOS 真机构建。
is_device_build() {
  [[ "${PLATFORM_NAME:-}" == "iphoneos" && "${ACTION:-build}" != "clean" ]]
}
# 校验 Xcode 已经提供了可复制的真机 App 和项目输出目录。
resolve_build_paths() {
  typeset source_app="${TARGET_BUILD_DIR:-}/${WRAPPER_NAME:-}"
  typeset project_root="${SRCROOT:-${PROJECT_DIR:-}}"
  typeset output_dir="${project_root}/build"
  typeset output_ipa="${output_dir}/${WRAPPER_NAME%.app}.ipa"

  [[ -n "${TARGET_BUILD_DIR:-}" && -n "${WRAPPER_NAME:-}" ]] || {
    log "✖ 缺少 TARGET_BUILD_DIR 或 WRAPPER_NAME，无法定位真机 App。"
    return 1
  }
  [[ "$WRAPPER_NAME" == *.app && -d "$source_app" ]] || {
    log "✖ 真机 App 不存在：${source_app}"
    return 1
  }
  [[ -n "$project_root" && -d "$project_root" ]] || {
    log "✖ 无法定位工程根目录：${project_root:-<empty>}"
    return 1
  }

  typeset -g SOURCE_APP="$source_app"
  typeset -g OUTPUT_DIR="$output_dir"
  typeset -g OUTPUT_IPA="$output_ipa"
}
# 解析 Xcode 的签名身份和 entitlements，供 IPA 快照重新签名。
resolve_signing_context() {
  typeset identity="${EXPANDED_CODE_SIGN_IDENTITY:-}"
  [[ "${CODE_SIGNING_ALLOWED:-YES}" == "YES" && -n "$identity" && "$identity" != "-" ]] || {
    log "✖ 当前真机构建没有可用的代码签名身份，拒绝生成不可安装的 IPA。"
    return 1
  }

  typeset -g SIGNING_IDENTITY="$identity"
}
# 将真机 App 复制到临时 Payload，并尽量保留 Xcode 已完成的完整签名元数据。
stage_and_sign_app() {
  typeset staging_root="$(mktemp -d "${TMPDIR:-/tmp}/${SCRIPT_BASENAME}.XXXXXX")"
  typeset payload_dir="${staging_root}/Payload"
  typeset staged_app="${payload_dir}/${WRAPPER_NAME}"
  mkdir -p "$payload_dir" || {
    log "✖ 无法创建临时 Payload 目录：${payload_dir}"
    return 1
  }

  ditto --norsrc "$SOURCE_APP" "$staged_app" || {
    log "✖ App 复制失败：${SOURCE_APP}"
    /bin/rm -rf -- "$staging_root"
    return 1
  }

  if ! /usr/bin/codesign --verify --deep --strict "$staged_app" >/dev/null 2>&1; then
    typeset -a sign_arguments
    sign_arguments=(--force --sign "$SIGNING_IDENTITY" --preserve-metadata=identifier,entitlements,requirements,flags)
    /usr/bin/codesign "${sign_arguments[@]}" "$staged_app" || {
      log "✖ IPA 快照签名失败：${staged_app}"
      /bin/rm -rf -- "$staging_root"
      return 1
    }
  else
    log "ℹ Xcode 真机 App 已通过完整签名校验，保留原始签名元数据。"
  fi
  /usr/bin/codesign --verify --deep --strict "$staged_app" || {
    log "✖ IPA 快照签名校验失败：${staged_app}"
    /bin/rm -rf -- "$staging_root"
    return 1
  }

  typeset -g STAGING_ROOT="$staging_root"
  typeset -g STAGED_APP="$staged_app"
}
# 将临时 Payload 压缩为 IPA，并以同名文件覆盖工程 build/ 中的旧版本。
package_ipa() {
  mkdir -p "$OUTPUT_DIR" || {
    log "✖ 无法创建 IPA 输出目录：${OUTPUT_DIR}"
    return 1
  }
  ditto -c -k --norsrc --keepParent "${STAGING_ROOT}/Payload" "$OUTPUT_IPA" || {
    log "✖ IPA 生成失败：${OUTPUT_IPA}"
    /bin/rm -rf -- "$STAGING_ROOT"
    return 1
  }
  [[ -d "${OUTPUT_DIR}/${WRAPPER_NAME}" ]] && /bin/rm -rf -- "${OUTPUT_DIR}/${WRAPPER_NAME}"
  /bin/rm -rf -- "$STAGING_ROOT"
  log "✔ 真机 IPA 已更新：${OUTPUT_IPA}"
}
# 编排构建平台过滤、路径解析、签名快照和 IPA 输出。
main() {
  initialize_runtime # 初始化日志与脚本运行环境。
  save_device_ipa # 过滤模拟器构建并生成最新真机 IPA。
}

# 处理一次 Xcode 构建后的真机 IPA 留存流程。
save_device_ipa() {
  if ! is_device_build; then
    log "ℹ 当前不是 iOS 真机构建，跳过 IPA 留存：PLATFORM_NAME=${PLATFORM_NAME:-<empty>} ACTION=${ACTION:-<empty>}"
    return 0
  fi
  resolve_build_paths # 定位 Xcode 已生成的真机 App 和项目 build 目录。
  resolve_signing_context # 确认可用的签名身份，避免生成不可安装的 IPA。
  stage_and_sign_app # 组装临时 Payload，并为留存快照补齐签名。
  package_ipa # 覆盖 build/ 下同名旧 IPA。
}

main "$@"
