# shell: zsh
# 配置库自述：为当前工程安装双远端提交策略；仅定义函数，供主入口加载。
# 影响范围：备份后修改当前仓库的 Git 配置，不创建提交、不推送、不处理远端记录。

# 按分支标记、现有配置和旧快照根标记识别当前名称，改名后不重建旧分支。
jobs_resolve_gitee_snapshot_branch() {
  local setup_repo_root="${1:A}"
  local setup_source_branch="${2:-byPods}"
  local setup_configured_branch=""
  local setup_refs="" setup_candidate="" setup_roots="" setup_root_message=""
  local -a setup_candidates=()

  setup_configured_branch="$(git -C "$setup_repo_root" config --local --get jobs.giteeSnapshot.snapshotBranch || true)"
  setup_refs="$(git -C "$setup_repo_root" for-each-ref --format='%(refname:strip=2)' refs/heads)" || return 1
  for setup_candidate in "${(@f)setup_refs}"; do
    [[ -n "$setup_candidate" && "$setup_candidate" != "$setup_source_branch" ]] || continue
    if [[ "$(git -C "$setup_repo_root" config --local --bool --get "branch.$setup_candidate.jobsGiteeSnapshot" 2>/dev/null)" == true ]]; then
      setup_candidates+=("$setup_candidate")
    fi
  done
  if (( ${#setup_candidates} > 1 )); then
    print -u2 -- '✖ 多个本地分支带有快照标记，请先确认保留哪条分支；未改写配置。'
    return 1
  fi
  if (( ${#setup_candidates} == 1 )); then
    print -r -- "$setup_candidates[1]"
    return 0
  fi
  if [[ -n "$setup_configured_branch" ]] && git -C "$setup_repo_root" show-ref --verify --quiet "refs/heads/$setup_configured_branch"; then
    print -r -- "$setup_configured_branch"
    return 0
  fi

  for setup_candidate in "${(@f)setup_refs}"; do
    [[ -n "$setup_candidate" && "$setup_candidate" != "$setup_source_branch" ]] || continue
    setup_roots="$(git -C "$setup_repo_root" rev-list --max-parents=0 "refs/heads/$setup_candidate")" || return 1
    [[ -n "$setup_roots" && "$setup_roots" != *$'\n'* ]] || continue
    setup_root_message="$(git -C "$setup_repo_root" show -s --format=%B "$setup_roots")" || return 1
    if print -r -- "$setup_root_message" | grep -Fxq "Jobs-Gitee-Snapshot: $setup_source_branch"; then
      setup_candidates+=("$setup_candidate")
    fi
  done
  if (( ${#setup_candidates} > 1 )); then
    print -u2 -- '✖ 检测到多条旧快照，请先配置 jobs.giteeSnapshot.snapshotBranch；未自动选择。'
    return 1
  fi
  if (( ${#setup_candidates} == 1 )); then
    print -r -- "$setup_candidates[1]"
  else
    print -r -- "${setup_configured_branch:-Gitee@snapshot}"
  fi
}
# 检查专用 hook 目录，避免重新安装时丢失用户额外添加的入口。
jobs_check_gitee_snapshot_extra_hooks() {
  local setup_hook_dir="$1"
  local setup_hook_file=""
  for setup_hook_file in "$setup_hook_dir"/*(N); do
    [[ -f "$setup_hook_file" && -x "$setup_hook_file" && "$setup_hook_file" != *.sample ]] || continue
    case "${setup_hook_file:t}" in
      post-commit|post-merge|post-rewrite|pre-push)
        continue
        ;;
    esac
    print -r -- "✖ 已存在额外有效 hook：$setup_hook_file；保留原配置，未安装。" >&2
    return 1
  done
}
# 检查工程身份、现有 hook 和需要安装的脚本，避免覆盖其它工作流。
jobs_check_gitee_snapshot_setup() {
  local setup_repo_root="${1:A}"
  local setup_git_root=""
  local setup_hooks_setting="$(git -C "$setup_repo_root" config --get core.hooksPath || true)"
  local setup_default_hooks=""
  local setup_installed_hooks_prefix=""
  local setup_hook_file=""
  local setup_hook_name=""

  setup_git_root="$(git -C "$setup_repo_root" rev-parse --show-toplevel)" || return 1
  setup_default_hooks="$(git -C "$setup_repo_root" rev-parse --path-format=absolute --git-path hooks)" || return 1
  setup_installed_hooks_prefix="$(git -C "$setup_repo_root" rev-parse --path-format=absolute --git-path jobs-gitee-snapshot-hooks)" || return 1

  if [[ "$setup_git_root" != "$setup_repo_root" ]]; then
    print -r -- '✖ 必须在工程仓库根目录配置 Gitee 快照。' >&2
    return 1
  fi
  if [[ -n "$setup_hooks_setting" && "$setup_hooks_setting" != .githooks && "$setup_hooks_setting" != "$setup_installed_hooks_prefix".* ]]; then
    print -r -- "✖ 已存在 core.hooksPath=$setup_hooks_setting；保留原配置，未覆盖。" >&2
    return 1
  fi
  if [[ -z "$setup_hooks_setting" ]]; then
    for setup_hook_file in "$setup_default_hooks"/*(N); do
      [[ -f "$setup_hook_file" && -x "$setup_hook_file" && "$setup_hook_file" != *.sample ]] || continue
      print -r -- "✖ 已存在有效 hook：$setup_hook_file；保留原 hook，未安装。" >&2
      return 1
    done
  else
    jobs_check_gitee_snapshot_extra_hooks "$setup_default_hooks" || return 1
  fi
  jobs_check_gitee_snapshot_extra_hooks "$setup_repo_root/.githooks" || return 1
  for setup_hook_name in post-commit post-merge post-rewrite pre-push; do
    setup_hook_file="$setup_repo_root/.githooks/$setup_hook_name"
    if [[ ! -f "$setup_hook_file" || ! -x "$setup_hook_file" ]]; then
      print -r -- "✖ hook 不存在或不可执行：$setup_hook_file" >&2
      return 1
    fi
  done
  if [[ ! -f "$setup_repo_root/ScriptsByDevTools/gitee_snapshot.command/gitee_snapshot.command" ]]; then
    print -r -- '✖ 快照脚本缺失，未修改配置。' >&2
    return 1
  fi
  git -C "$setup_repo_root" show-ref --verify --quiet refs/heads/byPods || {
    print -r -- '✖ 本地 byPods 分支不存在，未修改配置。' >&2
    return 1
  }
  git -C "$setup_repo_root" remote get-url origin >/dev/null || return 1
  git -C "$setup_repo_root" remote get-url gitee >/dev/null || return 1
}
# 备份原配置并应用当前工程专用策略；任一写入失败就恢复原配置。
jobs_install_gitee_snapshot() {
  local setup_repo_root="${1:A}"
  local setup_config_file=""
  local setup_backup_dir=""
  local setup_installed_hooks=""
  local setup_hook_name=""
  local setup_snapshot_branch=""
  local setup_key_index=0

  jobs_check_gitee_snapshot_setup "$setup_repo_root" || return 1
  setup_snapshot_branch="$(jobs_resolve_gitee_snapshot_branch "$setup_repo_root" byPods)" || return 1
  if [[ "$setup_snapshot_branch" == byPods ]] || ! git -C "$setup_repo_root" check-ref-format "refs/heads/$setup_snapshot_branch"; then
    print -u2 -- '✖ 快照分支名称无效或与源分支相同，未修改配置。'
    return 1
  fi

  local -a setup_keys=(
    core.hooksPath
    remote.pushDefault
    branch.byPods.pushRemote
    remote.gitee.push
    "branch.$setup_snapshot_branch.remote"
    "branch.$setup_snapshot_branch.merge"
    "branch.$setup_snapshot_branch.pushRemote"
    "branch.$setup_snapshot_branch.jobsGiteeSnapshot"
    jobs.giteeSnapshot.sourceBranch
    jobs.giteeSnapshot.snapshotBranch
    jobs.giteeSnapshot.remote
    jobs.giteeSnapshot.targetBranch
    jobs.giteeSnapshot.enabled
  )
  local -a setup_values=(
    .githooks
    origin
    origin
    "refs/heads/${setup_snapshot_branch}:refs/heads/byPods"
    gitee
    refs/heads/byPods
    gitee
    true
    byPods
    "$setup_snapshot_branch"
    gitee
    byPods
    true
  )

  setup_config_file="$(git -C "$setup_repo_root" rev-parse --path-format=absolute --git-path config)" || return 1
  setup_backup_dir="$(git -C "$setup_repo_root" rev-parse --path-format=absolute --git-path jobs-gitee-snapshot-backups)" || return 1
  setup_backup_dir="$(mktemp -d "$setup_backup_dir.XXXXXXXX")" || return 1
  cp -p "$setup_config_file" "$setup_backup_dir/config" || return 1
  setup_installed_hooks="$(git -C "$setup_repo_root" rev-parse --path-format=absolute --git-path jobs-gitee-snapshot-hooks)" || return 1
  setup_installed_hooks="$(mktemp -d "$setup_installed_hooks.XXXXXXXX")" || return 1
  for setup_hook_name in post-commit post-merge post-rewrite pre-push; do
    cp -p "$setup_repo_root/.githooks/$setup_hook_name" "$setup_installed_hooks/$setup_hook_name" || return 1
    chmod +x "$setup_installed_hooks/$setup_hook_name" || return 1
  done
  setup_values[1]="$setup_installed_hooks"

  for (( setup_key_index=1; setup_key_index <= ${#setup_keys}; setup_key_index++ )); do
    if ! git -C "$setup_repo_root" config --local --replace-all "${setup_keys[$setup_key_index]}" "${setup_values[$setup_key_index]}"; then
      cp -p "$setup_backup_dir/config" "$setup_config_file" || {
        print -r -- "✖ 配置恢复失败，原文件仍保存在 $setup_backup_dir/config" >&2
        return 1
      }
      print -r -- '✖ 写入失败，已恢复原配置。' >&2
      return 1
    fi
  done
  print -r -- '✔ 已安装当前仓库的提交 hook 和防误推检查。'
  print -r -- "✔ byPods 默认推送 origin；gitee 默认推送 $setup_snapshot_branch → byPods。"
  print -r -- 'ℹ 安装不创建快照提交；快照在 byPods 提交后自动同步。'
  print -r -- "ℹ 已安装 hook：$setup_installed_hooks"
  print -r -- "ℹ 原配置备份：$setup_backup_dir/config"
}
