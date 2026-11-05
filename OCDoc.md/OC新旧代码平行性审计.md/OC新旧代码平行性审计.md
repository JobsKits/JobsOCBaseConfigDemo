# OC 新旧代码平行性审计

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、扫描口径与允许差异](#scope)
- [二、已完成的源码与 API 对齐](#repairs)
- [三、成对源码目录与工程归属](#layout)
- [四、全量静态对账与待复查候选](#inventory)
- [五、已执行验证与构建边界](#validation)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

> 本报告是 2026-11-03 的源码与工程装配快照。已修正本轮证明的功能/API漂移及目录问题；其余文本候选保留复查，不据此声明整个仓库功能完全平行。完整路径、所有权、SHA-256 和迁移映射见[审计清单](./审计清单.json)。

## 一、<span id="scope">扫描口径与允许差异</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 新工程检查主工程及 JobsByPods；旧工程检查主工程集成源码。按共享所有权脚本核对前100行与同名头文件，排除外部 Pods、Manual、供应商、生成/构建产物及来源不明源码。
- 新侧 Podspec、Podfile、聚合头和 Development Pods，与旧侧直接集成、工程引用及 target 归属属于管理差异；公开 API、实现行为、Demo 与资源不能以此为由分叉。
- 同名文件比较去掉注释、导入、头守卫、非字符串空白和路径派生的自动分类哈希；保留字符串、方法体、API返回类型和其它预处理语义。异名文件通过类与 selector 交叉定位。
- `PKProtocolExtension/作者原版` 与 `改良版本` 在两侧各2组均标记为 `protected_upstream_path`；来源路径优先于被统一过的 Jobs 文件头，未移动或改写。

## 二、<span id="repairs">已完成的源码与 API 对齐</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 范围 | 修正结果 |
| --- | --- |
| 稳定性 SceneDelegate | 新侧归入 JobsOCStabilitySupport 本地 Pod；旧侧直接集成同名类。测试 host 保持空白 Scene，主 App 使用自身业务 Scene。 |
| JobsOCSearcherView | 对齐 clearHistory 的 Block 合同及 placeholder、推荐标题的空配置默认文案。 |
| JobsOCRefresher | 对齐 animator 协议、nil 默认系统动画与配置边界，清理旧历史动画分支及相应 typedef。 |
| JobsAdNoticeView | 补至新侧 JobsOCTools/Core 并公开，两侧 h/m 分别逐字一致。 |
| Demo 与临时分组 | MicroAppLearning、DeviceDescription、DeviceGuardLaunch 收口业务逻辑/功能模块/Demo@…；Recovered 与临时稳定性支援分组归位。 |

公开头缺声明本身也构成 API 漂移，即使实现已经存在。本轮另完成以下6组公开API修复与3组显式trait API补齐，均记录为已修项：

| API 组 | 对齐内容 |
| --- | --- |
| 开屏 | 公开既有 byHostGestureRestoration。 |
| JobsBaseApi | 公开既有 byAnimatingText、byAnimatingView。 |
| BaseRequest | 公开既有 jobsCustomHTTPHeader、jobsParameters。 |
| 上传请求 | 补 jobsRequestSerializerType Block 入口，保留 YTK 固定 selector 合同。 |
| 有序字典 | 补 jobsObjectAtIndex 标准入口，固定 objectAtIndex: 转发，保留旧 Block 单向别名。 |
| 导航栏 | 对齐 jobs_requiresDefaultNavigationBar 的 BOOL 合同与 Block 入口，同步基类、调用方及两个登录子类，保留登录页 NO 行为。 |
| UIColor trait API | 补显式traitCollection的渐变图入口，保留原有入口。 |
| UIImage trait API | 补显式traitCollection的文字图入口，保留原有入口。 |
| JobsIconfont trait API | 补2个显式traitCollection字形图入口及资源占位图入口，保留原有入口。 |

## 三、<span id="layout">成对源码目录与工程归属</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 在点名模块整改基础上，对全量存量清单另完成304组真实目录整理。

| 工程 | 迁移 h/m 组 | 上游路径排除组 | 可修改范围内剩余未包装组 |
| --- | ---: | ---: | ---: |
| 新工程 | 114 | 2 | 0 |
| 老工程 | 190 | 2 | 0 |

- 每组用完整基名目录包装；仅大小写不同的目录通过临时目录安全改名。Pod根聚合头保持根入口职责。
- 新侧228份移动源码SHA-256全部不变，6个普通文件引用移入3个真实分组，所有原target Sources UUID保留；旧侧同步维护文件引用、同步组编译归属及3处相对导入。
- 15份受影响Pod README、旧源码链接及音频回归脚本路径同步。静态Podspec实际glob核对通过，Tests仍由测试规格编译，Example保持原排除边界；未增加业务target成员。
- 老工程完整构建成功后，另将21份迁移文件的起始注释改为标准文件头；原创建日期保留，正文（含导入和空白）SHA-256逐份一致，未为纯注释变化重复构建。最终manifest已更新，移动时的指纹证据保留。
- 具体迁移前后路径、源码指纹、大小写目录、排除原因与引用核验见JSON的 `layout_remediation`；`paired_layout` 是整改后的剩余清单。

## 四、<span id="inventory">全量静态对账与待复查候选</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 指标 | 数量 |
| --- | ---: |
| 新侧扫描 h/m/mm | 5423 |
| 新侧 Jobs 自维护文件 | 3857 |
| 旧侧扫描 h/m/mm | 4056 |
| 旧侧 Jobs 自维护文件 | 2421 |
| 新侧同名文件归一化相等 | 2398 |
| 同名且旧侧有 Jobs 所有权，但文本仍不同 | 1100 |
| 旧侧同名候选受所有权保护，且文本未相等 | 219 |
| 新侧没有旧同名文件 | 140 |
| 上项中的生产文件/聚合入口 | 10 |
| 旧侧独有生产文件名候选 | 51 |

- 新侧无旧同名文件的140项含128份测试、2份文档样例、10份生产文件。生产项中6份是管理入口头；另两组h/m分别在旧 `JobsSystemAPIDSLSupplement` 与 `NSString+Time` 中找到对应功能，不按文件名判作缺失。
- 同名文本候选包含DSL与裸调用差异、方法顺序、兼容层和新侧Support多副本。旧侧独有文件名也包含历史别名与合并分类；候选数不等于功能缺陷数，尚未逐项完成行为证明。
- 例如旧 JobsClockView 位于手工第三方路径，不能用新同名源码直接覆盖；清单保留所有权边界。byShowSecurityBtn、byAxisType、byDoorModel 已分别在旧主类或其它分类找到实现。
- 根Demo唯一控制器集合新旧均为117，集合差为0；这仅证明根入口覆盖一致，不能替代页面内部API、资源和交互验收。

## 五、<span id="validation">已执行验证与构建边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 验证项 | 结果与覆盖 |
| --- | --- |
| 本地Pod集成 | 已完成；Pods根对象为PBXProject，JobsOCTools包含新增AdNotice源码，49个测试host依赖稳定性支援。 |
| 稳定性支援与host | 支援Pod及测试host构建、host smoke通过；窗口相关2个XCTest通过。 |
| Searcher | 新侧17项、旧侧17项测试通过。 |
| Refresher | 4个实现文件的目标对象编译通过。 |
| 6组公开API | 9处标准公开声明匹配；Clang隔离验证与26条运行断言通过，使用最小Foundation/UI/YTK适配，不等同完整UIKit App运行。 |
| 两侧工程引用 | PIF解析通过；迁移源码指纹、文件引用、编译归属及Pod源码glob边界核对通过。 |
| 3组显式trait API | 5条公开签名与5个实际方法体分别一致；真实UIKit SDK的Clang语法验证通过。未新增像素/换肤运行测试。 |
| 新主App | 最终源码的 Debug 双架构（arm64、x86_64）iOS Simulator 构建 BUILD SUCCEEDED。 |
| 旧主App | Debug、arm64 iOS Simulator完整构建 BUILD SUCCEEDED；PNG格式诊断未阻断，未修改图片。 |

- 本轮结果不扩展为Release、签名真机或整个仓库全部行为的覆盖证明。
- 已修API组列于 `public_api_repairs` 和 `trait_api_repairs`，没有计作剩余确认缺口；原始同名文本候选保留为可追溯静态清单。源码后续变化时，以当前源码重新生成快照。
- 未创建提交，未推送远程。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
