# `iOS Framework` 与 `XCFramework` 打包指南（Objective-C 主工程）

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 本文以 `JobsOCBaseConfigDemo` 主工程中已经直接集成的 `JobsRandomUtils` 为最小样板，说明怎样把一组主工程源码提取到独立 Framework target，再归档为同时支持 iOS 真机与 iOS Simulator 的 `XCFramework`。

- 当前源码位于 `JobsOCBaseConfigDemo/OCBaseConfig/JobsMixFunc/JobsRandomUtils/JobsRandomUtils.h/.m`，真实 Demo 位于 `业务逻辑/功能模块/Demo@随机数测试模块`。
- 主工程代码不能因为“准备二进制化”就直接删除或搬走。先创建独立 Framework target 并构建消费者，再在切换接入来源时移除 App target 对原 `.m` 的编译，避免重复符号。
- Apple 推荐使用[**多平台二进制 Framework Bundle**](https://developer.apple.com/documentation/xcode/creating-a-multi-platform-binary-framework-bundle)组合不同平台变体，不使用 `lipo` 把 iOS 真机与 iOS Simulator 二进制塞进同一份旧式胖 Framework。

## 一、主工程源码下沉的完整路径 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```mermaid
flowchart LR
    Source["主工程 JobsRandomUtils.h/.m"] --> Boundary["收口公开头与依赖"]
    Boundary --> Target["JobsRandomUtils Framework Target"]
    Target --> Device["iOS 真机 Archive"]
    Target --> Simulator["iOS Simulator Archive"]
    Device --> XCFramework["JobsRandomUtils.xcframework"]
    Simulator --> XCFramework
    XCFramework --> Consumer["干净消费者工程"]
    Consumer --> Cutover["App 切换为二进制来源"]
```

下沉不是“把文件夹后缀改成 Framework”，而是依次完成：

1. 模块职责和所有权确认。
2. 公开 API、私有实现与资源边界收口。
3. 独立 Framework target 和 Scheme。
4. 真机 / 模拟器分别 Archive。
5. 创建 XCFramework。
6. 干净消费者构建。
7. App 从源码实现切换到二进制实现。

## 二、样板源码与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 2.1、当前样板

| 项目 | 内容 |
| --- | --- |
| 源码 | `OCBaseConfig/JobsMixFunc/JobsRandomUtils/JobsRandomUtils.h/.m` |
| App Demo | `业务逻辑/功能模块/Demo@随机数测试模块` |
| 公开能力 | `JobsRandomNumber`、`JobsRandom0_100` 等 C 函数 |
| Pod 依赖 | 无 |
| 系统依赖 | C 标准库、`UIKit` |
| 资源 | 无 |

这组代码职责单一、公开 API 小、没有资源和跨模块依赖，适合作为第一个 Framework target。

### 2.2、最小消费者

本文目录提供：

```text
iOS Framework 与 XCFramework 打包指南.md/
├── README.md
└── Demo/
    └── JobsRandomUtilsBinaryConsumerDemo.m
```

消费者只使用公开头和公开函数：

```objc
#if __has_include(<JobsRandomUtils/JobsRandomUtils.h>)
#import <JobsRandomUtils/JobsRandomUtils.h>
#else
#import "JobsRandomUtils.h"
#endif

int value = JobsRandomNumber(1, 10);
```

## 三、先决定静态还是动态 Framework <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 维度 | 静态 Framework | 动态 Framework |
| --- | --- | --- |
| 链接时机 | 构建时进入 App 二进制 | App 启动或运行时装载 |
| App 接入 | 通常 `Do Not Embed` | `Embed & Sign` |
| 启动装载项 | 不新增 | 新增动态库装载 |
| 单包复用 | 每个 App 各自链接 | App 与 Extension 仍受嵌入和平台规则约束 |
| 适合 | 基础工具、稳定组件 | 需要明确动态边界的 SDK |

`JobsRandomUtils` 没有运行时动态加载需求，最小示范优先静态 Framework。Apple 的[**创建静态 Framework**](https://developer.apple.com/documentation/xcode/creating-a-static-framework)文档说明，Xcode 15 及以后可以让 Framework Bundle 的主二进制使用静态归档。

## 四、创建 Framework target <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、创建 target

在 [**Xcode**](https://developer.apple.com/xcode) 中执行：

1. `File → New → Target`。
2. 选择 `iOS → Framework & Library → Framework`。
3. Product Name 使用 `JobsRandomUtils`。
4. Language 使用 `Objective-C`。
5. 创建后把 Scheme 设为 Shared，保证命令行和 CI 可以看到。

### 4.2、Build Settings

| 设置 | 建议值 | 说明 |
| --- | --- | --- |
| `Mach-O Type` | `Static Library` | 最小样板使用静态 Framework。 |
| `Defines Module` | `YES` | 生成可导入模块。 |
| `Skip Install` | `NO` | 让 Framework 进入 Archive。 |
| `Build Libraries for Distribution` | `YES` | 统一使用分发构建设置，便于未来混编。 |
| `Build Active Architecture Only` | `NO` | Release 不限制为当前架构。 |
| `iOS Deployment Target` | 与发布声明一致 | 不能低于源码实际 API 要求。 |
| `Product Module Name` | `JobsRandomUtils` | 与消费者 import 保持一致。 |

不要手写 `ARCHS=arm64`。使用 `generic/platform=iOS` 与 `generic/platform=iOS Simulator`，由 Xcode 按平台决定支持架构。

### 4.3、Target Membership

把以下文件加入 `JobsRandomUtils` Framework target：

```text
OCBaseConfig/JobsMixFunc/JobsRandomUtils/
├── JobsRandomUtils.h
└── JobsRandomUtils.m
```

Headers Build Phase：

- `JobsRandomUtils.h` 设为 `Public`。
- 私有辅助头设为 `Project` 或 `Private`。
- 不把宿主 PCH、业务聚合头和无关页面头当作 Framework 公开 API。

当前工程使用文件系统同步组。通过 Xcode 调整 Target Membership 后，还要复核 `project.pbxproj` 中对应同步组例外与实际编译清单，不能只看文件已经出现在左侧导航。

## 五、迁移期间避免重复符号 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、并行构建阶段

Framework target 可以与 App target 同时编译同一份源码，但 App 此时不要再链接这份 Framework。这个阶段只验证 Framework 自己能否独立构建和归档。

### 5.2、消费者验证阶段

用不包含 `JobsRandomUtils.m` 源码的独立消费者工程链接 XCFramework，验证公开头、模块和运行结果。

### 5.3、正式切换阶段

当 App 决定使用二进制实现时：

1. App target 链接 `JobsRandomUtils.xcframework`。
2. 从 App target 的 Compile Sources / Target Membership 中移除原 `JobsRandomUtils.m`。
3. 保留源码仓库作为 Framework 的权威源，但不能让同一实现同时从源码和二进制进入一个 target。
4. 全量构建 App，检查重复符号、未定义符号和运行时调用。

禁止同时编译原 `.m` 并链接包含同一实现的静态 Framework，否则链接器会报 duplicate symbols。

## 六、归档真机与模拟器 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先确认 Scheme：

```shell
cd "/Users/jobs/Documents/Github/JobsBaseConfig/JobsBaseConfig@JobsOCBaseConfigDemo"
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -list | rg "JobsRandomUtils"
```

### 6.1、iOS 真机

```shell
xcodebuild archive \
  -workspace JobsOCBaseConfigDemo.xcworkspace \
  -scheme JobsRandomUtils \
  -configuration Release \
  -destination "generic/platform=iOS" \
  -archivePath "build/XCFrameworkDemo/JobsRandomUtils-iOS.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  CODE_SIGNING_ALLOWED=NO \
  ONLY_ACTIVE_ARCH=NO
```

### 6.2、iOS Simulator

```shell
xcodebuild archive \
  -workspace JobsOCBaseConfigDemo.xcworkspace \
  -scheme JobsRandomUtils \
  -configuration Release \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "build/XCFrameworkDemo/JobsRandomUtils-iOS-Simulator.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
  CODE_SIGNING_ALLOWED=NO \
  ONLY_ACTIVE_ARCH=NO
```

两个 Archive 都应包含：

```text
Products/Library/Frameworks/JobsRandomUtils.framework
```

## 七、创建 XCFramework <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
xcodebuild -create-xcframework \
  -archive "build/XCFrameworkDemo/JobsRandomUtils-iOS.xcarchive" \
  -framework "JobsRandomUtils.framework" \
  -archive "build/XCFrameworkDemo/JobsRandomUtils-iOS-Simulator.xcarchive" \
  -framework "JobsRandomUtils.framework" \
  -output "build/XCFrameworkDemo/JobsRandomUtils.xcframework"
```

验证：

```shell
plutil -lint "build/XCFrameworkDemo/JobsRandomUtils.xcframework/Info.plist"
find "build/XCFrameworkDemo/JobsRandomUtils.xcframework" \
  -type f \
  -name JobsRandomUtils \
  -exec file {} \;
find "build/XCFrameworkDemo/JobsRandomUtils.xcframework" \
  -type f \
  -path "*/Headers/*" \
  -print
```

## 八、公开头、依赖与 Category <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 8.1、公开头

- 公开头只能引用消费者确实能获得的系统 Framework 或二进制模块。
- 私有实现头留在 Framework target 内部，不通过 Header Search Paths 偶然泄漏。
- 若模块变大，新增根聚合头统一导出公共 API，消费者不穿透内部目录。

### 8.2、依赖

- 系统 Framework 在 Framework target 的 Link Binary 配置中声明。
- 其它 Jobs 模块优先分别二进制化并显式声明依赖。
- 公开 API 出现依赖模块类型时，消费者必须同时拿到该模块。
- 不使用主 App PCH、宏集合或业务聚合头掩盖缺失的直接依赖。

### 8.3、Category

`JobsRandomUtils` 当前是 C 函数实现，不依赖 Category 装载。下沉其它含 Category 的模块时：

- 确认 `.m` 真正进入 Framework target。
- 静态 Framework 消费者按需使用 `-ObjC`。
- 不无脑使用 `-all_load` 或 `-force_load` 扩大符号装载。
- 在消费者运行真实 Selector，不能只看编译通过。

## 九、资源与 Bundle <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsRandomUtils` 当前没有资源。其它模块有资源时：

1. 把图片、JSON、字体、音视频、本地化和隐私清单收口到独立 Resource Bundle。
2. Framework 代码从模块 Bundle / Resource Bundle 读取，不使用宿主 `mainBundle` 猜路径。
3. XCFramework、资源 Bundle、许可证和资源说明一起交付。
4. 消费者同时验证 Debug、Release、真机和模拟器资源读取。

## 十、二进制接入方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 10.1、手工接入

- 把 `JobsRandomUtils.xcframework` 拖入消费者工程。
- 静态 Framework 通常选择 `Do Not Embed`。
- 动态 Framework 使用 `Embed & Sign`。
- 不再额外加入原源码目录的 Header Search Paths。

### 10.2、CocoaPods 二进制 Pod

```ruby
Pod::Spec.new do |spec|
  spec.name             = 'JobsRandomUtilsBinary'
  spec.version          = '1.0.0'
  spec.summary          = 'Binary distribution for JobsRandomUtils.'
  spec.platform         = :ios, '16.6'
  spec.source           = { :http => 'https://example.com/JobsRandomUtils.xcframework.zip' }
  spec.vendored_frameworks = 'JobsRandomUtils.xcframework'
end
```

### 10.3、Swift Package 二进制 Target

Apple 的[**二进制 Framework Swift Package 分发文档**](https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages)要求远程 ZIP 提供 checksum：

```shell
swift package compute-checksum JobsRandomUtils.xcframework.zip
```

```swift
.binaryTarget(
    name: "JobsRandomUtils",
    url: "https://example.com/JobsRandomUtils.xcframework.zip",
    checksum: "这里填写 checksum"
)
```

## 十一、验证层级 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 层级 | 证明什么 | 不能证明什么 |
| --- | --- | --- |
| `plutil -lint` | XCFramework 索引 plist 合法 | 模块可以被消费者导入 |
| `file` / `lipo -info` | 二进制目标架构 | API、资源和运行行为正确 |
| Framework Scheme Build | 模块自身可编译 | 消费者没有缺失依赖 |
| 消费者编译 | 公开头、模块与链接边界基本成立 | 真机运行和资源状态完整 |
| 模拟器运行 | 当前模拟器平台行为 | 真机架构、签名和设备能力 |
| 真机安装运行 | 实际设备核心流程 | 所有外部消费者环境都兼容 |

正式交付至少验证：

- Framework target 的 Release 构建。
- iOS 与 iOS Simulator 两份 Archive。
- XCFramework `Info.plist`、Headers、Modules 和架构。
- 不包含源码实现的干净消费者编译。
- 主 App 切换来源后的完整构建。
- 随机数真实 Demo 页面运行。
- ZIP、SHA-256、版本号、最低系统、许可证和必要 dSYM。

## 十二、常见错误 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 错误 | 原因 | 处理 |
| --- | --- | --- |
| `xcodebuild` 看不到 Scheme | Framework Scheme 未 Shared | 在 Manage Schemes 中共享并重新执行 `-list`。 |
| Archive 没有 Framework | `SKIP_INSTALL=YES` | 使用 `SKIP_INSTALL=NO` 并检查 Scheme Build。 |
| 重复符号 | App 仍编译原 `.m`，同时又链接静态 XCFramework | 正式切换时移除 App target 的原实现编译。 |
| 头文件找不到 | Header 未设 Public，或消费者依赖旧搜索路径 | 修正 Headers Build Phase 与聚合头。 |
| `module not found` | `DEFINES_MODULE`、modulemap 或模块名错误 | 检查 target Build Settings 和 Framework `Modules`。 |
| 模拟器链接真机产物 | 只交付了一份 iOS Framework | 分别 Archive 后创建 XCFramework。 |
| `unrecognized selector` | Category 实现未进入 target 或静态链接未装载 | 检查 Target Membership、`-ObjC` 与真实运行调用。 |
| 资源缺失 | 资源未形成独立 Bundle 或仍读取 `mainBundle` | 单独交付资源并从模块 Bundle 定位。 |

## 十三、发布边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 公开 API 使用语义化版本；破坏兼容升级主版本。
- 固定 Xcode、最低 iOS、链接方式、支持架构和依赖版本。
- 每个版本保留 XCFramework、ZIP、SHA-256、许可证和 API 说明。
- 二进制交付前验证第三方许可证是否允许再分发。
- 闭源只能提高阅读门槛，不能把密码、Token、私钥或服务端安全决策放进客户端。
- Framework target 是新的编译边界；主工程里靠 PCH、间接头和全局搜索路径才能编过的代码，必须先修依赖再打包。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
