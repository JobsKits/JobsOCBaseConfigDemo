# `JobsOCSearcher`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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
├── Core/                 # 公开 API 与核心实现
│   ├── JobsOCSearcherConfig/
│   └── JobsOCSearcherView/
└── Support/              # 内部 Cell 支撑层
    └── JobsOCSearcherRecordCell/
```

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 暴露 `JobsOCSearcherConfig` 和 `JobsOCSearcherView`，是业务侧可直接使用的 API。
- `Support` 只放历史搜索 Cell，推荐词的彩色标签排布由 `JobsOCSearcherView` 内部完成。
- `JobsOCSearcher.h` 是统一聚合入口，调用方不直接引用 `Support` 内部头。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsOCSearcher.h`
- `Core/**/*.h`

### 5.2、源码入口

- `JobsOCSearcher.h`
- `Core/**/*.{h,m,mm}`
- `Support/**/*.{h,m,mm}`

### 5.3、系统框架

- `Foundation`
- `UIKit`

### 5.4、Pod 依赖

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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
