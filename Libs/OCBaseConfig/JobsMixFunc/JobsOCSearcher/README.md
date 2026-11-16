# JobsOCSearcher

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <span id="前言">前言</span>

本能力源码直接集成于主工程管理。

## 一、<span id="searcher-host-boundaries">统一搜索组件与宿主边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

首页搜索与组件 Demo 都实际创建 `JobsOCSearcherView`，共享输入、文字取消、推荐词、历史去重／容量／删除／清空、历史与结果切换及完整空态。首页保留原历史存储键，空关键词只展示历史，清空关键词回历史；组件 Demo 保留八个推荐词并用本地技术词表展示真实匹配结果与释义，选择结果会记录当前关键词。

`JobsOCSearcherConfig` 注入全局设置对应的文案和语义配色，组件不保存独立语言或主题偏好；`reloadWithConfig` 保留当前关键词、输入焦点和历史。`historyScope` 用于账号隔离，`persistsHistory=NO` 用于当前组件的内存历史，容量限制为 1–1000（默认 20）。推荐／历史选择只填入并回调，确认搜索才自动记录；宿主点结果可主动 `saveHistoryByText`。

宿主通过 `byResultContentView(view)` 注入结果区域，监听一次有效关键词变更后过滤数据，再以 `byResultCount(匹配项总数)` 更新空态；组件不依赖首页分组、Demo 路由、抽屉或调试浮层。首页继续保存并恢复原滚动／展开／浮控显隐／抽屉手势，搜索期间收键盘、主题或语言刷新及前后台切换不退出搜索。旧 `JobsOCSearcherBar` 作为 input-only 兼容门面复用同一输入管线，并保留真实 `ZYTextField` 协议类型。

## 二、<span id="unified-search-flow">统一输入、历史与结果区域</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

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

验证：新工程同源组件的 `Stability` test_spec 覆盖历史隔离、容量、输入回调、结果状态、同 Config 切语言、原生文本与绘制区域；旧工程沿用主 target 直接编译源码，另独立运行首页、组件 Demo 与三个输入条，证据按两工程分别归档。

UI 文案字段接受本地化原始 key 或已翻译文本；默认配置保留原 key，View / RecordCell 渲染时读取全局语言。宿主重载同一 Config 能更新默认文案，同时保留关键词与历史；原生输入的主题 trait 只在当前搜索宿主桥接。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
