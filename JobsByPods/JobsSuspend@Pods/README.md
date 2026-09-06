# `JobsSuspend`

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

> 这份自述用于记录 `JobsSuspend` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsSuspend provides suspend button, label and view components.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsSuspend` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Suspend UI components for Jobs. |
| 首页 | [https://example.local/JobsSuspend](https://example.local/JobsSuspend) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsSuspend@Pods/JobsSuspend.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsSuspend` 相关能力。
- 当 `JobsSuspend` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsSuspend@Pods/
├── JobsSuspend.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsSuspend.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，11 个文件
├── Support/  # 内部支撑层，46 个文件
└── LICENSE  # 许可证文件
```

- `JobsSuspend.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 11 个文件，其中源码 / 头文件 10 个；按 Jobs 规范，它是 `JobsSuspend` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 46 个文件，其中源码 / 头文件 46 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。
- `JobsSuspendBtn.byAllowDrag(BOOL)` 统一开关拖拽；`UIView+SuspendView` 提供 safeArea 内起点、拖动范围和吸边震感配置。拖动结束按上下左右最近边吸附，并只放行 Pan 与 LongPress 同时识别。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsSuspend.h`
- `Core/**/*.h`

### 5.2、源码入口

- `JobsSuspend.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架

- `Foundation`
- `UIKit`

### 5.5、Pod 依赖

- `ReactiveObjC`
- `XYColorOC`
- `JobsModel`
- `JobsBlock`
- `JobsOCDefs`
- `JobsDeviceInfo`
- `JobsLoadingImage`
- `JobsOCRuntimeKits`
- `JobsRichTextUtils`
- `JobsLanMgr`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsSuspend/JobsSuspend.h>)
#import <JobsSuspend/JobsSuspend.h>
#else
#import "JobsSuspend.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsSuspend.h` 不是最终公开入口，请先修正 `JobsSuspend.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 1 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- `Core/**/*.{png,jpg,jpeg,gif,webp,pdf,xcassets,bundle}`

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsSuspend` 后，优先按风险从低到高验证：

```shell
ruby -c JobsSuspend.podspec
```

```shell
pod lib lint JobsSuspend.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `panRcognize` 是懒加载手势，getter 首次创建后必须返回新实例；若返回 `nil`，继续调用 `byEnabled(...)` 这类 Block DSL 会触发空 Block 调用并产生 `EXC_BAD_ACCESS`。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分

为按钮、Label 和普通视图提供悬浮展示与拖拽能力，并用 UIView/UIViewController 分类连接宿主。具体视图负责内容表达，公共悬浮逻辑负责拖动和位置变化。

### 10.2、运行脉络

创建悬浮对象 → 挂载宿主 → 开启/关闭拖拽 → 响应拖动或点击 → 宿主按生命周期移除。

### 10.3、关键设计与边界

- 拖动开关不应改变按钮/Label 本身的业务意义，点击与拖动需要区分。
- 容器坐标、可用边界与安全区关系影响最终停靠位置。
- 悬浮视图持续存在时需明确持有者，不能只创建后丢失可修改引用。

### 10.4、阅读与重建顺序

先看 UIView 的悬浮分类，再看 Button/Label 的专用入口，最后追踪控制器挂载关系。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsSuspend.h](<./JobsSuspend.h>)
- [Core/JobsSuspendView/JobsSuspendView.h](<./Core/JobsSuspendView/JobsSuspendView.h>)
- [Core/UIView+SuspendView/UIView+SuspendView.h](<./Core/UIView+SuspendView/UIView+SuspendView.h>)
- [Core/UIViewController+SuspendBtn/UIViewController+SuspendBtn.h](<./Core/UIViewController+SuspendBtn/UIViewController+SuspendBtn.h>)
- [Core/JobsSuspendBtn/JobsSuspendBtn.h](<./Core/JobsSuspendBtn/JobsSuspendBtn.h>)

依赖与编译入口：[JobsSuspend.podspec](<./JobsSuspend.podspec>)。其中显式依赖声明包括 `ReactiveObjC`、`XYColorOC`、`JobsModelDSL`、`JobsBlock`、`JobsOCDSL`、`JobsLanMgr`、`JobsOCDefs`、`JobsBaseUI`、`JobsDeviceInfo`、`JobsLoadingImage`、`JobsOCRuntimeKits`、`JobsRichTextUtils`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
