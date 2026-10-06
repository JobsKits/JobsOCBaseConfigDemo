# JobsByPods 升级实施与编译验证

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

本文件承接 [稳定性与升级评估报告](./JobsByPods自建Pod稳定性与升级评估报告.md)，记录本轮实际修改和验证证据。评估报告保留升级前基线。本轮覆盖 109 个自建 Pod，排除 `ManualByOCPods@Pods`、供应商及他人作者源码。没有提交或推送。

**2026-10-06追加修复：新旧JobsMarkdownPackager已排除Products、Intermediates、固定文档bundle及work/JobsPodsStability/full；本次旧工程fresh Both已有正式实证。f199结果保留为上一轮历史，本次源码及完整ALL的实际结论以以下最终验收表为准；D0/D1文档封包另行验真。**

**验收记录：同指纹完整Pod、iOS、Mac及新旧主工程编译已核验；D0文档重建、实际App资源与冷启动已有独立实证。最后封包的文档字节与D1实测结论，以外部 `work/JobsPodsStability/final-proof-8218cf43/final-seal.json` 为准。**

## 一、升级后的行为 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 范围 | 实施结果 | 对应基线 |
| --- | --- | --- |
| 生命周期 | 析构走普通清理内核，停止已有 timer/display link/observer；逃逸 Block 在 owner 释放后安全退出 | R01、R04、R09、S03 |
| UIKit 与运行时 | Markdown 递归、nil refresh slot、nib 注册干预修复；NSInvocation 按实际 ABI 打包；真实 weak 关联；Patch 回滚保留有效 IMP | R02–R07、R09 |
| 数据完整性 | Snowflake 毫秒/序列/节点边界；Keychain 更新失败保留旧数据、身份包含 account；FMDB 明确提交结果/失败回滚；原子文件写入 | D01–D03、D05 |
| 构建与诊断 | AppIcon 在旁路 staging 完成后原子替换；输入/上次成功结果保留；fatal signal 仅记录定长 C 数据，普通导入完整写入并同步成功后才清空 journal | D04、R08 |
| 异步终态 | 蓝牙区分提交/ACK/业务响应；视频 CF 与 session 队列；音频真实启动失败与旧完成隔离；multipart 使用 YTK 标准请求；TimerMgr force finish 一次 | A01–A05 |
| 组件状态 | 刷新终态归还 inset；导航取消与 container 坐标；Stepper 统一归一化；Splash 合法缓存、限量/期限、独立取消 token/同 URL 合并、后台 GIF 解码 | S01–S05 |
| 边界输入 | Random 全 int 区间与反序；网速实际 monotonic elapsed；BioKit 正确枚举；UILabel 极值动画/滚动；多窗口显式宿主 | S06–S07、条件项 |
| 性能与可维护性 | Excel 可见网格复用与空态重载；WebSocket pong 超时；Scene/context 窗口；认证加密独立 envelope API；薄模块保留原能力、纳入统一编译 | 条件项 |
| 工程护栏 | Pod 自有测试、CI 逐单元构建、源码指纹与真实退出码；文档 icon 排除运行时复制；selector 单一所有权；真实 API 隐私 manifest | T01–T05 |
| 请求复用与缓存身份 | JobsAPIs / BaseRequest 默认关闭缓存；每次构造 header 读取当前账户 token，显式 Authorization 优先；responseModel 随 responseObject 失效；参数/header 保留独立可变副本 | A04 与条件项 |
| 语言、时间与文本合同 | 语言/bundle 同锁更新并按 locale 层级回退；固定日期采用 POSIX/Gregorian、日期差尊重传入 format，新增 BOOL+NSError 区分失败与零差；秒/毫秒与非法输入合同固定；UTF8/short 输出、空富文本和 UIColor/range 边界补齐 | 条件项、T04 |
| 可选宿主与独立消费 | 退出确认首次返回并缓存实际弹窗，回调弱持有 owner/原弹窗；生产 ISLogin 弱缺省定义兼容强宿主，确认始终发送 object=@NO 的既有通知；plist 读取采用 [**Foundation**](https://developer.apple.com/documentation/foundation) 路径/非目录检查，移除 Core 对 FileFolderHandleTool 的反向实现依赖 | 本轮实际链接补强 |
| 实际链接与旧集成收口 | Navigation Support 的同名 plist 入口也改为相同 Foundation 内核并移除 FileFolder 头引用，修复独立 ByPods XCTest 的剩余反向链接；旧 WebSocket 恢复本地 SRWebSocket 分类头导入，保持旧主工程集成形态 | 本轮实际 link65 / compile65 补强 |
| 刷新组件的可选标题 provider | MJRefresh 核心刷新不依赖 BaseUI；可选按钮标题 / 副标题在主线程通过运行时查找已有 BaseTextView，验证 UITextView 子类与初始化结果，缺失或无效时返回 nil，两个属性明确 nullable。有效 provider 保留原链接属性、配置与缓存身份；没有反向依赖、替代控件或失败缓存 | 本轮实际 MJRefreshExtra 独立 link65 补强 |
| 系统能力与失败边界 | DeviceID 仅 ItemNotFound 创建、写成功才返回，锁定/持久化失败返回 nil+NSError；Open 主线程展示与每封邮件独立代理；ScreenCapture 无安全 Canvas 时显式不可用并正常显示 | 条件项 |

## 二、可复现验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 2.1、本轮冻结范围与最终回填 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

2026-10-05 21:53:26 的26文件收口按原SHA合入：网络组17文件与S03/S06/语言验证9文件；其中生产只补raw request蜂窝属性及蓝牙首次连接nil previous守卫，其余为必要fixture/声明、Bits自身Stability与README合同。新增测试源码10个h/m引用，当前范围为 **109 Pods×Debug/Release=218次、48个Stability、49次iOS配置运行（Snowflake额外Release）、10个Mac脚本、主工程Debug/Release**。[应用receipt](/tmp/jobs-oc-original-acceptance-applied-20261005T1351/receipt.json)。本批7个网络组测试m真实UIKit Clang syntax-only均exit0，[命令/日志](/tmp/jobs-network-uikit-front/results.json)；不据此认领链接或XCTest通过。

新测试宿主引用安装首次因生成项目UUID碰撞失败：实际生成运行时为 CocoaPods 1.17.0 / Xcodeproj 1.28.1。TargetUUIDGenerator 稳定化后 generated 与 available 池共享对象；Scene挂载耗尽池后，CocoaPods从0开始顺序补池，导致Root UUID被Scene的PBXBuildFile覆盖。仅Root-owned Podfile 对该项目实例的 refill委托回原生Xcodeproj防撞allocator，不改gem或供应商。真实复现、48宿主保留497对象并save/reopen、重复hook幂等3项均exit0；[回归JSON](/tmp/jobs-cocoapods-post-install-uuid-proposal/regression.json)、[22:20:35应用receipt](/tmp/jobs-oc-uuid-fix-applied-20261005T142035/receipt.json)。Root另用Ruby 2.6 / Xcodeproj 1.27解析不代表生成版本。

第二次安装实际exit0；22:23:51独立解析确认Root为PBXProject、锁文件一致、25145对象、5118个vendor文件字节全部未改，[安装/完整性JSON](/tmp/jobs-oc-install-uuid-fixed-20261005T1421/root-vendor-integrity.json)。22:26:59安装后233项结构检查全部通过：真实48个Stability、48个AppHost、48份唯一Scene source以及10个新fixture引用，Root唯一PBXProject且25145对象，[结构JSON](/tmp/jobs-oc-uuid-fixed-project-audit-20261005T1427.json)。233是结构检查数；安装、解析和挂载成功不代替后续构建、运行和资源通过。

此前 `bb8e42233306ce001e51f69d02c523b021de30b0d32aafbd86e8e6c1cf2cf35b` 快照218次Pod构建均实际exit0；收口改变输入后旧worker实际exit1，BaseUI行记录验证75/进程0/source_consistent=false。保留历史日志，不能借用旧218宣称新批次完成。下表只接受最终冻结指纹、真实退出和完整结果包；`PENDING_*`为明确待回填字段，失败或缺证据时必须保持pending。

| 最终字段 | 当前状态 / 精确回填位置 |
| --- | --- |
| 最终源码/工程指纹与all-phase durable退出 | 指纹 `8218cf43acbefcfd911b375dea847ca9b0461944b08d2fbbcd6954cf47ce350f`；完整ALL实际finished/exit0、signal=null；[冻结退出证据](./work/JobsPodsStability/final-proof-8218cf43/new/all-receipt.json)。 |
| 218次Pod构建 | 109个Pod的Debug/Release共218/218条最新同指纹命令实际exit0；[严格结果表](./work/JobsPodsStability/final-proof-8218cf43/new/results-table.json)。 |
| 48个Stability / 49次iOS与实际通过/失败/skip用例数 | 48个Stability、49次配置运行，实际135case全部通过，fail0/skip0；含Snowflake Release与BaseUI真实签名/权限证据；[完整summary](./work/JobsPodsStability/final-proof-8218cf43/new/results-table.json)。 |
| 10个当前生产Mac脚本 | 10/10个Mac入口实际exit0；仅各脚本明示范围，不替代硬件/完整ASanTSan；[严格结果表](./work/JobsPodsStability/final-proof-8218cf43/new/results-table.json)。 |
| 新主工程Debug / Release及冷启动 | 新主工程Debug/Release实际exit0；[两配置记录](./work/JobsPodsStability/final-proof-8218cf43/new/results-table.json)。D0两配置冷启动至少30秒存活，App PID身份、截图与新增fatal/NSException证据经Root审阅；GUI补充范围：Debug实际记录：["首页实际显示18个Demo入口","通过AX按钮60进入横向/纵向刷新与加载更多Demo","AX及截图确认垂直刷新完成：水平刷新0/加载0，垂直刷新1/加载0"]；Release实际记录：["首页实际显示17个Demo入口，没有Debug调试入口","通过AX按钮59进入横向/纵向刷新与加载更多Demo","AX及截图确认垂直刷新完成：水平刷新0/加载0，垂直刷新1/加载0"]。[D0审阅](./work/JobsPodsStability/final-proof-8218cf43/D0/smoke-review.json)。 |
| 旧主工程Debug / Release与Jobs-owned同步 | 旧工程本轮独立Both实际finished/exit0，两配置0、source变化0；主App CP及Root privacy完整字节/字典/三reason核验，Packager额外SHA稳定且两App文档逐字节匹配；[本轮严格旧终态](./work/JobsPodsStability/final-proof-8218cf43/old/final-verification.json)。 |
| 109 README证据回填与最终报告字节 | 109份Pod README已按同指纹真实结果回填；[回填记录](./work/JobsPodsStability/final-proof-8218cf43/documents/109-README-CAS.json)、[D0文档CAS](./work/JobsPodsStability/final-proof-8218cf43/documents/D0-CAS.json)已归档。本文件及全部文档的最后封包字节/SHA由外部 `work/JobsPodsStability/final-proof-8218cf43/final-seal.json` 验真，不在本文件嵌入自身SHA。 |
| 文档回填后的重建、Markdown/字体/privacy实际.app字节审计 | D0文档回填后Debug/Release重新构建均实际exit0；资源v3两配置实际0：Debug17个primary＋2副本=19，Release16个primary＋2副本=18，Release两个DebugPanel运行bundle禁入。Root manifest完整字节/字典、字体/Markdown及112份必需文档原字节已核验；[Debug资源](./work/JobsPodsStability/final-proof-8218cf43/D0/resources-Debug.json)、[Release资源](./work/JobsPodsStability/final-proof-8218cf43/D0/resources-Release.json)、[D0阶段归档](./work/JobsPodsStability/final-proof-8218cf43/archive-D0.json)。最后封包对应的D1重建、资源与冷启动结果以外部 `work/JobsPodsStability/final-proof-8218cf43/final-seal.json` 为准。 |

旧指纹2edb8c91333ce333ccc8ce16ed83d0ed7241c7a9bd42e78113bf9251ec8acee2的6组真实定向记录保留：File3/3、APIs5/5、Bluetooth5/5、ByPods8/8均exit0/零skip；Bits0pass/2fail和Net1pass/2fail均exit65。两个失败不是编译失败：Bits真实Label/monitor未释放，Net错误地读取已取消JobsTimer的lazy nsTimer getter，创建了新native timer；[完整6组历史receipt](/tmp/jobs-final-docs-proposal/historical-six-directed-2edb.json)、[失败取证](/tmp/jobs-bits-net-actual-lifecycle-fix-proposals/actual-failure-receipts.json)。旧结果不转成下一指纹通过。

23:06:29按SHA合入UI15文件和Core4份既有Tests，[UI应用](/tmp/jobs-oc-lifecycle-fix-applied-20261005T150629/receipt.json)、[Core应用](/tmp/jobs-oc-core-acceptance-applied-20261005T150629/receipt.json)。该阶段UI在4个选中Jobs-owned provider统一已有零化weak helper，默认8类gesture改用原生target/action；仍残留工厂隐式byTarget造成的强metadata持有，不能作为最终owner释放合同。Bits原生菜单不强持有自身。timer fixture捕获运行时原NSTimer，保留真正Canceled/isRunning/无后续tick/另一Label继续更新断言。旧AaltoChen NSObject+Extras scalar getter/setter排除；旧owned DSL和gesture直接消费共享弱key，不覆写foreign，不声称旧全部scalar语义已统一。四个provider的真实Foundation内核compile/run0，[内核范围与所有权](/tmp/jobs-bits-net-actual-lifecycle-fix-proposals/final-receipt.json)。该阶段Core的Patch5/AppTools2/Iconfont4及ByPods10项保留原断言、补原必需验收；这些数量是历史快照，后续必要手势批次的真实iOS重测以新指纹为准。


本草案的必要手势批次以已冻结提案为合同依据，应用与实际验收状态须读取对应receipt。其合同是UIView手势工厂不隐式调用byTarget，目标交由UIKit弱delegate与native addTarget注册；JobsOCDSL Support两个nativeActionBy入口不隐式byTarget(self)，保留native action、copy callbacks/handler和当前对象的链式返回。验收取实际链接的原生生产IMP并通过原生handler单回调行为probe确认，不把dladdr image硬编码为动态JobsOCDSL.framework；本次真实dladdr image为静态链接后的JobsByOCPods-Unit-Stability.xctest产物。generic显式target/byTarget setter/getter保持原公开语义，工厂不会自动写入target metadata。工厂9个addGR/addXxxGR返回的保存Block在owner释放后应返回nil，既有存活时链式行为保留。旧侧对应2份Jobs-owned factory和1份canonical Native共3个m同样按集成形态同步；旧Both独立终态见最终验收记录。ByPods本次真实summary确认为12个case；48个Stability/49次iOS运行不变，case数不能与run数混淆。[提案manifest](/tmp/jobs-explicit-gesture-target-native-fix-proposal/manifest.json)记录new7/old3文件范围与完整原断言；3个实际UIKit Clang frontend检查（Gesture生产、Native callback生产、ByPods fixture）exit0，[完整argv/日志](/tmp/jobs-explicit-gesture-target-native-fix-proposal/actual-sdk-syntax.json)，这不等于链接或XCTest通过。前次12项定向为11PASS/1FAIL/0skip，唯一失败是fixture硬编码IMP的image归属；该失败没有执行后续100轮，不建立生产生命周期失败结论。仅修正测试选择逻辑后，00:29:40启动的ByPods新定向在指纹93dfc2d10154d16dccd9e2e1a19c4617a04387e4c65c3112921ac22b319a0c9a实际12/12通过、零fail/零skip，xcodebuild进程与验证exit均0、耗时32.87秒，durable wrapper finished/exit0；[终态receipt](/tmp/jobs-oc-stability-native-gesture-probe-directed-20261005T162940063Z.json)、[实际summary与原生probe证据](/tmp/jobs-native-gesture-002955-final-pass-proof/proof.json)。typed/void两个getter均为候选1 callbacks0、候选2 callbacks1，classMethodCount236；实际选中的native生产IMP分别0x10acfe5c0/0x10acfe434，handler为0x10acfe814。100轮完整生命周期和9个保存getter迟到调用的真实断言均通过；这仅是ByPods模块定向结果，不代替完整218/49/10/MainBoth。

指纹a4a8976c3d2a84b40418b83f73e715d3a8d091a23e264de69617600842cbd470的all调度在必要改码前已完成109个Debug Pod构建和部分Release，属于历史阶段结果；scheduler9343已停止调度且活跃编译排空，[历史all receipt](/tmp/jobs-oc-stability-all-final-a4-frozen-20261005T153552694Z.json)。该局部结果不能认领218/49/10/MainBoth整体完成；必要批次落盘冻结后须重新跑完整all，最后8字段只接受最终同指纹确证。

93df阶段的完整all已于04:45:32实际exit1：218次Pod构建均exit0，49次iOS运行中48次通过、MJRefreshExtra一次失败；总计135个case为133PASS/2FAIL/0skip，10个Mac入口均exit0，主工程阶段尚未执行。MJ的6项中4通过、2失败，真实异常为 `-[LOTAnimationView isStop]`；[完整终态与冻结results](/tmp/jobs-final-93df-mj-failure-terminal-history/archive-proof.json)。这些是失败版本的历史证据，不能移作下一指纹通过。

07:04:32仅MJ Header/Footer两处点式stop改为 `[animationView stop]` 并同步README，[MJ实际CAS](/tmp/jobs-oc-mj-native-stop-applied-20261005T230432Z/receipt.json)。原真实6项及全部断言保持，5c0820be988559ee9acb7407afcc06ce04aa9203705bcad7ecd0fc5d40a14473指纹下07:04:49的定向命令实际进程/验证exit0、6/6通过、零fail/零skip、8.90秒；[终态receipt](/tmp/jobs-oc-stability-mj-native-stop-directed-20261005T230444912Z.json)、[冻结summary/命令](/tmp/jobs-final-docs-proposal/latest-mj-native-stop-directed-pass.json)。这只证明该模块定向。实际生产AST原版为BOOL/isStop而显式消息为void/stop，编译两者均可通过；原生Lottie实现只有stop/pause，保持TimerProtocol的BOOL stop/isStop合同。

实际109 Pod FileAccessor与生成Sources核查同类LOTAnimationView stop调用只有MJ两处、Fuse两处及Tools一处；后两模块修复前读取的arm64 object同样含 `_objc_msgSend$isStop`，Fuse的pause实际为原生pause，无需改。07:08:39第二次CAS同步Fuse2处、Tools1处原生stop，另仅对Tools保存切换Block在strongify后加nil owner guard，README随合同更新；无新测试、依赖或供应商修改。[真实选源/符号证据](/tmp/jobs-lottie-stop-native-proposal/selected-source-evidence.json)、[第二次CAS](/tmp/jobs-oc-lottie-owned-stop-applied-20261005T230839Z/receipt.json)。

以下为f199阶段历史快照；当时的候选最终指纹为f199c824735a1242a4ba77dfc67c4c19e5682d6b0dd80d8cfd8166a191059a71，7341文件冻结，对93df仅4份生产m变化；[冻结快照](/tmp/jobs-oc-native-stop-final-source-freeze-20261005T230922Z.json)。07:09:23新的完整all worker2419/runner2428启动，[新all receipt](/tmp/jobs-oc-stability-all-final-native-stop-frozen-20261005T230923053Z.json)；启动快照为running，上方8字段在草案中保持pending，仅按后续真实终态回填。后续仅接受本候选同指纹实际终态，不将任何定向或旧版本结果扩写成最终218/49/10/MainBoth通过。最终外部封包证据固定输出为 `/tmp/jobs-final-proof-f199c824`，D0/D1策略保持。

生产NSInvocation C helper与公开调用/返回方法逐字抽取，实际Foundation/CoreGraphics按-fsanitize=address编译/运行均exit0：object、BOOL、NSInteger、double、CGRect、void、参数少/多/错型和10000次带autoreleasepool的标量调用，[CG/源码与片段SHA/完整argv/实际exit](/tmp/jobs-foundation-original-acceptance-proposals/runtime-asan/receipt.json)。仅生产内核范围；没有完整Pod/App ASan、TSan或泄漏检测通过结论，也没有改全局构建flags或增加第11个Mac门禁。

2026-10-05 23:07阶段的历史冻结指纹66c9a8dc1ef0ba45facb9fb69dec29300c4d174de44220e907380848a2f96603，[源码/配置快照](/tmp/jobs-oc-stability-lifecycle-core-source-freeze-20261005T1507.json)。23:08:35启动的worker94359含6组新定向，启动快照为running，[durable receipt](/tmp/jobs-oc-stability-lifecycle-core-directed-20261005T150835318Z.json)；此处不提前写完整6组或全矩阵通过。旧Both历史各exit65/7条Marquee编译错误保留；对应旧owned caller原生适配与本批网络2/UI4共7个m已由Foundation23:15:18按SHA CAS冻结，[旧7文件receipt](/tmp/jobs-oc-old-stability-20261005/old-seven-batch-20261005T151518Z/receipt.json)。Aalto foreign不变，无头/引用/依赖/vendor新增；当时旧Both独立重跑待结果；最终新侧记录也不能替代旧MainBoth和最终资源验收。

旧同步后续历史：上述old46009的Debug实际exit65，于04:32:04结束，墙钟4713.361秒包含maintenance sleep，不能推断编译性能；唯一编译错误是Jobs-owned `JobsOCBaseCustomizeUIKitCore/NSObject/BaseObject/FileFolderHandleTool/FileFolderHandleTool.m:720` 把返回 `UIImage *` 的 `videoPreViewImage` getter当Block调用。已批准的最小caller补丁仅删除 `urlAsset.videoPreViewImage` 后的空括号（patch SHA42a849974e4da104efbd586a3639f0606f32aae8d3bc6c9813cf9d6cf7d71b90）；foreign `User` 2024的 `AVURLAsset+Extra` getter/provider不改，header SHA56b74f9a…、m SHAd194c478…保持原字节。复用实际旧Clang argv对整份caller检查，before exit1复现同一错误，after exit0，[补丁/完整argv与结果](/tmp/jobs-old-filefolder-video-preview-caller-proposal/metadata.json)。[该轮真实结果](/tmp/jobs-oc-old-stability-20261005/run-20261005T035930Z/final-20261005T162733Z/results.json)保留Debug65与安全排空Release75；Foundation在确认旧wrapper finished1、源变化0及owned native children0后，于04:37:44完成这1行CAS（after SHAdaec7fb9fe565807cc982c80d13b446a0660dacda6a9750173d6430ec85434bb），[实际应用收据](/tmp/jobs-oc-old-stability-20261005/old-filefolder-video-caller-batch-20261005T203744Z/receipt.json)。当时新的同缓存Both worker91314启动，[新旧工程receipt](/tmp/jobs-oc-old-stability-20261005/durable-final-20261005T203814Z.json)；该轮后来安全排空，Debug实际75、Release实际-2，均不计通过；旧Both最终独立结果见最终验收记录，不能以整文件语法通过或新工程结果代替。

旧侧07:14:26按真实SHA集中同步Footer1、Fuse2处原生stop及Tools1处原生stop/保存Block guard，共3份Jobs-owned既有m，并同步旧根README；旧Header已显式调用原生stop，保持字节不变。[旧集中CAS](/tmp/jobs-oc-old-stability-20261005/old-native-stop-final-batch-20261005T231426Z/receipt.json)保留所有afterSHA和前轮排空终态；两映射m都有真正主target的完整路径ScanDependencies与CompileC证据，不以原工程显式Sources仅29项误判其未入编译。[实际旧主target成员证据](/tmp/jobs-oc-old-stability-20261005/old-native-stop-actual-target-source-evidence.json)。07:17:35新的同缓存Both worker8446启动，[旧最新Both receipt](/tmp/jobs-oc-old-stability-20261005/durable-final-20261005T231735Z.json)；草案准备时仍running，该启动阶段旧工程独立终态和post-CP资源字节检查仍待证据，最终结果见最终验收记录。

下面保留历史失败和当时的47/48规模，不能全局替换历史数字；当前规模以上述48/49字段为准。运行通过也不能自动清掉第六节的设备和诊断限制。

当前验收版本为 `8218cf43acbefcfd911b375dea847ca9b0461944b08d2fbbcd6954cf47ce350f`。原f199全量通过与第一轮D0文档CAS仍保留为历史；随后D0 Debug构建进程实际exit0，但文档来源一致性核验exit75，发现构建产物中的Markdown被再次计入来源。Jobs-owned Packager现排除Products、Intermediates、固定JobsMarkdownDocuments.bundle及work/JobsPodsStability/full，保留其它合法work文档和证明JSON；新旧脚本SHA同为 `e635418f2a238302c1e62495196c63d05f4ee4a770b272c04a427ba784fb8236`。本表仅按本轮新指纹完整ALL及旧工程真实新Both重新回填，不移植f199通过结果。历史D0失败原件见固定证明目录history/D0-Debug75-original.json；最终文档仍需D0/D1重建、资源和冷启动独立验收。

### 2.2、历史与局部验证证据 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

使用 [**Xcode**](https://developer.apple.com/xcode) 27.0 / iOS Simulator 27.0；[**CocoaPods**](https://cocoapods.org/) 1.17.0。最终逐项编译和回归结果见本文件的最终验收记录及模块矩阵；D0文档重建、资源与冷启动证据已独立归档，最后封包的文档字节与D1实测结论以外部 `work/JobsPodsStability/final-proof-8218cf43/final-seal.json` 为准。

耗时与工程环境：本轮主控在01:10之后记录多次 `pmset` MaintenanceSleep / DarkWake，计时工具50秒前后的墙钟曾分别跳约2小时、47分钟。多个Release命令仍实际exit0；记录的 `seconds` 为600–1298秒且包含系统休眠，不能据此判定编译挂死或用作编译性能基线。04:15:36只为本轮任务启动 `caffeinate -i -s -w47106`（PID80605）和 `caffeinate -i -s -w46009`（PID80606），实际 `pmset assertions` 的 `PreventSystemSleep` 与 `PreventUserIdleSystemSleep` 均为1；对应任务结束后自动释放，不更改持久化电源配置，也不强制亮屏。[任务级防休眠记录](/tmp/jobs-oc-build-sleep-inhibitors-20261005T1930.json)。此说明不领取完整矩阵或主工程通过。

```shell
JOBS_POD_INSTALL_PURE=1 JOBS_POD_INSTALL_SKIP_VENDOR_PATCHES=1 pod install --no-repo-update
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --simulator '<UDID>' --output "$PWD/work/JobsPodsStability/full"
```

`JOBS_POD_INSTALL_SKIP_VENDOR_PATCHES=1` 跳过现有 Podfile 中三项供应商源码兼容补丁；普通安装的既有默认行为保持。`PURE=1` 跳过可选后置增强；顶部异步离线前置报告/索引仍会运行。测试宿主通过 Jobs 自有 Scene delegate 适配新 SDK，生产 App 不使用该测试宿主。

本表记录各历史阶段已经发生的编译、链接、运行失败及局部回归，47/48等历史数量保持当时含义；当前执行范围为48个Stability / 49次iOS运行。各行的最终结果统一见上方最终验收记录和第3节模块矩阵，不把历史局部通过移作当前版本通过。

| 验证 | 历史阶段的真实结果及最终证据入口 |
| --- | --- |
| 109 podspec 求值 | 当前配置 109/109 加载成功；C / OC 预编译头隔离、Audio/Crash fixture、TimerMgr 公开 DSL 已刷新挂载 |
| 配置门禁自身回归 | 23 个实际 fixture 场景通过，包含公开聚合头漏导出 Core DSL 的拒绝验证 |
| README 证据校验器回归 | 31 个实际 fixture 检查通过：原 17 个通用证据 / 文档边界，加 14 个 Keychain 签名 receipt 检查；拒绝缺审计、错误策略、部分跳过或无效签名 / 权限证据；[日志](/tmp/jobs-readme-keychain-gate-regression.log)。最终实测结果见最终验收记录和模块矩阵 |
| Random C UBSan | 极值/反序/全域 20,000 次实际实现回归通过 |
| Snowflake iOS XCTest | 4 个 Debug 用例通过：并发唯一性、冻结时钟回卷、Release 同合同边界输入、回拨拒绝恢复；该阶段 Release 尚待运行；最终实测结果见最终验收记录和模块矩阵 |
| AppIcon macOS 回归 | 真实 Swift 编译/运行，输入隔离、重复替换、失败保留、越界路径和输出校验通过 |
| Crash signal C 回归 | 真实生产 C + UBSan 子进程验证，fatal record、系统终止、已有 handler 与 SIGPIPE 保持通过 |
| Crash 普通导入 macOS 回归 | 提取当前生产 checked writer / 导入内核，真实 Foundation 文件系统配合 POSIX 故障注入；open/write/短写/fsync/close 失败与坏记录保留 journal，成功后清空、自身重入/跨实例队列隔离通过；[日志](/tmp/jobs-crash-import-final.XHvZ9G/regression.log)。不等同真机 signal 或完整 iOS Pod 验收 |
| AuthenticatedCipher / weak holder | 真实 macOS 生产实现回归通过；最终实测结果见最终验收记录和模块矩阵 |
| SQLite / DeviceID | 实际 SQLite 事务回归、注入 OSStatus 的生产决策回归通过；最终实测结果见最终验收记录和模块矩阵 |
| Keychain 解档 macOS 回归 | 直接编译原始生产 `.m`，根对象及嵌套容器白名单、基础类型拒绝、非法类集合、nil、错误恢复与循环结构回归通过；[日志](/tmp/jobs-oc-old-stability-20261005/keychain-decode-kernel.log)。不访问系统 Keychain；签名宿主的真实账户测试结果见最终验收记录和模块矩阵 |
| Splash macOS 回归 | 完整生产 Cache/Token 编译，raw download 替身验证同 URL 合并、独立取消、最后订阅取消及迟到完成隔离通过；[日志](/tmp/jobs-network-regressions.zEE5zv/JobsOCSplash.log)。未联网 |
| Audio 初始化失败 macOS 回归 | 提取生产 start/toggle/byPlayer，AV factory/session 替身验证 nil 初始化、原 NSError、partial 清理与会话归还通过；[日志](/tmp/jobs-network-regressions.zEE5zv/JobsOCAudioRecorder.log)。另以实际 fixture 创建 BOOL 证明删除前置有效：[日志](/tmp/jobs-audio-fixture-proof-x_ta0o6a/regression.log)。不访问 AudioSession/麦克风，最终实测结果见最终验收记录和模块矩阵 |
| Audio 测试私有状态接口修正 | [本轮实际 compile65](./work/JobsPodsStability/full/test-JobsOCAudioRecorder-Debug-145140.log) 为 XCTest 点语法访问未公开的 currentURL；仅该断言改为与 recorder 一致的 KVC 读取，保留错误、会话归还、私有状态、partial 真创建及真实删除全部 7 个断言，不增加公有 getter 或影子状态。当前生产 Mac 回归实际 exit0，[捕获日志](/tmp/jobs-audio-mjrefresh-audio-regression.log)；最终实测结果见最终验收记录和模块矩阵 |
| MJRefresh 可选 provider macOS 回归 | [本轮独立 link65](./work/JobsPodsStability/full/test-MJRefreshExtra-Debug-150408.log) 指向 UIButton+TextView.o 的 BaseTextView 强类符号；改为可选 runtime provider 后，提取当前完整生产 category 的普通 Mac Mach-O 编译 exit0，nm 无该 undefined class，缺类后恢复 / 错类 / 合法 provider / 初始化 nil 四个独立 subprocess 均 exit0；[JSON](/tmp/jobs-mjrefresh-optional-textview-20261005-93603-1sy6cp/results.json)、[符号检查](/tmp/jobs-mjrefresh-optional-textview-20261005-93603-1sy6cp/undefined-symbols.log)。UIKit 与 DSL 为 Foundation 替身，不据此宣布 UIKit 通过；这一阶段既有 iOS 用例扩至 5 项，不注册同名假类或加 BaseUI 测试依赖；后来实际执行发现下述 Lottie 初始化缺陷，完整6项的最终实测结果见最终验收记录和模块矩阵 |
| MJRefresh Lottie 独立初始化缺陷 | [18:07 命令](./work/JobsPodsStability/full/test-MJRefreshExtra-Debug-180720.log) 最终 timeout124；Staging 的实际 stdout 显示 5 项已执行，4 个 provider 用例有通过记录，真实 Footer 初始化因 `-[LOTAnimationView byLoopAnimation]` 无实现抛出异常，不能据 partial 领取通过。AppHost 随后 exit1，外层停在失败后的 simctl diagnostics 收集，区别于前次安装阶段停滞；[原日志及 SHA](/tmp/jobs-mjrefresh-180719-evidence/evidence.json)。MJ 本身及依赖没有该 selector 的实现，仅 ByOCPods 另一个 category 提供。已改 header / footer 为 LOTAnimationView 原生循环属性，Header 补齐空路径回退及弱宿主 guard；其它尺寸 / 布局 DSL 均确认来自实际入选依赖。保留真实 Footer 生命周期断言，并增加真实 Header 初始化 / 释放 / 迟到回调，共 6 项；[实际应用 SHA](/tmp/jobs-mjrefresh-lottie-proposal/applied-receipt.json)。没有新增依赖、测试替身 selector、资源或引用；旧 Jobs-owned 映射由旧工程主控在构建退出后同步，最终实测结果见最终验收记录和模块矩阵 |
| MJRefresh 保存配置 Block 的释放边界 | CodeGraph 确认 Header 的 `byRefreshConfigModel` 在 weak owner 释放后仍取 getter 并调用 nil Block；现于 strongify 后提早返回 self（nil），保留公开 ABI 和存活时链式配置。Mac 抽取当前 public getter 与 private 文案 updater 两个完整生产方法，两个 clang 编译均 exit0 且无诊断：原版活宿主配置 / 五状态标题写入 / 释放确认后实际 SIGSEGV11，guard 版同场景实际 exit0；[JSON](/tmp/jobs-mjrefresh-header-lateconfig-proposal/results.json)、[原版日志](/tmp/jobs-mjrefresh-header-lateconfig-proposal/baseline-run.log)、[修版日志](/tmp/jobs-mjrefresh-header-lateconfig-proposal/proposal-run.log)。Foundation fixture 只模拟 UIKit 文案保存，不据此宣布 UIKit 通过。既有 Header 用例追加保存真实配置 Block、真实状态文案 / 原实例返回 / weak 释放确认 / 迟到真调用返回 nil，完整用例仍 6 项；root 已按精确 SHA 应用，最终实测结果见最终验收记录和模块矩阵 |
| 可选旗标与退出确认 macOS 回归 | 无 provider 与独立 strong provider 两种普通 Mach-O 均 compile/run 0；提取最终生产 getter/callback、UI 工厂替身覆盖首次缓存、取消/确认 payload、原弹窗重入与 owner/view 释放；[日志](/tmp/jobs-logout-optional-symbol-20261005-51734-10jga49/regression.log)。生产使用 weak definition 缺省，Pod XCTest 未添加假的 host BOOL；iOS 链接/UI 最终实测结果见最终验收记录和模块矩阵 |
| plist Foundation macOS 回归 | 提取最终生产 read Block，bundle 定位注入，真实文件验证空/非字符串、缺失/目录、坏/数组根 plist、有效字典与删除后返回 nil，compile/run 0；[日志](/tmp/jobs-foundation-plist-read-20261005-82432-19k7aes/regression.log)。真实 bundle 查找由现有 UIKit XCTest 验收 |
| Navigation Support plist macOS 回归 | 对实际 link65 指向的 Navigation Support 生产 Block 再提取并编译，真实 Foundation 文件边界 compile/run 0；与 ByPods Core 方法逐字节相同，[日志](/tmp/jobs-foundation-plist-read-20261005-56039-6q4yv3/regression.log)。当前 109 spec 的实际 FileAccessor 选中 1372 个 `.m`，排除 6 个他人作者后扫描 1366 个 Jobs 源码，仅剩 FileFolderHandleTool Pod 自身引用；[选择与命中 JSON](/tmp/jobs-filefolder-selected-source-scan.json)。真实独立链接结果见最终验收记录和模块矩阵 |
| 宿主 privacy hook 实际 subprocess 回归 | 直接提取生产函数和实际生成的 owned marker 片段，在临时完整 Root 布局运行 8 个真实 subprocess：两次 hook、build/install/skip 三次片段均 exit0；缺源 build/install/hook 三次均预期 exit1。单 marker、第二次字节/mtime 不变；恢复完整宿主源字节，四个模拟 vendor bundle 的八文件不变；[日志](/tmp/jobs-host-privacy-hook-20261005-49556-a55yak/regression.log)、[JSON](/tmp/jobs-host-privacy-hook-20261005-49556-a55yak/results.json)。未执行完整 CP 资源脚本、供应商正文或 actool，不等同真实 Archive |
| Mach-O 编译权限 helper 回归 | 10 个真实 Mach-O 场景通过：clang 链接 unsigned thin、lipo 合并 fat、缺 section 且相邻 xcent、空/错身份/混合架构、坏 plist、实际 section offset 越界、非法路径，以及既有双架构 AppHost；[日志](/tmp/jobs-host-entitlements-regression.log)、[回归源码](./ScriptsByPods/jobs_pods_stability_verify.rb/Tests/host_entitlements_regression.rb)。权限从实际二进制 `__TEXT,__entitlements` 读取；不是 10 次编译，不用源 entitlement/xcent 或签名文件存在代替权限证明。该 helper 独立审计 AppHost SHA 为 `4ab7d7e962bd01779440032a1d6cd8a5c16ad05f071a6df0f48a1aaeedc9aa5d` |
| BaseUI 最近一轮真实定向 XCTest | 2026-10-05 14:03:25 Debug 命令和进程 exit0，真实 xcresult 3/3 通过、failed0、skipped0；[日志](./work/JobsPodsStability/full/test-JobsBaseUI-Debug-140325.log)、[结果包](./work/JobsPodsStability/full/JobsBaseUI-Debug-140325239.xcresult)、[完整结果 JSON](./work/JobsPodsStability/full/results.json)。严格 `codesign --verify --strict --verbose=2` exit0；宿主实际 x86_64 / arm64 权限分别从 offset11614 / 10116、size438 读取，三项 application-identifier / keychain-access-groups / get-task-allow 均匹配该宿主，全部架构 valid。该次宿主 SHA `2d3b21a32877963365108bc38fad6384abc4862373f255542c07e56b05c7b881`，与稍后的 helper 宿主快照分别记录；此定向结果不代替源码继续收口后的最终完整矩阵 |
| ByPods UIKit iOS XCTest | 真实可见窗口与 `didShowViewController` 逐阶段等待，保留 YES / NO 动画参数、最终根栈、top / visible 控制器及锁复位断言；注册、退出与 plist 合计 5 / 5 通过、0 跳过，Xcode 49.23 秒实际退出 0；[结果包](./work/JobsPodsStability/full/JobsByOCPods-Debug-143104784.xcresult)。本次当前源码指纹 `b31cd2b7b06a8e9fb867c08273a74bbcaba7f73d868c8f1f973d3873143096a2`，该阶段完整47模块验收尚待结束；最终实测结果见最终验收记录和模块矩阵 |
| Clock 运行释放 XCTest 诊断 | 本轮实际 3 例 2 通过、1 失败，原运行 fixture 未清空 DSL +0 返回对象的临时持有；已在首个真实 tick 后排空显式 autoreleasepool，保留生产 tick 及 weak nil / timer 取消 / 无后续 tick 全部断言。[实际失败日志](./work/JobsPodsStability/full/test-JobsClockView-Debug-144344.log)、[ABI 复现](/tmp/jobs-clock-dsl-autorelease-proof/regression.log)。最终实测结果见最终验收记录和模块矩阵 |
| Navigation 空手势实际崩溃修复 | 本轮实际 3 例 2 通过、1 SIGSEGV；真实栈指向 clzPopGesture 调用 nil DSL Block，已同步 ByPods Core、Navigation Support 与旧 Jobs-owned UIKit 分类，保留方向隔离、重复安装和取消恢复断言。[实际崩溃取证](/tmp/jobs-navmgr-actual-crash-evidence.json)。逐字方法的 Mac ABI 回归中原三个边界实际 SIGSEGV11，修复后四场景 exit0；[日志](/tmp/jobs-nav-gesture-proposal/mac-regression.log)。最终实测结果见最终验收记录和模块矩阵 |
| Navigation 测试公开头补齐 | 强化空手势及迟到 Block 断言后的[实际 compile65](./work/JobsPodsStability/full/test-JobsNavigationTransitionMgr-Debug-152852.log) 缺少测试显式声明导入；仅在既有测试 m 增加公开 `<JobsByOCPods/UIViewController+Extra.h>`，保留原 3 例全部断言。FileAccessor 已确认该头公开；沿用实际 UIKit / Pods frontend 参数并重建临时模块缓存的 syntax-only exit0，[记录](/tmp/jobs-nav-test-header-proposal/syntax.json)。没有新增 API、文件或工程引用，最终实测结果见最终验收记录和模块矩阵 |
| Uploading 测试入口编译修复 | [本轮真实 compile65](./work/JobsPodsStability/full/test-JobsUploadingProgressView-Debug-150347.log) 为测试调用未公开的 dismiss selector；只在既有测试 m 声明真实 jobsDismiss 原型并调用原生产 Block，保留重复关闭 / 动画恢复 / 弱宿主断言，追加 owner 释放后的迟到动作。实际 UIKit / Pods frontend 参数 syntax-only exit0，[日志](/tmp/jobs-uploading-fixture-fix/syntax.log)；未改生产 API，两例最终实测结果见最终验收记录和模块矩阵 |
| 显式测试 scheme 与测试接口修正 | 本轮 JobsGetWindow 实际 exit66：头文件 Pod 的 aggregate scheme 没有 test action。runner 现在执行各自 `<Pod>-Unit-Stability`，47 个生成 scheme 都包含真实 NativeTestable；独立 Pod 编译仍用原 scheme。OCDSL 的背景 Block 改为显式 getter 消息，Excel fixture 改用现行点语法工厂，保留释放、可见格和缺失格断言；两份 fixture 的实际 UIKit frontend syntax-only exit0，最终实测结果见最终验收记录和模块矩阵 |
| Excel 空态真实事件补强 | [15:30 真实 XCTest](./work/JobsPodsStability/full/test-JobsOCExcel-Debug-153006.log) 编译、链接成功，2 项中 1 通过、1 失败、0 skip，exit65；空态按钮发送 TouchUpInside 后宿主请求次数为 0。实际入选 BaseButton 工厂只创建实例，onClickBy 只保存回调，没有注册事件。已局部改为现有 onJobsEvent 的原生控件事件注册，保留完整标题 / 说明 / 按钮、弱宿主及未设置回调时重绘。既有 XCTest 在主线程确认空态和唯一真实按钮，依次发送真实事件验证首次请求、重复 reload 后不叠加、替换宿主回调；[诊断与原 SHA](/tmp/jobs-excel-empty-proposal/proposal.json)。旧 Jobs-owned 同源仅保留同步提案，未打断旧工程编译；修复后最终实测结果见最终验收记录和模块矩阵 |
| Tools 独立链接默认值 | 本轮实际 link65 指向 `_DefaultIndex`。Jobs-owned Tools 提供 `NSUInteger` 弱定义默认 0，宿主已有强定义 2 保留；实际 Apple 静态 archive 两次链接 / 运行分别得到 0 和 2，证明单独安装可链接且宿主定义优先。[证据](/tmp/jobs-default-index-link-proof/results.json)。未给测试造同名常量，独立XCTest和完整App的最终实测结果见最终验收记录和模块矩阵 |
| 修复后门禁回归 | 此前代码快照实际通过全部 71 项：静态 23、README 31、进程超时 7、Mach-O 权限 10；均 exit0。实际日志：[静态](./work/JobsPodsStability/full/gate-static-fixtures-20261005-final.log)、[README](./work/JobsPodsStability/full/gate-readme-fixtures-20261005-final.log)、[超时](./work/JobsPodsStability/full/gate-timeout-fixtures-20261005-final.log)、[权限](./work/JobsPodsStability/full/gate-entitlements-fixtures-20261005-final.log)。这组局部门禁不替代每 Pod 与主工程编译 |
| EPERM 超时回收修正 | 真实超时曾因组探测 / 信号 EPERM 抛异常、ensure 再次报错而缺失 receipt；已补权限诊断、仅本次 child fallback 与全部有界 wait，无法领取真实状态时保留 null。原 SHA 核验应用后三个 Ruby syntax0，原 7 个真实进程场景加 4 个明确注入 EPERM、使用真实进程的边界场景共 11 场景实际 exit0；[日志](./work/JobsPodsStability/full/gate-timeout-eperm-final.log)。验证 timeout124、源码75优先和部分 xcresult 拒领，未把权限失败计为已清理；最终实测结果见最终验收记录和模块矩阵 |
| Uploading 初始化缺图实际崩溃修复 | 修正测试入口后两例都实际 SIGSEGV11，栈顶为 initWithFrame:+320；当次 arm64 二进制在 offset `0xd06dfc` 读取 nil 图片返回 Block 的 invoke 地址，随后调用。默认描边现使用视图 tint / 系统蓝，仅图片和缩放结果存在时启用原 pattern；可选 Logo 明确 nullable。保留动画复启 / 弱宿主 / 迟到 Block 断言，并验证默认描边有效；无新增资源或第三方修改。[真实崩溃取证](/tmp/jobs-uploading-init-crash-evidence/crashes.json)、[实际反汇编](/tmp/jobs-uploading-init-crash-evidence/disassembly.log)。最终实测结果见最终验收记录和模块矩阵 |
| Uploading 关闭 Block 持有修正 | [18:06 真实两例](./work/JobsPodsStability/full/test-JobsUploadingProgressView-Debug-180623.log) 1 通过、1 失败：展示 / 关闭 / 重启已通过，弱宿主已释放，但保存 jobsDismiss 后 weakView 非 nil。实际 UIKit frontend AST 确认 free ivar 强 capture 方法 self；仅改三个 ivar 经 Block 内 strongify 后的局部 self 访问，不调用 lazy getter、不改 fixture / API / constructor。真实 Mac ARC 逐字 Block 原版复现保活、修版释放且迟到关闭安全；[日志](/tmp/jobs-uploading-release-proposal/regression.log)、[当前生产 syntax0 / SHA](/tmp/jobs-uploading-release-proposal/applied.json)。旧对应属于 Manual，按边界未修改；最终实测结果见最终验收记录和模块矩阵 |
| 109 Pods Debug/Release | 最终实测结果见最终验收记录和模块矩阵 |
| 全部 iOS XCTest | 最终实测结果见最终验收记录和模块矩阵 |
| 主工程 Debug/Release | 最终实测结果见最终验收记录和模块矩阵 |
| 主工程模拟器冷启动/资源检查 | 最终实测结果见最终验收记录和模块矩阵 |

验收记录包含实际命令、退出码、源码及工程配置 SHA-256、日志和 XCTest 结果包。每个单元执行前后检查源码一致性，文件在编译期间被修改会中止验收；历史通过记录只在指纹一致时复用。XCTest 必须从真实结果包读到实际执行和通过用例，零用例或无法解析不能计为通过。

验收 runner 对每次 Pod / App 构建默认设置 1800 秒、每次 XCTest 命令默认设置 600 秒超时，可用 `--build-timeout` / `--test-timeout` 调整。截止后向本命令独立组发送 TERM，5 秒宽限后尝试 KILL；组探测 EPERM 按仍存在处理，权限失败保留诊断，只允许 fallback 尚未领取状态的本次直接 child。最终实际 `wait2(WNOHANG)` 最多再等 5 秒，领取失败时明确记录 `process_status_collected=false`、实际退出码 / 信号 null 与 PID，不宣称清理成功。超时记录 `timed_out=true`、验证退出 124；源码变化 75 优先，部分结果包和产物不作为成功证据。[命令超时回归](./ScriptsByPods/jobs_pods_stability_verify.rb/Tests/command_timeout_regression.rb) 保留原 7 个真实进程场景，另加 4 个明确注入 EPERM、使用真实进程的边界验证；这不替代XCTest和完整编译验收；最终实测结果见最终验收记录和模块矩阵。

109 份 README 的最终结果由证据校验器回填，默认只预览；单 Pod、回归或主工程任一证据缺失、失败或指纹过期，均拒绝回填：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/update_readme_results.rb \
  --results "$PWD/work/JobsPodsStability/full/results.json"
# 完整验收通过后才写入结果
ruby ScriptsByPods/jobs_pods_stability_verify.rb/update_readme_results.rb \
  --results "$PWD/work/JobsPodsStability/full/results.json" --apply
```

[CI 构建流程](./.github/workflows/build_simulator_app.yml) 已接入逐 Pod Debug/Release、配置/证据门禁回归、Pod XCTest 和主工程 Debug/Release；失败仍上传日志与结果包。打包显式选择主 App 的 `.app`，避免新增测试宿主后误取第一个 AppHost。工作流 YAML 已解析通过，未推送或执行远端 CI。

新 SDK 的首轮测试宿主缺 Scene 生命周期，未计为通过；修复自有 Scene delegate、manifest 及源码引用后，Snowflake 测试真实通过。失败尝试与最后成功记录分别保留，不用产物存在替代构建退出状态。

<a id="original-requirement-completion"></a>
### 2.3、原报告适用项与验收边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

以下逐项对照原评估报告的31个编号与9个条件方向。行号指升级前基线；“实现”与“运行证明”分列，未覆盖情景仍保留，不把当前编译或代表fixture当完整验收。`C-*`仅为原条件表9行的对照标签，不是新增缺陷编号。

| 原编号 / 基线验收或建议行 | 当前实现 | 本轮验证与仍需证据 |
| --- | --- | --- | --- |
| R01 / 80 | 普通析构内核、已有 timer/display link/observer 清理；弱计时目标 | 最终实测结果见最终验收记录和模块矩阵；Marquee启动后、Markdown已加载析构及完整移除组合/压力场景仍需补充证据 |
| R02 / 88 | Markdown存储/加载分离，消除DSL递归 | 最终实测结果见最终验收记录和模块矩阵；有效/缺失文件×全部公开入口的读/渲染次数未全部建立断言 |
| R03 / 96 | 非空slot快照、缺位置删除幂等 | 最终实测结果见最终验收记录和模块矩阵；四侧/全局触感的完整组合仍需宿主覆盖 |
| R04 / 106 | Iconfont普通取消、单次领取、UUID隔离迟到完成；新增真实SDK加载管线fixture | 4项真实SDK管线fixture已落盘，最终实测结果见最终验收记录和模块矩阵；含同资源替换/旧token/late完成/视图释放，实际CDN与缓存仍需集成 |
| R05 / 116 | 仅观察注册，不干预dequeue；任意/同类名reuse nib和真实supplementary/注销fixture | 23:06阶段的ByPods10项是历史基准；最新93df指纹ByPods定向真实12/12通过、零skip，完整all的最终结果见最终验收记录和模块矩阵；storyboard保留实际宿主验收，未采用的现代registration不硬加API，也不冒称已验证 |
| R06 / 124 | 按签名验证数量/ABI、正确打包；实际生产NSInvocation内核局部ASan compile/run0 | 完整Pod/App ASan与泄漏工具仍未完成；10000次带autoreleasepool标量循环不是泄漏检测证明，TSan未执行 |
| R07 / 134 | 锁内Patch层级、保留有效IMP、继承隔离与ABI拒绝；5项真实fixture | 新增继承/兄弟类、同id更新、显式rollbackAll与并行安装/调用/回滚已落盘；最终实测结果见最终验收记录和模块矩阵，不据语法领取通过 |
| R08 / 140,146 | ImageCode存储内核；纯C signal journal；普通完整写/失败保留导入 | 10个Mac脚本与iOS的最终实测结果见最终验收记录和模块矩阵；iOS fatal、磁盘压力和锁屏不是Mac子进程证明 |
| R09 / 152,153,154,155 | 安全pop、真实weak holder、弱reader、共享实例同锁；AppTools2项含并行destroy/旧代有效 | 最终实测结果见最终验收记录和模块矩阵；既有weak_target helper与fixture保留，工厂取消隐式byTarget及9个addGR/addXxxGR保存getter释放后返回nil已由93df指纹ByPods真实12/12定向断言验证；generic显式target/byTarget setter/getter保持，旧foreign scalar getter排除 |
| D01 / 171 | 毫秒/4096序列/回拨拒绝/节点范围，保留旧ID位布局 | Snowflake Debug与Release两配置的最终实测结果见最终验收记录和模块矩阵；多设备节点分配仍是宿主合同 |
| D02 / 181 | service+account、先编码再更新、失败保留、定向删除和旧数据迁移 | 签名宿主的最终实测结果见最终验收记录和模块矩阵；设备锁屏/暂不可用与解锁重试仍需环境验证 |
| D03 / 191 | 事务返回值/SQL错误/回滚与连接所有权，finally只清理 | 真实SQLite和iOS的最终实测结果见最终验收记录和模块矩阵；begin/commit实际故障注入不由正常提交断言代替 |
| D04 / 201 | 路径规范化、owned staging与原子替换，失败保留输入/上次成功结果 | 真实生成器Mac回归的最终结果见最终验收记录和模块矩阵；不改供应商生成器 |
| D05 / 207,211 | 文件真实创建/原子覆盖/排他创建；AES输入/error与空明文合同 | 本批新增四组合、并发完整内容、不可写目录断言；AES向量/错误验证仍按当前Mac/iOSreceipt领取 |
| A01 / 221 | 首次连接nil previous守卫；命令MTU/ACK/matcher/timeout/session清理 | 本批新增首连、ACK错误一次、旧外设ACK、分包/最后ACK门槛；真实多服务/设备互操作仍需真机 |
| A02 / 229 | Video串行生命周期、CF快照/保留与writer/session身份 | CF并发fixture的最终实测结果见最终验收记录和模块矩阵；录制重启/切摄像头/后台/晚权限/writer失败与可播放文件仍需设备 |
| A03 / 239 | record实际BOOL、nil factory清理、会话URL/旧delegate身份隔离 | 初始化失败/真实partial前置及晚回调的最终实测结果见最终验收记录和模块矩阵；权限/路由/中断需设备 |
| A04 / 251 | 标准YTK multipart/GET路径；raw helper映射timeout和cellular | 本批真实agent+NSURLProtocol断言GET、JPEG/参数、timeout/cellular false、error/取消；7个相关m曾仅Clang语法通过，最终XCTest实测结果见最终验收记录和模块矩阵 |
| A05 / 259 | 终态callback在detach前快照、一次派发与同名timer身份过滤 | Timer/Manager fixture的最终实测结果见最终验收记录和模块矩阵；线程/finish次数按真实断言领取 |
| S01 / 269 | 自有inset贡献归还；终态/移除/旧动画generation收口 | 代表fixture的最终实测结果见最终验收记录和模块矩阵；四侧与横向LoadMore的完整矩阵仍需对应集成 |
| S02 / 275 | Began准入、所有终态清理、方向轴/符号/progress、container/finalFrame | 3项导航fixture的最终实测结果见最终验收记录和模块矩阵；全方向反拖/斜拖/分屏场景仍需宿主 |
| S03 / 285 | Suspend weak；每Label独立monitor、外层弱捕获和释放停止 | Bits本身新增2项，双Label独立/单方释放/100轮生命周期的最终实测结果见最终验收记录和模块矩阵；不是100次可见push/present压力证明 |
| S04 / 293 | Stepper统一归一化内核、值/边界/step/UI同步 | 最终实测结果见最终验收记录和模块矩阵；完整极值与valueChanged次数按实际断言覆盖，不能按setter存在认领 |
| S05 / 301 | Splash HTTP/MIME/解码校验、同URL合并、独立取消、原子保留/限量缓存 | 5项fixture与生产Cache/Token Mac的最终实测结果见最终验收记录和模块矩阵；实际404恢复/后台和内存需集成 |
| S06 / 307,311 | Random全uint32区间；独立monotonic/uint64总流量采样、重启基准 | Net新增间隔/restart与真实tick隔离；定量elapsed、长会话/实际接口切换仍缺环境证据；总流量不冒称逐接口数据 |
| S07 / 317 | SDK/运行时LAError映射，保留preflight与主队列reply | 错误映射fixture的最终实测结果见最终验收记录和模块矩阵；真实认证提示、锁定与前后台须设备 |
| T01 / 325,338 | 实际receipt、源码指纹、48个Stability/49次iOS与10个Mac回归 | 完整218Pod/49iOS/10Mac/MainBoth结果见最终验收记录和模块矩阵；编译不代替行为断言 |
| T02 / 346 | 命名bundle、README-only icon排除、独立loader/test nib边界 | 最终.app及重建后Markdown/109README/字体/缺资源回退的审计结果见最终验收记录和外部封包proof |
| T03 / 352 | 已证实重复selector委托唯一canonical实现、显式依赖和门禁 | 已知selector名单不等于全工程category唯一性证明；扩展扫描仍按真实消费渐进 |
| T04 / 358,360,362,364 | 真实FileAccessor/链接消费闭环、无新环/漂移的渐进baseline | 108 helper仍19版本、47既存finding；未宣称统一模板/全面撤宽header，发布metadata仅独立发布时适用 |
| T05 / 372 | 实际required-reason用途、命名privacy bundle与宿主恢复hook | 最终.app实际manifest/源字节审计结果见最终验收记录和外部封包proof；Archive/AppStore门槛仅发布时验证，不冒称已审或被拒 |

| 原条件表方向 / 原行 | 适用性与当前实现 | 验证边界 |
| --- | --- | --- | --- |
| C-Excel / 378 | 需求型优化已选并实现可见复用、冻结列和真实空态按钮 | 逻辑10,000×100/活动label上限fixture的最终实测结果见最终验收记录和模块矩阵；数据数组仍完整持有，不声称零内存 |
| C-WebSocket / 379 | 半开检测已选：nonce pong/deadline、队列与旧socket身份 | 3项确定性fixture的最终实测结果见最终验收记录和模块矩阵；真实断网/恢复/后台半开集成仍缺 |
| C-Scene / 380 | 明确P2已补context优先、完整前台窗口搜索 | 2项选择fixture的最终实测结果见最终验收记录和模块矩阵；iPad双窗口、外屏与顺序变化需宿主 |
| C-Capture / 381 | 明确实验能力/availability与安全降级显示 | 各支持OS/截图/录屏/投屏/后台实际行为仍需设备，不承诺普适防截屏 |
| C-CryptoEnvelope / 382 | 保密/持久化扩展已选：独立认证版本化API与legacy兼容 | 真实Mac向量/篡改/KDF+iOS的最终实测结果见最终验收记录和模块矩阵；旧Manual第三方未覆盖 |
| C-TimeText / 383 | P2定向参数/单位/失败/UTF8/颜色/range合同已补 | Time/String/Rich/Model parser最终实测结果见最终验收记录和模块矩阵，非法输入不能静默变合法值 |
| C-LanguageID / 384 | 语言/bundle同锁+Foundation locale回退；DeviceID失败不漂移 | ByPods新增后台通知main、并发读写、实际hostbundle/缺key；regional locale需真实语言包和启动条件，不能用空AppHost冒称通过 |
| C-UI / 385 | 按实际使用升级17类组件及nil/迟到/空态/复用合同 | 已选fixture的最终实测结果见最终验收记录和模块矩阵；scene/动态字体/无障碍/可见压力仍需host smoke，不做无据全量重写 |
| C-Thin / 386 | 薄/空Extra没有强制扩功能依据，保留上游信任及bundle fallback | 按独立编译和原能力验收，不用虚构功能/测试提高升级数量 |

T04原题与L358–364明确要求渐进消费核查，并未要求盲目重写全部Support/helper。当前已治理实证反向链接与已知重复selector，并保留精确baseline；统一模板/生成版本标识、逐项缩窄宽泛头搜索和后续完整selector扫描仍属后续治理，不写成已经全部完成。

硬件与诊断边界仍按本文第六节：真实BLE/麦克风/相机/生物识别、设备锁屏Keychain、网络/接口切换、多窗口和可见页面压力不能由Mock或编译代替。已跑的C UBSan和局部真实NSInvocation内核ASan不等于全量Pod/App ASan；本轮全量ASan/TSan及泄漏诊断均未完成。TSan在支持的模拟器/Mac目标使用，不能写“真机TSan已通过”。

## 三、模块结果矩阵 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

指纹：`8218cf43acbefcfd911b375dea847ca9b0461944b08d2fbbcd6954cf47ce350f`；状态：ALL_REQUIRED_RECEIPTS_VERIFIED。

| Pod | Debug | Release | XCTest 完成记录 / 实际 case | Mac |
| --- | --- | --- | --- | --- |
| AFSecurityPolicyExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| BRPickerViewExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| FDFullscreenPopGesture | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| FMDatabaseExtra | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | PASS |
| FSCalendarExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| FileFolderHandleTool | PASS | PASS | Debug: PASS (3/3，fail 0，skip 0) | NOT_APPLICABLE |
| GKCustomNavigationBarExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| HTMLDocumentExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| HXPhotoManagerExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| HXPhotoViewExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| IQKeyboardManagerExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JXCategoryViewExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsAPIs | PASS | PASS | Debug: PASS (5/5，fail 0，skip 0) | NOT_APPLICABLE |
| JobsAppDoor | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsAppIconRibbon | PASS | PASS | 无 Stability | PASS |
| JobsAppTools | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsBasePopupView | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsBaseUI | PASS | PASS | Debug: PASS (3/3，fail 0，skip 0) | PASS |
| JobsBioKit | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsBitsMonitor | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsBlock | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsBluetooth | PASS | PASS | Debug: PASS (5/5，fail 0，skip 0) | NOT_APPLICABLE |
| JobsByOCPods | PASS | PASS | Debug: PASS (12/12，fail 0，skip 0) | NOT_APPLICABLE |
| JobsCallBackBlockDSL | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsClass | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsClockView | PASS | PASS | Debug: PASS (3/3，fail 0，skip 0) | NOT_APPLICABLE |
| JobsCountdownBtn | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsCryptography | PASS | PASS | Debug: PASS (3/3，fail 0，skip 0) | PASS |
| JobsCustomView | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsDebug | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsDebugPanel | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsDeviceInfo | PASS | PASS | 无 Stability | PASS |
| JobsDropDownListView | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsFiltrationView | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsFuseAnimation | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsGestureLock | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsGetWindow | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsHotLabel | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsIconfont | PASS | PASS | Debug: PASS (4/4，fail 0，skip 0) | NOT_APPLICABLE |
| JobsImageNumberView | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsImageRotation | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsLanMgr | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsLinkageMenuView | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsLoadingImage | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsLocker | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsLuckyEnvelopeRain | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsMakes | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsMarqueeView | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsMenuView | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsModel | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | PASS |
| JobsModelDSL | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsMonitorNetwoking | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsNavBar | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsNavigationTransitionMgr | PASS | PASS | Debug: PASS (3/3，fail 0，skip 0) | NOT_APPLICABLE |
| JobsNetWorkTools | PASS | PASS | Debug: PASS (3/3，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCAudioRecorder | PASS | PASS | Debug: PASS (4/4，fail 0，skip 0) | PASS |
| JobsOCCalendar | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsOCComment | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsOCCountryCodeCtrl | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsOCDSL | PASS | PASS | Debug: PASS (5/5，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCDefs | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsOCExcel | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCGraphicCaptcha | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsOCKeyboardMgr | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCMarkdown | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCNumberStepper | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCOpen | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsOCPatch | PASS | PASS | Debug: PASS (5/5，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCProtocols | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsOCRefresher | PASS | PASS | Debug: PASS (3/3，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCRuntimeKits | PASS | PASS | Debug: PASS (4/4，fail 0，skip 0) | PASS |
| JobsOCSearcher | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsOCSkeletonView | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCSnowflake | PASS | PASS | Debug: PASS (4/4，fail 0，skip 0); Release: PASS (4/4，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCSplash | PASS | PASS | Debug: PASS (5/5，fail 0，skip 0) | PASS |
| JobsOCTimer | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsOCTimerMgr | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCTools | PASS | PASS | Debug: PASS (4/4，fail 0，skip 0) | PASS |
| JobsOCUILabelScrolling | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCVideoRecorder | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsOCWebSocket | PASS | PASS | Debug: PASS (3/3，fail 0，skip 0) | NOT_APPLICABLE |
| JobsPresentTransitionMgr | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsProgressBar | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsRandomUtils | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsRichTextUtils | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsScreenCapture | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsStringUtils | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsSuspend | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| JobsTabBarCtrl | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsTimeUtils | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsUploadingProgressView | PASS | PASS | Debug: PASS (2/2，fail 0，skip 0) | NOT_APPLICABLE |
| JobsViewNavigator | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsViewPush | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| JobsWallet | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| LMJDropdownMenuExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| MGSwipeTableCellExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| MJRefreshExtra | PASS | PASS | Debug: PASS (6/6，fail 0，skip 0) | NOT_APPLICABLE |
| RACExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| ReachabilityExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| SRWebSocketExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| SYSAlertControllerExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| SZTextViewExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| TFPopupExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| This | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| UIBaseTextFieldDSL | PASS | PASS | Debug: PASS (1/1，fail 0，skip 0) | NOT_APPLICABLE |
| WHToastExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| YTKNetworkExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| ZFPlayerExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |
| ZMJCellExtra | PASS | PASS | 无 Stability | NOT_APPLICABLE |

实际核验汇总：`{"pod_build_commands":218,"test_commands":49,"test_cases":135,"passed_test_cases":135,"skipped_test_cases":0,"mac_harnesses":10,"app_builds":2}`。

本表从完成 receipt 生成；缺项、超时、source drift、缺真实 process status、无完整 xcresult/最终 summary、失败或 skip 均不会被计为通过。

## 四、兼容迁移与范围例外 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

认证加密使用新的 `JobsAES2:` envelope，旧 AES 解密兼容保留，认证失败不降级尝试旧格式；调用方主动迁移新写入。Keychain 按 service+account 分身份，旧身份迁移显式选择，失败不删原条目。蓝牙历史返回值只表示提交；需要硬件 ACK/业务响应时使用新明确完成合同。

按 OC 双侧维护约定，同步旧工程可维护的对应源码与新自有辅助类，保留旧工程集成结构及导入形态。旧工程只位于 `Manual` / `PodsManual` 的 Clock、FMDB、导航/上传，以及旧 AES/AESCipher、非 Jobs Swizzling 等明确排除。新工程升级和编译不代表这些排除的第三方旧实现已升级；不创建同名 override 掩盖边界。

旧侧 `NSObject+Extras/NSObject+Extras.m` 的同名 plist 入口来自 AaltoChen，保留第三方作者边界；本轮仅同步 Jobs-owned `NSObject+Extra.m` 和 `NSObject+PopViewToLogOut.m`，不新增同名覆盖分类。新旧 PopView 内容相同，Jobs-owned plist 方法精确比对通过。

真实独立 [ByPods XCTest 链接日志](./work/JobsPodsStability/full/test-JobsByOCPods-Debug-140747.log) 随后指出 Navigation Support 的 plist 方法仍引用 `_OBJC_CLASS_$_FileFolderHandleTool`，因此仅修 Core 不足以闭合该链接边界。本轮同步升级 Jobs-owned Navigation Support 方法与头，并保留旧 Navigation Manual 排除。旧主工程 Debug 则实际因 `JobsOCWebSocketClient.m:9` 的 `<SRWebSocketExtra/SRWebSocket+Extra.h>` 无法找到而 compile65（[实际错误日志](/tmp/jobs-oc-old-stability-20261005/run-20261005T035930Z/final-20261005T044851Z/Debug.log:4654467)）：该路径属于新 Pod 形态，旧侧恢复 `#import "SRWebSocket+Extra.h"`，复用现有本地头和 Debug/Release 3rdCore 搜索路径。没有新增旧 Pod 依赖或改第三方；后续真实独立链接与旧App独立重编结果见最终验收记录和模块矩阵，[源码/内核/指纹记录](/tmp/jobs-pods-network-upgrade.md)。

## 五、资源与隐私声明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

16 个实际使用 required-reason API 的 Pod 挂载独立 `<Pod>Privacy.bundle/PrivacyInfo.xcprivacy`，主 App 配置自身 manifest。UserDefaults 为自身 App 偏好 `CA92.1`，文件时间戳为自身沙盒缓存 `C617.1`，monotonic time 为经过时间 `35F9.1`。声明范围遵循 [**Apple API reasons**](https://developer.apple.com/documentation/bundleresources/app-privacy-configuration/nsprivacyaccessedapitypes/nsprivacyaccessedapitypereasons)。提供通用文件路径接口不代表调用方任意用途已获相同理由覆盖；最终产品必须按真实使用再次核验。

JobsBlock、JobsByOCPods、JobsNavigationTransitionMgr 的文档 `icon.png` 保留为文档文件，排除运行时资源复制。最终 `.app` 中 manifest 和 bundle 的实际打包结果见最终验收记录和外部封包proof。

当前配置有 17 个 primary privacy bundle（上述 16 个 required-reason API Pod 加 JobsBluetooth 的空清单），另有 JobsOCSplashResources / JobsOCToolsCore 两个资源命名空间内的相同声明副本；[期望清单](/tmp/jobs-final-privacy-expectations.json) 来自实际 FileAccessor。BaseUI、GestureLock、NavigationTransitionMgr、OCDefs 的自有裸 `.xcprivacy` 已从普通 resources 范围排除，具名 bundle 保留，避免自建裸资源相互覆盖宿主声明。

宿主声明仍由主工程维护。Podfile 的 `protect_jobs_host_privacy_manifest` 在 `post_integrate` 为实际生成的宿主 resources.sh 尾部追加唯一 owned marker：资源复制完成后恢复 Root 源文件完整字节，`ACTION=install` 且 `SKIP_INSTALL=NO` 时同时恢复 install 目录；缺 Root 源明确 exit1。该 hook 不修改供应商源或其 bundle。上表的 8 个临时布局真实 subprocess 已验证这一段行为，完整 `.app` 中的最终声明、字体及Markdown资源审计见最终验收记录和外部封包proof；Archive仍只在独立发布验收时认领，[完整局部回归说明](/tmp/jobs-host-privacy-hook-regression-report.md)。

旧 OC 工程按直接集成形态，将三类自有使用理由合并到宿主 `启动配置/JobsPrivacy/PrivacyInfo.xcprivacy`，显式挂载主 App Resources；没有复制 Pod 目录或替换第三方声明。新旧产物都需在最终编译后核验实际打包内容。

## 六、仍需环境集成验收的内容 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前注入与 Mac 内核回归不访问真实麦克风、相机、蓝牙、Keychain 或外网。以下设备与宿主合同仍需实际集成验收：

| 设备能力 | 最小验收矩阵 |
| --- | --- |
| 蓝牙 | 真实外设 MTU/分包、withResponse ACK、withoutResponse 流控、notification ready、匹配/不匹配响应、断连/换设备与迟到 ACK、允许重试的协议幂等 |
| 音频 | 首次授权/拒绝、prepare/record 失败、真实文件可播放、系统中断、路由/耳机变化、锁屏、停止/取消/快速重启；与宿主其它音频协调共享 AudioSession |
| 视频 | 前后摄切换、麦克风/相机权限晚回、立即停/重启、finish/cancel/后台竞争，旧帧/完成不能污染新文件；设备性能/内存与实际可播放结果 |
| 生物识别 | 未录入/不支持/锁定、用户/系统取消、App 切后台及当前硬件的认证提示；构造 LAError 不替代真实认证 |
| 截屏保护 | 每个支持 OS/设备检验 protectionAvailable、截图/录屏/投屏/后台快照与降级显示；私有 Canvas 行为不作为通用安全边界 |
| DeviceID/Keychain | 当前签名 entitlement、首次写/再次读、锁屏暂不可用、解锁后重试与既有身份不漂移；注入 OSStatus 不证明系统权限真实可用 |
| Open/邮件/外部应用 | 配置有/无邮件账户、真正 MFMailCompose 展示/关闭回调、已安装外部应用与 URL scheme / canOpenURL 前提；模态竞争与 owner 离开 |

设备流量采样还需实际 Wi-Fi/蜂窝接口与长期计数验证；Crash 需 iOS fatal 生命周期、磁盘压力及锁屏集成；Splash 需实际设备内存/后台恢复验收。HTTP/multipart 服务响应、WebSocket 半开/网络恢复和缓存错误响应可在可控服务器与模拟器做网络集成，但本组 transport 替身没有执行这些集成。

诊断工具应区分运行环境：真机使用 [**Address Sanitizer**](https://developer.apple.com/documentation/xcode/diagnosing-memory-thread-and-crash-issues-early?preferredLanguage=occ) 或适用诊断；[**Thread Sanitizer**](https://developer.apple.com/documentation/xcode/diagnosing-memory-thread-and-crash-issues-early?preferredLanguage=occ) 在支持的模拟器 / Mac 目标运行，不能用于运行在 iOS/iPadOS 等设备上的 App。原评估报告保留升级前记录；不把其中“真机配 ASan/TSan”的简写视为当前可执行验收命令，本轮未完成全量 Sanitizer 验收。

模拟器编译/回归证明代码、链接与可模拟状态合同；真实蓝牙 ACK、相机/录音权限、录制中断、Keychain 签名权限、多窗口手势和实际性能需设备环境验证。Excel 只缩减可见格渲染，业务数据数组仍完整持有；不声称百万格数据载入零内存。原有手工第三方、高扇出聚合入口与 helper 差异采用显式依赖/基线门禁。静态检查保留 47 个既有 Core 公开头到私有 Support 头的精确边界关系，以及 108 份 helper 的 19 个归一化版本；它们是明确记录的兼容债务，不代表已统一模板或完全撤除宽泛头搜索。新出现的重复 selector、依赖环、配置漂移和隐私声明不匹配不能借用此基线放行。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
