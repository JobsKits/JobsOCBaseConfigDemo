# `JobsMakes`

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

> 这份自述用于记录 `JobsMakes` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsMakes is a local Objective-C library providing make-style helpers, UIKit/Foundation categories, and common model base classes for Jobs projects.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsMakes` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Utility makers, categories and model helpers for Jobs projects. |
| 首页 | [https://example.local/JobsMakes](https://example.local/JobsMakes) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsMakes@Pods/JobsMakes.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsMakes` 相关能力。
- 承担 `jobsMakeXXX` 这一层“创建对象 + 提供 Block 入口”的职责，不在 `JobsMake` 本身堆业务配置。
- 对齐 Swift 侧 UI 创建模型：`JobsMake` 负责创建，`JobsOCDSL` / `JobsModelDSL` 负责链式赋值，`byAddTo` 负责进父视图并收口 [**Masonry**](https://github.com/SnapKit/Masonry) 约束。
- 当 `JobsMakes` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、UI 创建公约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 常用 UI 创建统一优先走本 Pod 当前真实导出的 `jobsMakeView`、`jobsMakeLabel`、`jobsMakeImageView`、`jobsMakeTextView`、`jobsMakeTextField`、`jobsMakeCollectionView`、`jobsMakeScrollView`、`jobsMakeSlider`、`jobsMakeSwitch`、`jobsMakeStackView`、`jobsMakeProgressView`、`jobsMakeSegmentedControl`、`jobsMakeContextualAction`、`jobsMakeSwipeActionsConfiguration`、`jobsMakeNavigationBarAppearance`、`jobsMakeTabBarAppearance` 等工厂。
- 菜单与系统条目创建分别使用 `jobsMakeAction`、`jobsMakeMenu` / `jobsMakeMenuByConfiguration`、`jobsMakeContextMenuConfiguration`、`jobsMakeNib`、`jobsMakeBarButtonItemByTitle`、`jobsMakeBarButtonItemByImage`、`jobsMakeBarButtonItemBySystemItem`；空图片走 `jobsMakeImage(config Block)`。
- 空贝塞尔路径统一使用 `jobsMakeBezierPath(nil)`；该工厂的配置 Block 允许为空，不再另增与它同义的空路径入口。
- `UIBarButtonItem.initBy(view)` 已承接 customView 创建，`UINavigationController.initBy(viewController)` 已承接 root controller 创建，本 Pod 不重复铺设同义工厂。
- `jobsMakeButton` 与 `jobsMakeTableViewByPlain/Grouped/InsetGrouped` 当前归属 `JobsByOCPods`，不属于 `JobsMakes`；调用方应按真实聚合头和 Pod 依赖使用，不能只因同为 `jobsMake` 命名就误判归属。
- `jobsMakeOCKeyboardConfig` 归属 `JobsOCKeyboardMgr/Core/JobsOCKeyboardConfig`；`JobsMakes` 不反向依赖键盘业务 Pod，避免与 `JobsOCDSL` 形成循环。
- Block 内部先写当前类 DSL，再写父类 DSL；`byAddTo` 放在靠后位置，保证“先加父视图，再布约束”。
- 如果样式依赖真实 `frame`，例如圆角路径、渐变层、阴影路径、动画起点，放到 `byAddTo + layoutIfNeeded` 之后执行。

- Foundation 无参对象同样使用创建 Block，例如：

  ```objc
  NSDateFormatter *formatter = jobsMakeDateFormatter(^(NSDateFormatter *dateFormatter) {
      dateFormatter
          .byLocale([NSLocale localeWithLocaleIdentifier:@"zh_Hans_CN"])
          .byDateFormat(@"HH:mm:ss.SSS");
  });
  ```

  带参初始化不塞进通用工厂，而是由真实系统类型提供 `initByXxx(arguments)` 类级 Block DSL。

  ```objc
  _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
      label
          .byText(@"标题")
          .byFont(UIFontWeightBoldSize(16))
          .byTextAlignment(NSTextAlignmentCenter)
          .byNumberOfLines(1)
          .byBgColor(UIColor.clearColor)
          .addOn(self.contentView)
          .byAdd(^(MASConstraintMaker *make) {
              make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(8, 12, 8, 12));
          });
  });
  ```

## 四、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsMakes@Pods/
├── JobsMakes.podspec  # Pod 描述文件
├── README.md  # 当前自述
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，3 个文件
├── Support/  # 内部支撑层，4 个文件
└── LICENSE  # 许可证文件
```

- `JobsMakes.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 五、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 3 个文件，其中源码 / 头文件 3 个；按 Jobs 规范，它是 `JobsMakes` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 4 个文件，其中源码 / 头文件 4 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Support/UIKit/NSString/NSString+Sys` 提供当前 Pod 内部使用的 `byTrimmingCharactersInSet` 字符串裁剪 DSL，不回引 `JobsByOCPods`。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。
- `JobsMakes.h` 提供 `jobsMakeMutData`、`jobsMakeMutSet`、`jobsMakeMutIndexSet`、`jobsMakeMutArr`、`jobsMakeMutDic`、`jobsMakeMutString` 等常用可变容器创建入口。

## 六、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

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
- `QuartzCore`
- `CoreGraphics`
- `JavaScriptCore`
- `MessageUI`
- `AVFoundation`
- `UserNotifications`
- `MapKit`
- `WebKit`
- `Photos`
- `NetworkExtension`

### 5.5、Pod 依赖

- `Texture`
- `MJExtension`
- `JobsBlock`
- `JobsOCDefs`
- `JobsStringUtils`

## 七、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- 如果 `JobsMakes.h` 不是最终公开入口，请先修正 `JobsMakes.podspec` 的 `public_header_files` 和入口头设计，再修改调用方。

## 八、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 0 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- podspec 未显式声明 `resources`，如新增图片、xib、bundle、json、plist 等资源，需要同步补齐。

## 九、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsMakes` 后，优先按风险从低到高验证：

```shell
ruby -c JobsMakes.podspec
```

```shell
pod lib lint JobsMakes.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 十、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
