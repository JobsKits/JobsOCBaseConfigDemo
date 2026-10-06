# `JobsByOCPods`

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

> 这份自述用于记录 `JobsByOCPods` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsByOCPods` |
| Pod 类型 | 原始本地 Pod 源头 |
| 版本 | `0.0.1` |
| 平台 | `ios 12.0` |
| 摘要 | Jobs OC Base Customize UIKit Core (local pod) |
| 首页 | [https://example.local/JobsOCBaseCustomizeUIKitCore](https://example.local/JobsOCBaseCustomizeUIKitCore) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsByOCPods@Pods/JobsByOCPods.podspec` |
| source | `{ :git => "file://#{__dir__}", :tag => spec.version.to_s }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为早期 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 本地 Pod 源头，后续缺文件、缺宏、缺分类时优先回到这里核对来源。
- 当 `JobsByOCPods` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsByOCPods@Pods/
├── JobsByOCPods.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsByOCPods.h  # 根入口头文件
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开入口与核心实现，479 个文件
├── Support/  # 内部支援，4 个文件
├── LICENSE  # 许可证文件
├── Resource/  # 非代码资源，14 个文件
└── Tests/  # 独立回归，3 个文件
```

- `JobsByOCPods.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 479 个文件，其中源码 / 头文件 470 个；按 Jobs 规范，它是 `JobsByOCPods` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 4 个文件，其中源码 / 头文件 4 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- `Core/UIKit/NSObject/NSObject+Queue` 的主队列延时诊断只保留 `JobsLog` 与 `PrintRetainCount` 控制台输出，不通过 Toast 干扰 App 页面。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。
- `Core/UIKit/UIButton/UIButton+SDWebImage` 与 `Core/UIKit/UIImageView/UIImageView+SDWebImage` 只保留历史兼容入口，真实链式实现已下沉到 `JobsOCDSL/3rd/SDWebImage+DSL`。
- `Core/UIKit/UIButton/UIButton+SimplyMake` / `UIButton+UI` 是 `jobsMakeButton`、`UIButton.jobsInit()` 与 `jobsResetBtn*` 跨新旧管线入口的当前权威实现；`jobsResetImagePlacement_Padding` 和 `jobsResetBtnBgImage` 均包含旧系统 fallback，调用方不额外加 iOS 16 门槛。
- `Core/UIKit/UIButton/UIButton+UIControlState` 统一提供 `titleForStateBy`、`attributedTitleForStateBy`、`imageForStateBy`、`backgroundImageForStateBy`、`titleColorForStateBy`、`titleShadowColorForStateBy` 与 iOS 13 起可用的 `preferredSymbolConfigurationForStateBy`；`titleShadowColorByState` / `preferredSymbolConfigurationByState` 承接对应状态查询。上述入口均接受任意 `UIControlState` 及组合态，例如 `UIControlStateSelected | UIControlStateHighlighted`。
- `Core/UIKit/UIView/UIView+Animation` 提供 `bySpinStart`、`bySpinStartBy`、`bySpinPause`、`bySpinResume`、`bySpinStop` 与旋转状态查询；持续旋转作用于 `sublayerTransform.rotation.z`，避免和拖拽坐标、按钮点击回弹使用的 `UIView.transform` 互相覆盖。
- `Core/UIKit/UIViewController/.../UIViewController+BaseVC` 的 `navBarConfig` / `navBar` 懒加载会返回本次刚创建并完成关联的对象，首次链式配置不再因返回 `nil` Block 而触发 `EXC_BAD_ACCESS`。
- `Core/UIKit/UIViewController/.../UIViewController+Extra` 的 `clzPopGesture` / `openPopGestureBy` 在系统返回手势存在时调用既有 DSL，无导航或手势尚未创建时仍维护 `fd_interactivePopDisabled`；保存的动作在控制器释放后安全结束。该入口与 Navigation Support 的独立消费实现保持相同合同。
- `Core/UIKit/UIViewController/.../UIViewController+BaseVC` 在跳转前把 `UIViewModel.textModel` 的 Demo 标题同步到目标控制器，保证普通 `UIViewController` 进入后也具备导航标题。
- OC 侧布局统一使用 `Masonry`；历史 `NSLayoutConstraint+Extra` 系统约束桥接已移除，不再从 `UIKits.h` 暴露。
- `Core/UIKit/UINavigationController/.../UINavigationController+SafeTransition` 在入栈完成及 `viewDidAppear:` 后，只为真正存在于 `navigationController.viewControllers` 的 Demo 非根控制器补齐 GK 导航栏、标题与 `backBtnCategory` Jobs 返回按钮；导航 / Tab / Split 容器、`UIAlertController` 及其私有子控制器、直接挂在容器上的覆盖层均不参与注入。已有系统富文本标题及右侧业务按钮会迁移到 GK 导航栏，不再显示系统导航容器。页面覆写 `jobs_requiresDefaultNavigationBar` 并返回 `NO` 时跳过整套默认导航 UI；`JobsNavigationDemoVC` 保留系统导航容器但参与同一导航主题绑定。Demo 根列表导航流及类名包含 `Demo` 的演示页右上角最多只保留一个主题入口，页面业务动作统一收进该入口的下拉列表；入口图标和无障碍文案始终描述下一次点击的主题切换、展开或收起动作。
- 默认返回按钮使用 template 图标、主题主文字色和主题次级背景色，并通过 `jobsResetBtnBgCor` / `jobsResetBtnCornerRadiusValue` 同时覆盖 iOS 16+ Configuration 与旧按钮管线。
- `Core/UIKit/UIViewController/.../UIViewController+XLBubbleTransition` 通过 `JobsOCDSL` 的 `UINavigationController.byDelegate(...)` 切换导航代理；根 podspec 已持有 `JobsOCDSL` 直接依赖，分类头保留保护性导入。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsByOCPods.h`
- `Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsByOCPods.h`
- `Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Foundation`
- `QuartzCore`
- `CoreFoundation`
- `MessageUI`
- `JavaScriptCore`
- `WebKit`
- `UIKit`

### 5.5、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>


### 5.6、UITableView 折叠能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core/UIKit/UITableView/UITableView+WWFoldableTableView` 暴露 `ww_foldable` 属性，并提供 `byFoldable(BOOL)` 链式入口，业务侧优先写成 `tableView.byFoldable(YES)` / `tableView.byFoldable(NO)`。

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsByOCPods.h` 不是最终公开入口，请先修正 `JobsByOCPods.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 14 个，`Resource` 目录文件 14 个。
- podspec 资源声明如下：

- 资源通过当前 podspec 的 `resources` / `resource_bundles` 映射；物理文件计数与运行时复制范围分别核对。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsByOCPods` 后，优先按风险从低到高验证：

```shell
ruby -c JobsByOCPods.podspec
```

```shell
pod lib lint JobsByOCPods.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 只有 podspec 指定的公开头进入外部 API 边界；新增 import 时要确认不会把私有实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- `UIButton` 点按、追加点按、长按、追加长按分别使用 `onClickBy` / `onClickAppendBy` / `onLongPressGestureBy` / `onLongPressGestureAppendBy`；`byAddTarget` 仅作底层 Target-Action 兼容入口。
- `UITableViewCellProtocol` / `UITableViewHeaderFooterView` 的数据驱动入口允许上层传空模型占位，类型判断必须使用 `[model isKindOfClass:...]` 这类系统消息写法；不要写 `model.isKindOfClass(...)`，避免空模型返回 nil block 后被调用导致 `EXC_BAD_ACCESS`。
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

按 Apple 系统类组织工厂、分类和功能封装，是多种基础能力的汇集处。每个类目录对应自己的系统对象；实例配置 DSL、创建工具与功能型扩展可能由相邻 Pod 协作提供。

### 11.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

按系统类型定位分类 → 创建或取得对象 → 应用 Jobs 功能入口 → 由系统对象完成实际操作。

### 11.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 媒体预览、图层动画、通知、列表和按钮不能被理解为一条统一业务流程，应按系统类型切入。
- 聚合头可见、源码纳入编译、依赖实际存在是三个独立条件。
- 与 JobsOCDSL/JobsMakes 已拆分的能力应按真实入口归属理解，避免重建同名分类造成冲突。

### 11.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先从目标系统类的公开头切入，再读对应实现和实际 import；无需一开始复刻整个系统封装集合。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsByOCPods.h](<./JobsByOCPods.h>)
- [Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.h](<./Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.h>)
- [Core/UIKit/NSObject/NSObject+PopViewToLogOut/NSObject+PopViewToLogOut.h](<./Core/UIKit/NSObject/NSObject+PopViewToLogOut/NSObject+PopViewToLogOut.h>)
- [Core/UIKit/NSObject/NSObject+UIScrollViewDelegate/NSObject+UIScrollViewDelegate.h](<./Core/UIKit/NSObject/NSObject+UIScrollViewDelegate/NSObject+UIScrollViewDelegate.h>)
- [Core/UIKit/NSString/NSString+WKWebView/NSString+WKWebView.h](<./Core/UIKit/NSString/NSString+WKWebView/NSString+WKWebView.h>)

依赖与编译入口：[JobsByOCPods.podspec](<./JobsByOCPods.podspec>)。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十二、注册观察与导航边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

退出确认入口 `logOutPopupView` 首次返回已经创建并缓存的弹窗，后续读取复用同一对象。弹窗回调弱持有 owner 和原弹窗，任一对象释放后回调直接结束；执行期间保活原弹窗，因此同步通知观察者替换缓存时也只隐藏本次弹窗。

确认退出仍调用 `logOut`、成功提示并发送 `退出登录成功` 通知，`object` 为 `@(NO)`；取消不触发这些动作。旧 Demo 的 `ISLogin` 仅是可选兼容旗标：生产代码提供初值 `NO` 的弱缺省定义，宿主已有强定义时由强定义接管并更新为 `NO`；未提供时独立 Pod 仍可链接且照常发送通知。新的宿主可直接订阅既有通知，无须提供全局变量。仅声明 `weak_import` 仍会在当前普通 Mach-O 的链接阶段留下未解析符号，不能替代缺省定义。

`readLocalPlistWithFileName` 保留 `JobsBundleResourcePath` 的现有资源查找顺序，再用 [**Foundation**](https://developer.apple.com/documentation/foundation) 的 `NSFileManager` 校验非空且不是目录的文件路径，并通过 `NSDictionary` 读取。空值、非字符串、缺失文件、目录或无法读取的字典返回 `nil`。Core 不再引用 `FileFolderHandleTool` 的实现，避免基础 Pod 与文件工具 Pod 互相依赖；不通过扩展 Support 编译范围补出反向链接。

时间分类兼容头继续导出 `JobsTimeUtils`，由其旧 include 路径转发 JobsModel 的 Core 时间入口。`chinaTime` 与 `timeStampByTimeFormatter:timeZoneType:intervalStyle:` 的唯一实现属于 `JobsModel/Core/Foundation/NSString+JobsModelTime`；`readableTimeByFormatter`、`isExpired` 仍属于 `JobsTimeUtils`，并共用 `JobsModelParseTimestamp` 严格解析器。`JobsByOCPods` 不重复实现这些 selector，`JobsModel` 不反向导出 TimeUtils。

显式转换保持秒 / 毫秒真实单位，拒绝非有限、负值、非法尾部和嵌入 NUL；中国时间入口使用毫秒、中国时区及 POSIX / Gregorian 格式化合同。已有 `@"0".chinaTime(@"yyyy-MM-dd HH:mm:ss")` 调用保持可用，返回中国时区的 Unix epoch；系统默认时区的兼容格式化仍使用 `readableTimeByFormatter`。

集合视图分类只观察 UIKit 的 class/nib 注册与注销，不再拦截 dequeue 或根据复用标识猜测类名。`registerClass:nil` 和 `registerNib:nil` 会移除观察记录。`isRegisteredForReuseIdentifier(...)` 返回本分类观察到的 cell/header/footer 注册；Storyboard 原型 cell、`CellRegistration` 和其他 supplementary kind 应按 UIKit 自己的注册入口使用，不能用此查询推断全部 UIKit 内部状态。

`ty_popToRootViewControllerBySetControllersAnimated(YES/NO)` 都一次性提交根控制器数组；空栈和仅根控制器直接结束。动画参数交给 UIKit，调用返回不代表转场完成；需要检查最终栈或开始下一次导航时，等待导航代理 `didShowViewController` 或转场完成回调。注册、dequeue 和导航操作在主线程执行。

[UIKit 回归](<./Tests/JobsUIKitRegistrationTests/JobsUIKitRegistrationTests.m>) 验证 class/nib 的 nil 重置、真正的 nib cell dequeue，以及真实可见窗口中的动画和非动画导航。导航用例在主线程操作，逐阶段等待 `didShowViewController`，检查动画参数、最终根栈、top/visible 控制器及转场锁复位，并覆盖空栈和仅根控制器；每阶段超时 5 秒，结束后恢复原 key window。[nib fixture](<./Tests/JobsUIKitRegistrationTests/JobsRegistrationFixtureCell.xib>) 应随 `Stability` 测试 bundle 编译。

`appLanguageAtAppLanguageBy` 保留真实 LanMgr setter，再异步在主线程发语言 UI 通知。既有 UIKit fixture 追加后台触发 / 主线程接收、4 个并发真实语言读写 worker，以及当前 AppHost 实际 bundle 的 locale 选择与缺 key 回退，语言、注册和导航原有用例共 8 项；保存并恢复原语言及原 UserDefaults 值。另增 `weak_target` 的真实弱目标释放 / 取回 nil / 自目标不保活用例，并保留默认 native tap、动作入口与 View 释放；supplementary 注册 / 注销 / fresh nib 来源用例使既有 suite 为 10 项。本批在现有测试文件追加真实 controller-owned view 的 tap / pan 100 次释放与生产回调验证、9 个保存手势 getter 的迟到调用验证，当前 suite 共 12 项；显式 generic `byTarget` 身份断言独立保留，工厂不再隐含强 metadata，新的统一指纹待实际复验。当前宿主若没有 `zh-Hans.lproj`，此回归不能冒充 `zh-Hans-CN → zh-Hans` 的真实资源匹配验收，受控真实本地化宿主方案另行记录。

`weak_target` 使用既有 Jobs 零化弱关联容器；getter / setter 共用全局 selector key，四个 owned provider 保持相同 ABI，不依赖 category 加载顺序。设为外部目标不会延长其生命，目标释放后 getter 返回 nil；设为自身不形成自持有环，也不再通过 getter 自动关联自身。泛用手势 `byTarget` / `target` 的既有 API 保持。UIView 的 8 类懒加载手势从共享零化弱 key 取显式目标，未设置时默认绑定自身；自身与外部目标均只交给 UIKit 原生 target/action 和弱 delegate，工厂不再自动写入泛用 `target` metadata。控制器强持 view 再把控制器设为弱目标时，不应通过手势反向保活控制器；需要独立 metadata 的调用方仍可显式使用泛用 `byTarget`。既有 UIKit suite 保留默认自身释放及 weak_target 零化断言，并以真实 controller / view 的 tap、pan 各 100 次循环验证 owner、view 与手势释放、真实公共 `GestureActionBy` 安装链与已编译 OCDSL native provider 的两类保存回调、原生 handler 执行及迟到回调无额外事件。OCDSL native ActionBy 不再把手势自身写入 metadata，既有显式 `byTarget` 不被覆盖；泛用 getter / setter / addAction / removeAction 的 ABI 保持。UIView 的 `addGR` 及 8 个 `addXxxGR` 保存动作在 view 释放后返回 nil，不调用 nil DSL Block；同一真实 UIKit suite 覆盖 9 个迟到 getter、owner 释放与回调次数为零。Bits 菜单同样采用原生 target/action 消除持有环。相关真实断言在 JobsByOCPods 既有 UIKit suite；验证结果见本 README 统一验收记录。

## 十三、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 479 | 470 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 4 | 4 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 14 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 3 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级资源直接复制映射：`Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict}`。

根级命名资源 bundle：`JobsByOCPodsPrivacy.bundle`；已有运行资源保持各自 bundle 查找合同。

隐私声明入口：[Resource/PrivacyInfo.xcprivacy](<./Resource/PrivacyInfo.xcprivacy>)，通过 `JobsByOCPodsPrivacy.bundle` 安装。声明类别与理由按该文件记录：

| API 类别 | 理由标识 | 当前代码用途 |
| --- | --- | --- | --- |
| `NSPrivacyAccessedAPICategoryUserDefaults` | `CA92.1` | 本应用本地偏好或状态的读取与保存 |

理由使用合同：`CA92.1`：仅供本 App 访问自身偏好。范围依据 [Apple 理由定义](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitypereasons)。

该文件记录当前 Pod 使用的 API 类别；宿主仍需按自身实际调用和数据行为维护自己的声明。最终产物是否包含该命名 bundle，随独立 Pod 与主工程资源验收一起核对。

`Resource/icon.png` 用于文档展示，podspec 通过 `exclude_files` 排除运行时资源复制，同时 `preserve_paths` 保留文件以供文档使用。这样避免通用 `icon.png` 名称在宿主资源中发生冲突；已有业务图片 / bundle 的查找位置沿用原合同。

## 十四、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsByOCPods
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

`JobsUIKitRegistrationTests` 通过真实生产 getter / 回调验证退出弹窗首次非空、稳定复用、取消无副作用、确认通知的次数与 payload，以及 owner 已释放而弹窗仍存活时回调无副作用；测试替换宿主的注销 / Toast 动作，不访问真实账户数据，不定义假的 `ISLogin` 来掩盖链接依赖。上述 UI 场景在主线程执行。

同一测试类直接调用生产 plist 读取 Block，覆盖 `nil`、空串、非字符串、不存在的随机文件名，并复用运行 bundle 的合法 `Info.plist`；先确认真实文件及非空字典存在，再核对读取结果，不把缺失 fixture 的 `nil == nil` 当作成功。

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsByOCPods --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
