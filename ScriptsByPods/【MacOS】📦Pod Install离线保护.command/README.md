# `Pod Install 本地脚本保护`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

本目录为 [**CocoaPods**](https://cocoapods.org/) 提供两阶段本地脚本入口，目标是让 Jobs 自定义脚本不被依赖下载、CDN 超时或网络失败阻塞，同时在成功集成后安全检查 Xcode PIF 构建会话。

该机制不会探测网络、不会伪造成功、不会提前结束 `pod install`。CocoaPods 仍按原始语义完成依赖解析、下载与集成，并原样返回自己的成功或失败结果。

## 一、目录文件

- `./jobs_pod_install_offline_guard.rb`：由 `Podfile` 最前面加载，异步启动不依赖网络结果的本地前置任务。
- `./【MacOS】📦Pod Install离线保护.command`：统一编排前置任务和 `post_integrate` 收尾任务。

## 二、两阶段执行策略

### 2.1、依赖解析前：`--preflight`

`Podfile` 被 `pod install` 加载后立即派生独立进程，然后 CocoaPods 继续自己的主流程：

1. 本地生成 `PodspecDependencyReport`。
2. 本机工具齐全时，后台启动 CodeGraph 索引和 Markdown 导出。
3. 强制向这些脚本传入离线标记，禁止安装 Homebrew、Graphviz、Node.js、npm 或 CodeGraph。
4. 前置任务的耗时、失败或退出状态都不会阻塞、覆盖或短路 CocoaPods。

### 2.2、集成完成后：`--post-integrate`

只有 CocoaPods 已经完成工程集成并进入 `post_integrate`，才同步执行 Xcode PIF 构建会话检查：

1. 检测当前用户是否存在活动 `xcodebuild` 或 Xcode 构建服务子进程。
2. 有活动构建时安全跳过，不抢占正在进行的编译。
3. 无活动构建时终止空闲的 `SWBBuildService` / `XCBBuildService`，再用工作空间只读列表命令重建会话。
4. 子脚本失败只记录警告，不篡改 CocoaPods 已经得出的安装结果。

## 三、安全边界

- 不删除或覆盖 `Pods`、`Podfile.lock`、`.xcworkspace`、`DerivedData`。
- 不调用 `Kernel.exit(0)` 跳过 CocoaPods，也不使用空依赖 Podfile 重新集成工程。
- 不对 `pod update`、`pod ipc`、`pod repo` 等命令注入任务。
- 前置任务只使用本机已有工具；缺少工具时跳过对应增强。
- PIF 脚本遵守活动构建保护、当前用户进程边界和跨工程互斥锁。

## 四、独立运行

只读检查所有脚本是否可用：

```shell
./【MacOS】📦Pod\ Install离线保护.command --check-only
```

只检查前置任务：

```shell
./【MacOS】📦Pod\ Install离线保护.command --preflight --check-only
```

只检查安装完成后的 PIF 收尾：

```shell
./【MacOS】📦Pod\ Install离线保护.command --post-integrate --check-only
```

不带 `--check-only` 独立执行时，必须输入完整大写 `YES`。可用参数：

- `--preflight`：只运行依赖报告与 CodeGraph 启动阶段。
- `--post-integrate`：只运行 Xcode PIF 会话检查阶段。
- `--offline`：兼容参数；前置任务始终按本机离线策略运行。
- `--check-only`：只读检查，不生成报告、不启动 CodeGraph。
- `--project-root 路径`：指定包含 `Podfile` 的工程根目录。

## 五、日志

日志位于系统临时目录，并使用工程路径摘要隔离三个 iOS 工程：

- `jobs-pod-install-preflight-<工程摘要>.log`：Podfile 顶部异步任务总输出。
- `【MacOS】📦Pod Install离线保护.<工程摘要>.log`：统一入口汇总。
- `codegraph_init.<工程摘要>.async.log`：CodeGraph 后台输出。
- PIF 与依赖报告子脚本仍保留自己的同名日志。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
