# `JobsGestureLock`

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

> 这份自述用于记录 `JobsGestureLock` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsGestureLock is an Objective-C gesture lock component library for iOS. It provides a reusable lock view, indicator view, password persistence helper, and an optional ready-to-use view controller for create/validate flows.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsGestureLock` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Objective-C gesture lock components for iOS. |
| 首页 | [https://example.local/JobsGestureLock](https://example.local/JobsGestureLock) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsGestureLock@Pods/JobsGestureLock.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsGestureLock` 相关能力。
- `JobsGestureLockVC` 基于 `BaseViewController` 提供创建 / 验证流程，直接复用 Jobs 页面数据、导航与主题契约；应用层子类可以安全读取 `viewModel`，无需重复补一套控制器状态。
- 默认九宫格使用 56pt 自适应圆形节点、2pt 语义色描边和蓝 / 红选中状态；节点背景、描边与圆角统一走 `UIButton` 专用 Jobs 配置管线，避免位图倍率导致圆环越界重叠。
- `JobsSettingGestureVC` 对齐 Swift 手势 Demo，提供“设置/重置 / 验证”切换、状态提示、跨点自动补点和“清除/重来”入口，导航标题统一为“手势解锁”。
- 当 `JobsGestureLock` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsGestureLock@Pods/
├── JobsGestureLock.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，13 个文件
├── Resource/  # 资源目录，8 个文件
└── LICENSE  # 许可证文件
```

- `JobsGestureLock.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 13 个文件，其中源码 / 头文件 13 个；按 Jobs 规范，它是 `JobsGestureLock` 对外公开 API 和核心实现的边界。
- 当前目录没有 `Support` 文件夹；如后续补内部兼容代码，优先放入 `Support` 并让 podspec 动态映射。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `Core/**/*.h`

### 5.2、源码入口

- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架

- `Foundation`
- `UIKit`

### 5.5、Pod 依赖

- `JobsBaseUI`（`jobsMakeButton` 与 `jobsResetBtn*`）
- `JobsMakes`
- `JobsOCDSL`
- `JobsOCDefs`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsGestureLock/JobsGestureLock.h>)
#import <JobsGestureLock/JobsGestureLock.h>
#else
#import "JobsGestureLock.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsGestureLock.h` 不是最终公开入口，请先修正 `JobsGestureLock.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 8 个，`Resource` 目录文件 8 个。
- podspec 资源声明如下：

- `Resource/**/*`

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsGestureLock` 后，优先按风险从低到高验证：

```shell
ruby -c JobsGestureLock.podspec
```

```shell
pod lib lint JobsGestureLock.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `JobsGestureLockVC` 的页面基座固定为 `BaseViewController`；不要降级成裸 `UIViewController`，否则应用层 Demo 访问 `viewModel`、导航配置或主题能力时会失去运行时契约。
- 默认节点不读取 128px 椭圆位图作为点尺寸；只有调用方显式注入 `node*Image` / `indicator*Image` 时才进入自定义图片分支。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 操作按钮由 `jobsMakeButton` 创建，点按通过 `onClickBy` Block 链式入口绑定，不在调用方新增 `byAddTarget`。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分

把图案锁拆成配置、手势绘制、状态指示、存储和控制器。绘制层产生经过节点的图案，控制器区分创建/确认/校验阶段，存储层承接已确认结果，资源访问单独封装。

### 10.2、运行脉络

选择模式与配置 → 用户滑过节点 → 检查图案长度 → 创建/确认或比对已有结果 → 展示成功/错误反馈。

### 10.3、关键设计与边界

- 创建后的再次确认与普通解锁校验不是同一状态。
- minimumPatternLength、线宽/颜色和状态文案分别属于验证与视觉配置。
- 绘制图案不应直接等同于服务器身份认证；存储方式与清除时机需单独理解。

### 10.4、阅读与重建顺序

先看模式/结果枚举与配置，再看 View 如何形成节点序列，最后看控制器与 Storage 的协作。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsGestureLock.h](<./JobsGestureLock.h>)
- [Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.h](<./Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.h>)
- [Core/JobsGestureLockView/JobsGestureLockView.h](<./Core/JobsGestureLockView/JobsGestureLockView.h>)
- [Core/JobsGestureLockIndicator/JobsGestureLockIndicator.h](<./Core/JobsGestureLockIndicator/JobsGestureLockIndicator.h>)
- [Core/JobsGestureLockResource/JobsGestureLockResource.h](<./Core/JobsGestureLockResource/JobsGestureLockResource.h>)

依赖与编译入口：[JobsGestureLock.podspec](<./JobsGestureLock.podspec>)。其中显式依赖声明包括 `JobsOCDefs`、`JobsBlock`、`JobsBaseUI`、`JobsMakes`、`JobsOCDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
