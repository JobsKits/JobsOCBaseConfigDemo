#!/bin/zsh
# 脚本自述：
# - 脚本名称：Gitee 快照隔离回归。
# - 核心用途：在临时 Git 仓库中验证快照生成、历史隔离与推送门禁。
# - 影响范围：只写临时 fixture；不提交、不推送、不更新真实项目引用。
# - 运行提示：终端运行需回车；--run 明确执行自动回归，--help 只显示说明。
# shell: zsh

SCRIPT_DIR=""
PROJECT_ROOT=""
TEST_ROOT=""
FIXTURE=""
ENGINE=""
LOG_FILE=""
SNAPSHOT="codex/gitee-snapshot"
NULL_SHA="0000000000000000000000000000000000000000"

# 展示固定用途与作用范围，再按显式入口确认执行。
show_script_intro_and_wait() {
    local mode="${1:-}" title="Gitee 快照隔离回归" line body="1、仅在临时目录创建源码仓库与两个本地 bare 远端。\n2、验证 GitHub 保留源历史、Gitee 从独立根提交开始。\n3、临时目录和日志保留供复现；按 Ctrl+C 可取消。"
    body="${(g::)body}"
    if [[ -t 1 && -n "${TERM:-}" && "$TERM" != dumb && -z "${NO_COLOR+x}" ]]; then
        print -r -- $'\033[1;31m'"$title"$'\033[0m'
        for line in "${(@f)body}"; do
            print -r -- $'\033[0;34m'"$line"$'\033[0m'
        done
    else
        print -r -- "$title"
        print -r -- "$body"
    fi
    case "$mode" in
        --help) print -r -- "用法：/bin/zsh run_regression.command [--run|--help]"; exit 0 ;;
        --run) [[ $# -eq 1 ]] || exit 2 ;;
        "")
            [[ $# -eq 0 && -t 0 ]] || { print -u2 -- "✖ 自动测试请显式传入 --run；手动运行需要终端。"; exit 2; }
            read -r "?按回车运行隔离回归；按 Ctrl+C 取消：" _ || exit 1 ;;
        *) print -u2 -- "✖ 未知参数：$mode"; exit 2 ;;
    esac
}
# 创建独立测试环境，并清除外部 Git 路径与签名配置影响。
initialize_test_environment() {
    setopt NO_NOMATCH ERR_EXIT PIPE_FAIL
    SCRIPT_DIR="${${(%):-%x}:A:h}"
    PROJECT_ROOT="${SCRIPT_DIR:h:h:h}"
    for tool in git mktemp cp chmod cksum; do
        command -v "$tool" >/dev/null || { print -u2 -- "✖ 缺少命令：$tool"; exit 1; }
    done
    unset GIT_DIR GIT_WORK_TREE GIT_INDEX_FILE GIT_OBJECT_DIRECTORY GIT_ALTERNATE_OBJECT_DIRECTORIES
    unset GIT_COMMON_DIR GIT_CONFIG_COUNT GIT_CONFIG_PARAMETERS GIT_TEMPLATE_DIR GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL
    export GIT_CONFIG_NOSYSTEM=1 GIT_CONFIG_GLOBAL=/dev/null GIT_TERMINAL_PROMPT=0
    TEST_ROOT="$(mktemp -d "${TMPDIR:-/tmp}/gitee-snapshot-regression.XXXXXX")"
    FIXTURE="$TEST_ROOT/source"
    ENGINE="$FIXTURE/ScriptsByDevTools/gitee_snapshot.command/gitee_snapshot.command"
    LOG_FILE="$TEST_ROOT/run_regression.log"
    export TMPDIR="$TEST_ROOT/"
    : > "$LOG_FILE"
    print -r -- "ℹ 临时目录：$TEST_ROOT" | tee -a "$LOG_FILE"
}
# 同步终端日志，成功断言给出可定位的名称。
success_echo() {
    print -r -- "✔ $1" | tee -a "$LOG_FILE"
}
# 输出失败位置与最近命令日志，保留 fixture 以便复现。
fail_test() {
    print -u2 -r -- "✖ $1"
    [[ -n "$LOG_FILE" ]] && tail -n 60 "$LOG_FILE" >&2
    print -u2 -r -- "日志与 fixture：$TEST_ROOT"
    exit 1
}
# 将所有真实 Git 操作固定到隔离源码仓库。
fixture_git() {
    command git -C "$FIXTURE" "$@"
}
# 将远端引用断言和测试预置固定到临时 Gitee bare 仓库。
gitee_fixture_git() {
    command git --git-dir="$TEST_ROOT/gitee.git" "$@"
}
# 将 GitHub 删除断言固定到另一个临时 bare 仓库。
github_fixture_git() {
    command git --git-dir="$TEST_ROOT/github.git" "$@"
}
# 捕获预期成功命令的错误，避免静默中断。
expect_success() {
    local label="$1"
    shift
    "$@" >> "$LOG_FILE" 2>&1 || fail_test "$label"
    success_echo "$label"
}
# 断言门禁拒绝；意外放行时立即停止测试。
expect_rejected() {
    local label="$1"
    shift
    if "$@" >> "$LOG_FILE" 2>&1; then
        fail_test "$label：命令意外成功。"
    fi
    success_echo "$label"
}
# 比较精确结果，失败时展示期待值与实测值。
assert_equal() {
    [[ "$1" == "$2" ]] || fail_test "$3：期待 [$1]，实际 [$2]。"
    success_echo "$3"
}
# 创建三段旧图片历史，先不启用任何快照 hook。
create_fixture() {
    local hook version
    [[ -f "$PROJECT_ROOT/ScriptsByDevTools/gitee_snapshot.command/gitee_snapshot.command" ]] || fail_test "快照引擎尚不存在。"
    mkdir -p "$FIXTURE/ScriptsByDevTools/gitee_snapshot.command" "$FIXTURE/PodspecDependencyReport" "$FIXTURE/Src" "$FIXTURE/.githooks"
    cp "$PROJECT_ROOT/ScriptsByDevTools/gitee_snapshot.command/gitee_snapshot.command" "$ENGINE"
    cp "$PROJECT_ROOT/ScriptsByDevTools/gitee_snapshot.command/gitee_snapshot_setup.zsh" "${ENGINE:h}/gitee_snapshot_setup.zsh"
    for hook in post-commit post-merge post-rewrite pre-push; do
        [[ -f "$PROJECT_ROOT/.githooks/$hook" ]] || fail_test "缺少项目 hook：$hook"
        cp "$PROJECT_ROOT/.githooks/$hook" "$FIXTURE/.githooks/$hook"
        chmod +x "$FIXTURE/.githooks/$hook"
    done
    expect_success "创建隔离源码仓库" git init -q "$FIXTURE"
    fixture_git symbolic-ref HEAD refs/heads/byPods
    fixture_git config user.name "Snapshot Regression"
    fixture_git config user.email "snapshot-regression@example.invalid"
    fixture_git config commit.gpgsign false
    fixture_git config tag.gpgsign false
    fixture_git config core.hooksPath "$TEST_ROOT/disabled-hooks"
    for version in 1 2 3; do
        print -r -- "all-old-$version" > "$FIXTURE/PodspecDependencyReport/PodspecDependencies_all.png"
        print -r -- "internal-old-$version" > "$FIXTURE/PodspecDependencyReport/PodspecDependencies_internal.png"
        print -r -- "source-$version" > "$FIXTURE/Src/app.m"
        fixture_git add .
        expect_success "建立第 $version 段完整源历史" fixture_git commit -q -m "source history $version"
    done
    expect_success "创建本地 Gitee bare fixture" git init -q --bare "$TEST_ROOT/gitee.git"
    expect_success "创建本地 GitHub bare fixture" git init -q --bare "$TEST_ROOT/github.git"
    fixture_git remote add gitee "$TEST_ROOT/gitee.git"
    fixture_git remote add origin "$TEST_ROOT/github.git"
    fixture_git config --unset core.hooksPath
    source "${ENGINE:h}/gitee_snapshot_setup.zsh"
    expect_success "安装实际配置并保留原配置备份" jobs_install_gitee_snapshot "$FIXTURE"
}
# 验证独立根提交、递增父链与当前全部跟踪文件的精确树一致性。
test_snapshot_history() {
    local old_source="$(fixture_git rev-parse byPods)" first second
    expect_success "首次 --check 保持只读" /bin/zsh "$ENGINE" --check
    expect_rejected "默认刷新缺少 TTY 时拒绝执行" simulate_noninteractive_refresh
    expect_rejected "首次 --check 未创建快照引用" fixture_git rev-parse --verify "$SNAPSHOT"
    print -r -- "first snapshot source" >> "$FIXTURE/Src/app.m"
    fixture_git add Src/app.m
    expect_success "源提交 hook 自动建立首个快照" fixture_git commit -q -m "first snapshot"
    first="$(fixture_git rev-parse "$SNAPSHOT")"
    assert_equal 1 "$(fixture_git rev-list --count "$first")" "首快照为单一独立根提交"
    assert_equal "$(fixture_git rev-parse 'byPods^{tree}')" "$(fixture_git rev-parse "$first^{tree}")" "首快照完整保留源码和两张当前报告图"
    expect_rejected "旧源提交不是快照祖先" fixture_git merge-base --is-ancestor "$old_source" "$first"
    print -r -- "second snapshot source" >> "$FIXTURE/Src/app.m"
    fixture_git add Src/app.m
    expect_success "第二个源提交自动追加快照" fixture_git commit -q -m "second snapshot"
    second="$(fixture_git rev-parse "$SNAPSHOT")"
    assert_equal "$second $first" "$(fixture_git rev-list --parents -n 1 "$second")" "第二快照只有前快照一个父提交"
    assert_equal "$(fixture_git rev-parse 'byPods^{tree}')" "$(fixture_git rev-parse "$second^{tree}")" "第二快照树与当前源树相同"
    assert_equal 5 "$(fixture_git rev-list --count byPods)" "原分支完整保留五个源提交"
}
# 无交互 stdin 调用默认入口，验证它不能绕过终端确认。
simulate_noninteractive_refresh() {
    /bin/zsh "$ENGINE" </dev/null
}
# 构造带标准 pre-push stdin 的 URL 调用，避免测试触网。
simulate_url_push() {
    print -r -- "refs/heads/byPods $(fixture_git rev-parse byPods) refs/heads/byPods $NULL_SHA" |
        /bin/zsh "$ENGINE" --hook pre-push "$1" "$1"
}
# 验证正确本地推送、旧历史与标签门禁、过期与损坏引用拒绝。
test_push_guards() {
    local first_push="$(fixture_git rev-parse "$SNAPSHOT")" corrupt latest source_tree remote_before url
    expect_success "git push gitee 按默认映射推送当前快照" fixture_git push gitee
    assert_equal "$first_push" "$(git --git-dir="$TEST_ROOT/gitee.git" rev-parse byPods)" "Gitee 接收正确快照"
    remote_before="$(git --git-dir="$TEST_ROOT/gitee.git" show-ref)"
    expect_rejected "显式 byPods:byPods 强推仍被门禁拒绝" fixture_git push --force gitee byPods:byPods
    fixture_git tag fixture-old byPods~3
    expect_rejected "Gitee 标签推送被拒绝" fixture_git push gitee --tags
    expect_rejected "直接远端 URL 强推旧历史仍被门禁拒绝" fixture_git push --force "$TEST_ROOT/gitee.git" byPods:byPods
    for url in git@gitee.com:JobsGo/fixture.git https://gitee.com/JobsGo/fixture.git http://gitee.com/JobsGo/fixture.git ssh://git@gitee.com:22/JobsGo/fixture.git; do
        expect_rejected "直接 Gitee URL 拒绝旧历史：$url" simulate_url_push "$url"
    done
    expect_success "相似域名不被误识别为 Gitee" simulate_url_push "https://evilgitee.com/JobsGo/fixture.git"
    assert_equal "$remote_before" "$(git --git-dir="$TEST_ROOT/gitee.git" show-ref)" "被拒绝推送未更改任何 Gitee 引用"
    print -r -- "unpublished snapshot source" >> "$FIXTURE/Src/app.m"
    fixture_git add Src/app.m
    expect_success "建立待推送的快照提交" fixture_git commit -q -m "unpublished snapshot"
    fixture_git config jobs.giteeSnapshot.enabled false
    print -r -- "stale snapshot source" >> "$FIXTURE/Src/app.m"
    fixture_git add Src/app.m
    expect_success "在 fixture 暂停自动刷新并推进源码" fixture_git commit -q -m "stale snapshot"
    fixture_git config jobs.giteeSnapshot.enabled true
    expect_rejected "过期快照 --check 失败" /bin/zsh "$ENGINE" --check
    expect_rejected "过期快照推送被拒绝" fixture_git push gitee "$SNAPSHOT:byPods"
    expect_success "显式 hook 刷新过期快照" /bin/zsh "$ENGINE" --hook post-commit
    latest="$(fixture_git rev-parse "$SNAPSHOT")"
    source_tree="$(fixture_git rev-parse 'byPods^{tree}')"
    corrupt="$(print -r -- $'invalid fixture\n\nJobs-Gitee-Snapshot: byPods' | fixture_git commit-tree "$source_tree" -p byPods)"
    fixture_git update-ref "refs/heads/$SNAPSHOT" "$corrupt" "$latest"
    expect_rejected "含源历史父节点的损坏快照 --check 失败" /bin/zsh "$ENGINE" --check
    expect_rejected "损坏快照刷新被拒绝" /bin/zsh "$ENGINE" --hook post-commit
    expect_rejected "损坏快照强推仍被门禁拒绝" fixture_git push --force gitee "$SNAPSHOT:byPods"
    fixture_git update-ref "refs/heads/$SNAPSHOT" "$latest" "$corrupt"
    expect_success "GitHub 正常推送完整源历史" fixture_git push origin byPods:byPods
    assert_equal "$(fixture_git rev-parse byPods)" "$(git --git-dir="$TEST_ROOT/github.git" rev-parse byPods)" "GitHub 接收原分支"
    expect_success "GitHub 保持原标签推送行为" fixture_git push origin --tags
    expect_rejected "专用快照分支不误推 GitHub" fixture_git push origin "$SNAPSHOT:$SNAPSHOT"
}
# 验证 Gitee 分支和标签可原生删除，错误混合推送仍整批拒绝。
test_gitee_branch_deletion() {
    local snapshot_oid="$(fixture_git rev-parse "$SNAPSHOT")" remote_before
    expect_success "删除回归前推送最新正确快照" fixture_git push gitee
    expect_success "在 bare fixture 预置 main 分支" gitee_fixture_git update-ref refs/heads/main "$snapshot_oid"
    expect_success "在 bare fixture 预置自定义分支" gitee_fixture_git update-ref refs/heads/feature/fixture-cleanup "$snapshot_oid"
    expect_success "在 bare fixture 预置旧 gitee 分支" gitee_fixture_git update-ref refs/heads/gitee "$snapshot_oid"
    expect_success "在 bare fixture 预置多分支删除目标" gitee_fixture_git update-ref refs/heads/fixture-batch "$snapshot_oid"
    expect_success "在 bare fixture 预置已有标签" gitee_fixture_git update-ref refs/tags/fixture-kept "$snapshot_oid"

    expect_success "原生删除目标 byPods 被允许" fixture_git push gitee :refs/heads/byPods
    expect_rejected "删除后 Gitee 目标引用确实不存在" gitee_fixture_git show-ref --verify --quiet refs/heads/byPods
    expect_success "删除后正确快照可重新推送恢复目标" fixture_git push gitee
    assert_equal "$snapshot_oid" "$(gitee_fixture_git rev-parse refs/heads/byPods)" "恢复后的目标仍是正确快照"

    expect_success "main 分支原生删除被允许" fixture_git push gitee --delete main
    expect_rejected "删除后 main 引用确实不存在" gitee_fixture_git show-ref --verify --quiet refs/heads/main
    expect_success "自定义嵌套分支原生删除被允许" fixture_git push gitee :refs/heads/feature/fixture-cleanup
    expect_rejected "删除后自定义分支引用确实不存在" gitee_fixture_git show-ref --verify --quiet refs/heads/feature/fixture-cleanup
    expect_success "旧 gitee 与其它分支可在同批原生删除" fixture_git push gitee :refs/heads/gitee :refs/heads/fixture-batch
    expect_rejected "同批删除后旧 gitee 引用确实不存在" gitee_fixture_git show-ref --verify --quiet refs/heads/gitee
    expect_rejected "同批删除后其它分支引用确实不存在" gitee_fixture_git show-ref --verify --quiet refs/heads/fixture-batch

    expect_success "已有 Gitee 标签原生删除被允许" fixture_git push gitee :refs/tags/fixture-kept
    expect_rejected "删除后 Gitee 标签引用确实不存在" gitee_fixture_git show-ref --verify --quiet refs/tags/fixture-kept

    expect_success "在 bare fixture 预置禁用模式删除目标" gitee_fixture_git update-ref refs/heads/fixture-disabled "$snapshot_oid"
    fixture_git config jobs.giteeSnapshot.enabled false
    expect_success "未启用快照时 Gitee 分支仍可删除" fixture_git push gitee --delete fixture-disabled
    expect_rejected "禁用模式删除后目标引用确实不存在" gitee_fixture_git show-ref --verify --quiet refs/heads/fixture-disabled
    fixture_git config jobs.giteeSnapshot.enabled true

    expect_success "直接远端 URL 删除目标 byPods 被允许" fixture_git push "$TEST_ROOT/gitee.git" :refs/heads/byPods
    expect_rejected "直接 URL 删除后目标引用确实不存在" gitee_fixture_git show-ref --verify --quiet refs/heads/byPods
    expect_success "直接 URL 删除后正确快照仍可恢复目标" fixture_git push gitee
    assert_equal "$snapshot_oid" "$(gitee_fixture_git rev-parse refs/heads/byPods)" "再次恢复后的目标仍是正确快照"

    remote_before="$(gitee_fixture_git show-ref)"
    expect_rejected "目标删除混合错误源码推送时整批被拒绝" fixture_git push gitee :refs/heads/byPods refs/heads/byPods:refs/heads/fixture-forbidden
    assert_equal "$remote_before" "$(gitee_fixture_git show-ref)" "混合推送被拒绝后目标及其它远端引用完全保持"
    assert_equal "$snapshot_oid" "$(gitee_fixture_git rev-parse refs/heads/byPods)" "混合推送失败没有提前删除目标"
}
# 验证非 Gitee 远端同样允许删除，但错误快照推送仍会阻止整批更新。
test_github_reference_deletion() {
    local source_oid="$(fixture_git rev-parse byPods)" remote_before
    expect_success "GitHub 分支原生删除被允许" fixture_git push origin :refs/heads/byPods
    expect_rejected "删除后 GitHub 分支引用确实不存在" github_fixture_git show-ref --verify --quiet refs/heads/byPods
    expect_success "删除后 GitHub 完整源历史可重新推送" fixture_git push origin byPods:byPods
    assert_equal "$source_oid" "$(github_fixture_git rev-parse refs/heads/byPods)" "GitHub 恢复后仍指向完整源历史"
    expect_success "GitHub 标签原生删除被允许" fixture_git push origin :refs/tags/fixture-old
    expect_rejected "删除后 GitHub 标签引用确实不存在" github_fixture_git show-ref --verify --quiet refs/tags/fixture-old

    remote_before="$(github_fixture_git show-ref)"
    expect_rejected "GitHub 分支删除混合错误快照推送时整批被拒绝" fixture_git push origin :refs/heads/byPods "refs/heads/$SNAPSHOT:refs/heads/fixture-snapshot-forbidden"
    assert_equal "$remote_before" "$(github_fixture_git show-ref)" "GitHub 混合推送被拒绝后全部引用保持"
}
# 验证缺少引擎时稳定 hook 仍放行纯删除，混合普通推送则保持拒绝。
test_missing_engine_deletion() {
    local snapshot_oid="$1" source_oid="$2" remote_before
    expect_success "缺引擎 fixture 预置 Gitee 分支" gitee_fixture_git update-ref refs/heads/fixture-without-engine "$snapshot_oid"
    expect_success "缺引擎 fixture 预置 Gitee 标签" gitee_fixture_git update-ref refs/tags/fixture-without-engine "$snapshot_oid"
    expect_success "缺引擎 fixture 预置 GitHub 分支" github_fixture_git update-ref refs/heads/fixture-without-engine "$source_oid"
    expect_success "缺引擎 fixture 预置 GitHub 标签" github_fixture_git update-ref refs/tags/fixture-without-engine "$source_oid"

    expect_success "缺少引擎时 Gitee 分支和标签仍可同批删除" fixture_git push gitee :refs/heads/fixture-without-engine :refs/tags/fixture-without-engine
    expect_rejected "缺引擎删除后 Gitee 分支确实不存在" gitee_fixture_git show-ref --verify --quiet refs/heads/fixture-without-engine
    expect_rejected "缺引擎删除后 Gitee 标签确实不存在" gitee_fixture_git show-ref --verify --quiet refs/tags/fixture-without-engine
    expect_success "缺少引擎时 GitHub 分支和标签仍可同批删除" fixture_git push origin :refs/heads/fixture-without-engine :refs/tags/fixture-without-engine
    expect_rejected "缺引擎删除后 GitHub 分支确实不存在" github_fixture_git show-ref --verify --quiet refs/heads/fixture-without-engine
    expect_rejected "缺引擎删除后 GitHub 标签确实不存在" github_fixture_git show-ref --verify --quiet refs/tags/fixture-without-engine

    remote_before="$(gitee_fixture_git show-ref)"
    expect_rejected "缺引擎 Gitee 删除混合普通推送时整批被拒绝" fixture_git push gitee :refs/heads/byPods refs/heads/byPods:refs/heads/fixture-forbidden
    assert_equal "$remote_before" "$(gitee_fixture_git show-ref)" "缺引擎 Gitee 混合推送失败后全部引用保持"
    remote_before="$(github_fixture_git show-ref)"
    expect_rejected "缺引擎 GitHub 删除混合普通推送时整批被拒绝" fixture_git push origin :refs/heads/byPods refs/heads/byPods:refs/heads/fixture-github-copy
    assert_equal "$remote_before" "$(github_fixture_git show-ref)" "缺引擎 GitHub 混合推送失败后全部引用保持"
}
# 验证刷新不碰真实索引、未提交内容、未跟踪文件与无关分支。
test_workspace_preservation() {
    local source_before="$(fixture_git rev-parse byPods)" snapshot_before="$(fixture_git rev-parse "$SNAPSHOT")" index_before status_before worktree_before
    print -r -- "unstaged source" >> "$FIXTURE/Src/app.m"
    print -r -- "staged fixture" > "$FIXTURE/staged.txt"
    fixture_git add staged.txt
    print -r -- "untracked fixture" > "$FIXTURE/scratch note.txt"
    index_before="$(cksum < "$FIXTURE/.git/index")"
    status_before="$(fixture_git --no-optional-locks status --porcelain=v1)"
    worktree_before="$(cksum "$FIXTURE/Src/app.m" "$FIXTURE/staged.txt" "$FIXTURE/scratch note.txt")"
    expect_success "含未提交改动时 --check 只读成功" /bin/zsh "$ENGINE" --check
    expect_success "相同源树重复刷新幂等" /bin/zsh "$ENGINE" --hook post-commit
    assert_equal "$snapshot_before" "$(fixture_git rev-parse "$SNAPSHOT")" "重复刷新不产生新快照提交"
    assert_equal "$source_before" "$(fixture_git rev-parse byPods)" "源分支引用保持原值"
    assert_equal "$index_before" "$(cksum < "$FIXTURE/.git/index")" "真实索引逐字节保持原值"
    assert_equal "$status_before" "$(fixture_git --no-optional-locks status --porcelain=v1)" "暂存、工作区和未跟踪状态保持原值"
    assert_equal "$worktree_before" "$(cksum "$FIXTURE/Src/app.m" "$FIXTURE/staged.txt" "$FIXTURE/scratch note.txt")" "工作区、暂存与未跟踪文件内容逐字节保留"
    assert_equal "untracked fixture" "$(cat "$FIXTURE/scratch note.txt")" "未跟踪文件内容保留"
    expect_success "切换非源分支 fixture" fixture_git switch -q -c fixture-topic
    fixture_git add Src/app.m
    expect_success "非源分支提交可正常完成" fixture_git commit -q -m "topic fixture"
    assert_equal "$snapshot_before" "$(fixture_git rev-parse "$SNAPSHOT")" "非源分支提交跳过快照刷新"
    assert_equal "$source_before" "$(fixture_git rev-parse byPods)" "非源分支提交不改源分支"
    mv "$ENGINE" "$TEST_ROOT/missing-engine.command"
    expect_rejected "工作区脚本缺失时稳定 hook 仍阻止 Gitee 强推" fixture_git push --force gitee byPods:byPods
    test_missing_engine_deletion "$snapshot_before" "$source_before"
    expect_success "旧分支缺少脚本时源提交仍可完成" fixture_git commit -q --allow-empty -m "missing engine on topic"
    mv "$TEST_ROOT/missing-engine.command" "$ENGINE"
}
# 打印最终结果与可复现测试目录。
report_test_result() {
    success_echo "全部隔离回归通过；未对真实项目创建提交、推送或更新引用。"
    print -r -- "日志：$LOG_FILE"
}
# 编排自述、独立环境与各项回归验证。
main() {
    show_script_intro_and_wait "$@" # 首先展示范围，确认后才创建临时 fixture。
    initialize_test_environment # 将 Git 环境与日志隔离到临时目录。
    create_fixture # 构造旧历史、本地远端和实际项目 hooks。
    test_snapshot_history # 验证全量当前树与独立快照父链。
    test_push_guards # 验证推送成功路径及旧历史防误推门禁。
    test_gitee_branch_deletion # 验证 Gitee 删除、恢复与整批拒绝保护。
    test_github_reference_deletion # 验证其它远端分支与标签删除不受阻挡。
    test_workspace_preservation # 验证索引、工作区与其它分支均不受影响。
    report_test_result # 汇总通过结果并保留复现日志。
}

main "$@"
