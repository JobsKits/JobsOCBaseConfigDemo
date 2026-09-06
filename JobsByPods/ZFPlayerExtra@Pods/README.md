# `ZFPlayerExtra`

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

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 这份自述用于记录 `ZFPlayerExtra` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `ZFPlayerExtra` |
| Pod 类型 | 本地扩展 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | ZFPlayer helpers for Jobs. |
| 首页 | [https://example.local/ZFPlayerExtra](https://example.local/ZFPlayerExtra) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/ZFPlayerExtra@Pods/ZFPlayerExtra.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 为 `ZFPlayer` 或同名上游能力提供 Jobs 项目内的分类、桥接、资源或边界适配。
- 当 `ZFPlayerExtra` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
ZFPlayerExtra@Pods/
├── ZFPlayerExtra.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── ZFPlayerExtra.h  # 根入口头文件
├── Core/  # 公开 API 与核心实现，含 ZFAV / ZFIJK / DouYin DSL 分类
└── LICENSE  # 许可证文件
```

- `ZFPlayerExtra.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 10 个源码 / 头文件；按 Jobs 规范，它是 `ZFPlayerExtra` 对外公开 API 和核心实现的边界。
- 当前目录没有 `Support` 文件夹；如后续补内部兼容代码，优先放入 `Support` 并让 podspec 动态映射。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `ZFPlayerExtra.h`
- `Core/ZFDouYinControlView/ZFDouYinControlView/ZFDouYinControlView.h`
- `Core/ZFDouYinControlView/ZFDouYinControlView+DSL/ZFDouYinControlView+DSL.h`
- `Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.h`
- `Core/ZFIJKPlayerManager/ZFIJKPlayerManager+ZFPlayerExtraDSL/ZFIJKPlayerManager+ZFPlayerExtraDSL.h`

`Core/ZFPlayerExtra/ZFPlayerExtra.h` 只作为 private header 参与内部编译，避免和根入口头 `ZFPlayerExtra.h` 同名抢占 framework public `Headers`。

### 5.2、源码入口

- `ZFPlayerExtra.h`
- `Core/**/*.{h,m,mm}`

### 5.2.1、DSL 补充能力

- `ZFAVPlayerManager+ZFPlayerExtraDSL`：补齐 `assetURL`、`view`、`shouldAutoPlay`、音量 / 静音 / 速率 / seek / scaling / presentationSize、播放动作、缩略图回调和播放状态回调链式入口。
- `ZFIJKPlayerManager+ZFPlayerExtraDSL`：在非模拟器且 `IJKMediaFramework` 可用时，按同一标准补齐 IJK manager 的链式入口。
- `ZFDouYinControlView+DSL`：补齐 `player`、`resetControlView`、`showCoverViewWithUrl:` 的链式入口。
- `ZFAVPlayerManager` 已由 `JobsOCDSL` 提供的 `byTimeRefreshInterval`、`byRequestHeader` 不在本 Pod 重复实现，避免同一类同名 category 抢实现。

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架

- `Foundation`
- `UIKit`

### 5.5、Pod 依赖

- `ZFPlayer`
- `ZFPlayer/AVPlayer`
- `ZFPlayer/ControlView`
- `ZFPlayer/ijkplayer`
- `JobsBlock`
- `JobsOCDefs`
- `JobsOCDSL`
- `JobsBaseUI`（通过公开聚合头提供 `jobsMakeBaseButton` 按钮创建入口）

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<ZFPlayerExtra/ZFPlayerExtra.h>)
#import <ZFPlayerExtra/ZFPlayerExtra.h>
#else
#import "ZFPlayerExtra.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `ZFPlayerExtra.h` 不是最终公开入口，请先修正 `ZFPlayerExtra.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 0 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- podspec 未显式声明 `resources`，如新增图片、xib、bundle、json、plist 等资源，需要同步补齐。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `ZFPlayerExtra` 后，优先按风险从低到高验证：

```shell
ruby -c ZFPlayerExtra.podspec
```

```shell
pod lib lint ZFPlayerExtra.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分

围绕 ZFPlayer 的播放器管理器和控制视图提供 Jobs 的配置链。AVPlayer 与 IJK 管理器负责媒体播放，ZFDouYinControlView 负责短视频场景交互，DSL 连接地址、播放状态和回调。

### 10.2、运行脉络

选择播放管理器 → 配置媒体地址及承载视图 → 绑定控制视图与状态回调 → 准备/播放/暂停/停止。

### 10.3、关键设计与边界

- 管理器与控制视图分层，替换控制界面不应重新实现解码内核。
- 准备播放、播放、重播、停止以及音量/静音属于不同操作；进度、缓冲和错误回调也不能合并。
- podspec 声明了多个上游 subspec，重建时应核对实际可用的播放后端，不把所有后端当作系统自带。

### 10.4、阅读与重建顺序

先看管理器 DSL，再看控制视图与其 DSL；先打通一个媒体地址的生命周期，再扩展列表场景。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [ZFPlayerExtra.h](<./ZFPlayerExtra.h>)
- [Core/ZFPlayerExtra/ZFPlayerExtra.h](<./Core/ZFPlayerExtra/ZFPlayerExtra.h>)
- [Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.h](<./Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.h>)
- [Core/ZFDouYinControlView/ZFDouYinControlView+DSL/ZFDouYinControlView+DSL.h](<./Core/ZFDouYinControlView/ZFDouYinControlView+DSL/ZFDouYinControlView+DSL.h>)
- [Core/ZFDouYinControlView/ZFDouYinControlView/ZFDouYinControlView.h](<./Core/ZFDouYinControlView/ZFDouYinControlView/ZFDouYinControlView.h>)

依赖与编译入口：[ZFPlayerExtra.podspec](<./ZFPlayerExtra.podspec>)。其中显式依赖声明包括 `ZFPlayer`、`ZFPlayer/AVPlayer`、`ZFPlayer/ControlView`、`ZFPlayer/ijkplayer`、`JobsBlock`、`JobsOCDefs`、`JobsOCDSL`、`JobsBaseUI`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
