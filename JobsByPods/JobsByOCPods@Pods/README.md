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

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

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
├── Core/  # 公开 API 与核心实现，517 个文件
├── Support/  # 内部支撑层，4 个文件
└── LICENSE  # 许可证文件
```

- `JobsByOCPods.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 517 个文件，其中源码 / 头文件 496 个；按 Jobs 规范，它是 `JobsByOCPods` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 4 个文件，其中源码 / 头文件 4 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- `Core/UIKit/NSObject/NSObject+Queue` 的主队列延时诊断只保留 `JobsLog` 与 `PrintRetainCount` 控制台输出，不通过 Toast 干扰 App 页面。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。
- `Core/UIKit/UIButton/UIButton+SDWebImage` 与 `Core/UIKit/UIImageView/UIImageView+SDWebImage` 只保留历史兼容入口，真实链式实现已下沉到 `JobsOCDSL/3rd/SDWebImage+DSL`。
- `Core/UIKit/UIButton/UIButton+SimplyMake` / `UIButton+UI` 是 `jobsMakeButton`、`UIButton.jobsInit()` 与 `jobsResetBtn*` 跨新旧管线入口的当前权威实现；`jobsResetImagePlacement_Padding` 和 `jobsResetBtnBgImage` 均包含旧系统 fallback，调用方不额外加 iOS 16 门槛。
- `Core/UIKit/UIButton/UIButton+UIControlState` 统一提供 `titleForStateBy`、`attributedTitleForStateBy`、`imageForStateBy`、`backgroundImageForStateBy`、`titleColorForStateBy`、`titleShadowColorForStateBy` 与 iOS 13 起可用的 `preferredSymbolConfigurationForStateBy`；`titleShadowColorByState` / `preferredSymbolConfigurationByState` 承接对应状态查询。上述入口均接受任意 `UIControlState` 及组合态，例如 `UIControlStateSelected | UIControlStateHighlighted`。
- `Core/UIKit/UIView/UIView+Animation` 提供 `bySpinStart`、`bySpinStartBy`、`bySpinPause`、`bySpinResume`、`bySpinStop` 与旋转状态查询；持续旋转作用于 `sublayerTransform.rotation.z`，避免和拖拽坐标、按钮点击回弹使用的 `UIView.transform` 互相覆盖。
- `Core/UIKit/UIViewController/.../UIViewController+BaseVC` 的 `navBarConfig` / `navBar` 懒加载会返回本次刚创建并完成关联的对象，首次链式配置不再因返回 `nil` Block 而触发 `EXC_BAD_ACCESS`。
- `Core/UIKit/UIViewController/.../UIViewController+BaseVC` 在跳转前把 `UIViewModel.textModel` 的 Demo 标题同步到目标控制器，保证普通 `UIViewController` 进入后也具备导航标题。
- OC 侧布局统一使用 `Masonry`；历史 `NSLayoutConstraint+Extra` 系统约束桥接已移除，不再从 `UIKits.h` 暴露。
- `Core/UIKit/UINavigationController/.../UINavigationController+SafeTransition` 在入栈完成及 `viewDidAppear:` 后，只为真正存在于 `navigationController.viewControllers` 的非根控制器补齐 GK 导航栏、标题与 `backBtnCategory` Jobs 返回按钮；直接挂在导航控制器上的子控制器覆盖层不属于导航栈。已有系统富文本标题及右侧业务按钮会迁移到 GK 导航栏，不再显示系统导航容器。页面覆写 `jobs_requiresDefaultNavigationBar` 并返回 `NO` 时跳过整套默认导航 UI；`JobsNavigationDemoVC` 作为系统导航栏专项 Demo 保留系统导航容器。Demo 根列表导航流及类名包含 `Demo` 的演示页还会统一保留最右侧全局主题入口。
- 默认返回图标使用 template 渲染，着色源为 `UIViewModel.backBtnTitleModel.textCor`，其默认值是 `JobsLabelColor`，可随明暗主题自动变色。
- `Core/UIKit/UIViewController/.../UIViewController+XLBubbleTransition` 通过 `JobsOCDSL` 的 `UINavigationController.byDelegate(...)` 切换导航代理；根 podspec 已持有 `JobsOCDSL` 直接依赖，分类头保留保护性导入。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsByOCPods.h`
- `Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.h`

### 5.2、源码入口

- `JobsByOCPods.h`
- `Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.h`

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架

- `Foundation`
- `QuartzCore`
- `CoreFoundation`
- `MessageUI`
- `JavaScriptCore`
- `WebKit`
- `UIKit`

### 5.5、Pod 依赖


### 5.6、UITableView 折叠能力

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

- 当前目录扫描到资源类文件 13 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- podspec 未显式声明 `resources`，如新增图片、xib、bundle、json、plist 等资源，需要同步补齐。

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

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- `UIButton` 点按、追加点按、长按、追加长按分别使用 `onClickBy` / `onClickAppendBy` / `onLongPressGestureBy` / `onLongPressGestureAppendBy`；`byAddTarget` 仅作底层 Target-Action 兼容入口。
- `UITableViewCellProtocol` / `UITableViewHeaderFooterView` 的数据驱动入口允许上层传空模型占位，类型判断必须使用 `[model isKindOfClass:...]` 这类系统消息写法；不要写 `model.isKindOfClass(...)`，避免空模型返回 nil block 后被调用导致 `EXC_BAD_ACCESS`。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
