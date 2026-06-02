#!/bin/zsh
# ================================== iOS IPA 打包助手 ==================================
# 目标：
# • 自动定位“主 iOS 工程”（避开 Flutter Runner 壳工程、避开 .xcodeproj 包内 workspace）
# • 自动识别主 Scheme（优先用“与工程同名”的 Scheme），否则提供 fzf 选择
# • 强制真机：xcodebuild -destination generic/platform=iOS
# • 通过 Build Settings 精确定位 .app，然后打包为 .ipa 输出到桌面
# • 失败时自动 open 日志（保留传统）
# =====================================================================================

set -euo pipefail

# ================================== 默认配置 ==================================
CONFIG="Release"                 # Debug / Release
OUT_DIR="${HOME}/Desktop"        # 输出目录
PROJECT_PATH=""                  # 指定 .xcodeproj 或 .xcworkspace（可空）
SCHEME=""                        # 选择的 scheme（可空：自动识别）
CONFIRM="0"                      # --confirm 开启交互确认
DERIVED_DATA="${HOME}/Library/Developer/Xcode/DerivedData/JobsIpaBuild"
LOG_FILE="/tmp/$(basename "$0").log"
ALLOW_UPDATES="0"                # --allow-updates 传 -allowProvisioningUpdates

# ================================== 语义化输出（不污染变量） ==================================
_color_echo() { local c="$1"; shift; printf "\033[%sm%s\033[0m\n" "$c" "$*"; }
info_echo()   { _color_echo "34" "ℹ️  $*"; }
success_echo(){ _color_echo "32" "✅ $*"; }
warn_echo()   { _color_echo "33" "⚠️  $*"; }
error_echo()  { _color_echo "31" "❌ $*"; }
debug_echo()  { _color_echo "35" "🐛 $*"; }
log()         { printf "%s %s\n" "$(date '+%F %T')" "$*" >> "$LOG_FILE"; }

# ================================== 基础工具 ==================================
have_cmd() { command -v "$1" >/dev/null 2>&1; }

open_log_and_exit() {
  local msg="$1"
  error_echo "$msg（看日志）：$LOG_FILE"
  log "ERR $msg（看日志）：$LOG_FILE"
  open "$LOG_FILE" >/dev/null 2>&1 || true
  exit 1
}

trap_err() {
  local exit_code="$?"
  log "TRAP_ERR exit_code=$exit_code line=$1 cmd=$2"
  open "$LOG_FILE" >/dev/null 2>&1 || true
  exit "$exit_code"
}
trap 'trap_err $LINENO "$BASH_COMMAND"' ERR

# ================================== 自述 ==================================
show_intro() {
  cat <<'EOF'
📦==================================================
                iOS IPA 打包助手
==================================================
• 多 Scheme：用 fzf 选择要打的 Scheme（自动过滤 Pods/Tests/Flutter Assemble）
• 自动主工程 Scheme：优先用“与工程同名”的 Scheme，其次按常见主工程规则自动挑选
• 工程定位：优先脚本所在目录；自动避开 Flutter Runner 壳工程
• 强制真机：xcodebuild -destination generic/platform=iOS
• 优先从 Build Settings 精确定位 .app；失败则自动从 DerivedData 回退匹配
• 编译生成 .app 后，组装并导出为 .ipa 到指定目录（默认桌面）
• 失败时自动 open 日志
• 支持交互确认模式（--confirm）
==================================================
EOF
}

usage() {
  cat <<EOF
用法:
  $(basename "$0") [--config Debug|Release] [--out 输出目录] [--project 工程路径] [--scheme Scheme] [--confirm] [--allow-updates]

参数:
  --config          构建配置，默认 Release
  --out             .ipa 输出目录，默认 \$HOME/Desktop
  --project         指定 .xcodeproj 或 .xcworkspace 的完整路径（可不填：自动定位）
  --scheme          指定 Scheme（可不填：自动识别/选择）
  --confirm         运行前交互确认
  --allow-updates   传 -allowProvisioningUpdates（需要时再开，避免污染机器签名状态）

示例:
  $(basename "$0") --config Release --out ~/Desktop
  $(basename "$0") --project ./MyApp.xcworkspace --confirm
EOF
}

# ================================== 参数解析 ==================================
parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --config) CONFIG="${2:-}"; shift 2;;
      --out) OUT_DIR="${2:-}"; shift 2;;
      --project) PROJECT_PATH="${2:-}"; shift 2;;
      --scheme) SCHEME="${2:-}"; shift 2;;
      --confirm) CONFIRM="1"; shift 1;;
      --allow-updates) ALLOW_UPDATES="1"; shift 1;;
      -h|--help) usage; exit 0;;
      *) error_echo "未知参数：$1"; usage; exit 1;;
    esac
  done
}

# ================================== 定位脚本目录（双击 .command 也稳定） ==================================
resolve_script_dir() {
  local src="$0"
  if [[ "$src" != /* ]]; then
    src="$(pwd)/$src"
  fi
  if [[ -L "$src" ]]; then
    local link
    link="$(readlink "$src")"
    [[ "$link" != /* ]] && link="$(dirname "$src")/$link"
    src="$link"
  fi
  local dir
  dir="$(cd "$(dirname "$src")" && pwd)"
  echo "$dir"
}

# ================================== 自动定位主工程（优先脚本目录） ==================================
is_flutter_shell_project() {
  local p="$1"
  case "$p" in
    *"/ios/Runner."*|*"/macos/Runner."*|*"/my_flutter/ios/Runner."*|*"/Flutter/"* ) return 0;;
    *) return 1;;
  esac
}

is_inside_xcodeproj_bundle_workspace() {
  local p="$1"
  [[ "$p" == *".xcodeproj/project.xcworkspace" ]]
}

pick_project_in_dir() {
  local base_dir="$1"

  local candidates=()
  local p

  for p in "$base_dir"/*.xcworkspace "$base_dir"/*/*.xcworkspace; do
    [[ -e "$p" ]] || continue
    is_inside_xcodeproj_bundle_workspace "$p" && continue
    is_flutter_shell_project "$p" && continue
    candidates+=("$p")
  done

  if [[ ${#candidates[@]} -eq 0 ]]; then
    for p in "$base_dir"/*.xcodeproj "$base_dir"/*/*.xcodeproj; do
      [[ -e "$p" ]] || continue
      is_flutter_shell_project "$p" && continue
      candidates+=("$p")
    done
  fi

  if [[ ${#candidates[@]} -eq 0 ]]; then
    echo ""
    return 0
  fi

  local folder_name="${base_dir:t}"
  for p in "${candidates[@]}"; do
    if [[ "${p:t:r}" == "$folder_name" ]]; then
      echo "$p"
      return 0
    fi
  done

  echo "${candidates[1]}"
}

ensure_project_path() {
  local script_dir="$1"

  if [[ -n "$PROJECT_PATH" ]]; then
    if [[ "$PROJECT_PATH" != /* ]]; then
      PROJECT_PATH="$script_dir/$PROJECT_PATH"
    fi
    [[ -e "$PROJECT_PATH" ]] || open_log_and_exit "指定工程不存在：$PROJECT_PATH"
    return 0
  fi

  PROJECT_PATH="$(pick_project_in_dir "$script_dir")"
  [[ -n "$PROJECT_PATH" ]] || open_log_and_exit "未在脚本目录找到工程（.xcworkspace / .xcodeproj）"
}

project_kind_flag() {
  if [[ "$PROJECT_PATH" == *.xcworkspace ]]; then
    echo "-workspace"
  else
    echo "-project"
  fi
}

project_display_name() {
  echo "${PROJECT_PATH:t:r}"
}

# ================================== 读取 Schemes（兼容 macOS awk；不使用 mapfile） ==================================
xcodebuild_list_raw() {
  local flag
  flag="$(project_kind_flag)"
  local cmd=(/usr/bin/xcodebuild -list "$flag" "$PROJECT_PATH")
  log "XCODEBUILD_LIST_CMD=${(j: :)cmd}"
  "${cmd[@]}" 2>&1
}

parse_schemes_from_list_output() {
  awk '
    BEGIN { ins=0 }
    /^\s*Schemes:\s*$/ { ins=1; next }
    ins==1 && /^[[:space:]]*$/ { ins=0; next }
    ins==1 {
      gsub(/^[[:space:]]+/, "", $0)
      if (length($0) > 0) print $0
    }
  '
}

filter_schemes() {
  grep -vE '^(Pods-|Pods$|.*-Tests$|.*Tests$|.*UITests$|Flutter Assemble$|Flutter$|FlutterPluginRegistrant$)' || true
}

list_schemes() {
  local out
  out="$(xcodebuild_list_raw)" || {
    log "XCODEBUILD_LIST_EXIT=$?"
    log "XCODEBUILD_LIST_OUTPUT_BEGIN"
    log "$out"
    log "XCODEBUILD_LIST_OUTPUT_END"
    open_log_and_exit "xcodebuild -list 失败"
  }

  log "XCODEBUILD_LIST_OUTPUT_BEGIN"
  log "$out"
  log "XCODEBUILD_LIST_OUTPUT_END"

  local schemes
  schemes="$(printf "%s\n" "$out" | parse_schemes_from_list_output | filter_schemes)"
  if [[ -z "$schemes" ]]; then
    open_log_and_exit "未找到可用 Schemes（工程可能未共享 Scheme，或被过滤规则误伤）"
  fi
  printf "%s\n" "$schemes"
}

# ================================== 自动挑选主 Scheme + fzf 兜底 ==================================
auto_pick_main_scheme() {
  local project_name="$1"
  local schemes_text="$2"

  if printf "%s\n" "$schemes_text" | grep -Fxq "$project_name"; then
    echo "$project_name"
    return 0
  fi

  local s
  s="$(printf "%s\n" "$schemes_text" | grep -E "($project_name|App|Main|Release)" | head -n 1)"
  if [[ -n "$s" ]]; then
    echo "$s"
    return 0
  fi

  echo "$(printf "%s\n" "$schemes_text" | head -n 1)"
}

pick_scheme() {
  local schemes_text
  schemes_text="$(list_schemes)"

  local project_name
  project_name="$(project_display_name)"

  if [[ -n "$SCHEME" ]]; then
    if printf "%s\n" "$schemes_text" | grep -Fxq "$SCHEME"; then
      echo "$SCHEME"
      return 0
    fi
    warn_echo "指定 Scheme 不在列表中：$SCHEME（将自动挑选/选择）"
    log "WARN 指定 Scheme 不在列表中：$SCHEME"
  fi

  local auto
  auto="$(auto_pick_main_scheme "$project_name" "$schemes_text")"

  if have_cmd fzf; then
    local chosen
    chosen="$(printf "%s\n" "$schemes_text" | fzf --prompt="选择 Scheme > " --height=40% --reverse --cycle --query="$auto" --select-1 --exit-0)" || true
    [[ -n "$chosen" ]] || chosen="$auto"
    echo "$chosen"
    return 0
  fi

  echo "$auto"
}

# ================================== 真机构建 + 定位 .app ==================================
xcodebuild_show_build_settings() {
  local flag
  flag="$(project_kind_flag)"
  local scheme="$1"

  local cmd=(/usr/bin/xcodebuild
    "$flag" "$PROJECT_PATH"
    -scheme "$scheme"
    -configuration "$CONFIG"
    -sdk iphoneos
    -destination "generic/platform=iOS"
    -derivedDataPath "$DERIVED_DATA"
    -showBuildSettings
  )
  log "XCODEBUILD_SHOWBUILDSETTINGS_CMD=${(j: :)cmd}"
  "${cmd[@]}" 2>&1
}

parse_build_setting_value() {
  local key="$1"
  awk -v k="$key" '
    $0 ~ "^[[:space:]]*"k"[[:space:]]*=" {
      sub("^[[:space:]]*"k"[[:space:]]*=[[:space:]]*", "", $0)
      print $0
      exit
    }
  '
}

locate_app_path() {
  local scheme="$1"
  local out
  out="$(xcodebuild_show_build_settings "$scheme")" || {
    log "XCODEBUILD_SHOWBUILDSETTINGS_EXIT=$?"
    log "XCODEBUILD_SHOWBUILDSETTINGS_OUTPUT_BEGIN"
    log "$out"
    log "XCODEBUILD_SHOWBUILDSETTINGS_OUTPUT_END"
    open_log_and_exit "xcodebuild -showBuildSettings 失败"
  }

  log "XCODEBUILD_SHOWBUILDSETTINGS_OUTPUT_BEGIN"
  log "$out"
  log "XCODEBUILD_SHOWBUILDSETTINGS_OUTPUT_END"

  local target_build_dir full_product_name
  target_build_dir="$(printf "%s\n" "$out" | parse_build_setting_value "TARGET_BUILD_DIR")"
  full_product_name="$(printf "%s\n" "$out" | parse_build_setting_value "FULL_PRODUCT_NAME")"

  if [[ -z "$target_build_dir" || -z "$full_product_name" ]]; then
    return 1
  fi

  local app_path="$target_build_dir/$full_product_name"
  if [[ -d "$app_path" ]]; then
    echo "$app_path"
    return 0
  fi
  return 1
}

xcodebuild_build() {
  local scheme="$1"
  local flag
  flag="$(project_kind_flag)"

  local cmd=(/usr/bin/xcodebuild
    "$flag" "$PROJECT_PATH"
    -scheme "$scheme"
    -configuration "$CONFIG"
    -sdk iphoneos
    -destination "generic/platform=iOS"
    -derivedDataPath "$DERIVED_DATA"
    build
  )
  if [[ "$ALLOW_UPDATES" == "1" ]]; then
    cmd+=(-allowProvisioningUpdates)
  fi

  log "XCODEBUILD_BUILD_CMD=${(j: :)cmd}"
  "${cmd[@]}"
}

fallback_find_app_in_deriveddata() {
  local app
  app="$(/usr/bin/find "$DERIVED_DATA" -type d -name "*.app" -path "*-iphoneos/*" -print 2>/dev/null | /usr/bin/xargs -I{} stat -f "%m %N" "{}" 2>/dev/null | sort -nr | head -n 1 | cut -d' ' -f2-)"
  [[ -n "$app" && -d "$app" ]] && echo "$app" || echo ""
}

ensure_app_path() {
  local scheme="$1"

  local app_path=""
  app_path="$(locate_app_path "$scheme" || true)"

  if [[ -n "$app_path" ]]; then
    success_echo "定位 .app：$app_path"
    log "OK 定位 .app：$app_path"
    echo "$app_path"
    return 0
  fi

  info_echo "未能从 Build Settings 定位 .app，开始编译后回退匹配"
  log "INFO 未能从 Build Settings 定位 .app，开始编译后回退匹配"

  xcodebuild_build "$scheme" 2>&1 | tee -a "$LOG_FILE"
  app_path="$(locate_app_path "$scheme" || true)"
  if [[ -z "$app_path" ]]; then
    app_path="$(fallback_find_app_in_deriveddata)"
  fi
  [[ -n "$app_path" ]] || open_log_and_exit "未能定位 .app（请确认真机构建成功，且 scheme 是主 iOS App）"
  success_echo "定位 .app：$app_path"
  log "OK 定位 .app：$app_path"
  echo "$app_path"
}

# ================================== 打包 .ipa ==================================
make_ipa() {
  local app_path="$1"
  local app_name="${app_path:t:r}"
  local stamp
  stamp="$(date '+%Y%m%d_%H%M%S')"
  local ipa_path="${OUT_DIR}/${app_name}_${CONFIG}_${stamp}.ipa"

  local tmp_dir
  tmp_dir="$(mktemp -d "/tmp/${app_name}.ipa.XXXXXX")"
  mkdir -p "$tmp_dir/Payload"
  /bin/cp -R "$app_path" "$tmp_dir/Payload/"

  (cd "$tmp_dir" && /usr/bin/zip -qry "$ipa_path" "Payload") || {
    rm -rf "$tmp_dir" || true
    open_log_and_exit "打包 .ipa 失败"
  }
  rm -rf "$tmp_dir" || true

  success_echo "已生成：$ipa_path"
  log "OK 已生成：$ipa_path"
}

# ================================== 交互确认 ==================================
confirm_or_exit() {
  [[ "$CONFIRM" == "1" ]] || return 0
  echo
  warn_echo "确认开始打包？"
  echo "  工程：$PROJECT_PATH"
  echo "  Scheme：$SCHEME"
  echo "  配置：$CONFIG"
  echo "  输出：$OUT_DIR"
  echo -n "继续 (y/N)："
  read -r ans
  [[ "$ans" == "y" || "$ans" == "Y" ]] || { warn_echo "已取消"; exit 0; }
}

# ================================== 主流程 ==================================
main() {
  : > "$LOG_FILE"
  show_intro
  parse_args "$@"

  mkdir -p "$OUT_DIR" || open_log_and_exit "创建输出目录失败：$OUT_DIR"
  rm -rf "$DERIVED_DATA" >/dev/null 2>&1 || true
  mkdir -p "$DERIVED_DATA" || open_log_and_exit "创建 DerivedData 失败：$DERIVED_DATA"

  local script_dir
  script_dir="$(resolve_script_dir)"
  info_echo "📂 工作目录：$script_dir"
  log "INFO 📂 工作目录：$script_dir"
  log "LOG_FILE=$LOG_FILE"
  log "CONFIG=$CONFIG"
  log "OUT_DIR=$OUT_DIR"
  log "SCRIPT_DIR=$script_dir"
  debug_echo "DERIVED_DATA=$DERIVED_DATA"
  log "INFO 🐛 DERIVED_DATA=$DERIVED_DATA"

  ensure_project_path "$script_dir"
  success_echo "发现工程：${PROJECT_PATH:t}"
  log "OK 发现工程：${PROJECT_PATH:t}"

  SCHEME="$(pick_scheme)"
  success_echo "选择 scheme：$SCHEME"
  log "OK 选择 scheme：$SCHEME"

  confirm_or_exit

  info_echo "开始构建并定位 .app：$SCHEME ($CONFIG)"
  log "INFO 开始构建并定位 .app：$SCHEME ($CONFIG)"

  local app_path
  app_path="$(ensure_app_path "$SCHEME")"

  make_ipa "$app_path"
}

main "$@"
