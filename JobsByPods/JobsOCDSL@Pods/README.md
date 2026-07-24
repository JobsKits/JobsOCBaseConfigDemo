# `JobsOCDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsOCDSL` 用来集中管理 Objective-C 项目里的点语法 DSL 分类，只放 `+DSL` 分类本身，不承接按钮辅助、布局工具、业务 UI 或其它非 DSL 支撑文件。本版本开始同时承接“属性 DSL”和“方法型 DSL”：凡是适合链式表达的单参数 / 无参数实例方法，也可以包装成 `byXxx(...)`。

## 一、适用场景

- 对系统类或少量第三方 UI 类的方法做链式封装，例如 `UIView`、`UITableView`、`UITextField`、`UITextView`、`UIBackgroundConfiguration`、`UIControl`、`ASButtonNode`。
- `CMMotionManager+DSL` 覆盖加速度计、陀螺仪、磁力计与设备姿态的更新频率、启动、停止、队列回调及参考坐标系配置；调用方可从 `CMMotionManager.byMotionManager()` 开始一链完成配置和监听。
- 系统类 DSL 以“当前类本层级”为边界，只封装当前类自己声明的属性、无参数方法和单参数方法；父类能力留在父类 DSL，子类特有能力留在子类 DSL。
- OC 侧 DSL 统一依赖 `JobsBlock` 提供 Block typedef，避免每个 Pod 自己散落定义。
- 原本散在其它本地 Pod 里的纯 DSL 分类逐步迁移到这里，调用方通过 `JobsOCDSL` 暴露。
- 对照 Swift 侧 `JobsSwiftDSL` 的 [**SnapKit**](https://github.com/SnapKit/SnapKit) 链式封装，OC 侧通过 [**Masonry**](https://github.com/SnapKit/Masonry) 补齐 `byAddTo`、`byMakeConstraints`、`byUpdateConstraints`、`byRemake`。
- 对照 Swift 侧 `BMPlayer+DSL`、`GKNavigationBarSwift+DSL`、`YTKNetwork+DSL`，OC 侧分别补齐当前工程实际使用的 `ZFPlayer`、`GKNavigationBar`、`YTKNetwork` 链式入口；其中 `GKNavigationBar` 的手势配置在 OC 版里属于 `GKGestureHandleConfigure`。

## 二、目录结构

```text
JobsOCDSL@Pods/
├── Core/
│   ├── CoreMotion/
│   │   └── CMMotionManager+DSL/
│   ├── UIKit/
│   │   ├── UILabel+DSL/
│   │   ├── UITextField+DSL/
│   │   ├── UITextView+DSL/
│   │   ├── UITableView+DSL/
│   │   ├── UITableViewCell+DSL/
│   │   ├── UICollectionView+DSL/
│   │   ├── UIScrollView+DSL/
│   │   ├── UISearchBar+DSL/
│   │   ├── UIView+DSL/
│   │   ├── UIControl+DSL/
│   │   ├── UIContextualAction+DSL/
│   │   ├── UIProgressView+DSL/
│   │   ├── UISlider+DSL/
│   │   ├── UISegmentedControl+DSL/
│   │   ├── UIStackView+DSL/
│   │   ├── UISwitch+DSL/
│   │   ├── UISwipeActionsConfiguration+DSL/
│   │   ├── UIButton+DSL/
│   │   ├── UINavigationController+DSL/
│   │   ├── UIBarAppearance+DSL/
│   │   ├── UIBarButtonItem+DSL/
│   │   ├── UINavigationBarAppearance+DSL/
│   │   ├── UINavigationBar+DSL/
│   │   ├── UITabBar+DSL/
│   │   ├── UIImpactFeedbackGenerator+DSL/
│   │   ├── UIBackgroundConfiguration+DSL/
│   │   ├── UIBezierPath+DSL/
│   │   └── NSMutableParagraphStyle+DSL/
│   ├── UserNotifications/
│   │   ├── UNUserNotificationCenter+DSL/
│   │   └── UNNotificationSound+DSL/
│   ├── QuartzCore/
│   │   └── CALayer+DSL/
│   └── 3rd/
│       ├── FSCalendar+DSL/
│       ├── GKNavigationBar/
│       │   ├── GKGestureHandleConfigure/
│       │   ├── GKNavigationBarConfigure/
│       │   └── UIViewController/
│       ├── Masonry/
│       ├── SDWebImage+DSL/
│       ├── HXPhotoPickerObjC/
│       ├── Texture/
│       ├── YTKNetwork/
│       └── ZFPlayer/
├── JobsOCDSL.h
├── JobsOCDSL.podspec
└── JobsPodspecKit.rb
```

## 方法型 DSL 补充

- `CMMotionManager+DSL` 提供 `byAccelerometerUpdateInterval(...)`、`byGyroUpdateInterval(...)`、`byMagnetometerUpdateInterval(...)`、`byDeviceMotionUpdateInterval(...)` 及对应 `byStart...` / `byStop...` 链式入口；`byStopAllUpdates()` 用于在页面退出或对象销毁前统一停止传感器。
- `UIBezierPath+DSL` 已把 `moveToPoint:`、`addLineToPoint:`、`appendPath:`、`applyTransform:`、`containsPoint:` 改成链式入口，并用 `byBezierPathWithRoundedRect`、`byBezierPathWithRoundedCorners`、`byBezierPathWithArcCenter` 收口三类常用路径工厂。
- `CALayer+DSL` 除属性包装外，补齐 `addSublayer:`、`removeAnimationForKey:`、`drawInContext:`、`renderInContext:`、`containsPoint:` 等方法型 DSL。
- `UIView+DSL` 补齐 `addSubview:`、`bringSubviewToFront:`、`sendSubviewToBack:`、`addGestureRecognizer:`、`removeGestureRecognizer:`、`addInteraction:`、`removeInteraction:`、`setNeedsDisplayInRect:`、`removeFromSuperview`、`layoutIfNeeded`、`sizeToFit` 等链式入口。类级终止动作使用 `jobsAnimate`、`jobsAnimateWithCompletion`、`jobsAnimateWithOptions`、`jobsAnimateWithSpring`、`jobsTransition`、`jobsTransitionFromViewToView`，屏蔽 UIKit 动画 overload 差异。
- `UIBarButtonItem+DSL`、`UITableViewCell+DSL`、`UIImpactFeedbackGenerator+DSL` 覆盖各自当前类本层属性和 0 / 1 参数方法，不复制 `UIBarItem`、`UIView`、`UIFeedbackGenerator` 的父类能力。
- `UIButton+DSL` 覆盖按钮本层 configuration、普通状态标题 / 图片 / 富文本、titleLabel / imageView 回调，以及 `adjustsImageWhenHighlighted` 等旧式按钮属性；父类交互状态仍走 `UIControl+DSL`。Jobs 公开 DSL 不复制 UIKit deprecated 标记，`contentEdgeInsets` 的 configuration 适配及其它旧属性的兼容、回退和最小范围压警告均由实现内部处理。状态写入使用 `bySelected(...)` / `byEnabled(...)` / `byHighlighted(...)`，切换使用 `byToggleSelected()`，读取使用 `jobs_isSelected` / `jobs_isEnabled` / `jobs_isHighlighted` / `jobs_effectiveState`。
- `UINavigationController+DSL` 用 `byDelegate(...)` 收口导航控制器代理；`UNUserNotificationCenter+DSL` 用同名入口收口通知中心代理。
- `UIBarAppearance+DSL` 在父类层统一提供背景、阴影与背景配置方法，`UINavigationBarAppearance` 与 `UITabBarAppearance` 共同复用，不在两个子类重复铺设父类属性。
- `UIBarAppearance+DSL` 同时承接公共背景、阴影与三种 `configureWith...Background` 方法；`UINavigationBarAppearance+DSL` 只放标题 / 按钮外观等子类属性，`UINavigationBar+DSL` 与 `UITabBar+DSL` 分别承接各自 appearance 管线和旧系统栏兼容属性，栏背景色、阴影图和背景图由封装内部在 appearance 与旧系统属性之间切换，不向调用方暴露 deprecated 标记。
- `UIAppearance` 是消息记录代理，不能执行返回 Block 的实例 DSL；全局 `UITabBar` 外观使用 `jobsApplyStandardAppearance:` / `jobsApplyScrollEdgeAppearance:`，真实 `UITabBar` 实例继续使用 `byStandardAppearance` / `byScrollEdgeAppearance`。
- `UILabel+DSL` 的 `transformLayer(...)` 会在真实 bounds 下用 CoreText 生成文字字形路径，并挂到 `shapeLayer`，原 label 文本色置透明；文本适配同时覆盖 `byLineBreakMode(...)`、`byAdjustsFontSizeToFitWidth(...)`、`byAdjustsFontForContentSizeCategory(...)`、`byMinimumScaleFactor(...)`。
- `UILabel+DSL` 补齐数字文本动效，`byAnimatedTextNumberFrom:step:duration:minimumInterval:completion:` 配合 `byStartAnimatedTextNumber(...)`、`byStopAnimatedTextNumber()` 使用，底层由 `JobsOCTimer` 按最小时间间隔驱动。
- `UISearchBar+DSL` 覆盖搜索栏本层可写属性，包括文本、占位符、代理、按钮显隐、样式、背景图片、scope 配置和输入附件视图；父类视图属性仍走 `UIView+DSL`。
- `UIImageView+DSL` 覆盖当前类本层图片与高亮状态，`byImage(...)` 设置普通图片，`byHighlightedImage(...)` 设置高亮图片，`byHighlighted(...)` 切换当前高亮状态。
- `UISegmentedControl+DSL` 用 `jobs_selectedSegmentIndex` 查询当前分段，用 `bySelectedSegmentIndex(...)`、`byMomentary(...)`、`byApportionsSegmentWidthsByContent(...)`、`bySelectedSegmentTintColor(...)` 和 `byRemoveAllSegments()` 收口本层基础属性 / 无参方法；创建统一走 `JobsMakes.jobsMakeSegmentedControl(items, block)`，调用方不再裸调 `initWithItems:`。
- `UIStackView+DSL` 收口布局轴、分布、对齐、间距、基线 / layoutMargins 相对布局及 arrangedSubview 增删；`UISwitch+DSL` 用 `jobs_isOn` 查询状态，并收口开关状态、动画切换、颜色、样式、标题与 on/off 图片。
- `UIView+DSL` 用 `byTranslatesAutoresizingMaskIntoConstraints(...)` 收口 Auto Layout 自动转换开关，上层配置不再散落裸属性赋值。
- `UIContextualAction+DSL` 收口图片、背景色（含 `byBgColor` 兼容名）和标题，`UISwipeActionsConfiguration+DSL` 收口全滑触发开关；两类对象分别由 `jobsMakeContextualAction` / `jobsMakeSwipeActionsConfiguration` 创建。
- `NSMutableParagraphStyle+DSL` 覆盖段落样式常用字段，包括 `byAlignment(...)`、`byParagraphSpacing(...)`、`byParagraphSpacingBefore(...)`、`byFirstLineHeadIndent(...)`、`byHeadIndent(...)`、`byLineSpacing(...)`、`byLineBreakMode(...)`、`byBaseWritingDirection(...)`，供 `jobsMakeParagraphStyle` 闭包内保持点语法链式配置。
- `FSCalendar+DSL` 对 `appearance`、`calendarHeaderView`、`swipeToChooseGesture` 这类子对象提供 block 配置入口，回调内部配置子对象后继续返回主 `FSCalendar`，方便调用方保持一个 `calendar` 中心链。

## 三、引用方式

```objc
#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
```

## 四、依赖关系

- `CoreMotion`：提供 `CMMotionManager`、传感器数据模型与更新回调类型。
- `JobsBlock`：集中提供 OC Block 类型别名。
- 第三方 DSL 的 Block typedef 统一落在 `JobsBlock`，`JobsOCDSL` 头文件只负责导入并使用，不再本地散落声明。
- `JobsOCDefs`：提供基础宏、枚举、颜色和 `Prop_*` 属性声明宏；`JobsOCDSL` 内属性声明统一使用该宏族。
- `JobsOCProtocols`：提供 DSL 协议边界。
- `JobsOCTimer`：服务 `UILabel+DSL` 数字文本动效的 tick 驱动。
- `CoreText`：服务 `UILabel+DSL` 文字字形路径生成。
- `GKNavigationBar`：服务 OC 侧导航栏全局配置与控制器级全部可写属性、无参数动作、单参数动作 DSL。
- `UIViewController+GKNavigationBarDSL` 的公开入口统一使用 `byGK...` 前缀，明确能力来自 GKNavigationBar，例如 `byGKNavBackgroundColor(...)`、`byGKNavTitleColor(...)`、`byGKHideNavLine()`。
- `byGKNavigationBarBlock(...)` 用于在同一条 `UIViewController` 主链中配置 `gk_navigationBar` 子对象，避免调用方再次散落 `self.gk_navigationBar...`；Block 结束后继续返回原控制器。
- `Masonry`：服务 OC 侧约束链式 DSL。
- `Texture`：服务当前已迁入的 Texture DSL 分类。
- `YTKNetwork`：服务请求、批量请求、链式请求 DSL。
- `ZFPlayer`：服务 OC 侧播放器 DSL，对齐 Swift 项目中的 `BMPlayer+DSL` 职责。
- `HXPhotoPickerObjC`：服务 `HXPhotoView`、`HXPhotoManager`、`HXPhotoConfiguration` 的发帖图片选择链式配置。
- `SDWebImage`：服务 `UIButton`、`UIImageView` 的网络图片链式加载 DSL。
- `JobsModelDSL`：服务 `SDWebImageModel` 等模型对象的链式配置。

## 五、Masonry 链式约束

- `UIView+MasonryDSL` 只做公共链式入口，不承接旧 Pod 私有的网格算法、约束动画和 `masonryBlock` 存储。
- 推荐写法是先调用本层类型 DSL，再调用 `UIView` / `Masonry` 父层 DSL。比如 `UILabel` 先写 `byText`、`byFont`、`byTextAlignment`，最后再写 `byAddTo` 或 `byMakeConstraints`，避免父类方法返回 `UIView` 后丢失 `UILabel` 本层链式能力。

  ```objc
  UILabel *label = UILabel.alloc.init
      .byText(@"Demo")
      .byFont(UIFontSystemFontOfSize(16))
      .byTextAlignment(NSTextAlignmentCenter)
      .addOn(self.view)
      .byAdd(^(MASConstraintMaker *make) {
          make.center.equalTo(self.view);
          make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(20)));
      });
  ```

## 六、第三方 DSL 对照

| Swift DSL | OC 侧 DSL | 说明 |
| --- | --- | --- |
| `SnapKit+DSL` | `Masonry/UIView+MasonryDSL` | 约束创建、更新、重建与添加到父视图。 |
| `BMPlayer+DSL` | `ZFPlayer/ZFPlayerController+DSL`、`ZFAVPlayerManager+DSL` | OC 工程使用 `ZFPlayer`，不硬引 Swift-only 的 `BMPlayer`。 |
| `GKNavigationBarSwift+DSL` | `GKNavigationBar/GKNavigationBarConfigure+DSL`、`GKGestureHandleConfigure+DSL` | 全局导航栏背景、标题、返回按钮、间距、状态栏、手势和转场参数配置。 |
| `YTKNetwork+DSL` | `YTKBaseRequest+DSL`、`YTKBatchRequest+DSL`、`YTKChainRequest+DSL` | 请求配置、成功失败回调、启动停止、批量和链式请求，并补齐 `jobs_requests` 等语义访问。 |
| `HXPhotoPicker+DSL` | `HXPhotoPickerObjC/HXPhotoView+DSL`、`HXPhotoManager+DSL`、`HXPhotoConfiguration+DSL` | 发帖图片 / 视频选择视图和配置对象链式化，调用方不再散落写 `manager.configuration.xxx = ...`。 |

- `YTKNetwork`、`GKNavigationBar`、`ZFPlayer`、`Texture` 这些第三方 DSL 所需 Block 类型统一从 `JobsBlock` 取；新增同类 DSL 时先补 `JobsBlock`，再在 `JobsOCDSL` 分类里使用。
- Swift 可以通过参数重载复用 `byBack(...)` 这类方法名；OC 侧不能只靠 Block 返回类型重载，所以图片别名使用 `byBack`，返回样式继续使用 `byBackStyle`，组合式配置使用 `byBackPreset`。

## 七、列表 Block 化

- `UITableView+DSL` 已补齐 `byTarget`、`byNumberOfSections`、`byNumberOfRowsInSection`、`cellForRowAt`、`didSelectRowAt`。
- `UICollectionView+DSL` 已补齐 `byTarget`、`byNumberOfSections`、`byNumberOfItemsInSection`、`cellForItemAt`、`didSelectItemAt`。
- 推荐写法仍然是先列表本层属性，再 `UIView` / `UIScrollView` 父层属性，最后 `byAddTo` 进父视图。

  ```objc
  _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
      tableView
          .byTarget(self)
          .byNumberOfRowsInSection(^NSInteger(id  _Nonnull target, UITableView * _Nonnull tv, NSInteger section) {
              return self.dataMutArr.count;
          })
          .cellForRowAt(^__kindof UITableViewCell * _Nonnull(id  _Nonnull target, UITableView * _Nonnull tv, NSIndexPath * _Nonnull indexPath) {
              return [tv dequeueReusableCellWithIdentifier:@"UITableViewCell"] ?: UITableViewCell.alloc.init;
          })
          .didSelectRowAt(^(id  _Nonnull target, UITableView * _Nonnull tv, NSIndexPath * _Nonnull indexPath) {
              [tv deselectRowAtIndexPath:indexPath animated:YES];
          })
          .addOn(self.view)
          .byAdd(^(MASConstraintMaker *make) {
              make.edges.equalTo(self.view);
          });
  });
  ```

## 八、文本视图 DSL

- `UITextField+DSL` 继续覆盖单行输入框的文本、占位符、左右视图、键盘和输入视图配置。
- `UITextView+DSL` 覆盖多行输入框的文本、富文本、颜色、字体、对齐、选区、编辑态、数据识别、键盘特征、输入视图和文本容器配置。
- `UITextView+DSL` 不再本地声明 `JobsRetTextView...` Block，统一复用 `JobsBlock` 暴露的 `UITextView` 返回类型。
- `UITextView` 继承自 `UIScrollView`，滚动、回弹、指示器和内容偏移这类父类能力仍然走 `UIScrollView+DSL`，不在 `UITextView+DSL` 里重复定义。
- 推荐链式顺序仍然是先 `UITextView` 本层属性，再接 `UIScrollView` / `UIView` / `Masonry` 父层装配能力。

  ```objc
  _textView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
      textView
          .byText(@"请输入内容")
          .byFont(UIFontSystemFontOfSize(15))
          .byTextCor(UIColor.darkTextColor)
          .byTextContainerInset(UIEdgeInsetsMake(8, 10, 8, 10))
          .byEditable(YES)
          .addOn(self.view)
          .byAdd(^(MASConstraintMaker *make) {
              make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 16, 0, 16));
              make.top.equalTo(self.view).offset(20);
              make.height.mas_equalTo(120);
          });
  });
  ```

## 九、背景配置 DSL

- `UIBackgroundConfiguration+DSL` 覆盖 iOS 14+ 背景配置的自定义视图、背景色、颜色转换器、毛玻璃效果、圆角、边距、描边和图片配置。
- Block 类型统一复用 `JobsBlock` 里已有的 `JobsRetBackgroundConfig...`，不在 `JobsOCDSL` 本地重复声明。
- 推荐先通过系统工厂方法创建配置，再继续链式设置，最后赋给 `UIButtonConfiguration`、`UICollectionViewCell` 或其它支持背景配置的对象。

  ```objc
  UIBackgroundConfiguration *backgroundConfig = UIBackgroundConfiguration.clearConfiguration
      .byBackgroundColor(JobsWhiteColor)
      .byCornerRadius(JobsWidth(8))
      .byStrokeColor(JobsClearColor)
      .byStrokeWidth(0);
  ```

## 十、按钮配置 DSL

- `UIButtonConfiguration+DSL` 覆盖按钮配置的背景、主副标题、图片、指示器与布局属性。
- 配合 `UIButton+UIButtonConfiguration` 新增的 `jobsUpdateButtonConfigurationBy`，可以在按钮链式调用中一次性修改配置对象，外层继续返回 `UIButton`。

  ```objc
  button.jobsUpdateButtonConfigurationBy(^(UIButtonConfiguration *config) {
      config
          .byBaseForegroundColor(JobsWhiteColor)
          .bySubtitleLineBreakMode(NSLineBreakByTruncatingTail)
          .byImagePlacement(NSDirectionalRectEdgeLeading)
          .byTitleLineBreakMode(NSLineBreakByTruncatingTail)
          .bySubtitle(@"subtitle");
  });
  ```

## 十一、SDWebImage 链式 DSL

- `3rd/SDWebImage+DSL` 统一承接 `UIButton+SDWebImage` 和 `UIImageView+SDWebImage` 的链式封装。
- 原来散落在 `JobsBaseUI`、`JobsByOCPods` 里的同名文件只保留兼容 import，不再保留 category 实现，避免 duplicate category 和实现重复。
- `UIButton` 支持 `imageURL(...)`、`placeholderImage(...)`、`options(...)`、`completed(...)`、`progress(...)` 以及普通图片 / 背景图片的状态加载入口。
- `UIImageView` 支持 `imageURL(...)`、`placeholderImage(...)`、`options(...)`、`completed(...)`、`load()`，Block 类型统一由 `JobsBlock+SDWebImage` 管理。

## 十二、风险说明

- `UIControl` 事件优先使用 `onJobsTap` / `onJobsChange` / `onJobsEvent`；需要解绑时使用 `offJobsEvent`。`byAddTarget` 仅作 Target-Action 兼容入口保留，不作为调用方新增写法。
- 不把非 DSL 辅助文件迁入本 Pod；如果某个旧 `+DSL` 文件混入了业务辅助能力，需要先拆干净再迁入。
- 修改 `Core`、podspec 或依赖后，需要重新执行 `pod install --no-repo-update` 并检查依赖报告。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
