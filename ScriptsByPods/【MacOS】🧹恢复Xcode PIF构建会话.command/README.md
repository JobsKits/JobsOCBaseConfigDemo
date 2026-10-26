# `恢复 Xcode PIF 构建会话`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、脚本行为](#jobs-toc-heading-2)
- [二、安全边界](#jobs-toc-heading-3)
- [三、运行方式](#jobs-toc-heading-4)
  - [3.1 pod install 后自动运行](#jobs-toc-heading-5)
  - [3.2 只读诊断](#jobs-toc-heading-6)
  - [3.3 独立恢复](#jobs-toc-heading-7)
- [四、日志](#jobs-toc-heading-8)
- [五、常见问题](#jobs-toc-heading-9)
  - [5.1 为什么不直接删除 DerivedData？](#jobs-toc-heading-10)
  - [5.2 检测到活动构建时怎么办？](#jobs-toc-heading-11)
  - [5.3 自动恢复失败会不会导致 Pods 安装失败？](#jobs-toc-heading-12)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

本目录提供独立的 MacOS `zsh` 脚本，用于处理 Xcode 偶发的依赖图会话冲突：

```text
Could not compute dependency graph:
MsgHandlingError(message: "unable to initiate PIF transfer session (operation in progress?)")
```

脚本既可由 `Podfile` 的 `post_integrate` 在 `pod install` 完成后自动调用，也可在终端独立诊断和恢复。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、脚本行为 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

正常终端运行先展示内置自述，再要求精确输入大写 `YES` 授权恢复；取消或输入结束时不初始化日志、不采集进程或发送信号。确认后按以下顺序执行：

1. 获取三个 iOS 工程共用的临时互斥锁，串行化并发的 `pod install` 收尾动作。
2. 采集当前用户的 `xcodebuild`、`SWBBuildService` 和 `XCBBuildService` 进程快照。
3. 如果存在 `xcodebuild` 或构建服务子进程，则按活动构建处理并跳过回收。
4. 只向可确认空闲的构建服务发送 `TERM`，最多等待 5 秒，不升级为 `KILL`。
5. 在没有活动构建信号时，通过 `xcodebuild -workspace ... -list` 验证工作区依赖图入口，最长等待 60 秒。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、安全边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 不关闭 Xcode 主进程。
- 不删除 `DerivedData`、ModuleCache、Pods 或工程文件。
- 多套工程并行运行时只允许一个恢复实例进入构建服务操作区。
- 不终止其他用户的进程。
- 不打断可识别的活动 `xcodebuild` 或带子进程的构建服务。
- 验证超时时，只终止本脚本自己启动的 `xcodebuild`。
- 自动钩子失败时由 `Podfile` 输出警告，不阻断 `pod install`。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、运行方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

### <span id="jobs-toc-heading-5" data-jobs-toc="v2">3.1 `pod install` 后自动运行 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

工程 `Podfile` 已在 `post_integrate` 调用本脚本，继承当前终端并保留 `YES` 确认。`JOBS_POD_INSTALL_HOOK=1` 和 `JOBS_SKIP_README=1` 不会绕过授权；没有可交互终端时跳过恢复，并提示在终端执行。

### <span id="jobs-toc-heading-6" data-jobs-toc="v2">3.2 只读诊断 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```shell
./【MacOS】🧹恢复Xcode\ PIF构建会话.command --check-only
```

该模式只报告哪些服务处于活动状态或可安全回收，不发送任何终止信号，也不启动依赖图验证。

### <span id="jobs-toc-heading-7" data-jobs-toc="v2">3.3 独立恢复 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

```shell
./【MacOS】🧹恢复Xcode\ PIF构建会话.command
```

独立恢复与 Podfile 调用采用相同门禁：阅读影响范围后输入完整大写 `YES`；其它输入、直接回车或输入结束均跳过恢复。`JOBS_POD_INSTALL_INTERACTION=check-only` 等同于只读诊断，`skip` 明确跳过。

可选参数：

- `--project-root 路径`：指定包含 `.xcworkspace` 的工程根目录。
- `--skip-verify`：完成安全回收后不运行 `xcodebuild -list`。
- `--help`：显示参数说明。

## <span id="jobs-toc-heading-8" data-jobs-toc="v2">四、日志 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

日志统一写入 `$TMPDIR`：

- `【MacOS】🧹恢复Xcode PIF构建会话.log`：进程判断、回收和汇总日志。
- `【MacOS】🧹恢复Xcode PIF构建会话.xcodebuild-list.log`：工作区依赖图验证输出。

## <span id="jobs-toc-heading-9" data-jobs-toc="v2">五、常见问题 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

### <span id="jobs-toc-heading-10" data-jobs-toc="v2">5.1 为什么不直接删除 DerivedData？ <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

该错误的直接冲突点通常是构建服务中的并行 PIF 会话。先回收空闲会话的影响更小，也不会让所有工程重新编译。

### <span id="jobs-toc-heading-11" data-jobs-toc="v2">5.2 检测到活动构建时怎么办？ <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

脚本会安全跳过。等待现有编译结束后重新执行，或再次运行 `pod install` 即可。

### <span id="jobs-toc-heading-12" data-jobs-toc="v2">5.3 自动恢复失败会不会导致 Pods 安装失败？ <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

不会。三个 iOS 工程都把它作为可选后置增强；失败只给出警告和日志路径。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
