# GitHub 完整历史与 Gitee 零点快照

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 前言

本工程在同一个仓库文件夹中管理两条提交历史：[**GitHub**](https://github.com/) 使用原来的 `byPods`，保留全部已有历史；[**Gitee**](https://gitee.com/) 使用本地平铺分支 `gitee-snapshot`，首次从当前已提交内容建立无父提交的零点，之后继续积累新的历史。两条分支共用文件对象，不需要第二份工程目录。

快照包含 `byPods` 当前提交中的全部文件，包括 `PodspecDependencyReport` 的报告和 PNG；既有 `.gitignore` 保持原样。未提交、未跟踪和已忽略的文件不会进入快照。这里的“全跟踪”是保留工程现有跟踪范围，不会把 `Pods`、构建缓存等原本忽略的内容加入 Git。

## 一、文件与配置 <a href="#前言" style="font-size:17px; color:green;">🔼</a> <a href="#🔚" style="font-size:17px; color:green;">🔽</a>

| 文件 | 职责 |
| --- | --- |
| [gitee_snapshot.command](./gitee_snapshot.command) | 生成与检查快照，验证待推送引用 |
| [gitee_snapshot_setup.zsh](./gitee_snapshot_setup.zsh) | 备份并安装当前仓库的 Git 配置 |
| [`.githooks`](../../.githooks) | 提交、合并、改写提交后同步快照；推送前检查 |
| [Tests/run_regression.command](./Tests/run_regression.command) | 在临时仓库中验证快照和推送保护 |

安装后使用以下映射：

| 远端 | 本地源分支 | 远端目标分支 | 历史 |
| --- | --- | --- | --- |
| `origin`（GitHub） | `byPods` | `byPods` | 保留全部原历史 |
| `gitee`（Gitee） | `gitee-snapshot` | `byPods` | 从首次快照开始的新历史 |

安装把 [`.githooks`](../../.githooks) 的四个入口复制到本仓库 Git 元数据目录的 `jobs-gitee-snapshot-hooks.*`，并将本地 `core.hooksPath` 指向该稳定目录。切换到旧分支也会保留推送检查；删除操作直接放行，不依赖工作区快照脚本。若缺少脚本且包含普通推送，操作会停止，回到 `byPods` 后再推送即可。修改 hook 入口后须重新执行 `--install`。

其它配置只写入当前仓库的 `.git/config`：`byPods` 默认推送 `origin`，`gitee` 默认推送上述快照映射，`jobs.giteeSnapshot.*` 保存源分支、快照分支与目标。原配置备份保存在 Git 元数据目录中的 `jobs-gitee-snapshot-backups.*/config`。如果已有其它有效 hook 或其它 `core.hooksPath`，安装会停止并保留原配置。

## 二、首次使用 <a href="#前言" style="font-size:17px; color:green;">🔼</a> <a href="#🔚" style="font-size:17px; color:green;">🔽</a>

1、当前工程已安装本地配置；新克隆或迁移电脑后，在工程根目录执行以下命令，阅读内置自述后按回车安装。安装本身不创建提交。

若已有旧版 `codex/gitee-snapshot`，先改名以保留原快照链，再执行安装；已使用 `gitee-snapshot` 或新克隆时跳过改名。

```zsh
git branch -m codex/gitee-snapshot gitee-snapshot
```

```zsh
./ScriptsByDevTools/gitee_snapshot.command/gitee_snapshot.command --install
```

2、自行处理 Gitee 旧记录与容量问题：可以在 [**Sourcetree**](https://www.sourcetreeapp.com/) 删除远端 `gitee/byPods`，或在 Gitee 网页操作，然后在本地 `byPods` 提交这些脚本和文档。`post-commit` 会自动创建首次快照，根提交没有父提交；它的文件树与这次 `byPods` 提交完全一致。保持检出 `byPods`，快照分支只供推送。

终端删除旧远端分支时执行以下命令。本地 hook 放行所有远端的分支与标签删除，不再按分支名、远端名或快照启用状态限制：

```zsh
git push gitee --delete byPods
git push gitee --delete gitee
```

`git branch -D -r gitee/byPods` 只删除本地跟踪记录，不会删除服务器上的分支。Sourcetree 会先删除本地记录，再执行远端删除；以 push 的最终结果判断是否成功。删除操作按 [Git 官方 pre-push 输入协议](https://git-scm.com/docs/githooks#_pre_push)识别，不跳过正常推送保护。

如果日志包含 `remote: Repo size ... exceeds quota` 和 `pre-receive hook declined`，删除请求已通过本地 hook，但被 Gitee 服务器拒绝。旧分支仍留在服务器，下次 fetch 会再次显示同一个旧提交；这不代表快照脚本重新创建了远端分支。

先进入[本仓库服务端 GC 设置](https://gitee.com/JobsGo/JobsOCBaseConfigDemo/settings#git-gc)执行仓库 GC，按 [Gitee 官方容量处理说明](https://help.gitee.com/enterprise/code-manage/容量管理/仓库容量不足怎么办)检查是否恢复到配额内。GC 不保证释放足够空间。若仍超限，可尝试 Gitee 网页的分支管理删除旧分支，再执行服务端 GC；网页同样拒绝时，可联系 Gitee 支持并提供完整日志，或调整仓库配额。不能保证网页删除绕过容量限制；本地 `git gc`、强制删除或继续放宽本地 hook 都无法解除这次服务端拒绝。

3、分别推送：

```zsh
git push origin byPods
git push gitee
```

第二条命令读取已安装的 `remote.gitee.push`，实际推送 `gitee-snapshot` 到 Gitee 的 `byPods`。也可以明确写出映射：

```zsh
git push gitee refs/heads/gitee-snapshot:refs/heads/byPods
```

Gitee 旧分支、标签或其它引用仍可能保留旧历史；仅创建本地零点不会自动降低已有远端容量。处理旧引用后，按 [Gitee 仓库体积说明](https://help.gitee.com/repository/base/仓库体积过大，如何减小)检查仓库 GC 与容量。这个远端的 `main` 承载旧 OC 工程；远端记录的保留或删除由你决定，本地 hook 全部放行删除。仓库已因容量锁定时，新快照也不能保证立即获准推送。

## 三、Sourcetree 操作 <a href="#前言" style="font-size:17px; color:green;">🔼</a> <a href="#🔚" style="font-size:17px; color:green;">🔽</a>

在 [**Sourcetree**](https://www.sourcetreeapp.com/) 中继续检出并提交 `byPods`；提交 hook 会自动更新快照，不会切换当前分支，也不会修改暂存区或工作区。

**开发、提交和拉取 GitHub 都保持检出 `byPods`。推送 Gitee 时，在推送窗口选择快照作为源分支，无须检出快照；删除 Gitee 远端分支同样无须切换本地分支。**

GitHub 拉取窗口应显示 `origin`、远端分支 `byPods`、拉取到本地分支 `byPods`。如果本地分支显示 `gitee-snapshot`，先取消并切回 `byPods`，否则会出现 `refusing to merge unrelated histories`。快照与 GitHub 原历史故意独立，不能用 `--allow-unrelated-histories` 或 rebase 将两条历史合并。旧 Gitee 跟踪记录显示的待拉取计数不代表 GitHub 开发分支落后。

| 推送位置 | 推送窗口选择 |
| --- | --- |
| GitHub `origin` | 本地 `byPods` → 远端 `byPods` |
| Gitee `gitee` | 本地 `gitee-snapshot` → 远端 `byPods`，取消其它分支与标签 |

首次提交后刷新分支列表，即可看到与 `byPods` 同级显示的 `gitee-snapshot`。Sourcetree 明确传入的 `byPods:byPods` 会覆盖 Git 默认映射，因此不能只选择 Gitee 后继续推送原分支；`pre-push` 会拦截这个操作并显示正确映射。

现有通用动作“🚀逐层空白提交并Push（识别父Git）”会拉取、合并多个远端并推送当前 `HEAD`，不适用于本工程的两条独立历史。本工程使用上述原生推送窗口，或第二节的命令。

## 四、后续提交与检查 <a href="#前言" style="font-size:17px; color:green;">🔼</a> <a href="#🔚" style="font-size:17px; color:green;">🔽</a>

每次在 `byPods` 提交、合并或执行 amend / rebase 后，hook 会检查当前已提交文件树：内容变化时，创建以上一次快照为唯一父提交的新快照；内容相同时复用原快照，不新增快照提交。依赖图的字节未变化时，也不会产生新的 Git 文件对象。

快照链不会继承 GitHub 的父提交，但零点之后的 PNG 新版本仍会占用 Gitee 容量。该方案解决原有历史的搬运问题，之后的仓库大小仍随新内容增长。

只读检查：

```zsh
./ScriptsByDevTools/gitee_snapshot.command/gitee_snapshot.command --check
```

如果曾跳过 hook、快照落后或提交后同步失败，手动运行以下入口，阅读自述并按回车重试。它只更新本地快照，不执行推送。

```zsh
./ScriptsByDevTools/gitee_snapshot.command/gitee_snapshot.command
```

提交后的 hook 失败不会撤销已经完成的源分支提交；检查失败或快照落后时，Gitee 推送会被拦截。脚本会拒绝接管无标记、含合并提交或与源分支共享祖先的快照链，并通过锁和引用比较防止并发覆盖。日志追加到 `${TMPDIR:-/tmp}/gitee_snapshot.log`；`--check` 不写日志。

所有远端的删除操作均放行，包括分支、标签及多引用删除。普通推送仍只允许正确快照进入 Gitee 的 `byPods`，拦截原历史、标签和其它目标分支。直接使用 `gitee.com` URL 推送也会检查；若同一批删除中混入校验失败的普通推送，整次操作都会停止。GitHub 的普通源分支与标签推送照常使用；快照分支直接推到其它远端会被拦截。不要使用 `--no-verify`、`--mirror`、`--all` 或把两条历史合并。

## 五、验证与恢复 <a href="#前言" style="font-size:17px; color:green;">🔼</a> <a href="#🔚" style="font-size:17px; color:green;">🔽</a>

回归测试仅在系统临时目录创建源仓库和 bare 远端，不操作当前工程的提交或远端：

```zsh
./ScriptsByDevTools/gitee_snapshot.command/Tests/run_regression.command --run
```

测试会输出临时目录和日志位置，保留现场供核查。它验证独立零点、后续父链、报告保留、原历史保留、重复同步、工作区与暂存区保持，以及实际 push 的允许和拦截行为，包括各远端分支与标签删除、目标删除后恢复和混合错误推送整体拒绝。

需要恢复安装前配置时，先保存当前配置，再将安装输出中对应的 `config` 备份复制回原 Git 配置文件；普通克隆就是工程的 `.git/config`。备份是本地配置文件，可能包含私有远端地址，不应提交。恢复配置不会删除已经创建的快照分支，也不会修改任何远端。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
