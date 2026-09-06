# `JobsBaseUI`

Demo 主题入口调用 `JobsThemeCenter.toggle`；`JobsOCDefs` 根据主工程 JSON 数据包重放已登记的背景色、文字色和显式主题图片，并发布 `JobsThemeDidChangeNotification`，不遍历 Scene、Window 或控制器树。

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

> 这份自述用于记录 `JobsBaseUI` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsBaseUI is a local Objective-C UI component library used in Jobs projects. It contains base views, view controllers, table and collection view cells, text fields, buttons, labels, navigation components, layouts, helper objects, UIKit categories, model helpers, and related resource files.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsBaseUI` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Base UI component library for Jobs projects. |
| 首页 | [https://example.local/JobsBaseUI](https://example.local/JobsBaseUI) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsBaseUI@Pods/JobsBaseUI.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsBaseUI` 相关能力。
- 当 `JobsBaseUI` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsBaseUI@Pods/
├── JobsBaseUI.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsBaseUI.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，156 个文件
├── Support/  # 内部支撑层，169 个文件
└── LICENSE  # 许可证文件
```

- `JobsBaseUI.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 156 个文件，其中源码 / 头文件 133 个；按 Jobs 规范，它是 `JobsBaseUI` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 169 个文件，其中源码 / 头文件 164 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。
- `Support/UIKit/UIButton/UIButton+SDWebImage` 只保留历史兼容入口，真实链式实现已下沉到 `JobsOCDSL/3rd/SDWebImage+DSL`。
- `BaseViewController` 会在 Demo 子页面进入前及转场完成后兜底 Jobs/GK 导航栏、Jobs 返回按钮和标题；只处理真实导航栈成员或直接模态页面，导航 / Tab / Split 容器、`UIAlertController` 及其私有子控制器不会创建导航栏。已有系统富文本标题及右侧业务按钮会迁移到 GK 导航栏，不再沿用系统导航容器。根页面不处理，专门演示系统导航栏的 `JobsNavigationDemoVC` 继续使用系统导航栏但参与同一主题绑定；全屏业务页可覆写 `jobs_requiresDefaultNavigationBar` 并返回 `NO`，明确关闭整套默认导航 UI。
- `UIViewController+BaseNavigationBar` 会识别 `ViewController_1` Demo 根列表的导航 / 模态子页面及类名包含 `Demo` 的独立演示页，统一刷新返回按钮的 template 图标、主文字色和次级背景，并把 GK / 系统导航的普通标题、富文本 titleView、双行主副标题收口到主题主 / 次文字色。右上角最多只保留一个透明背景的主题入口；没有业务动作时直接切换主题，月亮 / 太阳图标与无障碍文案表达下一次点击会切换到的主题；存在业务动作时用 Demo 总入口同款 `ellipsis.circle` 展开下拉列表，展开后切换为填充图标与“收起”语义，统一承载主题与页面动作。切换结果由 `JobsThemeCenter` 持久化并按资源绑定更新。
- `JobsDebugVC` 通过 `JobsControllerDeallocTipsEnabled()` / `JobsSetControllerDeallocTipsEnabled(...)` 持久化控制销毁 Toast，默认开启；关闭只隐藏提示，不影响通知清理与调试日志。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsBaseUI.h`
- `Core/**/*.h`

### 5.2、源码入口

- `JobsBaseUI.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。
- `TMSCollectionViewLayout` 提供 UICollectionView 卡包式重叠布局，公开 `itemHeight`、`overlapRatio` 和 `expandedItemSpacing`，默认收起时相邻 Cell 盖住 50%，调用 `didClickWithIndexPath:isExpand:` 可展开或收起被点击的 Cell。
- `ZYTextField` 继承系统 `UITextField.text` 的读写实现，不重复合成同名属性，保证 UIKit 实际输入、`text` 取值和 `rac_textSignal` 始终来自同一份文本状态。

### 5.4、系统框架

- `AudioToolbox`
- `Foundation`
- `UIKit`
- `WebKit`

### 5.5、Pod 依赖

- `Masonry`
- `MJRefresh`
- `lottie-ios ~> 2.5.3`
- `XYColorOC`
- `SZTextView`
- `XZMRefresh`
- `MJExtension`
- `TABAnimated`
- `ReactiveObjC`
- `GKNavigationBar`
- `MJRefreshExtra`
- `WHToastExtra`
- `JobsModel`
- `JobsClass`
- `JobsBlock`
- `JobsMakes`
- `JobsNavBar`
- `JobsOCDefs`
- `JobsAppTools`
- `JobsTimeUtils`
- `JobsDeviceInfo`
- `JobsStringUtils`
- `JobsRandomUtils`
- `JobsOCProtocols`
- `JobsLoadingImage`
- `JobsBasePopupView`
- `JobsRichTextUtils`
- `JobsOCRuntimeKits`
- `JobsLanMgr`
- `This`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsBaseUI.h` 不是最终公开入口，请先修正 `JobsBaseUI.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 17 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- `Core/**/*.{png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle}`

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsBaseUI` 后，优先按风险从低到高验证：

```shell
ruby -c JobsBaseUI.podspec
```

```shell
pod lib lint JobsBaseUI.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- `BaseLabel` 是 `UIView` 子类，可见性状态使用 `jobsVisible` / `byVisible`；`isVisible` 只属于 model 协议标记，不能直接发给视图对象。
- `BaseLabel` / `BaseTextView` 的系统编辑菜单必须先交给 `super` 判断真实可执行动作；自定义菜单只放 Jobs 动态 selector，缺少对应实现的 `delete:` 这类动作落到 toast 兜底，不能用空字符串匹配或默认 `YES` 放出系统未知 action。
- `JobsTextView` 内部承接 `SZTextView` 时，`textModel`、`text` 和 `placeholder` 必须兜底为空对象 / 空字符串，避免第三方 `SZTextView` 用 nil placeholder 创建 `NSAttributedString` 导致发帖页进入即崩溃。
- `JobsHeaderFooterView` 的数据驱动入口要同时兼容单个 `UIViewModel` 和 `NSArray<UIViewModel *>`；`JobsHotLabelByMultiLine` 这类 supplementary view 会直接传 `JobsHeaderFooterViewModel`，不能无条件当数组调用 `count`。
- `UITableViewHeaderFooterView` 的数据驱动入口允许上层传空模型占位，类型判断必须使用 `[model isKindOfClass:...]` 这类系统消息写法；不要写 `model.isKindOfClass(...)`，避免空模型返回 nil block 后被调用导致 `EXC_BAD_ACCESS`。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- BaseVC 的页面根背景不展示固定底色或底图；业务图片必须下沉到内容子视图，避免覆盖全局明暗主题。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要显式绑定主题 Key，或监听 `JobsThemeDidChangeNotification` 后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 十、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 10.1、设计目的与职责划分

这是按控件类型组织的 UI 基础组件集合，包含基础 View、Button、Cell、列表布局和多种输入框。公共模型/协议提供统一表达，各具体控件实现自己的布局、渲染和交互；Support 承接局部支撑。

### 10.2、运行脉络

选择具体基础控件 → 注入模型和配置 → 组装子视图/约束 → 接收交互并回传 → 在复用或状态变化时更新。

### 10.3、关键设计与边界

- 同一库包含多种控件，不存在一条适用于全部组件的统一业务状态机。
- Cell 复用、输入框占位动画和按钮点击具有不同生命周期，应按类型阅读。
- 自维护代码与历史引入组件要保留来源边界，不能把目录内所有实现都视为需要重新生成的自研内核。

### 10.4、阅读与重建顺序

先选业务需要的 BaseView/BaseButton/BaseCell 或输入框分支，再沿模型、协议、实现追踪；不要从所有文件列表开始整体重写。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsBaseUI.h](<./JobsBaseUI.h>)
- [Core/UIBaseView/BaseView/BaseView.h](<./Core/UIBaseView/BaseView/BaseView.h>)
- [Core/UIBaseButton/BaseButton/BaseButton.h](<./Core/UIBaseButton/BaseButton/BaseButton.h>)
- [Core/UIBaseCollectionReusableView/BaseCollectionReusableView/BaseCollectionReusableView.h](<./Core/UIBaseCollectionReusableView/BaseCollectionReusableView/BaseCollectionReusableView.h>)
- [Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.h](<./Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.h>)

依赖与编译入口：[JobsBaseUI.podspec](<./JobsBaseUI.podspec>)。其中显式依赖声明包括 `Masonry`、`MJRefresh`、`lottie-ios`、`XYColorOC`、`SZTextViewExtra`、`XZMRefresh`、`MJExtension`、`TABAnimated`、`ReactiveObjC`、`GKNavigationBar`、`MJRefreshExtra`、`WHToastExtra`、`JobsModelDSL`、`JobsClass`、`JobsBlock`、`JobsOCDSL`、`JobsMakes`、`JobsNavBar`、`JobsOCDefs`、`JobsAppTools`、`JobsTimeUtils`、`JobsDeviceInfo`、`JobsStringUtils`、`JobsRandomUtils`、`JobsOCProtocols`、`JobsLoadingImage`、`JobsBasePopupView`、`JobsRichTextUtils`、`JobsOCRuntimeKits`、`JobsLanMgr`、`This`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
