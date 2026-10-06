# `JobsOCSearcher`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font>

> 这份自述用于记录 `JobsOCSearcher` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCSearcher` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Search view component for Jobs Objective-C projects. |
| 首页 | [https://example.local/JobsOCSearcher](https://example.local/JobsOCSearcher) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsOCSearcher@Pods/JobsOCSearcher.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 需要在业务页内嵌一个轻量搜索组件：包含输入框、搜索推荐、搜索历史记录。
- 搜索框初始就是普通输入框，激活后右侧出现 `搜索` 按钮；输入内容为空时按钮不可用。
- `搜索` 按钮按正常、高亮、禁用状态使用圆角背景，不以裸文字形式展示。
- 搜索推荐由 `JobsOCSearcherView.byRecommendSearches(...)` 链式配置，业务侧只需要传入字符串数组；传 `nil` 或空数组时不展示推荐模块。
- 推荐词使用彩色矩形标签多行排布，文字固定为白色，标签背景不使用透明色或白色。
- 历史搜索使用 `NSUserDefaults` 按 `historyStorageKey` 持久化，只有键盘搜索确认会自动写入历史，支持单条删除、全部清空和最大条数限制。
- 点击推荐词或历史词后，只负责填入输入框并通过 `itemSelectedBlock` 回调给业务侧，不自动写入历史。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCSearcher@Pods/
├── JobsOCSearcher.podspec  # Pod 描述文件
├── JobsOCSearcher.h        # 根聚合头文件
├── README.md             # 当前自述
├── JobsPodspecKit.rb     # 本地 podspec 基座
├── LICENSE               # 许可证文件
├── Core/  # 公开入口与核心实现，4 个文件
│   ├── JobsOCSearcherConfig/
│   └── JobsOCSearcherView/
├── Support/  # 内部支援，2 个文件
    └── JobsOCSearcherRecordCell/
└── Resource/  # 非代码资源，1 个文件
```

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 暴露 `JobsOCSearcherConfig` 和 `JobsOCSearcherView`，是业务侧可直接使用的 API。
- `Support` 只放历史搜索 Cell，推荐词的彩色标签排布由 `JobsOCSearcherView` 内部完成。
- `JobsOCSearcher.h` 是统一聚合入口，调用方不直接引用 `Support` 内部头。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCSearcher.h`
- `Core/**/*.h`

### 5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCSearcher.h`
- `Core/**/*.{h,m,mm}`
- `Support/**/*.{h,m,mm}`

### 5.3、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Foundation`
- `UIKit`

### 5.4、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Masonry`（组件布局和动态约束更新）
- `JobsBlock`
- `JobsBaseUI`（`jobsMakeButton`、`jobsResetBtn*` 与 `jobsMakeTableViewBy*`）
- `JobsMakes`
- `JobsOCDSL`
- `JobsOCDefs`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用：

```objc
#if __has_include(<JobsOCSearcher/JobsOCSearcher.h>)
#import <JobsOCSearcher/JobsOCSearcher.h>
#else
#import "JobsOCSearcher.h"
#endif
```

示例配置：

```objc
JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig;
config.itemSelectedBlock = ^(NSString * _Nullable text) {
    NSLog(@"select = %@", text);
};
JobsOCSearcherView *searchView = [JobsOCSearcherView.alloc initWithConfig:config];
searchView.byRecommendSearches(@[@"JobsBaseUI", @"JobsOCDSL", @"JobsOCSearcher"]);
```

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前 Pod 不依赖图片、字体、音视频、`xib`、`storyboard` 或 `xcassets` 资源。
- 清空历史按钮的垃圾桶图标由代码绘制，不额外引入图片资源。
- 如果后续需要更多图标，优先按 Jobs 规则从 [**iconfont**](https://www.iconfont.cn/) 或项目已有素材库接入，并同步更新 podspec 资源声明。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsOCSearcher` 后，优先按风险从低到高验证：

```shell
ruby -c JobsOCSearcher.podspec
```

```shell
pod lib lint JobsOCSearcher.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 历史记录默认写入 `NSUserDefaults`，如果多个业务场景共用组件，应配置不同 `historyStorageKey`，避免历史数据串场。
- `Support` 头文件只服务当前 Pod 内部实现，不应在 App 层或其它 Pod 中直接引用。
- 按钮点按使用 `onClickBy`，输入框编辑事件使用 `onJobsEvent`；调用方不新增 `byAddTarget`。`UIButton` 专用的 `onClickBy` 必须排在 `UIControl` / `UIView` 父类 DSL 之前，避免链条返回类型降级后丢失按钮专用 API。
- 组件的搜索框、推荐区、历史标题和 Cell 约束统一使用 `Masonry`，不直接创建系统 `NSLayoutConstraint`。
- 组件内部只负责展示和记录搜索词，真正搜索结果、网络请求、页面跳转由业务侧通过回调自行处理。

## 十、明暗主题契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 十一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 11.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

把搜索输入、推荐词和本地历史集中到一个可配置视图。Config 决定文案、历史存储键、容量和回调，View 负责显示与交互，实际搜索请求留给宿主。

### 11.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

输入或点选词条 → 分发文本变化/确认事件 → 按规则更新历史 → 宿主执行搜索 → 可删除单项或清空历史。

### 11.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 文本变化、确认搜索和点击词条是不同回调，避免同时触发重复请求。
- historyStorageKey 决定历史隔离范围，maxHistoryCount 决定展示/保存容量。
- 取消时是否收键盘可配置，删除历史与清空历史也有独立事件。

### 11.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 Config 的事件与存储策略，再看 View 的输入、历史更新和重载路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCSearcher.h](<./JobsOCSearcher.h>)
- [Core/JobsOCSearcherConfig/JobsOCSearcherConfig.h](<./Core/JobsOCSearcherConfig/JobsOCSearcherConfig.h>)
- [Core/JobsOCSearcherView/JobsOCSearcherView.h](<./Core/JobsOCSearcherView/JobsOCSearcherView.h>)

依赖与编译入口：[JobsOCSearcher.podspec](<./JobsOCSearcher.podspec>)。其中根级依赖声明包括 `Masonry`、`JobsBlock`、`JobsBaseUI`、`JobsMakes`、`JobsOCDSL`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 十二、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 4 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 2 | 2 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 1 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/`（无目录） | 0 | 0 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级私有头模式：`Support/**/*.h`；相应实现照常编译，头文件不从公共聚合入口消费。

根级命名资源 bundle：`JobsOCSearcherPrivacy.bundle`；已有运行资源保持各自 bundle 查找合同。

隐私声明入口：[Resource/PrivacyInfo.xcprivacy](<./Resource/PrivacyInfo.xcprivacy>)，通过 `JobsOCSearcherPrivacy.bundle` 安装。声明类别与理由按该文件记录：

| API 类别 | 理由标识 | 当前代码用途 |
| --- | --- | --- | --- |
| `NSPrivacyAccessedAPICategoryUserDefaults` | `CA92.1` | 本应用本地偏好或状态的读取与保存 |

理由使用合同：`CA92.1`：仅供本 App 访问自身偏好。范围依据 [Apple 理由定义](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitypereasons)。

该文件记录当前 Pod 使用的 API 类别；宿主仍需按自身实际调用和数据行为维护自己的声明。最终产物是否包含该命名 bundle，随独立 Pod 与主工程资源验收一起核对。

## 十三、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译已完成；本 Pod 无独立 Stability 回归；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

该 Pod 维持既有内核，纳入统一逐 Pod 和主工程编译；没有以新增代码数量作为升级验收依据。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCSearcher
```

当前没有 `Stability` test_spec；单独 Pod 的编译覆盖不能等同于行为测试通过，集成场景由宿主验收。

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
