# `JobsBlock`

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

> 这份自述用于记录 `JobsBlock` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsBlock is a header-only Objective-C definitions library containing common block typedefs, business block typedefs, and parameterized block macro helpers used across Jobs projects.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsBlock` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.4` |
| 平台 | `ios 12.0` |
| 摘要 | Objective-C block type definitions for Jobs projects. |
| 首页 | [https://example.local/JobsBlock](https://example.local/JobsBlock) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsBlock@Pods/JobsBlock.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsBlock` 相关能力。
- 当 `JobsBlock` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsBlock@Pods/
├── JobsBlock.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开入口与核心实现，8 个文件
├── LICENSE  # 许可证文件
└── Resource/  # 非代码资源，1 个文件
```

- `JobsBlock.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 8 个文件，其中源码 / 头文件 8 个；按 Jobs 规范，它是 `JobsBlock` 对外公开 API 和核心实现的边界。
- 当前目录没有 `Support` 文件夹；如后续补内部兼容代码，优先放入 `Support` 并让 podspec 动态映射。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsBlock.h`
- `JobsBlockDef.h`
- `JobsBlockHeader.h`
- `Core/**/*.h`

- `Core/确定参数的Block/ReturnByCertainParametersBlock.h` 集中维护带返回值的确定参数 Block，`UITextView`、`UIBezierPath / CALayer / UIView` 方法型 DSL 相关返回类型统一从这里暴露。
- `JobsOCDSL` 新增系统类 DSL 时，所需 `JobsRet<Class>By<Type>Block` 统一先在 `ReturnByCertainParametersBlock.h` 查找；缺失时补在这里，避免 DSL 头文件私自定义 Block。
- `ReturnByCertainParametersBlock.h` 统一提供 `JobsRetUNUserNotificationCenterByDelegateBlock`、`JobsRetBarAppearanceByCorBlock`，并集中维护按钮任意组合状态的 `JobsRetBtnByImageAndControlStateBlock`、`JobsRetBtnByCorAndControlStateBlock`、`JobsRetBtnByStringAndControlStateBlock`、`JobsRetBtnByAttributedStringAndControlStateBlock`、`JobsRetBtnBySymbolConfigurationAndControlStateBlock` 以及状态型 Symbol Configuration 查询 `JobsRetSymbolConfigurationByControlStateBlock`；业务 Pod 不再私自声明同签名 Block。
- `ReturnByCertainParametersBlock.h` 统一提供 `UIStackView` 与 `UISwitch` 返回型 Block，供布局轴、分布、对齐、间距以及开关状态 / 颜色 DSL 返回当前主对象。
- `VoidByCertainParametersBlock.h` 与 `ReturnByCertainParametersBlock.h` 分别提供 `UISegmentedControl` 创建回调和链式返回 Block，供 `JobsMakes` / `JobsOCDSL` 共同复用。
- `VoidByCertainParametersBlock.h` 集中提供 `UIAction` / `UIMenu` / `UIContextMenuConfiguration` / `UINib` / `UIBarButtonItem` 工厂回调，以及 `UIView` 普通动画、options、spring 和 transition 终止动作签名。
- `ReturnByCertainParametersBlock.h` 提供圆角矩形与指定圆角的 `UIBezierPath` 工厂 Block；弧线工厂与 `addArcWithCenter:` 参数完全相同，直接复用 `JobsRetBezierPathByAddArcBlock`，不重复定义同签名 Block。
- `UIContextualAction` 与 `UISwipeActionsConfiguration` 的创建回调 / 链式返回 Block 统一由 `JobsBlock` 暴露，供滑动操作工厂和图片、颜色、标题、全滑触发属性 DSL 复用。
- `UIBarAppearance`、`UINavigationBarAppearance`、`UINavigationBar` 与 `UITabBar` 的返回型 Block 按属性所属层集中维护；父类背景 / 阴影能力不在子类重复定义。
- `JobsBlock.h` 提供 `JobsRetOCGraphicCaptchaViewByFontBlock`，供自建 `JobsOCGraphicCaptchaView+DSL` 复用；对应类型只在 `JobsBlockHeader.h` 前向声明，不反向依赖业务 Pod。
- `ReturnByCertainParametersBlock.h` 提供 `JobsOCCalendar` 数据源、代理链式返回 Block；类型和协议只在 `JobsBlockHeader.h` 前向声明，避免 `JobsBlock` 反向依赖日历 Pod。
- `JobsBlock.h` 暴露 `JobsRetUIViewModelByJobsByTextModelBlockBlock`、`JobsRetUIButtonModelByJobsByTextModelBlockBlock` 等嵌套 Model 配置返回类型，用于 `JobsModelDSL` 在大 Model 里回调配置子 Model 后继续返回自身。
- `JobsBlock.h` / `ReturnByCertainParametersBlock.h` 暴露 `FSCalendar` 子对象配置相关 Block 类型，用于 `JobsOCDSL` 在 `appearance`、`calendarHeaderView`、`swipeToChooseGesture` 回调配置后继续返回主 `FSCalendar`。
- `JobsBlock.h` / `ReturnByCertainParametersBlock.h` 统一承接 `JobsOCDSL` 第三方 DSL 所需 Block typedef，包括 `YTKNetwork`、`GKNavigationBar`、`ZFPlayer`、`Texture` 的链式配置返回类型。
- `JobsBlock.h` 集中提供 `CMMotionManager` 的频率、启停、队列回调和参考坐标系链式返回 Block；回调参数类型来自 `CoreMotion`，DSL 头不再重复声明 typedef。
- `JobsBlock.h` 提供 `jobsByGKCustomNavigationBarBlock` 与 `JobsRetGKNavVCByNavigationBarBlock`，让控制器通过 `byGKNavigationBarBlock(...)` 配置 GK 导航栏子对象后仍返回原控制器继续主链。
- `HXPhotoPickerObjC` 相关 DSL 需要的 `HXPhotoView`、`HXPhotoManager`、`HXPhotoConfiguration` Block 别名统一在 `JobsBlock.h` 暴露，协议 / 类向前声明集中放在 `JobsBlockHeader.h`。
- `JobsOCTimerMgr` 相关 DSL 的 `JobsTimerMgr` 与内部 `_JobsTimerMgrEntry` 返回型 Block 统一由 `JobsBlock.h` 管理；其中包含 Scope upsert、实例安全取消和 Scope 生命周期链式签名，相关类向前声明集中放在 `JobsBlockHeader.h`。
- `JobsPresentTransitionMgr` 的配置回调使用 `jobsByPresentTransitionManagerBlock`，由 `JobsBlock.h` 统一暴露，类向前声明集中放在 `JobsBlockHeader.h`。
- `VoidByCertainParametersBlock.h` 暴露常用数据容器配置 Block，包括 `jobsByMutableIndexSetBlock`，供 `JobsMakes` 创建可变索引集合时复用。
- `VoidByCertainParametersBlock.h` 统一承接 `JobsOCRefresher` 的 `JobsOCRefreshActionBlock` 别名和 `jobsByOCRefreshConfigBlock` 配置回调，避免业务 Pod 内散落同签名 Block。
- `JobsBlockHeader.h` 集中维护向前声明，避免 `@class` / `@protocol` 分散在业务头文件中。
- `JobsBlockHeader.h` 对 `YTKNetwork`、`GKNavigationBar`、`ZFPlayer`、`Texture` 采用条件导入和能力宏；`JobsBlock.podspec` 不因此强制新增这些第三方依赖。
- OC 新工程自建 Pod、应用 / Demo 与 OC 老工程中 Jobs 自维护的 0 / 1 入参功能方法统一使用本模块的 Block typedef；类型只按“返回类型 + 入参类型”去重，不在业务头文件重复声明。
- 普通 Jobs 功能 API 直接改为无参 getter 返回 Block；系统回调、协议、Target-Action、Runtime 等固定 ABI 保留原 selector trampoline，功能内核收入 `jobsXxx` Block 门面。两种形态都只改 API 表达，不改副作用顺序和业务返回值。
- 固定 ABI trampoline 必须通过 `JobsBlockInstanceMethodIMP` / `JobsBlockClassMethodIMP` 绑定当前定义类取得 Block 门面，不能使用 `self.jobsXxx` 动态派发；Runtime helper 同时兼容 `NSObject` 与 `NSProxy`，并避免父子类生命周期在 `[super ...]` 链路中回跳递归。
- Block 捕获实例时统一使用 `@jobs_weakify(self)` / `@jobs_strongify(self)`；`JobsBlock` 自身为避免对 `JobsOCDefs` 形成反向循环，是保留显式 `__weak` / `__strong` 的唯一底层例外。
- 属性、协议和跨模块公开 getter 保留原 selector 与原返回类型，另设 `jobsXxx` Block 门面；协议声明与实现返回类型必须完全一致。
- `dealloc` 不调用会创建弱引用的 Block 门面；析构清理保留传统入口。可能为 `nil` 的接收者必须先守卫，不能直接执行其返回的 Block。
- Block getter 的返回类型必须显式 `_Nonnull`；新增 Model、控制器或业务对象 DSL 时，先按签名复用本模块 typedef，缺失才在这里补齐。应用层不直接赋值：在属性真实宿主提供返回该具体类型的 Block，子模型配置结束后继续返回主对象，保证整段调用一链到底。

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsBlock.h`
- `JobsBlockDef.h`
- `JobsBlockHeader.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Foundation`
- `UIKit`
- `CoreMotion`
- `MessageUI`
- `QuartzCore`
- `Metal`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `SDWebImage`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsBlock/JobsBizBlock.h>)
#import <JobsBlock/JobsBizBlock.h>
#else
#import "JobsBizBlock.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsBizBlock.h` 不是最终公开入口，请先修正 `JobsBlock.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 1 个，`Resource` 目录文件 1 个。
- podspec 资源声明如下：

- 资源通过当前 podspec 的 `resources` / `resource_bundles` 映射；物理文件计数与运行时复制范围分别核对。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsBlock` 后，优先按风险从低到高验证：

```shell
ruby -c JobsBlock.podspec
```

```shell
pod lib lint JobsBlock.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 只有 podspec 指定的公开头进入外部 API 边界；新增 import 时要确认不会把私有实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 第三方 DSL Block typedef 只在对应第三方头文件可见时启用；调用方应由 `JobsOCDSL` 这类上层 Pod 持有第三方依赖，不要反向要求 `JobsBlock` 兜底安装所有第三方 Pod。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

## 十、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 8 | 8 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 1 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/`（无目录） | 0 | 0 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级资源直接复制映射：`Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff}`。

`Resource/icon.png` 用于文档展示，podspec 通过 `exclude_files` 排除运行时资源复制，同时 `preserve_paths` 保留文件以供文档使用。这样避免通用 `icon.png` 名称在宿主资源中发生冲突；已有业务图片 / bundle 的查找位置沿用原合同。

## 十一、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译已完成；本 Pod 无独立 Stability 回归；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsBlock
```

当前没有 `Stability` test_spec；单独 Pod 的编译覆盖不能等同于行为测试通过，集成场景由宿主验收。

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>

- QuartzCore 子类 DSL 已同步补齐返回当前子类类型的通用 Block typedef，避免链式调用中从 CAShapeLayer/CAGradientLayer 等降级为 CALayer。

<a id="jobs-architecture"></a>

## 十二、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 12.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

为 OC 各模块提供共享的 Block 类型语言。按有/无返回值、确定/不定参数及业务类型分组，NSObject 的回调属性工具负责挂载回调，类型声明本身不执行业务。

### 12.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

定义匹配输入/输出的 Block 类型 → 接口使用该类型 → 对象保存回调 → 业务时机触发。

### 12.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 回调参数、可空性和返回对象类型是调用契约，不能只按名称生成 void Block。
- 类型别名、回调存储和回调执行分属不同职责；存入 Block 不等于立即调用。
- 底层类型层应控制依赖方向，避免为某个业务类型引入整套上层实现。

### 12.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看聚合头和基础返回/参数类型，再进入业务类型与 NSObject 回调存储；重建依赖模块前先建立最小公共类型集。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsBlock.h](<./JobsBlock.h>)
- [JobsBlockDef.h](<./JobsBlockDef.h>)
- [JobsBlockHeader.h](<./JobsBlockHeader.h>)
- [Core/JobsBizBlock/JobsBizBlock.h](<./Core/JobsBizBlock/JobsBizBlock.h>)
- [Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h](<./Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h>)

依赖与编译入口：[JobsBlock.podspec](<./JobsBlock.podspec>)。其中根级依赖声明包括 `SDWebImage`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
