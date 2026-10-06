#!/bin/zsh
# 脚本自述：
# - 脚本名称：gitee_snapshot.command（shell: zsh）。
# - 核心用途：GitHub 保留 byPods 全部历史，Gitee 从当前已提交内容建立独立历史。
# - 影响范围：仅创建 Git 对象并更新本地快照分支，不切换分支、不改索引或工作区、不推送。
# - 运行提示：默认执行需回车确认；--check 只读；--hook 由 Git 无交互调用；--install 安装配套钩子。

SCRIPT_DIR=''
PROJECT_ROOT=''
LOG_FILE=''
MODE='refresh'
HOOK_NAME=''
SOURCE_BRANCH='byPods'
SNAPSHOT_BRANCH='codex/gitee-snapshot'
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
  local body="1、默认同步当前已提交文件；GitHub 原历史保留。\n2、仅更新本地 codex/gitee-snapshot，远端清理、源分支提交和推送由你操作。\n3、--install 安装本仓库钩子；--check 只读；Git 钩子自动执行。\n4、日志：$LOG_FILE；按 Ctrl+C 取消。"
  if [[ "$MODE" != hook && -t 1 && -n "${TERM:-}" && "$TERM" != dumb && -z "${NO_COLOR+x}" ]]; then
    printf '\033[1;31m%s\033[0m\n' "$title"
    printf '\033[0;34m%b\033[0m\n' "$body"
  else
    print -r -- "$title"
    printf '%b\n' "$body"
  fi
  if [[ "$MODE" == refresh || "$MODE" == install ]]; then
    [[ -t 0 ]] || { print -u2 -- '错误：请在可交互终端运行；自动同步由 Git 钩子完成。'; exit 1; }
    read -r '?已了解用途，按回车继续；按 Ctrl+C 取消：' _ || {
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
  SNAPSHOT_BRANCH="$(repo_git config --local --get jobs.giteeSnapshot.snapshotBranch || print codex/gitee-snapshot)"
  TARGET_REMOTE="$(repo_git config --local --get jobs.giteeSnapshot.remote || print gitee)"
  TARGET_BRANCH="$(repo_git config --local --get jobs.giteeSnapshot.targetBranch || print byPods)"
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
# 原样检查 Git pre-push 输入，阻止旧历史、标签和错误目标进入 Gitee。
check_push() {
  local push_is_gitee=0 local_ref local_oid remote_ref remote_oid extra
  is_gitee_target "$1" "$2" && push_is_gitee=1
  while IFS=' ' read -r local_ref local_oid remote_ref remote_oid extra; do
    [[ -z "$local_ref" && -z "$local_oid" ]] && continue
    [[ -n "$remote_ref" && -n "$remote_oid" && -z "$extra" ]] || fail 'pre-push 引用输入无效。'
    if [[ "$push_is_gitee" == 0 ]]; then
      [[ "$local_ref" != "refs/heads/$SNAPSHOT_BRANCH" ]] || fail "快照分支只供 $TARGET_REMOTE 推送；GitHub 请推 $SOURCE_BRANCH。"
      continue
    fi
    [[ "$ENABLED" == true ]] || fail 'Gitee 快照保护尚未启用，请运行本脚本 --install。'
    [[ "$local_ref" == "refs/heads/$SNAPSHOT_BRANCH" && "$remote_ref" == "refs/heads/$TARGET_BRANCH" && -n "${local_oid//0/}" ]] || fail "Gitee 只接受 $SNAPSHOT_BRANCH -> $TARGET_BRANCH；请取消标签推送，旧远端记录由你在网页处理。"
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
