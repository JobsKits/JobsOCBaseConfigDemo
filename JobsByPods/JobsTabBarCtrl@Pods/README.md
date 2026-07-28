# `JobsTabBarCtrl`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 这份自述用于记录 `JobsTabBarCtrl` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、公开能力、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsTabBarCtrl` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Custom tab bar controller component for Jobs projects. |
| 首页 | [https://example.local/JobsTabBarCtrl](https://example.local/JobsTabBarCtrl) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsTabBarCtrl@Pods/JobsTabBarCtrl.podspec` |
| source | `{ :path => '.' }` |

## 二、支持能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 支持用一组 `UIButton` 和一组 `UIViewController` 建立自定义底部 Tab 容器。
- 支持内容区横向分页、按钮点击切换、手势滑动切换和主动 `selectIndex:animated:` 切换。
- 支持 `swipeEnabled` 控制内容区是否允许左右滑动。
- 支持 `horizontalOnly` 锁定内容区纵向偏移。
- 支持 `suppressChildVerticalScrolls` 对子控制器内部 `UITableView` / `UICollectionView` / `UIScrollView` 做纵向滚动抑制。
- 支持 `customBarHeight`、`barBottomOffset`、`barBackgroundColor`、`barBackgroundImage` 配置底部栏尺寸、位置和背景。
- 支持 `contentInset`、`equalSpacing`、`equalVisibleMin`、`equalVisibleMax`、`lockUnitToMaxEqualCount` 控制按钮布局规则。
- 支持 `autoRelayoutForBoundsChange` 在旋转或尺寸变化时自动重排按钮。
- 支持 `onButtonsBuilt` 和 `onButtonsLayouted` 回调，便于按钮创建后统一补样式、凸起或动画。
- 支持 `jobsMakeTabBarCtrl(...)` 和 `byXxx` 链式 API，保持 Jobs [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 点语法风格。
- 对外暴露 `tabBar`、`contentScrollView`、`buttons`、`controllers`、`selectedIndex` 只读状态，支持 `requestRelayout` 手动重排。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsTabBarCtrl@Pods/
├── JobsTabBarCtrl.podspec  # Pod 描述文件
├── JobsTabBarCtrlHeader.h  # 根聚合头文件
├── README.md  # 当前自述
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，2 个文件
└── LICENSE  # 许可证文件
```

- `Core/JobsTabBarCtrl/JobsTabBarCtrl.h` 是公开 API 和链式配置入口。
- `Core/JobsTabBarCtrl/JobsTabBarCtrl.m` 承载布局、滚动同步、数据源装配、子滚动抑制和链式 API 实现。
- 当前没有 `Support` 和 `Resource` 目录；后续内部兼容代码优先放 `Support`，非代码资源放 `Resource`。

## 四、公开边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、公开头文件

- `JobsTabBarCtrlHeader.h`
- `Core/**/*.h`

### 4.2、源码入口

- `JobsTabBarCtrlHeader.h`
- `Core/**/*.{h,m,mm}`

### 4.3、系统框架

- `Foundation`
- `UIKit`

### 4.4、Pod 依赖

- `JobsBlock`
- `JobsMakes`
- `JobsByOCPods`
- `JobsBaseUI`
- `JobsOCDefs`
- `JobsOCDSL`

## 五、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐调用方优先引用当前 Pod 的聚合头：

```objc
#if __has_include(<JobsTabBarCtrl/JobsTabBarCtrlHeader.h>)
#import <JobsTabBarCtrl/JobsTabBarCtrlHeader.h>
#else
#import "JobsTabBarCtrlHeader.h"
#endif
```

- App 或其它 Pod 不应继续通过 `JobsOCTools` 间接拿 `JobsTabBarCtrl`。
- `JobsTabBarCtrl` 的公开依赖已经写入 `JobsTabBarCtrl.podspec`，不要在调用方补内部搜索路径绕过依赖边界。

## 六、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前 Pod 不包含图片、xib、bundle、json、plist 等非代码资源。
- 如后续新增背景图、默认按钮图标或动效资源，需要放入 `Resource` 并同步 `JobsTabBarCtrl.podspec` 与本 README。

## 七、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsTabBarCtrl` 后，优先按风险从低到高验证：

```shell
ruby -c JobsTabBarCtrl.podspec
```

```shell
pod install --no-repo-update
```

```shell
ruby -rxcodeproj -e 'p = Xcodeproj::Project.open("Pods/Pods.xcodeproj"); puts [p.root_object.isa, p.targets.find { |t| t.name == "JobsTabBarCtrl" }&.name].join(" | ")'
```

- 若执行 `pod install`，还要确认 `Development Pods > JobsTabBarCtrl` 能展开到 `Core` 和 `Support Files`。
- 若本机环境暂不适合执行 [**CocoaPods**](https://cocoapods.org/) 流程，至少保留未执行声明，并检查 `PodspecDependencyReport` 后续是否刷新。

## 八、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsTabBarCtrl` 继承 `BaseViewController`，因此必须依赖 `JobsBaseUI`。
- `jobsMakeTabBarCtrl`、链式 Block 类型、属性宏、颜色宏和滚动 / 按钮 DSL 分别来自 `JobsMakes`、`JobsBlock`、`JobsOCDefs`、`JobsOCDSL` 和 `JobsByOCPods`。
- 当前 Pod 不反向依赖 `JobsOCTools`，避免形成循环引用；其它模块需要使用时应直接依赖 `JobsTabBarCtrl`。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
