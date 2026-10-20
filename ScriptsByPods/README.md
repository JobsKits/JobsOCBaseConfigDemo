# `ScriptsByPods`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、安装入口](#jobs-toc-heading-2)
- [二、CodeGraph 运行边界](#jobs-toc-heading-3)
- [三、日志与迁移](#jobs-toc-heading-4)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

本目录存放 [**CocoaPods**](https://cocoapods.org/) 生命周期的辅助脚本；自动执行以工程根目录 [Podfile](../Podfile) 的实际挂载为准，目录中存在脚本不代表它会自动运行。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、安装入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

| 入口 | 挂载时机 | 行为与失败边界 |
| --- | --- | --- |
| [CocoaPods 网络适配](<./【MacOS】🌐CocoaPods网络适配.command/README.md>) | Podfile 顶部、选源前 | 同步验证当前链路与已启用代理，注册已审发布请求的官方归档回退；仅影响当前安装进程与子进程 |
| [CocoaPods 源自动选择](<./【MacOS】🌐CocoaPods源自动选择.command/README.md>) | Podfile 的 `source` 声明前 | 同步选择当前可用公共 Specs 源，保留私有源与锁定版本 |
| [Pod Install 本地脚本保护](<./【MacOS】📦Pod Install离线保护.command/README.md>) | 依赖解析前异步 `--preflight` | 只离线生成 `../PodspecDependencyReport/`，不安装工具、不启动 CodeGraph |
| 同一保护入口 `--post-integrate` | 成功完成工程集成后 | 同步执行 [PIF 会话检查](<./【MacOS】🧹恢复Xcode PIF构建会话.command/README.md>)，有活动构建则跳过；随后后台启动 CodeGraph |
| [CodeGraph 初始化](./codegraph_init.command/README.md) | 收尾后台进程 | 完整体检工具链、按需补齐依赖，更新 `../.codegraph/codegraph.db` 并调用 [Markdown 导出](./codegraph_export_md.command/README.md) 更新 `../.codegraph/codegraph.md/`；安装主流程无须等待，失败不阻断安装 |

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、CodeGraph 运行边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

完整体检覆盖系统 Shell / curl / Git / CLT、[**Homebrew**](https://brew.sh/) 版本 / 配置 / doctor、Node.js 实际执行和 npm 配置、SQLite 内存查询、CLI 子命令与隔离样例建图，再校验目标状态 JSON 的工程路径与完整性。已有健康 CLI 直接复用、不自动升级；Homebrew 没有该官方 [**CodeGraph**](https://github.com/colbymchenry/codegraph) 对应 formula，缺失或损坏的 Node/npm 优先通过 Brew 的 `node@24` 补齐，再从官方 npm 包 `@colbymchenry/codegraph` 安装 CLI 到用户独立前缀，操作前展示实际来源。

- `JOBS_SKIP_CODEGRAPH=1`：跳过地图。
- `JOBS_POD_INSTALL_OFFLINE=1`、`CODEGRAPH_ALLOW_INSTALL=0` 或保护入口 `--offline`：禁止 CodeGraph 安装工具，健康工具仍可更新本地地图；这些开关不保证 CocoaPods 自身完全离线。
- `JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY=1`：前置与收尾均只读检查，CodeGraph 不安装、不建图、不导出。
- `JOBS_POD_INSTALL_PURE=1`：按 Podfile 既有边界跳过可选收尾增强。
- 互斥以 `../.codegraph/.jobs-update.lock` 工程锁为准，调度日志中的 PID 只供观察，不以任意存活 PID 判断是否正在索引。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、日志与迁移 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

迁移工程时保留 Podfile、Podfile.deps 与本目录完整脚本包，路径按脚本与明确工程根解析。系统临时目录中的 `jobs-pod-install-preflight-<工程摘要>.log` 记录前置总输出，`【MacOS】📦Pod Install离线保护.<工程摘要>.log` 记录调度汇总，`codegraph_init.<工程摘要>.async.log` 按工程路径隔离并追加后台输出，具体位置随安装终端打印。PIF、依赖报告和 CodeGraph 子脚本另保留各自日志。

本目录辅助任务失败只告警或写日志，不伪造 CocoaPods 成功，不删除 Pods、锁文件、工作空间或 DerivedData。网络模块查询命令不联网，真实依赖下载失败仍由 CocoaPods 报告。脚本语法与隔离调度验证不代表真实 `pod install`、工具链安装或 Xcode 构建已经通过。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

