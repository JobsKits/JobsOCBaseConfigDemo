# `JobsOCTools`

<iframe
  src="https://dragonir.github.io/3d/#/earth"
  title="Jobs出品，必属精品"
  width="100%"
  height="400"
  style="border:0; display:block;"
  allowfullscreen>
</iframe>

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> 这份自述用于记录 `JobsOCTools` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsOCTools is an Objective-C component collection containing UI widgets, crash diagnostics, crypto helpers, tab bar utilities, WebSocket helpers, animation resources, and other reusable iOS toolspec. 登录、注册与忘记密码模板统一由 `JobsAppDoor` Pod 管理。


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCTools` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `0.0.1` |
| 平台 | `ios 12.0` |
| 摘要 | Objective-C UI and utility components by Jobspec. |
| 首页 | [https://github.com/Jobs/JobsOCTools](https://github.com/Jobs/JobsOCTools) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / jobs@example.com` |
| podspec | `JobsByPods/JobsOCTools@Pods/JobsOCTools.podspec` |
| source | `{ :git => 'https://github.com/Jobs/JobsOCToolspec.git', :tag => spec.version.to_s }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsOCTools` 相关能力。
- 当 `JobsOCTools` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。
- TabBar 的 `stopAnimationAllLottieView` 直接调用 Lottie 原生 `[lottieView stop]` 停止并复位动画，避免点式 `.stop` 被计时器的 `getter=isStop` 属性解析为错误消息；计时器自身的 `stop` 属性合同保持。保存的动画切换 Block 在 owner 释放后直接返回，不调用 nil Block。验证结果见本 README 统一验收记录。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCTools@Pods/
├── JobsOCTools.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsOCTools.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开入口与核心实现，185 个文件
├── Support/  # 内部支援，4 个文件
├── Resource/  # 非代码资源，75 个文件
├── LICENSE  # 许可证文件
└── Tests/  # 独立回归，6 个文件
```

- `JobsOCTools.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 185 个文件，其中源码 / 头文件 150 个；按 Jobs 规范，它是 `JobsOCTools` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 4 个文件，其中源码 / 头文件 4 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Support/UIKit/NSString/NSString+Sys` 提供当前 Pod 内部使用的 `byTrimmingCharactersInSet` 字符串裁剪 DSL，不回引 `JobsByOCPods`。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCTools.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCTools.h`
- `Core/**/*.{h,m,mm,c}`
- `Core/在指定的y区间内滑动视图/JobsScrollYView` 的拖拽位移会写入 `jobsPoint`，实现层必须承接 `UILocationProtocol_synthesize`，避免运行时缺失 `setJobsPoint:`。
- `Core/在指定的y区间内滑动视图/JobsScrollViewVC` 作为演示入口，页面内展示 GK 导航栏、返回键、导航标题、使用文案、最高 / 最低锚点提示和绿色拖拽区提示；上滑释放会按最高点提示行的实际布局位置吸附，下滑释放回到底部初始位置。
- `Core/CrashLog` 提供 `JobsOCCrashLogCenter`、日志文件信息和内存快照模型；默认写入 `Documents/jobs_crash.log`，记录启动会话、前后台安全点、异常退出判定、Signal / NSException 和周期内存轨迹，日志超过 `1 MB` 时保留最近 `512 KB`。
- `JobsAppDoor` 认证模块已下沉到独立 Pod；`JobsOCTools` 不再公开认证控制器、表单视图或认证配置。
- `Core/XXTools` 的非标准 `UIFontWeight = -0.4` 通过 `JobsOCDefs` 的 `UIFontSystemFontOfSizeAndWeight` 工厂创建，不在上层直接调用系统 UIFont 工厂。

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `UIKit`
- `Foundation`
- `QuartzCore`
- `CoreText`
- `EventKit`
- `UserNotifications`
- `NetworkExtension`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `FDFullscreenPopGesture`
- `FSCalendar`
- `Masonry`
- `PPBadgeView`
- `ReactiveObjC`
- `SocketRocket`
- `ZFPlayer`
- `lottie-ios`
- `JobsBlock`
- `JobsMakes`
- `JobsModelDSL`
- `JobsOCDSL`
- `JobsBaseUI`
- `JobsOCDefs`
- `JobsCryptography`
- `JobsStringUtils`
- `JobsOCTimer`
- `JobsCountdownBtn`
- `JobsOCGraphicCaptcha`
- `JobsSuspend`
- `JobsOCKeyboardMgr`
- `JobsByOCPods`
- `JobsAppTools`
- `TFPopupExtra`
- `JobsHotLabel`
- `JobsDeviceInfo`
- `AFSecurityPolicyExtra`
- `HTMLDocumentExtra`
- `FMDatabaseExtra`
- `FSCalendarExtra`
- `GKCustomNavigationBarExtra`
- `HXPhotoManagerExtra`
- `HXPhotoViewExtra`
- `IQKeyboardManagerExtra`
- `JXCategoryViewExtra`
- `LMJDropdownMenuExtra`
- `MGSwipeTableCellExtra`
- `RACExtra`
- `ReachabilityExtra`
- `SRWebSocketExtra`
- `SZTextViewExtra`
- `ZFPlayerExtra`
- `ZMJCellExtra`
- `JobsOCProtocols`
- `JobsLoadingImage`
- `JobsOCRuntimeKits`
- `JobsLanMgr`
- `JobsOCCountryCodeCtrl`
- `JobsFuseAnimation`
- `XYColorOC`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsOCTools/JobsOCTools.h>)
#import <JobsOCTools/JobsOCTools.h>
#else
#import "JobsOCTools.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsOCTools.h` 不是最终公开入口，请先修正 `JobsOCTools.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前 `Resource` 目录包含 74 个资源文件。
- podspec 通过 `JobsOCToolsCore` resource bundle 递归声明图片、JSON、plist、bundle、xib、storyboard、字体、音视频和 `xcprivacy` 等资源；新增资源时继续放入真实 `Resource` 目录并复核 bundle 映射。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsOCTools` 后，优先按风险从低到高验证：

```shell
ruby -c JobsOCTools.podspec
```

```shell
pod lib lint JobsOCTools.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 只有 podspec 指定的公开头进入外部 API 边界；新增 import 时要确认不会把私有实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- `XDTextBtnView` 生成的按钮使用 `onClickBy` Block 链式入口绑定点按，不在调用方新增 `byAddTarget`。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

## 十、明暗主题契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 十一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 11.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

这是多个历史工具与 UI 能力的集合入口，包含崩溃日志、图标/通知、缩放、页面组合等分支，并依赖已拆出的独立 Pod。它不对应单一业务流程，阅读时应沿具体功能目录与聚合入口定位。

### 11.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

从需求选择功能分支 → 进入独立工具或组合视图 → 调用所依赖的基础 Pod → 返回结果或呈现 UI。

### 11.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Core 中既有自维护工具也有历史来源组件，不能仅凭目录或统一文件头认定全部为自研。
- 崩溃日志的启动标记、写入、尾部读取和清理是一套独立生命周期，不应与普通 UI 工具混作同一初始化。
- 已拆出的计时器、验证码、悬浮等能力应按真实依赖引用，避免在重建集合库时重复生成。

### 11.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先从业务入口反查所属子目录，再区分本库实际实现与外部依赖；按功能逐块重建，不一次复制整套聚合依赖。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCTools.h](<./JobsOCTools.h>)
- [Core/FSAppIconManager/FSAppIconManager.h](<./Core/FSAppIconManager/FSAppIconManager.h>)
- [Core/JobsRightMenuView/JobsRightMenuView.h](<./Core/JobsRightMenuView/JobsRightMenuView.h>)
- [Core/JobsShowNumView/JobsShowNumView.h](<./Core/JobsShowNumView/JobsShowNumView.h>)
- [Core/JobsStepView/JobsStepView.h](<./Core/JobsStepView/JobsStepView.h>)

依赖与编译入口：[JobsOCTools.podspec](<./JobsOCTools.podspec>)。其中根级依赖声明包括 `FDFullscreenPopGesture`、`FSCalendar`、`Masonry`、`PPBadgeView`、`ReactiveObjC`、`SocketRocket`、`ZFPlayer`、`lottie-ios`、`JobsBlock`、`JobsMakes`、`JobsModelDSL`、`JobsOCDSL`、`JobsBaseUI`、`JobsOCDefs`、`JobsCryptography`、`JobsStringUtils`、`JobsOCTimer`、`JobsCountdownBtn`、`JobsOCGraphicCaptcha`、`JobsSuspend`、`JobsOCKeyboardMgr`、`JobsByOCPods`、`JobsAppTools`、`TFPopupExtra`、`JobsHotLabel`、`JobsDeviceInfo`、`AFSecurityPolicyExtra`、`HTMLDocumentExtra`、`FMDatabaseExtra`、`FSCalendarExtra`、`GKCustomNavigationBarExtra`、`HXPhotoManagerExtra`、`HXPhotoViewExtra`、`IQKeyboardManagerExtra`、`JXCategoryViewExtra`、`LMJDropdownMenuExtra`、`MGSwipeTableCellExtra`、`RACExtra`、`ReachabilityExtra`、`SRWebSocketExtra`、`SZTextViewExtra`、`ZFPlayerExtra`、`ZMJCellExtra`、`JobsOCProtocols`、`JobsLoadingImage`、`JobsOCRuntimeKits`、`JobsLanMgr`、`JobsOCCountryCodeCtrl`、`JobsFuseAnimation`、`XYColorOC`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十二、验证码与致命信号边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`ImageCodeView` 背景更新遵循 `UIView` 的普通 `setBackgroundColor:` 合同；自定义背景属性负责触发重新绘制。渲染对非有限 / 非正尺寸和空 `CodeStr` 提前退出，字符位置按可用空间计算，避免零尺寸除法及负随机范围。

独立 Pod 为 tab 控制器提供 `NSUInteger DefaultIndex` 的弱定义默认 0；宿主可保留自己的同类型强定义，优先使用宿主索引。当前主工程强定义 2 不变。真实 Apple 静态 archive 链接 / 运行分别验证了无宿主默认 0、宿主强定义 2，独立 XCTest 与主工程构建结果按本轮单元验证回填。

致命信号处理只通过预打开的文件描述符写入固定长度 C 记录，不在 signal 上下文分配 Objective-C 对象、格式化日志或操作 Foundation。只接管仍使用系统默认处理的 `SIGABRT`、`SIGILL`、`SIGSEGV`、`SIGFPE`、`SIGBUS`；既有自定义 handler 和 `SIG_IGN` 保持原设置，`SIGPIPE` 不由本模块接管。写入后恢复系统默认动作并重新发送信号，保留系统 fatal 退出行为。

二进制记录由下次正常启动在安全上下文解析并转为常规崩溃日志。导入先检查整份 journal 的长度、magic 和版本；任一记录不合法时保留整份原始文件，不先导入有效前缀。普通日志写入在当前实例的串行 IO 队列执行，同队列重入直接执行；完整处理短写和 `open` / `write` / `fsync` 的 `EINTR`，并检查 `fsync` 与一次 `close` 的结果。仅普通日志完整写入、同步与关闭成功后才尝试原子清空 journal；写入或清空失败保留原记录供后续启动重试。部分写入、同步 / 关闭失败或清空失败后重试可能重复常规日志文本，本接口不提供 exactly-once 导入保证。公开的 `writeCrashSync` 仍保留原 `void` Block ABI，成功结果由私有导入内核使用。

生产信号实现为私有辅助文件 [JobsCrashSignalRecorder.c](<./Core/CrashLog/JobsCrashSignalRecorder/JobsCrashSignalRecorder.c>)，不提供业务公开调用入口。[Tests/run_regression.rb](<./Tests/run_regression.rb>) 先编译同一纯 C 源码并启用 UndefinedBehaviorSanitizer，核验记录、默认 fatal、既有 handler / ignore 和 `SIGPIPE` 边界；随后抽取当前生产普通写入与导入内核，以 Mac Foundation harness 注入 open、写入、短写、零写入、fsync、close 失败及 EINTR，核验原 journal 保留、成功清空、损坏 / 截断拒绝、清空失败和自身 / 跨实例队列归属。该故障注入不进入 signal handler。

验证码的独立 XCTest 位于 [JobsImageCodeViewStabilityTests](<./Tests/JobsImageCodeViewStabilityTests/JobsImageCodeViewStabilityTests.m>)；[JobsCrashLogImportStabilityTests](<./Tests/JobsCrashLogImportStabilityTests/JobsCrashLogImportStabilityTests.m>) 直接调用生产私有导入内核，核验实际文件打开失败后保留记录、合法重试清空、损坏记录拒绝与同队列重入。测试只操作独立临时目录，不安装崩溃 handler；最终 iOS 编译与 XCTest 结果随主控验收记录。

## 十三、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 185 | 150 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 4 | 4 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 75 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 6 | 5 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级私有头模式：`Core/CrashLog/JobsCrashSignalRecorder/*.h`；相应实现照常编译，头文件不从公共聚合入口消费。

`Core/CrashLog/JobsCrashSignalRecorder/JobsCrashSignalRecorder.c` 是生产 C 实现，包含在 `Core/**/*.{h,m,mm,c}`；其头文件为私有，测试 harness 编译同一实现。

根级命名资源 bundle：`JobsOCToolsCore.bundle`、`JobsOCToolsPrivacy.bundle`；已有运行资源保持各自 bundle 查找合同。

隐私声明入口：[Resource/PrivacyInfo.xcprivacy](<./Resource/PrivacyInfo.xcprivacy>)，通过 `JobsOCToolsPrivacy.bundle` 安装。声明类别与理由按该文件记录：

| API 类别 | 理由标识 | 当前代码用途 |
| --- | --- | --- | --- |
| `NSPrivacyAccessedAPICategoryUserDefaults` | `CA92.1` | 本应用本地偏好或状态的读取与保存 |
| `NSPrivacyAccessedAPICategoryFileTimestamp` | `C617.1` | 文件时间戳读取，用于本地文件 / 缓存生命周期处理 |

理由使用合同：`CA92.1`：仅供本 App 访问自身偏好；`C617.1`：仅访问本 App、同组或 CloudKit 容器内文件。范围依据 [Apple 理由定义](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitypereasons)。

该文件记录当前 Pod 使用的 API 类别；宿主仍需按自身实际调用和数据行为维护自己的声明。最终产物是否包含该命名 bundle，随独立 Pod 与主工程资源验收一起核对。

## 十四、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归、macOS 生产实现回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCTools
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsOCTools --simulator '<UDID>'
```

本地生产实现回归 harness：

```shell
ruby JobsByPods/JobsOCTools@Pods/Tests/run_regression.rb
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
