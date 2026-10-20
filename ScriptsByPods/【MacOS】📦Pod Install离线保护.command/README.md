# `Pod Install 本地脚本保护`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、目录文件](#jobs-toc-heading-2)
- [二、两阶段执行策略](#jobs-toc-heading-3)
  - [2.1、依赖解析前：--preflight](#jobs-toc-heading-4)
  - [2.2、集成完成后：--post-integrate](#jobs-toc-heading-5)
- [三、安全边界](#jobs-toc-heading-6)
- [四、独立运行](#jobs-toc-heading-7)
- [五、日志](#jobs-toc-heading-8)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

本目录为 [**CocoaPods**](https://cocoapods.org/) 提供两阶段脚本入口：前置离线生成依赖报告，成功集成后检查 Xcode PIF 构建会话，并后台体检、更新 [**CodeGraph**](https://github.com/colbymchenry/codegraph)。

前置任务不探测网络；CodeGraph 收尾默认允许按需安装依赖，显式离线时禁止安装。CocoaPods 仍按原始语义完成依赖解析、下载与集成，并原样返回自己的成功或失败结果。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、目录文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `./jobs_pod_install_offline_guard.rb`：由 `Podfile` 最前面加载，异步启动不依赖网络结果的本地前置任务。
- `./【MacOS】📦Pod Install离线保护.command`：统一编排前置任务和 `post_integrate` 收尾任务。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、两阶段执行策略 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

### <span id="jobs-toc-heading-4" data-jobs-toc="v2">2.1、依赖解析前：`--preflight` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

`Podfile` 被 `pod install` 加载后立即派生独立进程，然后 CocoaPods 继续自己的主流程：

1. 只在本地生成 `PodspecDependencyReport`，不启动 CodeGraph。
2. 向报告脚本传入离线标记，禁止安装 [**Homebrew**](https://brew.sh/) 或 Graphviz。
3. 前置任务的耗时、失败或退出状态都不会阻塞、覆盖或短路 CocoaPods。

### <span id="jobs-toc-heading-5" data-jobs-toc="v2">2.2、集成完成后：`--post-integrate` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

只有 CocoaPods 已经完成工程集成并进入 `post_integrate`，才执行以下收尾：

1. 检测当前用户是否存在活动 `xcodebuild` 或 Xcode 构建服务子进程。
2. 有活动构建时安全跳过，不抢占正在进行的编译。
3. 无活动构建时终止空闲的 `SWBBuildService` / `XCBBuildService`，再用工作空间只读列表命令重建会话。
4. 子脚本失败只记录警告，不篡改 CocoaPods 已经得出的安装结果。
5. 后台调用 `../codegraph_init.command/codegraph_init.command`；传入明确工程根目录、`CODEGRAPH_AUTO_INIT=1`、`CODEGRAPH_EXPORT_ASYNC=0`，由同一后台进程完成工具链体检、索引和 Markdown 导出。安装主流程不等待后台任务。
6. 默认允许补齐缺失或损坏工具。Homebrew 目前没有该官方 CodeGraph 对应 formula，因此优先通过 Brew 管理 `node@24`，再从官方 npm 包 `@colbymchenry/codegraph` 安装 CLI 到用户独立前缀；安装前展示来源。已有健康 CLI 直接复用，不自动升级。

完整体检覆盖系统 zsh / bash / curl / Git 与 CLT、Brew 版本 / 配置 / doctor、Node.js 实际执行、npm 版本 / prefix / root、SQLite 内存查询，以及 CodeGraph 版本、子命令能力与隔离样例建图。随后按目标工程检查 `status --json` 的路径与索引完整性；不是仅检查 `command -v`。产物为工程根下的 `.codegraph/codegraph.db` 与 `.codegraph/codegraph.md/`，索引刷新、Markdown 按导出脚本既有覆盖规则更新。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">三、安全边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 不删除或覆盖 `Pods`、`Podfile.lock`、`.xcworkspace`、`DerivedData`。
- 不调用 `Kernel.exit(0)` 跳过 CocoaPods，也不使用空依赖 Podfile 重新集成工程。
- 不对 `pod update`、`pod ipc`、`pod repo` 等命令注入任务。
- 前置任务只使用本机已有工具；缺少工具时跳过对应增强。
- CodeGraph 的工具安装与索引只在集成成功后的后台进程执行，失败写入日志，不把依赖安装改判为失败；`JOBS_SKIP_CODEGRAPH=1` 完全跳过。首次创建地图、已有地图更新均由同一入口处理。
- `--offline`、`JOBS_POD_INSTALL_OFFLINE=1` 或 `CODEGRAPH_ALLOW_INSTALL=0` 禁止 CodeGraph 安装工具，健康工具仍可更新本地地图；前置报告默认离线不会污染收尾安装策略。此开关只限制辅助脚本，不保证 CocoaPods 依赖解析完全离线。
- 调度日志中的 PID 只用于观察，重复任务由 CodeGraph 子脚本的 `.codegraph/.jobs-update.lock` 工程锁处理，避免复用 PID 导致误跳过。
- PIF 脚本遵守活动构建保护、当前用户进程边界和跨工程互斥锁。

## <span id="jobs-toc-heading-7" data-jobs-toc="v2">四、独立运行 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

只读检查所有脚本是否可用：

```shell
./【MacOS】📦Pod\ Install离线保护.command --check-only
```

只检查前置任务：

```shell
./【MacOS】📦Pod\ Install离线保护.command --preflight --check-only
```

只检查安装完成后的 PIF 与 CodeGraph 工具链：

```shell
./【MacOS】📦Pod\ Install离线保护.command --post-integrate --check-only
```

不带 `--check-only` 独立执行时，必须输入完整大写 `YES`。可用参数：

- `--preflight`：只运行离线依赖报告。
- `--post-integrate`：运行 Xcode PIF 会话检查，随后后台体检、更新 CodeGraph。
- `--offline`：禁止 CodeGraph 安装依赖；前置报告始终按离线策略运行。
- `--check-only`：只读检查，CodeGraph 同步执行 `--check-only` 完整体检，不安装、不建图、不导出。
- `--project-root 路径`：指定包含 `Podfile` 的工程根目录。

Podfile 自动入口设置 `JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY=1` 时，前置与收尾均使用只读模式。`JOBS_POD_INSTALL_PURE=1` 仍按 Podfile 既有边界跳过可选收尾增强。

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">五、日志 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

日志位于系统临时目录，并使用工程路径摘要隔离三个 iOS 工程：

- `jobs-pod-install-preflight-<工程摘要>.log`：Podfile 顶部异步任务总输出。
- `【MacOS】📦Pod Install离线保护.<工程摘要>.log`：统一入口汇总。
- `codegraph_init.<工程摘要>.async.log`：CodeGraph 后台输出，按工程隔离并追加，不截断正在运行任务的日志。
- PIF 与依赖报告子脚本仍保留自己的同名日志。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
