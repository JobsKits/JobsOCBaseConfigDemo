# `恢复 Xcode PIF 构建会话`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

本目录提供独立的 MacOS `zsh` 脚本，用于处理 Xcode 偶发的依赖图会话冲突：

```text
Could not compute dependency graph:
MsgHandlingError(message: "unable to initiate PIF transfer session (operation in progress?)")
```

脚本既可由 `Podfile` 的 `post_integrate` 在 `pod install` 完成后自动调用，也可在终端独立诊断和恢复。

## 一、脚本行为

脚本按以下顺序执行：

1. 获取三个 iOS 工程共用的临时互斥锁，串行化并发的 `pod install` 收尾动作。
2. 采集当前用户的 `xcodebuild`、`SWBBuildService` 和 `XCBBuildService` 进程快照。
3. 如果存在 `xcodebuild` 或构建服务子进程，则按活动构建处理并跳过回收。
4. 只向可确认空闲的构建服务发送 `TERM`，最多等待 5 秒，不升级为 `KILL`。
5. 在没有活动构建信号时，通过 `xcodebuild -workspace ... -list` 验证工作区依赖图入口，最长等待 60 秒。

## 二、安全边界

- 不关闭 Xcode 主进程。
- 不删除 `DerivedData`、ModuleCache、Pods 或工程文件。
- 多套工程并行运行时只允许一个恢复实例进入构建服务操作区。
- 不终止其他用户的进程。
- 不打断可识别的活动 `xcodebuild` 或带子进程的构建服务。
- 验证超时时，只终止本脚本自己启动的 `xcodebuild`。
- 自动钩子失败时由 `Podfile` 输出警告，不阻断 `pod install`。

## 三、运行方式

### 3.1 `pod install` 后自动运行

工程 `Podfile` 已在 `post_integrate` 最后调用本脚本。自动模式不要求终端输入，日志仍会保留。

### 3.2 只读诊断

```shell
./【MacOS】🧹恢复Xcode\ PIF构建会话.command --check-only
```

该模式只报告哪些服务处于活动状态或可安全回收，不发送任何终止信号，也不启动依赖图验证。

### 3.3 独立恢复

```shell
./【MacOS】🧹恢复Xcode\ PIF构建会话.command
```

独立恢复模式会先显示影响范围，只有输入完整大写 `YES` 才会继续。

可选参数：

- `--project-root 路径`：指定包含 `.xcworkspace` 的工程根目录。
- `--skip-verify`：完成安全回收后不运行 `xcodebuild -list`。
- `--help`：显示参数说明。

## 四、日志

日志统一写入 `$TMPDIR`：

- `【MacOS】🧹恢复Xcode PIF构建会话.log`：进程判断、回收和汇总日志。
- `【MacOS】🧹恢复Xcode PIF构建会话.xcodebuild-list.log`：工作区依赖图验证输出。

## 五、常见问题

### 5.1 为什么不直接删除 DerivedData？

该错误的直接冲突点通常是构建服务中的并行 PIF 会话。先回收空闲会话的影响更小，也不会让所有工程重新编译。

### 5.2 检测到活动构建时怎么办？

脚本会安全跳过。等待现有编译结束后重新执行，或再次运行 `pod install` 即可。

### 5.3 自动恢复失败会不会导致 Pods 安装失败？

不会。三个 iOS 工程都把它作为可选后置增强；失败只给出警告和日志路径。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
