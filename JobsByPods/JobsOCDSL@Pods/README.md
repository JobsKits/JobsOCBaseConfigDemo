# `JobsOCDSL`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

`JobsOCDSL` 用来集中管理 Objective-C 项目里的点语法 DSL 分类，只放 `+DSL` 分类本身，不承接按钮辅助、布局工具、业务 UI 或其它非 DSL 支撑文件。本版本开始同时承接“属性 DSL”和“方法型 DSL”：凡是适合链式表达的单参数 / 无参数实例方法，也可以包装成 `byXxx(...)`。

## 一、适用场景

- 对系统类或少量第三方 UI 类的方法做链式封装，例如 `UIView`、`UITableView`、`UITextField`、`UITextView`、`UIBackgroundConfiguration`、`UIControl`、`ASButtonNode`。
- 系统类 DSL 以“当前类本层级”为边界，只封装当前类自己声明的属性、无参数方法和单参数方法；父类能力留在父类 DSL，子类特有能力留在子类 DSL。
- OC 侧 DSL 统一依赖 `JobsBlock` 提供 Block typedef，避免每个 Pod 自己散落定义。
- 原本散在其它本地 Pod 里的纯 DSL 分类逐步迁移到这里，调用方通过 `JobsOCDSL` 暴露。
- 对照 Swift 侧 `JobsSwiftDSL` 的 [**SnapKit**](https://github.com/SnapKit/SnapKit) 链式封装，OC 侧通过 [**Masonry**](https://github.com/SnapKit/Masonry) 补齐 `byAddTo`、`byMakeConstraints`、`byUpdateConstraints`、`byRemake`。
- 对照 Swift 侧 `BMPlayer+DSL`、`GKNavigationBarSwift+DSL`、`YTKNetwork+DSL`，OC 侧分别补齐当前工程实际使用的 `ZFPlayer`、`GKNavigationBar`、`YTKNetwork` 链式入口；其中 `GKNavigationBar` 的手势配置在 OC 版里属于 `GKGestureHandleConfigure`。

## 二、目录结构

```text
JobsOCDSL@Pods/
├── Core/
│   ├── UIKit/
│   │   ├── UILabel+DSL/
│   │   ├── UITextField+DSL/
│   │   ├── UITextView+DSL/
│   │   ├── UITableView+DSL/
│   │   ├── UITableViewCell+DSL/
│   │   ├── UICollectionView+DSL/
│   │   ├── UIScrollView+DSL/
│   │   ├── UIView+DSL/
│   │   ├── UIControl+DSL/
│   │   ├── UIProgressView+DSL/
│   │   ├── UIBarButtonItem+DSL/
│   │   ├── UIImpactFeedbackGenerator+DSL/
│   │   ├── UIBackgroundConfiguration+DSL/
│   │   ├── UIBezierPath+DSL/
│   │   └── NSMutableParagraphStyle+DSL/
│   ├── QuartzCore/
│   │   └── CALayer+DSL/
│   └── 3rd/
│       ├── FSCalendar+DSL/
│       ├── GKNavigationBar/
│       │   ├── GKGestureHandleConfigure/
│       │   └── GKNavigationBarConfigure/
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

- `UIBezierPath+DSL` 已把 `moveToPoint:`、`addLineToPoint:`、`appendPath:`、`applyTransform:`、`containsPoint:` 以及常用工厂方法改成链式入口。
- `CALayer+DSL` 除属性包装外，补齐 `addSublayer:`、`removeAnimationForKey:`、`drawInContext:`、`renderInContext:`、`containsPoint:` 等方法型 DSL。
- `UIView+DSL` 补齐 `addSubview:`、`bringSubviewToFront:`、`sendSubviewToBack:`、`addGestureRecognizer:`、`removeGestureRecognizer:`、`addInteraction:`、`removeInteraction:`、`setNeedsDisplayInRect:`、`removeFromSuperview`、`layoutIfNeeded`、`sizeToFit` 等链式入口。
- `UIBarButtonItem+DSL`、`UITableViewCell+DSL`、`UIImpactFeedbackGenerator+DSL` 覆盖各自当前类本层属性和 0 / 1 参数方法，不复制 `UIBarItem`、`UIView`、`UIFeedbackGenerator` 的父类能力。
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

- `JobsBlock`：集中提供 OC Block 类型别名。
- `JobsOCDefs`：提供基础宏、枚举和颜色等定义。
- `JobsOCProtocols`：提供 DSL 协议边界。
- `GKNavigationBar`：服务 OC 侧导航栏全局配置 DSL。
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
      .byFont([UIFont systemFontOfSize:16])
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
          .byFont([UIFont systemFontOfSize:15])
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

- 不把非 DSL 辅助文件迁入本 Pod；如果某个旧 `+DSL` 文件混入了业务辅助能力，需要先拆干净再迁入。
- 修改 `Core`、podspec 或依赖后，需要重新执行 `pod install --no-repo-update` 并检查依赖报告。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
