# `JobsOCSearcher`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、Pod 定位](#jobs-toc-heading-2)
- [二、适用场景](#jobs-toc-heading-3)
- [三、目录结构](#jobs-toc-heading-4)
- [四、Core / Support 边界](#jobs-toc-heading-5)
- [五、公开能力与依赖](#jobs-toc-heading-6)
  - [5.1、公开头文件](#jobs-toc-heading-7)
  - [5.2、源码入口](#jobs-toc-heading-8)
  - [5.3、系统框架](#jobs-toc-heading-9)
  - [5.4、Pod 依赖](#jobs-toc-heading-10)
- [六、引用方式](#jobs-toc-heading-11)
- [七、资源说明](#jobs-toc-heading-12)
- [八、验证方式](#jobs-toc-heading-13)
- [九、风险说明](#jobs-toc-heading-14)
- [十、明暗主题契约](#jobs-toc-heading-15)
- [十一、架构脉络与关键设计](#jobs-toc-heading-16)
  - [11.1、设计目的与职责划分](#jobs-toc-heading-17)
  - [11.2、运行脉络](#jobs-toc-heading-18)
  - [11.3、关键设计与边界](#jobs-toc-heading-19)
  - [11.4、阅读与重建顺序](#jobs-toc-heading-20)
- [十二、目录计数与安装边界](#jobs-toc-heading-21)
- [十三、本轮单元验证](#jobs-toc-heading-22)
- [十四、统一输入、历史与结果区域](#unified-search-flow)

</details>
<!-- jobs-toc:end -->

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> 这份自述用于记录 `JobsOCSearcher` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

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

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 需要在业务页内嵌一个轻量搜索组件：包含输入框、搜索推荐、搜索历史记录。
- 搜索框初始就是普通输入框，激活后右侧出现 `搜索` 按钮；输入内容为空时按钮不可用。
- `搜索` 按钮按正常、高亮、禁用状态使用圆角背景，不以裸文字形式展示。
- 搜索推荐由 `JobsOCSearcherView.byRecommendSearches(...)` 链式配置，业务侧只需要传入字符串数组；传 `nil` 或空数组时不展示推荐模块。
- 推荐词使用彩色矩形标签多行排布，文字固定为白色，标签背景不使用透明色或白色。
- 历史搜索使用 `NSUserDefaults` 按 `historyStorageKey` 持久化，只有键盘搜索确认会自动写入历史，支持单条删除、全部清空和最大条数限制。
- 点击推荐词或历史词后，只负责填入输入框并通过 `itemSelectedBlock` 回调给业务侧，不自动写入历史。规范化关键词实际变化时只发送一次 `searchTextDidChangeBlock`，同值确认不重复发送输入事件。
- `placeholder`、`recommendTitle`、`historyTitle` 为空时分别回退为全局语言对应的 `请输入搜索内容`、`搜索推荐`、`搜索历史`；使用自定义 Config 时仍保留这些默认文案。
- 使用 `searchView.clearHistory()` 清空历史，随后刷新列表并触发 `clearHistoryBlock`。该入口返回无参 Block，属于终止动作；新旧 OC 工程使用同一公开调用方式。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

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
├── Tests/JobsOCSearcherStabilityTests/  # XCTest 行为验证
├── Support/  # 内部支援，2 个文件
    └── JobsOCSearcherRecordCell/
└── Resource/  # 非代码资源，1 个文件
```

## <span id="jobs-toc-heading-5" data-jobs-toc="v2">四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `Core` 暴露 `JobsOCSearcherConfig` 和 `JobsOCSearcherView`，是业务侧可直接使用的 API。
- `Support` 只放历史搜索 Cell，推荐词的彩色标签排布由 `JobsOCSearcherView` 内部完成。
- `JobsOCSearcher.h` 是统一聚合入口，调用方不直接引用 `Support` 内部头。

## <span id="jobs-toc-heading-6" data-jobs-toc="v2">五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

### <span id="jobs-toc-heading-7" data-jobs-toc="v2">5.1、公开头文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `JobsOCSearcher.h`
- `Core/**/*.h`

### <span id="jobs-toc-heading-8" data-jobs-toc="v2">5.2、源码入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `JobsOCSearcher.h`
- `Core/**/*.{h,m,mm}`
- `Support/**/*.{h,m,mm}`

### <span id="jobs-toc-heading-9" data-jobs-toc="v2">5.3、系统框架 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `Foundation`
- `UIKit`

### <span id="jobs-toc-heading-10" data-jobs-toc="v2">5.4、Pod 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `Masonry`（组件布局和动态约束更新）
- `JobsBlock`
- `JobsBaseUI`（`jobsMakeButton`、`jobsResetBtn*` 与 `jobsMakeTableViewBy*`）
- `JobsMakes`
- `JobsLanMgr`（读取宿主全局语言；不提供组件内语言开关）
- `JobsOCDSL`
- `JobsOCDefs`

## <span id="jobs-toc-heading-11" data-jobs-toc="v2">六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

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
JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig()
    .byItemSelectedBlock(^(NSString * _Nullable text) {
        NSLog(@"select = %@", text);
    });
JobsOCSearcherView *searchView = [JobsOCSearcherView.alloc initWithConfig:config];
searchView.byRecommendSearches(@[@"JobsBaseUI", @"JobsOCDSL", @"JobsOCSearcher"]);
// 业务需要清空时调用，并由组件分发 clearHistoryBlock。
searchView.clearHistory();
```

## <span id="jobs-toc-heading-12" data-jobs-toc="v2">七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 当前 Pod 不依赖图片、字体、音视频、`xib`、`storyboard` 或 `xcassets` 资源。
- 清空历史按钮的垃圾桶图标由代码绘制，不额外引入图片资源。
- 如果后续需要更多图标，优先按 Jobs 规则从 [**iconfont**](https://www.iconfont.cn/) 或项目已有素材库接入，并同步更新 podspec 资源声明。

## <span id="jobs-toc-heading-13" data-jobs-toc="v2">八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

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

## <span id="jobs-toc-heading-14" data-jobs-toc="v2">九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 历史记录默认写入 `NSUserDefaults`，如果多个业务场景共用组件，应配置不同 `historyStorageKey`，避免历史数据串场。
- `Support` 头文件只服务当前 Pod 内部实现，不应在 App 层或其它 Pod 中直接引用。
- 按钮点按使用 `onClickBy`，输入框编辑事件使用 `onJobsEvent`；调用方不新增 `byAddTarget`。`UIButton` 专用的 `onClickBy` 必须排在 `UIControl` / `UIView` 父类 DSL 之前，避免链条返回类型降级后丢失按钮专用 API。
- 组件的搜索框、推荐区、历史标题和 Cell 约束统一使用 `Masonry`，不直接创建系统 `NSLayoutConstraint`。
- 组件内部只负责展示和记录搜索词，真正搜索结果、网络请求、页面跳转由业务侧通过回调自行处理。

## <span id="jobs-toc-heading-15" data-jobs-toc="v2">十、明暗主题契约 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## <span id="jobs-toc-heading-16" data-jobs-toc="v2">十一、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### <span id="jobs-toc-heading-17" data-jobs-toc="v2">11.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

把搜索输入、推荐词和本地历史集中到一个可配置视图。Config 决定文案、历史存储键、容量和回调，View 负责显示与交互，实际搜索请求留给宿主。

### <span id="jobs-toc-heading-18" data-jobs-toc="v2">11.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

输入或点选词条 → 分发文本变化/确认事件 → 按规则更新历史 → 宿主执行搜索 → 可删除单项或清空历史。

### <span id="jobs-toc-heading-19" data-jobs-toc="v2">11.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 文本变化、确认搜索和点击词条是不同回调，避免同时触发重复请求。
- historyStorageKey 决定历史隔离范围，maxHistoryCount 决定展示/保存容量。
- 取消时是否收键盘可配置，删除历史与清空历史也有独立事件。

### <span id="jobs-toc-heading-20" data-jobs-toc="v2">11.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

先看 Config 的事件与存储策略，再看 View 的输入、历史更新和重载路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCSearcher.h](<./JobsOCSearcher.h>)
- [Core/JobsOCSearcherConfig/JobsOCSearcherConfig.h](<./Core/JobsOCSearcherConfig/JobsOCSearcherConfig.h>)
- [Core/JobsOCSearcherView/JobsOCSearcherView.h](<./Core/JobsOCSearcherView/JobsOCSearcherView.h>)

依赖与编译入口：[JobsOCSearcher.podspec](<./JobsOCSearcher.podspec>)。其中根级依赖声明包括 `Masonry`、`JobsBlock`、`JobsBaseUI`、`JobsMakes`、`JobsOCDSL`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## <span id="jobs-toc-heading-21" data-jobs-toc="v2">十二、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 4 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/` | 2 | 2 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/` | 1 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

根级私有头模式：`Support/**/*.h`；相应实现照常编译，头文件不从公共聚合入口消费。

根级命名资源 bundle：`JobsOCSearcherPrivacy.bundle`；已有运行资源保持各自 bundle 查找合同。

隐私声明入口：[Resource/PrivacyInfo.xcprivacy](<./Resource/PrivacyInfo.xcprivacy>)，通过 `JobsOCSearcherPrivacy.bundle` 安装。声明类别与理由按该文件记录：

| API 类别 | 理由标识 | 当前代码用途 |
| --- | --- | --- | --- |
| `NSPrivacyAccessedAPICategoryUserDefaults` | `CA92.1` | 本应用本地偏好或状态的读取与保存 |

理由使用合同：`CA92.1`：仅供本 App 访问自身偏好。范围依据 [Apple 理由定义](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitypereasons)。

该文件记录当前 Pod 使用的 API 类别；宿主仍需按自身实际调用和数据行为维护自己的声明。最终产物是否包含该命名 bundle，随独立 Pod 与主工程资源验收一起核对。

## <span id="jobs-toc-heading-22" data-jobs-toc="v2">十三、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

既有 Debug / Release 单 Pod 构建记录见根 [JobsByPods升级实施与编译验证.md](<../../项目相关报告/JobsByPods升级实施与编译验证.md>)。本轮新增 `Stability` 行为测试；生产源码、测试源码、资源与工程配置指纹一致且命令真实退出成功，才可复用对应验证记录。

本组件的输入、历史及结果状态由 `Stability` 测试覆盖；首页、组件 Demo 和旧输入条的实际布局与交互另由宿主验收。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsOCSearcher
```

本轮新增 `Stability` test_spec，覆盖历史隔离、输入回调和结果状态；单独编译不能等同于行为测试通过，测试执行结果与宿主交互分别记录。

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。


## 十四、<span id="unified-search-flow">统一输入、历史与结果区域</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本组件由首页与独立 Demo 共同消费，完整流程和宿主边界如下。现有公开 API 继续可用。

| 配置／入口 | 行为 |
| --- | --- |
| `showsCancelButton`／`cancelBlock` | 默认隐藏取消按钮；启用后为自适应语言宽度的文字取消。清空关键词后回调宿主；是否收键盘沿用 `dismissKeyboardWhenCancel`。 |
| `showsSearchButton` | 默认 `YES`，输入激活后展示提交按钮；首页设为 `NO`，保留键盘 Search 提交。 |
| `historyStorageKey`／`historyDefaults` | 默认使用标准 UserDefaults；首页显式沿用既有历史键。测试或多租户宿主可注入独立 Defaults。 |
| `historyScope`／`persistsHistory` | 非空 scope 在存储键后追加 `.account.` 与 UTF-8 Base64 后缀；默认持久化，`NO` 时按键／scope 保存在当前组件内存，不写磁盘。变更同一 Config 后可 reload，不向旧账号写入或清空。 |
| `maxHistoryCount` | 默认 20，归一到 1–1000；去空白、去重、最近优先。 |
| `byResultContentView(view)` | 注入宿主拥有的结果视图。空关键词展示可选推荐与历史／空历史；非空只展示结果或无结果空态。传 nil 可解除结果归属。 |
| `byQuery(text, recordHistory)` | 统一程序化填词／清空；只有规范化关键词真实变化才回调一次输入事件。默认由调用方显式传 `NO`，确认或结果选择再记录。 |
| `byResultCount(count)` | 传匹配 item 总数，不能传分组数；只刷新结果／空态，不触发查询回调。 |
| `focus()`／`dismissKeyboard()` | 仅控制输入焦点，不取消搜索，不清历史。结果模式点击空白同样仅收键盘。 |
| `reloadWithConfig(config)` | 刷新文案、语义色、历史上下文，保留 query 和当前输入框／焦点；不重复发查询事件。 |
| `inputOnly`／`initWithConfig:textField:` | 旧输入条兼容：可注入真实 UITextField 子类，组件统一拥有其 delegate／输入事件；不展示历史与结果。 |

```objc
@jobs_weakify(self)
JobsOCSearcherConfig *config = JobsOCSearcherConfig.defaultConfig()
    .byShowsCancelButton(YES)
    .byShowsSearchButton(NO)
    .byHistoryStorageKey(@"Feature.SearchHistory")
    .byHistoryScope(accountID)
    .byPersistsHistory(YES)
    .byMaxHistoryCount(20)
    .bySearchTextDidChangeBlock(^(NSString *query) {
        // 宿主过滤真实数据并刷新自己的结果视图，再传匹配项总数。
        @jobs_strongify(self)
        self.searchView.byResultCount(matchingItems.count);
    })
    .byCancelBlock(^{
        // 宿主退出独占搜索并恢复原页面状态。
    });
_searchView = [JobsOCSearcherView.alloc initWithConfig:config]
    .byResultContentView(self.resultsView)
    .byRecommendSearches(@[@"UIKit", @"Swift"])
    .addOn(container)
    .byAdd(^(MASConstraintMaker *make) {
        make.edges.equalTo(container);
    });
```

配置中的 `placeholder`、取消／清空／删除、空历史／无结果等文案，以及 page／input／text／secondary／accent 语义色均可由宿主注入。默认文案读取全局 `JobsLanMgr`，默认颜色跟随现有主题语义；本模块不增加语言／主题按钮。仅搜索字段使用零高 inputAccessoryView，不修改全局 IQ 配置。宿主可刷新本地化 Config，不重建输入框或用户草稿。推荐词标签、历史删除与空态点击均使用原生可交互控件。

底层不包含 Demo 模型、匹配算法、路由、首页浮层或抽屉依赖。独立 Demo 的本地词表是明确的离线教学数据；替换成服务端结果时，宿主负责请求和本地演示回退，仍沿用同一个结果区域接口。

验证：`JobsOCSearcherStabilityTests` 中 `testSearcherHistoryIsolationAndLegacyStorage`、`testSearcherQueryCallbacksAndResultsAreIndependent` 、`testSearcherConfigRefreshPreservesQueryAndCustomField` 、`testSearcherUsesNativeAttributedTextForRendering` 、`testSearcherSameConfigReloadsCurrentLanguage` 和 `testSearcherLaysOutVisibleNativeInput` 覆盖原历史键兼容、scope／memory 隔离、容量、回调去重、结果计数、重配输入保持及原生文本绘制合同；首页与独立 Demo 另做实际交互验证，记录以当轮验收产物为准。

UI 文案字段接受本地化原始 key，也兼容已翻译的自定义文本。`defaultConfig` 保留原始 key，View / RecordCell 在渲染时读取当前全局语言；复用同一个 Config 调用 `reloadWithConfig` 不会固定在创建时的语言。宿主仅为 Searcher 视图桥接全局有效主题的原生 trait，避免输入框圆叉与键盘跟主题脱节；不改全局 UIKit / IQ 配置。

同 Config 的跨语言用例要求测试宿主提供真实 `en` / `zh-Hans` 词表；不带这些表的纯组件测试宿主会明确跳过该用例。本轮集成验收使用临时生成的测试宿主，拷入最终 App 的原表并验证哈希，未给生产组件增加测试资源依赖。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
