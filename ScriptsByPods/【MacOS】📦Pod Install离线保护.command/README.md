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

本目录为 [**CocoaPods**](https://cocoapods.org/) 提供两阶段前台脚本入口：依赖解析前确认并生成依赖报告，成功集成后逐项确认 Xcode PIF 构建会话恢复，并体检和更新 [**CodeGraph**](https://github.com/colbymchenry/codegraph)。

默认保留真实终端输入：先显示内置自述并等待回车，再由子脚本分别确认工具安装 / 升级、PIF 恢复和地图更新。显式离线时禁止安装工具；没有可交互终端时明确跳过辅助写任务。CocoaPods 仍按原始语义完成依赖解析、下载与集成，并保留自己的成功或失败结果。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、目录文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `./jobs_pod_install_offline_guard.rb`：由 `Podfile` 最前面加载，同步启动前置依赖报告，并继承当前终端输入。
- `./【MacOS】📦Pod Install离线保护.command`：统一编排前置任务和 `post_integrate` 收尾任务。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、两阶段执行策略 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

### <span id="jobs-toc-heading-4" data-jobs-toc="v2">2.1、依赖解析前：`--preflight` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

`Podfile` 被真实 `pod install` 加载后，同步执行 `--preflight`：

1、先显示自述并等待回车；已自动识别工程路径仍需确认。

2、依赖报告保留 [**Homebrew**](https://brew.sh/) 自检 / 更新和 Graphviz 安装 / 升级选择，普通安装或更新均为回车跳过、输入任意字符后执行。

3、生成 `PodspecDependencyReport` 后继续依赖解析；辅助任务失败会明确告警，但不短路 CocoaPods，也不替代其退出状态。

### <span id="jobs-toc-heading-5" data-jobs-toc="v2">2.2、集成完成后：`--post-integrate` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

只有 CocoaPods 已经完成工程集成并进入 `post_integrate`，才执行以下收尾：

1、PIF 脚本显示影响范围；只有精确输入大写 `YES` 才会进入恢复，回车、其它输入或输入结束均跳过。

2、确认后检测当前用户是否存在活动 `xcodebuild` 或构建服务子进程，有活动构建时安全跳过。

3、无活动构建时终止空闲的 `SWBBuildService` / `XCBBuildService`，再用工作空间只读列表命令重建会话。

4、前台调用 `../codegraph_init.command/codegraph_init.command`，传入明确工程根目录；等待工具链体检、索引和 Markdown 导出结束，真实输入和结果均保留在当前终端。

5、缺失或损坏工具须经终端选择后补齐。Homebrew 目前没有该官方 CodeGraph 对应 formula，因此优先通过 Brew 管理 `node@24`，再从官方 npm 包 `@colbymchenry/codegraph` 安装 CLI 到用户独立前缀；安装前展示来源。已有健康 CLI 复用，更新和重建地图按子脚本说明确认。

6、子任务失败会继续其余辅助任务并汇总失败；调度器返回非零供 Podfile 告警，不篡改 CocoaPods 已经得出的安装结果。

完整体检覆盖系统 zsh / bash / curl / Git 与 CLT、Brew 版本 / 配置 / doctor、Node.js 实际执行、npm 版本 / prefix / root、SQLite 内存查询，以及 CodeGraph 版本、子命令能力与隔离样例建图。随后按目标工程检查 `status --json` 的路径与索引完整性；不是仅检查 `command -v`。产物为工程根下的 `.codegraph/codegraph.db` 与 `.codegraph/codegraph.md/`，索引刷新、Markdown 按导出脚本既有覆盖规则更新。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">三、安全边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 不删除或覆盖 `Pods`、`Podfile.lock`、`.xcworkspace`、`DerivedData`。
- 不调用 `Kernel.exit(0)` 跳过 CocoaPods，也不使用空依赖 Podfile 重新集成工程。
- 不对 `pod update`、`pod ipc`、`pod repo` 等命令注入任务。
- 交互模式由 `JOBS_POD_INSTALL_INTERACTION=interactive|check-only|skip` 选择，默认 `interactive`；`JOBS_POD_INSTALL_HOOK`、`JOBS_SKIP_README` 或 `CODEGRAPH_AUTO_INIT` 不代表用户已确认。
- `interactive` 没有 TTY 或输入结束时，不把管道输入当授权，也不默认安装、生成报告或更新地图。
- `check-only` 只读检查，不安装、不生成报告、不恢复 PIF、不建图或导出；`skip` 跳过辅助任务。
- CodeGraph 的工具安装与索引只在集成成功后的前台流程执行，失败明确显示并记入日志，不把依赖安装改判为失败；`JOBS_SKIP_CODEGRAPH=1` 完全跳过。首次创建地图、已有地图更新均由同一入口处理。
- 显式 `--offline` 或 `JOBS_POD_INSTALL_OFFLINE=1` 禁止辅助脚本安装 / 升级工具；`CODEGRAPH_ALLOW_INSTALL=0` 单独禁止 CodeGraph 安装工具。已有工具仍可在确认后生成报告或更新地图；这些开关不保证 CocoaPods 依赖解析完全离线。
- CodeGraph 子脚本使用 `.codegraph/.jobs-update.lock` 工程锁避免并发更新；不再用后台 PID 代替执行结果。
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

不带 `--check-only` 执行时，先阅读自述并按回车继续；输入其它内容或输入结束则取消。具体业务由子脚本继续确认，PIF 恢复必须输入完整大写 `YES`。可用参数：

- `--preflight`：只前台运行依赖报告并保留工具选择。
- `--post-integrate`：依次确认 Xcode PIF 会话恢复和 CodeGraph 体检 / 地图更新。
- `--offline`：禁止辅助脚本安装或升级工具，保留已有工具和交互确认。
- `--check-only`：只读检查，CodeGraph 同步执行 `--check-only` 完整体检，不安装、不建图、不导出。
- `--project-root 路径`：指定包含 `Podfile` 的工程根目录。

Podfile 入口可设置 `JOBS_POD_INSTALL_INTERACTION=check-only`，或兼容原 `JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY=1`，使前置与收尾均为只读。`JOBS_POD_INSTALL_PURE=1`、`JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS=1` 和 `JOBS_POD_INSTALL_INTERACTION=skip` 均跳过前后两阶段；不会在纯净模式下另起报告或地图任务。

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">五、日志 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

日志位于系统临时目录，并使用工程路径摘要隔离三个 iOS 工程：

- 前置输出直接进入当前安装终端，不另起后台进程或后台总日志。
- `【MacOS】📦Pod Install离线保护.<工程摘要>.log`：统一入口汇总。
- `codegraph_init.<工程摘要>.log`：CodeGraph 前台执行日志；按工程隔离，具体位置随执行输出显示。
- PIF 与依赖报告子脚本仍保留自己的同名日志；只读检查不创建业务产物。

隔离交互回归入口：

```shell
ruby ./Tests/interaction_workflow_test.rb
```

回归使用临时工程、假子脚本与 PTY，不执行真实 CocoaPods、Homebrew、Graphviz、PIF 恢复或 CodeGraph。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
