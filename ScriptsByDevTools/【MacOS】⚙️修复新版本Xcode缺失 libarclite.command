#!/bin/zsh
set -euo pipefail

# ================================== 全局配置 ==================================
REPO_URL_DEFAULT="https://github.com/JobsKits/Xcode_Sys_lib.git"
REPO_NAME_DEFAULT="Xcode_Sys_lib"
WORKDIR_DEFAULT="/tmp/xcode_sys_lib_fix"
TARGET_RELATIVE_PATH="Toolchains/XcodeDefault.xctoolchain/usr/lib/arc"

# ================================== 输出工具 ==================================
log_info()  { print -r -- "ℹ️  $*" >&2; }
log_ok()    { print -r -- "✅ $*" >&2; }
log_warn()  { print -r -- "⚠️  $*" >&2; }
log_err()   { print -r -- "❌ $*" >&2; }

# ================================== 环境兜底 ==================================
# 说明：部分 .command 运行环境可能 PATH 异常，导致 open/find/install 等命令找不到
ensure_base_path() {
  local base="/usr/bin:/bin:/usr/sbin:/sbin"
  case ":${PATH:-}:" in
    *":/usr/bin:"*) : ;;
    *) export PATH="${base}:${PATH:-}" ;;
  esac
}

# ================================== 帮助信息 ==================================
print_readme() {
  local repo_url="$1"
  local workdir="$2"

  local dev_dir abs_target_dir
  dev_dir="$(/usr/bin/xcode-select -p 2>/dev/null || true)"
  if [[ -n "${dev_dir}" ]]; then
    abs_target_dir="${dev_dir}/${TARGET_RELATIVE_PATH}"
  else
    abs_target_dir="（无法解析：xcode-select -p 失败）"
  fi

  cat <<EOF
============================================================
这个脚本用于修复新版本 Xcode 缺失 libarclite 导致的链接失败问题。

将执行的动作：
  1) 下载仓库：
     ${repo_url}
  2) 下载到临时目录：
     ${workdir}
  3) 搜集 libarclite_*.a
  4) 复制到 Xcode Toolchain 目录（模板）：
     \$(xcode-select -p)/${TARGET_RELATIVE_PATH}
  5) 本机真实路径：
     ${abs_target_dir}

执行完成后：
- Finder 打开下载目录
- Finder 打开最终生效的 arc 目录

⚠️ 注意：
- 该操作会修改 Xcode.app 内容
- 需要 sudo 权限
============================================================
EOF
}

# ================================== 用户确认 ==================================
wait_user_confirm() {
  log_warn "即将下载仓库，并可能修改 Xcode 安装目录（需要 sudo）"
  log_warn "不想继续请直接关闭终端"
  while true; do
    print -n -- "请按回车继续（仅回车有效）："
    IFS= read -r input
    [[ -z "${input}" ]] && break
  done
  log_ok "用户已确认，继续执行"
}

# ================================== Finder 操作 ==================================
# 用绝对路径 /usr/bin/open，避免 PATH 异常导致 command not found
open_in_finder() {
  local path="$1"
  if [[ -d "${path}" ]]; then
    log_ok "Finder 打开：${path}"
    if ! /usr/bin/open "${path}"; then
      log_warn "Finder 打开失败：${path}"
    fi
  else
    log_warn "目录不存在，无法打开：${path}"
  fi
}

# ================================== 依赖检查 ==================================
check_dependencies() {
  command -v git >/dev/null 2>&1 || {
    log_err "未检测到 git，请先安装 git"
    exit 1
  }
  log_ok "git 已就绪"
}

# ================================== 路径解析 ==================================
get_target_arc_dir() {
  local dev_dir
  dev_dir="$(/usr/bin/xcode-select -p)"
  print -r -- "${dev_dir}/${TARGET_RELATIVE_PATH}"
}

# ================================== 工作目录管理 ==================================
prepare_workdir() {
  rm -rf "${WORKDIR_DEFAULT}"
  mkdir -p "${WORKDIR_DEFAULT}"
  log_ok "工作目录已准备：${WORKDIR_DEFAULT}"
}

# ================================== 下载仓库 ==================================
download_repo() {
  local repo_dir="${WORKDIR_DEFAULT}/${REPO_NAME_DEFAULT}"
  log_info "git clone ${REPO_URL_DEFAULT}"
  git clone --depth 1 "${REPO_URL_DEFAULT}" "${repo_dir}" >/dev/null
  print -r -- "${repo_dir}"
}

# ================================== 文件搜集 ==================================
collect_libarclite_files() {
  local repo_dir="$1"
  /usr/bin/find "${repo_dir}" -type f -name "libarclite_*.a" 2>/dev/null | /usr/bin/sort
}

# ================================== 安装复制 ==================================
copy_files_to_target() {
  local target_dir="$1"
  shift
  local -a files=("$@")

  [[ -d "${target_dir}" ]] || sudo /bin/mkdir -p "${target_dir}"

  for f in "${files[@]}"; do
    if [[ ! -f "${f}" ]]; then
      log_err "源文件不存在：${f}"
      exit 1
    fi
    log_info "install $(/usr/bin/basename "${f}")"
    sudo /usr/bin/install -m 0644 "${f}" "${target_dir}/"
  done
}

# ================================== 主流程入口 ==================================
# main：统一调度所有逻辑
main() {
  ensure_base_path

  print_readme "${REPO_URL_DEFAULT}" "${WORKDIR_DEFAULT}"
  wait_user_confirm
  check_dependencies

  prepare_workdir

  local repo_dir
  repo_dir="$(download_repo)"
  log_ok "仓库已下载：${repo_dir}"

  # ① 打开下载目录
  open_in_finder "${repo_dir}"

  local target_dir
  target_dir="$(get_target_arc_dir)"
  log_ok "Xcode arc 目录：${target_dir}"

  local -a files
  files=("${(@f)$(collect_libarclite_files "${repo_dir}")}")
  log_ok "找到 libarclite 文件数量：${#files[@]}"

  copy_files_to_target "${target_dir}" "${files[@]}"
  log_ok "libarclite 文件复制完成"

  # ② 打开最终生效目录（你点名要打开的）
  open_in_finder "${target_dir}"

  log_ok "修复完成，请回到 Xcode Clean Build 再编译"
}

main "$@"
