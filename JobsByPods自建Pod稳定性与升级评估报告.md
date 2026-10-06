# JobsByPods 自建 Pod 稳定性与升级评估报告

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

**结论：有明确升级必要，优先修复崩溃、数据完整性和异步完成语义；现有模块划分、DSL 和大量已有防御应继续保留。** 此次发现的关键问题集中在少数高风险入口，并不支持将全部 Pod 推倒重写。

审阅日期：**2026-10-05**。对象：当前工程 `JobsByPods` 中除 `ManualByOCPods@Pods` 外的目录。依据是当前工作树，包括已有未提交修改和新建的 `JobsDebugPanel`；不是某个已发布版本。本报告只做审阅和建议，未修改任何 Pod 源码或配置。

这是一轮覆盖全体模块的配置盘点、入口扫描和高风险流程深读。它能给出可执行的升级清单；未逐行审完约 39 万行原始文本，也未进行整工程构建或真机验收。“没有列出缺陷”不能解释为已经证明安全。

## 一、范围、规模与判断标准 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 1.1、盘点结果 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 结果 | 解释 |
| --- | ---: | --- |
| 排除 Manual 后的一级目录 | 112 | 其中 109 个实际 Pod，3 个空占位目录 |
| 自建 podspec | 109 | 全部成功求值 |
| 原始源码文件 | 3,050 | `h/m/mm/c/cpp/swift`，包含头文件及 Support 副本 |
| 原始源码行数 | 391,615 | 不代表独立可执行代码量或审阅覆盖率 |
| 配置实际匹配的 source_files | 3,035 | 按当前 [**CocoaPods**](https://cocoapods.org/) FileAccessor 枚举 |
| public headers | 1,149 | 每个 Pod 内未发现同 basename 的公开头碰撞 |
| 自建 Pod 之间的依赖边 | 658 | 汇总 subspec 后按根 Pod 去重；未发现环 |
| 自建范围 XCTest 源文件 / test_spec | 0 / 0 | 未发现自动化回归基线；Demo 和构建不能替代状态/错误断言 |
| JobsPodspecKit.rb | 108 份 | 归一化模块名后仍有 19 个文本版本，部分资源差异属于有意配置 |

三个空目录为 `JobsAppEnvironmentRibbon@Pods`、`JobsSwiftComment@Pods`、`JobsSwiftSearcher@Pods`。没有 podspec 或实际实现，应视为规划占位，不按已交付能力评价。`JobsAppIconRibbon` 是构建期生成器，其不配置常规源码编译属于设计，不应误判为漏编译。

原有 `PodspecDependencyReport` 统计包含 Manual 范围，与本报告 109 / 658 的统计口径不同。这里未用仓库总数替代自建范围。

### 1.2、证据和优先级 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- **P1｜优先修复**：常见入口崩溃、内存/ABI 风险、数据串值或丢失、全局侵入及关键异步合同失效。P1 不代表已经在线上观测到事故。
- **P2｜应安排修复**：条件性公开 API 缺陷、状态不一致、资源泄漏、错误映射失效，或未发现当前调用但启用即会触发的问题。
- **条件升级**：由规模、分发方式或业务需求决定；先测量或定义契约，再引入实现复杂度。
- **续审**：本轮仅扫描或局部抽查，尚不足以给安全结论，也不足以要求强制重写。

正文逐项标明触发条件、源码位置、建议和验收。竞态项只确认源码存在竞争窗口；标为“小型复现”的检查仅验证相应语言或算法机制，不冒充 iOS 模块集成测试。

使用现有 CodeGraph 定位后回读当前源码。旧 `graphify-out` 生成于 2026-06-04，指向旧工程路径且包含第三方范围，未作为当前缺陷证据，也未重新初始化索引。`ManualByOCPods@Pods`、根 `Pods` 和保留他人版权的内嵌实现不作为默认改造对象；上游行为只用官方文档或对应版本源码核对。

## 二、最值得先做的升级 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 顺序 | 模块 / 问题 | 必要性 | 为什么先做 |
| --- | --- | --- | --- |
| 1 | JobsIconfont、JobsOCMarkdown、JobsOCRefresher、JobsMarqueeView、JobsProgressBar、JobsClockView、JobsOCTimerMgr | P1 | 首次调用、加载和释放路径即可触发 nil Block、递归或弱引用 fatal |
| 2 | JobsOCRuntimeKits、JobsOCPatch、JobsByOCPods 的 collection 注册 | P1 | 类型/IMP 生命周期及全局交换可把局部错误扩散到宿主与其他组件 |
| 3 | JobsOCSnowflake、JobsBaseUI Keychain、FMDatabaseExtra、JobsAppIconRibbon | P1 | ID 碰撞、账户互相覆盖、事务合同失真和条件性删除输入资源 |
| 4 | JobsOCTools 的 ImageCodeView / CrashLog | P1 | 默认初始化递归；启动安装的 signal handler 使用不安全运行时调用 |
| 5 | JobsBluetooth、JobsOCVideoRecorder、JobsOCAudioRecorder、JobsAPIs | P1 | 提前宣布成功、旧会话污染新会话、CF 竞争、上传请求体错误 |
| 6 | Refresher 终态、转场取消、Suspend / BitsMonitor 释放、文件 / 随机 / BioKit | P2 | 消除遗留状态、泄漏和边界错误 |
| 7 | 回归测试、资源 bundle、category 唯一所属、依赖/模板一致性、隐私声明 | 工程基线 | 让修复能长期保持，减少下一轮生成式改动把同类问题带回 |
| 8 | Excel 虚拟化、WebSocket 心跳闭环、多 Scene 专项、加密格式迁移 | 按需求安排 | 有明确升级空间，但应以业务规模、协议和兼容性为边界 |

以上按失败影响和改造收益排序，不按 Pod 大小排序。基础层优先控制改动范围：`JobsBlock` 有 102 个自建直接消费者，`JobsOCDefs` 有 100 个，`JobsOCDSL` 有 60 个，`JobsMakes` 有 53 个；这些数字只统计本轮 109 个 Pod。小改动也应配调用方回归，避免批量改名或一次性调整全部链式接口。

## 三、崩溃、运行时和全局影响面 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 3.1、R01｜P1：析构清理仍进入创建弱引用的 Block getter <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 模块 | 当前源码证据 | 路径 |
| --- | --- | --- |
| JobsMarqueeView | dealloc L63–65 → jobsStop getter L144–150 | [JobsMarqueeViewCore.m](./JobsByPods/JobsMarqueeView@Pods/Core/JobsMarqueeView/JobsMarqueeViewCore/JobsMarqueeViewCore.m) |
| JobsProgressBar | dealloc L52–54 → stopAutoProgress getter L107–117 | [JobsProgressBar.m](./JobsByPods/JobsProgressBar@Pods/Core/JobsProgressBar/JobsProgressBar/JobsProgressBar.m) |
| JobsOCRefresher | proxy dealloc L386–387 → removeObservers getter L408–418 | [UIScrollView+JobsOCRefresher.m](./JobsByPods/JobsOCRefresher@Pods/Core/JobsOCRefresher/UIScrollView+JobsOCRefresher/UIScrollView+JobsOCRefresher.m) |
| JobsOCMarkdown | dealloc L90–92 → webView getter L294–296 → jobsMakeWebView L264–267 | [JobsOCMarkdownView.m](./JobsByPods/JobsOCMarkdown@Pods/Core/JobsOCMarkdownView.m) |
| JobsClockView | dealloc L53–54 → jobsStop getter L326–329 | [JobsClockView.m](./JobsByPods/JobsClockView@Pods/Core/JobsClockView/JobsClockView.m) |
| JobsOCTimerMgr | dealloc L135–137 → teardownAppStateObservers / stopAndRemoveAll，L654–657 / L523–526 | [JobsTimerMgr.m](./JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr/JobsTimerMgr.m) |

这些 getter 在返回 Block 前执行 `@jobs_weakify(self)`。当对象已经进入析构，再向它注册弱引用会进入 Runtime fatal 路径；直接取得 IMP 执行 getter 仍会执行其内部弱注册。TimerMgr 默认单例较少销毁，但公开实例创建未禁止，问题不能因为单例用法而忽略。[Apple objc4 弱引用实现](https://raw.githubusercontent.com/apple-oss-distributions/objc4/main/runtime/objc-weak.mm)提供了该行为的实现依据。

**建议：**对外保留 Block 门面，内部建立普通私有清理方法；dealloc 只调用该内核和访问 ivar。Markdown 清理 `_webView`，不经过会创建视图/Block 的 getter。不要把对正常存活子对象调用 Block 的代码机械列为此类缺陷。

**验收：**未启动即释放、启动后释放、停后重复停、视图移除、仅挂单侧刷新、Markdown 未加载/已加载分别覆盖；weak sentinel 归 nil，观察者和计时源释放，没有 weak fatal。此项由源码与 Runtime 机制确认，尚未做 iOS 动态回归。

### 3.2、R02｜P1：Markdown 的公开加载入口形成递归环 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsOCMarkdownView.m](./JobsByPods/JobsOCMarkdown@Pods/Core/JobsOCMarkdownView.m) L105–126：`byDocument` → `loadDocument` Block → 双参数加载方法 → 再次 `byDocument`。直接调用任一加载入口都可能进入同一环，真正读文件和渲染尚未到达就会栈溢出。

**建议：**“存储 document”和“开始加载”各归一个内核；加载内核直接更新真实存储，不反调会再次开始加载的 DSL。保留现有 WeakMessageHandler 和 JSON/base64 payload 防御。

**验收：**byDocument、loadDocument、双参数方法和 reloadDocument 对有效/不存在文件分别调用，读文件、渲染及错误回调各只发生应有次数，document 保持当前对象。

### 3.3、R03｜P1：Refresher 对未挂载位置执行 nil Block <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[UIScrollView+JobsOCRefresher.m](./JobsByPods/JobsOCRefresher@Pods/Core/JobsOCRefresher/UIScrollView+JobsOCRefresher/UIScrollView+JobsOCRefresher.m) L50–53 声明四侧 slot 可空；L464–475 的 tick 却无条件执行四个 `handleWithScrollView`。仅配置下拉头，KVO L420–426 触发 tick 后就会执行空 footer Block。L706–713 的 remove 对未挂载 slot 执行 `detach()` 也一样。

Objective-C 向 nil 发消息的语义不能保护“取出 nil Block 后执行”的第二步。

**建议/验收：**迭代非空 slot 快照；不存在位置的删除幂等。覆盖仅头、仅尾、仅左右、头尾、四侧及只配置全局触感而未挂组件的组合，反复滚动和 remove 均无崩溃。

### 3.4、R04｜P1：Iconfont 首次加载、取消与 token 析构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsIconfont.m](./JobsByPods/JobsIconfont@Pods/Core/JobsIconfont/JobsIconfont.m) L359–361 对全新 imageView 不存在的 oldToken 执行 `oldToken.jobsCancel()`；L429–431 的无 token 取消同样缺守卫。首次加载尚未到占位图/下载就进入空 Block 调用。

独立问题：L154–157 的 `cancel` 返回 void，而 L171–173 的析构把其 IMP 当成返回 Block 的函数，并调用所谓返回值，违反 ABI；cancel 又进入 L159–168 的弱捕获 getter，叠加 R01 根因。

**建议：**无 token 的替换/取消应幂等；真实 void 方法按真实签名调用；析构使用普通清理内核。保持本地占位、缓存和当前加载身份校验。

**验收：**首次加载、从未加载即取消、重复取消、连续更换资源、释放 imageView/token、取消后晚到完成；旧加载不能覆盖新资源。

### 3.5、R05｜P1：全局 UICollectionView 自动注册会破坏有效 nib / storyboard <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[UICollectionView+RegistrationTracking.m](./JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m) L19–40 在 `+load` 交换注册/出队。L43–56 只记录 registerClass；L59–84 对“未被本分类记录”的 identifier 自动用 `NSClassFromString` 注册 class，没有追踪 nib 或 storyboard。

正常注册 nib 且 reuse id 为 `profile-card` 时，自动 class 为 nil，可能注销原注册；若 id 恰为类名，则把 nib 换成纯 class，丢失 IBOutlet。它影响全进程 collectionView，包含其他业务组件。[Apple 注册 API](https://developer.apple.com/documentation/uikit/uicollectionview/register%28_%3Aforcellwithreuseidentifier%3A%29-3vaho)说明相同 identifier 的注册替换及 nil 注销语义。

**建议：**优先限定到显式 Jobs 入口/实例；未知注册不改写。若保留追踪，区分 class、nib、注销和现代 registration，不能把“未观察到”当作“未注册”。

**验收：**任意/同类名 reuse id 的 nib、IBOutlet、storyboard、supplementary、注销重注册及 CellRegistration，宿主和第三方行为保持正确。

### 3.6、R06｜P1：DynamicInvoke 把任意返回值和参数当 id <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[NSObject+DynamicInvoke.m](./JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+DynamicInvoke/NSObject+DynamicInvoke.m) L285–305 的 property 在非零返回长度时只提供一个 id 缓冲区。arm64 的 CGRect 返回约 32 字节，会写入 8 字节局部量；count 等标量则被解释为对象地址。L97–100 也未按签名校验参数数量/编码，统一用 id 地址传参；L118–150 的 primitive buffer 未释放。

**建议：**按 NSMethodSignature 编码做数量和类型分派，NSNumber 解包标量、NSValue 解包结构体；未知类型明确失败。对象返回处理 ARC 所有权，所有临时缓冲区可靠释放，禁止“任意 property 都是对象”的隐式假设。[Apple getReturnValue 文档](https://developer.apple.com/documentation/foundation/nsinvocation/getreturnvalue%3A)要求缓冲区容量匹配实际返回长度，并提醒拷贝不负责 ARC。

**验收：**对象、BOOL、NSInteger、double、CGRect、void，参数少/多/错型；ASan 查越界，循环标量调用查泄漏。未在本轮执行原 Pod 内存诊断。

### 3.7、R07｜P1：Patch 无序回滚可恢复已释放 IMP <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsOCPatchMgr.m](./JobsByPods/JobsOCPatch@Pods/Core/JobsOCPatchMgr/JobsOCPatchMgr.m) L97–149 只按 identifier 管补丁，回滚恢复 originalIMP 后 imp_removeBlock；rollbackAll 按字典 keys 顺序处理。

同一 class+selector 装 A 再装 B：B 的 originalIMP 为 A 的 Block IMP。先回滚 A 释放 IMPA，再回滚 B 会把已释放 IMPA 装回 selector，形成悬空实现。另有继承方法直接改到父类 Method、未校验签名却统一装入无参数对象返回 Block 的边界问题。现有 Demo 的无参 NSDictionary 签名是匹配的，不能说 Demo 已发生 ABI 错误。[Apple imp_removeBlock](https://developer.apple.com/documentation/objectivec/1418482-imp_removeblock?language=objc)说明会释放对应 Block 拷贝。

**建议：**按 class+selector 管层级，禁止不受支持的覆盖或强制 LIFO；回滚核验实际 IMP，确保仍被记录或执行中的 IMP 不提前释放；继承方法先建立本类 override；只接受经校验的签名，序列化安装/回滚。

**验收：**A/B 任意顺序、rollbackAll、同 id 覆盖、继承/兄弟类隔离、拒绝不支持签名及明确的并发契约。

### 3.8、R08｜P1：旧 ImageCodeView 初始化递归；CrashLog 的 signal 路径不安全 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[ImageCodeView.m](./JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView/ImageCodeView.m) L68–94 → byBgColor L55–61 → setBgColor L173–176 → byBgColor，默认 init / nib setup 都会递归。修好后还需处理 L128–152 的整数尺寸取模，零/小尺寸可能出现除零。新 `JobsOCGraphicCaptcha` 已有字符和空 rect 防御，不能套用旧类的结论。

**建议/验收：**setter 写存储和真实 backgroundColor，DSL 单向调用 setter；init、nib、两种设置入口只更新一次，尺寸 0/1/正常、空验证码均可绘制或安全早退。

[JobsOCCrashLogCenter.m](./JobsByPods/JobsOCTools@Pods/Core/CrashLog/JobsOCCrashLogCenter/JobsOCCrashLogCenter.m) L664–689 的 signal handler 创建 NSString/NSDate，取单例和 Block，再到 L407–433 的 Foundation 编码/文件路径操作。这些分配和消息发送不满足 async-signal-safety；当前 [AppDelegate](./JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+UIApplicationDelegate/AppDelegate+UIApplicationDelegate.m) L16 已安装监控。若信号打断 Runtime/malloc 内部锁，handler 再进入同类调用可能死锁或二次异常；本轮未复现具体死锁。

**建议：**致命 signal 中只写事先准备的定长 C 记录和文件描述符，下次启动再用 Foundation 整理；明确信号 handler 共存和系统 crash 保留策略。[Apple DTS 技术讨论](https://developer.apple.com/forums/thread/113742)明确指出 signal handler 不能运行 Objective-C/Swift。

**验收：**在独立测试进程验证信号最小记录、系统 crash、高频分配和已有 handler 共存，不在普通主工程会话直接制造崩溃。

### 3.9、R09｜P2：尚未确认当前调用的运行时入口，也应在启用前修好 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 入口与证据 | 条件和影响 | 建议 / 验收 |
| --- | --- | --- |
| [SafeTransition.m](./JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m) L227–237 | `ty_popToRootViewControllerBySetControllersAnimated(YES)` 重调自身，无终止条件；NO 空栈也可能构造 nil 数组元素。未发现活跃调用者 | 真正执行根栈切换；YES/NO × 空/单/多 VC，完成与取消均收尾 |
| [NSObject+Swizzling.m](./JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m) L102–136 | weak-association 原样接受 caller 的关联策略：ASSIGN 不保证归零，RETAIN 会强持有；共享动态子类捕获首个 owner/key，自定义 dealloc 不转发父类；未发现实际调用 | 用 retained holder 内真实 weak，避免 object_setClass 模拟；双 owner/key、释放先后及继承类回归 |
| [NSObject+Class.m](./JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m) L87–100 | 保存 readModelPropertyValueByOrder Block 后 receiver 释放，仍调用 `self.propertyList()` | strongify 后先守卫 receiver；延迟执行和属性类型回归 |
| [JobsAppTools.m](./JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.m) L27–44 | destroy 无同步地重置 dispatch_once token；未确认业务启用，属生命周期/线程风险 | 保留则建立独立状态/锁和销毁契约；否则收窄永久单例 API |

这些入口的必要性来自具体实现，不代表当前页面已经运行失败。对 nil 的防线应放在执行 Block 的调用层和 getter 内适当位置；只在 Block 内判断 self，保护不了 nil receiver 根本返回不出 Block 的情况。

## 四、数据完整性与失败真实性 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、D01｜P1：Snowflake 毫秒截断、序列回卷和节点边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsOCSnowflake.m](./JobsByPods/JobsOCSnowflake@Pods/Core/JobsOCSnowflake/JobsOCSnowflake.m) L60 先把秒 cast 成整数再乘 1,000，实际分辨率退化为秒。L67–72 的 12 位序列回卷只等待 1 ms，仍可能处于同一截断秒，产生重复 ID；L74–79 的时钟回退也未保证最终时间严格满足策略。

L43–49 又允许节点值 32，再用 5 位 mask 变成 0；0 / 32 节点别名，而且 NSAssert 不能承担 Release 参数校验。

**小型算术验证：**固定输入秒值 1791191234.875，现表达式损失 875 ms；固定截断秒下生成 4,097 个序列，只有 4,096 个唯一编码，第一个与回卷后的编码相等。此处验证算法，不是运行原 Pod。

**建议：**先乘再 cast；注入可测试时钟，序列耗尽等待真正下一时间单位；时钟回退明确拒绝/等待/逻辑时钟策略，避免只 sleep 一次；Release 校验节点 0…31 和时间位宽。多进程/设备唯一性还依赖节点分配，不能由本地锁自动保证。

**验收：**冻结/回退时钟、同时间单位超 4,096 次、边界节点、并发和编码解码。切勿直接修改位布局使旧 ID 无法兼容。

### 4.2、D02｜P1：Keychain 的 account 不参与身份，失败保存先删旧值 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsKeychainHelper.m](./JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m) L80–101 保存/读取仅校验 account；基础 query L137–143 用 service 作为实际 kSecAttrAccount。相同 service 保存 A 后保存 B 会先删除 A，读取 A/B 都得到最后的 B。

通用保存 L50–77 在编码前删除旧条目，secure archive 失败后还可能将 nil 写入字典，既丢旧值又不能返回完整错误。

**建议：**query 明确包含实际 service+account；先成功编码，再 Update/必要时 Add，失败保留旧数据并传递编码错误/OSStatus。旧 account=service 数据需制定兼容读取和迁移，不能整体擦除服务条目。

**验收：**双 account 保存/读取/删除互不影响，失败保留旧值，锁屏暂不可用不等于“账号不存在”，旧数据迁移可回退。

### 4.3、D03｜P1：FMDB 事务的 finally 改写结果，SQL 失败不触发回滚 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[FMDatabase+Manager.m](./JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m) L82–103：catch 调 rollback 并准备返回 YES，finally 仍调用 commit，最后 return NO 覆盖之前返回；begin/commit/executeUpdate 的失败也未统一检查。`executeUpdate` 返回 NO 不等于抛异常，可能把前面部分成功写入提交。L30–37 的更新助手会关闭同一连接，若从事务 callback 使用也会破坏连接所有权。

**已做语言复现：**相同 try/catch/finally 返回结构输出 `rollback_return=0`。仅证明 finally 覆盖返回，不证明已回滚数据被重新提交；回滚后再 commit 通常可能失败，本轮没有运行实际 FMDB 数据测试。

**建议：**明确事务“成功/回滚/错误”返回契约；finally 只清理资源；检查每次 SQL 和 begin/commit；一个序列化队列拥有连接，事务内助手不自行 close。保留失败 NSError 和具体 SQL 上下文，日志不写敏感参数。

**验收：**第二条约束失败时第一条也不落库；正常提交、业务主动回滚、begin/commit 失败、嵌套/误用连接各有明确结果和一次清理。

### 4.4、D04｜P1：AppIcon 生成器条件性删除输入目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsAppIconRibbonGenerator.swift](./JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift) L75–84 推导输入/输出；L143–158 先删除已有输出目录，再从输入拷贝 Contents.json。没有 source/output 相同检查。

有效自定义组合：输入 `AppIcon-Debug.appiconset`、prefix `AppIcon`、configuration `Debug`，两者会是同一目录。于是删除原资源后复制失败。路径计算已验证相等，**没有执行删除型复现**。

**建议：**规范化路径并拒绝相同、符号链接别名及不允许的重叠；只替换生成器拥有的输出；暂存目录全部渲染成功后再替换，失败保留输入和上次有效结果。

**验收：**相同路径立即错误且无写入；符号链接别名、无权限、输入缺图、渲染中断和输出已有有效图都保护原始资源。

### 4.5、D05｜P2：文件接口返回成功但没有创建目标；AES 失败先执行空 Block <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[FileFolderHandleTool.m](./JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m) L93–104：只保证父目录后，overwrite=NO 就直接返回 YES，目标不存在也未创建。

**建议/验收：**仅目标已存在且不覆盖才跳过；覆盖原子写，无覆盖考虑排他创建；传完整错误。目标存在/不存在 × 覆盖/不覆盖四组合，父路径为文件、并发、无权限不能假成功。已有常规 write 的 atomically:YES 应继续保留。

[AES.m](./JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AES/AES.m) L11–20 在检查 cipher error 前调用 `encryptedData.base64StringFromData()`，失败返回 nil 时先崩溃；解密 L28–31 用空串表示失败，和合法空明文混淆。

**建议/验收：**先校验输入/data/error，再编码；成功空值与失败分离。覆盖 nil、故障注入、空串、错误密码、非法 Base64、截断/篡改和旧向量。保留第三方 CommonCrypto 实现版权与边界，先改 Jobs 包装层。

## 五、异步队列、会话隔离与完成合同 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、A01｜P1：蓝牙“命令成功”早于 ACK / 业务响应，旧特征未清理 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsBluetoothManager.m](./JobsByPods/JobsBluetooth@Pods/Core/JobsBluetoothManager/JobsBluetoothManager.m) L155–160 写入后立即 completion(emptyData,nil)，没有实现 command 声明的 timeout/retry/priority/responseMatcher 闭环。L184 的 didDisconnectPeripheral 回调只清 peripheral，未清 characteristic；L187–194 还按首个服务发现宣布 ready，而非核对完整 profile。

**建议：**明确“提交写入”“写 ACK”“业务匹配响应”的不同完成语义，真实 command 成功由匹配响应决定；断开/失败/新连接开始清特征和待处理命令；校验 peripheral+session 代次；落实 MTU 分包/背压/超时，仅在幂等前提下重试。若暂不做命令队列，应收窄公开承诺。

**验收：**A→B、重连、多服务乱序、无特征、ACK 错误、晚到响应、超时及大包；每个 completion 恰好一次，旧会话不能操作新状态。Mock 成功不能代替真实外设验收。

### 5.2、A02｜P1：视频回调与主线程清理共享 CF 状态存在竞争窗口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[CaptureManager.m](./JobsByPods/JobsOCVideoRecorder@Pods/Core/JobsOCVideoRecorderCaptureManager/JobsOCVideoRecorderCaptureManager.m) L88、L250–255 把 sample buffer 回调放采样队列；[JobsOCVideoRecorderVC.m](./JobsByPods/JobsOCVideoRecorder@Pods/Core/JobsOCVideoRecorderVC/JobsOCVideoRecorderVC.m) L682、L776–810 读写格式描述，而 UI 启停 L391–424 和后台/离开 L537–562 清理共享状态，没有一致的队列所有权。CF 对象 retain/release 成对不等于跨队列使用安全。

**建议：**一个串行会话所有者管理 recording/finishing/格式描述/writer 身份；回调携带 session generation；使用前保证对象在该队列或快照内存活；主线程只提交命令和更新 UI。

**验收：**录制立即停止重启、相机切换、后台、权限晚回、writer 失败；真机配 ASan/TSan 或相应诊断，旧帧不能写入新文件。此项是源码竞争风险，未在本轮复现实际 use-after-free。

已有 sessionQueue、writerQueue、单槽背压、相机切换回滚和后台停止基础值得保留，不需要重写完整录制系统。

### 5.3、A03｜P1：音频启动结果忽略，旧 recorder 完成可污染新录音 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsOCAudioRecorder.m](./JobsByPods/JobsOCAudioRecorder@Pods/Core/JobsOCAudioRecorder.m) L151–170 忽略实际 record BOOL，发布开始后直接 YES。L195–202 delegate 未核对 recorder 身份，使用共享 currentURL/keepFile；stop A 后立即 start B，晚到 A 回调可能清空 B 状态、停用 AudioSession 或处理 B 文件。

**建议：**状态覆盖 Starting/Recording/Stopping，不只 isRecording；实际 record 成功才宣布开始；每次 session 保存自己的 URL/保留意图，delegate 校验身份；串行化生命周期和中断/编码失败。

**验收：**record 返回 NO、拒绝权限、立即 stop→start、来电/设备切换和编码失败；旧回调不碰新文件，完成恰好一次。启动 BOOL 是确定缺口；晚到竞争未做硬件复现。

### 5.4、A04｜P1：图片上传继承自定义 JSON request，绕过 multipart <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsBaseApi.m](./JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m) L35–53 返回非空 custom request；[UploadImageApi.h](./JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.h) L45 继承该实现，[UploadImageApi.m](./JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.m) L52–66 返回 POST 并提供 constructingBodyBlock。默认参数为字典，custom body 会是 JSON，而非 JPEG multipart。

锁定的 [**YTKNetwork 3.0.6 官方源码**](https://raw.githubusercontent.com/kanyun-inc/YTKNetwork/3.0.6/YTKNetwork/YTKNetworkAgent.m)中 custom 分支跳过标准构建，后者才执行 multipart Block。结论限定为 URL 有效、构建完成时的请求体路径，未实际访问服务端；示例空 URL 不作为现网故障。

[YTKBaseRequest+Extra.m](./JobsByPods/YTKNetworkExtra@Pods/Core/YTKRequestExtra/YTKBaseRequest+Extra/YTKBaseRequest+Extra.m) L14 的 raw request 也未完整映射 timeout / cellular 约束。

**建议：**普通 API 用上游标准 serializer / headers / arguments；只为确需 raw request 的请求单独覆写；上传走标准 multipart 或完整显式构建，失败传递图像编码错误和最终请求约束。

**验收：**NSURLProtocol 拦截断言 boundary、JPEG part、参数、GET 编码、超时与蜂窝属性；单独验证取消/错误，不把上游已有取消和 HTTP 校验误报为缺失。

### 5.5、A05｜P2：TimerMgr force finish 先移除 entry，完成回调被自身过滤 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsTimerMgr.m](./JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr/JobsTimerMgr.m) L367–391 的 fireOnceAndRemove 先从 entries 移除，再 fireOnce；L223–227 的 finish 依赖 weakEntry，L608–617 又要求 current entry 与 expected 相同。[JobsTimer.m](./JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m) L741–771 异步派发 onFinish。等回调执行，旧 entry 已不在字典，完成被丢弃，但方法此前返回 YES。

**建议：**在 detach 前快照 terminal callback，独立且恰好一次派发；正常 tick 仍保留旧 entry 身份过滤，新同名 timer 不能被旧终态删除。不要为“修完回调”取消已有防陈旧事件保护。

**验收：**fireOnceAndRemove、正常到期、stop/remove、同名立即重建和 scope 取消；对各合同明确 finish 次数及线程，旧终态不触碰新 timer。timer 内核现有代次、弱代理及 GCD suspend 平衡继续保留。

## 六、组件状态、资源恢复和边界输入 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 6.1、S01｜P2：Refresher 的 NoMoreData / remove / Failed 收尾不完整 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

同 [Refresher 文件](./JobsByPods/JobsOCRefresher@Pods/Core/JobsOCRefresher/UIScrollView+JobsOCRefresher/UIScrollView+JobsOCRefresher.m) L219–306 正常 begin/end 成对增减 inset；L349–356 的 NoMoreData 直接改状态、L111–118 的 detach 直接移除，未归还刷新中的 inset；L679 的 Failed 仅取 `[slot fail]` Block 而未调用。

**建议：**记录本组件贡献的 inset，结束/失败/无更多/移除统一释放；避免覆盖宿主或其他组件的原始 inset；generation 防旧动画完成改新状态。

**验收：**非零初始 inset，四侧分别 begin→Failed/remove；NoMoreData 覆盖 footer 及配置为 LoadMore 的横侧，不要求 Refresh 角色接受无更多状态。最终 inset 精确回到基线；快速重挂无累加、旧 view 或陈旧 completion。

### 6.2、S02｜P2：导航转场终止被方向门禁拦截，系统取消可能 finish <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsNavigationTransitionMgr.m](./JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m) L98–129 将所有手势状态放入实时方向判断内；起手正确后反向/斜向结束可能不进入终止分支，interactiveTransition 残留。Cancelled 又按 0.3 进度阈值决定 finish，混淆取消语义；L190–194 用 screen 尺寸代替 container。

**建议/验收：**只在 Began 做准入；已开始的 session 必须处理全部终止，Cancelled/Failed 无条件 cancel+清理；横向用 x/width、纵向用 y/height 并按方向符号归一化和夹紧 progress，现 L101–104 所有方向都用 x/width；使用 container/finalFrame。四方向反拖、斜拖、系统取消、连续转场和分屏分别验收。未在本轮实跑“页面卡住”；当前 `JobsPresentTransitionMgr` 已有 container 与取消恢复，不套用此缺陷。

### 6.3、S03｜P2：weak 属性实际强持有；网速 Label 被单例回调保留 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[UIView+SuspendView.h](./JobsByPods/JobsSuspend@Pods/Core/UIView+SuspendView/UIView+SuspendView.h) L36 的 vc 声明 weak，[实现](./JobsByPods/JobsSuspend@Pods/Core/UIView+SuspendView/UIView+SuspendView.m) L43–51 却 retain 关联。宿主持有 view 时构成 controller→view→controller 环；手写 setter 不会自动遵守头文件 weak。

[JobsBitsMonitorSuspendLab.m](./JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab/JobsBitsMonitorSuspendLab.m) L24–49 / L98 在已经保存的外层 callback 内才 weakify，不能解除外层对 self 的捕获；[JobsNetWorkTools.m](./JobsByPods/JobsNetWorkTools@Pods/Core/JobsNetWorkTools/JobsNetWorkTools.m) L12 的单例 copy onUpdate 保留 Label，dealloc 没机会执行。单回调槽还不能支持两个独立订阅。

**建议：**Suspend 用真正 weak holder，不能改 ASSIGN 裸指针；BitsMonitor 外层捕获前 weakify，token 管订阅，最后订阅者离开停采样。若复用弱关联实现，应先避开 R09 中有缺陷的旧 helper。

**验收：**push/pop、present/dismiss 100 次，weak sentinel 释放；两个 Label 独立订阅，移除一个不影响另一个，controller 提前释放返回 nil。

### 6.4、S04｜P2：NumberStepper 的公开 DSL 绕过归一化状态内核 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsOCNumberStepper.m](./JobsByPods/JobsOCNumberStepper@Pods/Core/JobsOCNumberStepper/JobsOCNumberStepper.m) L27–60 的 byValue/min/max/step 只调合成 setter；L128–164 的 configure/setBounds/setValue:sendActions: 才做范围和 UI 同步。

配置 5 / 0…10 后 byValue(100)，model 变 100，显示/按钮可能仍为旧值；byStepValue 负值也绕过正步长防线。普通按钮路径已有整数解析、夹紧和正步长溢出保护，问题在公开入口未共享这些保护。

**建议/验收：**所有入口进入同一个状态内核，内部存储不反调 DSL；明确 valueChanged 语义。超界、上下界反序、零/负/极值 step，数据/文本/按钮及回调一致，无新 setter↔DSL 递归。

### 6.5、S05｜P2：开屏图片错误响应成为长期有效缓存，接口恢复也不重载 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsOCSplashMediaCache.m](./JobsByPods/JobsOCSplash@Pods/Core/JobsOCSplash/JobsOCSplashMediaCache/JobsOCSplashMediaCache.m) L92–135 只看 NSError/文件非空，忽略 HTTP response；[JobsOCSplashVC.m](./JobsByPods/JobsOCSplash@Pods/Core/JobsOCSplash/JobsOCSplashVC/JobsOCSplashVC.m) L390–404 缓存命中后 image 解码 nil 仍返回。404 HTML 可被落盘并长期命中。

**建议：**校验 2xx、内容类型和实际媒体解码，坏缓存失效；同 URL 合并下载、原子替换；失败保留旧有效数据，远端图先显示打包本地图。复用现有视频路径的串行、去重、退避和校验能力，并设缓存容量/有效期。

**验收：**404→200、200 HTML、空/截断文件及同 URL 并发，恢复后可自动显示；不能因为新下载失败删除最后的有效资源。

### 6.6、S06｜P2：随机区间极值发生溢出/除零；网速按错误时间采样 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsRandomUtils.m](./JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils/JobsRandomUtils.m) L38–57 用 int 相减和 `y-x+1` 取模；INT_MIN…INT_MAX 是合法输入却触发未定义行为。摘取原函数的 clang UBSan 检查已报告两处 signed overflow 和一处 division by zero。

**建议/验收：**用 64 位计算区间，无偏抽样覆盖完整 2^32 范围；反序/单值/负值/极值全部在界内。保留 L10–15 已有的单 border INT_MIN 保护。

网速方面，[JobsNetWorkTools.m](./JobsByPods/JobsNetWorkTools@Pods/Core/JobsNetWorkTools/JobsNetWorkTools.m) L69 接受 interval，但 L93 固定 1 秒计时，L131 除配置 interval；2 秒配置导致数值减半，0 有非法分母。L103–105 static 基准未在重启清理，L134 类型恒为 Wi-Fi。[JobsMonitorNetwoking.m](./JobsByPods/JobsMonitorNetwoking@Pods/Core/JobsMonitorNetwoking/JobsMonitorNetwoking.m) L57 / L80 使用 32 位累计和未防回绕差分。

**建议/验收：**统一实例采样器，以单调时钟实际 elapsed 为分母、64 位累计、区分接口、重启重置；保留旧门面。验证 0/负/非默认 interval、长会话、重启和 Wi-Fi/蜂窝切换，不只看 Label 能更新。

### 6.7、S07｜P2：BioKit 把枚举当预处理宏，细分结果失效 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsBioKit.m](./JobsByPods/JobsBioKit@Pods/Core/JobsBioKit/JobsBioKit.m) L161–206 使用 `#if defined(LAErrorBiometry...)`；当前 SDK 的 LAError 是 enum，不是这些同名宏，case 被预处理删掉，未录入/锁定/不可用等落入通用 Failed。

**建议/验收：**按 SDK 版本和运行时可用性处理，避免同值别名重复 case；人工构造各 LAErrorDomain/code 断言映射，再做真机提示流。已有前置 canEvaluatePolicy、两 policy 和主队列 reply 保留。

## 七、让升级长期有效的工程基线 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 7.1、T01｜先建立小而有价值的回归套件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本轮自建范围没有发现 XCTestCase、XCTest import 或 test_spec。现有 [build_simulator_app.yml](./.github/workflows/build_simulator_app.yml) 提供构建/打包流程，没有 test 或模拟器冷启动冒烟步骤；本轮未检查历史 CI 执行结果。

建议按故障机制建设测试，而不是给每个 setter 补形式化测试：

| 第一批回归 | 核心断言 |
| --- | --- |
| 生命周期 | 创建/启动/停止/释放，弱引用归 nil，无观察者/计时源残留 |
| 类型与运行时 | 支持编码、缓冲长度、补丁层回滚、nib 注册不被改写 |
| 数据 | ID 不重复，账户隔离，失败事务原子，文件创建真实，生成器不删输入 |
| 异步 | 取消、断开、重入和晚到事件；终态一次，旧会话不碰新状态 |
| UI 状态 | 单侧刷新、inset 归还、转场取消、公开 DSL 与显示一致 |
| 集成冒烟 | 当前 Demo 冷启动、打开重点页面、空数据/服务不可用与重复进出 |

支持依赖注入：时钟、队列/调度、网络、蓝牙 transport、录制 factory 和持久化失败都能替换，避免只有连接真实设备才能测错误。Sanitizer 先覆盖 runtime/CF/生命周期；UI 自动化只覆盖关键流程，不替代可快速重复的内核断言。

修复一个问题就固化一个原失败路径，再进入下一批。构建通过之后仍需终态和释放断言，编译器不能发现“返回成功但没有做成”。

### 7.2、T02｜资源用独立 bundle，文档图片不混入运行时 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本轮匹配到不同内容的 `Resource/icon.png`，分别位于 `JobsBlock`、`JobsByOCPods` 和 `JobsNavigationTransitionMgr`。当前生成的宿主 resources.sh 同时拷贝这些路径（Debug L140、L142、L205），存在落入主 bundle 同名文件的覆盖/冲突风险；三个文件 SHA-256 不同。本轮未执行完整打包，不能声称已确认最终覆盖赢家。

**建议：**真正运行时资源进 Pod 命名 bundle，loader 明确查该 bundle；仅供 README 的 icon/截图从 resources 排除。先扫描资源消费者，再改归属，避免直接改名导致加载失效。官方 [CocoaPods resource_bundles 说明](https://guides.cocoapods.org/syntax/podspec.html#resource_bundles)也建议独立 bundle 防碰撞。

验收同宿主集成、各 Pod 单独集成和资源缺失回退；检查实际 .app 内资源及加载结果，不能只看 glob 配置。这里读取根 Pods 的生成脚本只用于集成证据，没有审阅或改动第三方实现。

### 7.3、T03｜一个 class + selector 只归一个实现 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[JobsBlock 的 byObjBlock](./JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.m) L52–61 与 [JobsCallBackBlockDSL](./JobsByPods/JobsCallBackBlockDSL@Pods/Core/NSObject+CallBackInfoByBlock+DSL/NSObject+CallBackInfoByBlock+DSL.m) L21–30 同时实现 NSObject.byObjBlock，且 receiver 消失后的守卫不同。多个 category 同 selector 的加载结果不能作为稳定的兼容合同。

建议建立 category selector 唯一所属清单；委托一个规范实现，其余只声明/依赖或提供确有必要的不同接口。验收单独/同时引入及存储 Block 后 owner 释放。后续再扫描 Core/Support 副本、主题 hook 和 swizzle 组合；不要仅凭文件名相同就删除实现。

当前每 Pod 内公开头 basename 检查为 0 碰撞，说明此前头文件边界整理已有成果；它不等价于全进程 selector 不冲突。

### 7.4、T04｜依赖和配置用实际消费闭环，渐进收口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

内部根依赖无环是好的基础。大量共用基础层依赖不自动等于错误；应结合各 subspec 真实 import、链接符号和资源加载确认依赖是否必要，避免只按 graph 边数做“瘦身”。

边界审计 dry-run 给出 38 个 Core→Support 相关头候选、51 处 import、34 个可处理候选文件及 4 个人工审阅候选；都是后续核查入口，未自动移动或改写。**Support 存在本身不是 bug**，应检查它是否确为本 Pod 专属、依赖方向及公开范围。

108 份 JobsPodspecKit.rb 经模块名归一化得到 19 个版本；不少差异来自各 Pod 的资源需求。建议统一维护模板/生成规则和版本标识，明确允许差异，CI 检查漂移，仍保留各 Pod 独立使用所需文件；不要简单改成依赖当前父工程的中央路径。

已有 broad HEADER_SEARCH_PATHS / non-modular 放宽应逐个验证最小集成后收口，先治理真实越界 import，避免一次移除兼容配置导致大面积构建断裂。只在计划独立发布时补 source/tag、homepage、版本和许可证闭环；本地 example.local 元数据不属于当前运行崩溃。

### 7.5、T05｜发布前补真实 required-reason API 声明并验证包内产物 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

自建范围只找到 [JobsBluetooth PrivacyInfo.xcprivacy](./JobsByPods/JobsBluetooth@Pods/Resource/PrivacyInfo.xcprivacy)，其 accessed APIs 数组为空；宿主源码与工程引用未发现对应隐私清单。与此同时，[JobsDebugPanelManager.m](./JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanelManager/JobsDebugPanelManager.m) L132 / L207 使用 standardUserDefaults，[FileFolderHandleTool.m](./JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m) L148 / L155 读取文件时间。

建议按实际用途审查 UserDefaults、文件时间等 required-reason APIs；结合宿主构建和独立分发方式，填写真实适用理由并确保资源打包。不要把空模板当作已经完成声明，也不要给每个 Pod 机械复制同一代码。[Apple UserDefaults 文档](https://developer.apple.com/documentation/foundation/userdefaults)及[required-reason API 说明](https://developer.apple.com/documentation/bundleresources/describing-use-of-required-reason-api)是核对依据。

验收以最终 archive 的 manifest、汇总报告和实际调用相符为准。本轮未生成 archive 或访问 App Store Connect，不能据此声称已遭拒审；发布门槛应在上线前复核。

## 八、有升级空间，但应按需求决定 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 模块 / 方向 | 已见依据 | 升级边界与验收 |
| --- | --- | --- |
| JobsOCExcel：大表虚拟化 | [JobsOCExcelView.m](./JobsByPods/JobsOCExcel@Pods/Core/JobsOCExcelView/JobsOCExcelView.m) L126–141 / L253–342 全量重建全部格，每格 label+约束，数据格有 gesture | 先定义支持规模，测 100/1,000/10,000 行。10,000×20 约 200,020 个 label、800,080 条约束、200,000 手势是源码结构估计，非实测 OOM；需要大表时做可见区域复用/增量，保留缺格和索引守卫 |
| JobsOCWebSocket：pong deadline | 已有 workQueue、旧 socket 身份过滤、手动取消、退避和主线程回调；心跳仅发 ping | 长连接确需半开检测时加匹配 pong/超时及 app 生命周期策略；connect URL 命令也统一队列，断网/恢复/主动断开验证 |
| JobsGetWindow：多 Scene 基座 | [window.h](./JobsByPods/JobsGetWindow@Pods/Core/window/window.h) L42–61：第一后台 scene 记 fallback，第二后台 scene 可提前 break，未到后面的前台；L101–105 直接取 firstObject | 属明确 P2；调用方 windowScene 优先，全局回退先完整搜前台再选。iPad 双窗口、多个后台+前台、外屏与顺序变化验证 |
| JobsScreenCapture：保护能力定位 | 使用 UITextField 内部 CanvasView / firstSubview fallback | 作为系统版本实测的实验能力，不能承诺普适防截屏；明确失败可用性，保留现有主线程捕获、相册授权和 NSError |
| JobsCryptography：密文格式迁移 | [AESCipher.m](./JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m) L10 固定 IV，L27–37 CBC+PKCS7，无认证标签 | 若用于保密/持久化，安排版本化认证加密、合适 nonce/IV 和密码派生；明文长度、篡改拒绝和旧数据迁移需定义。可参考 [Apple AES.GCM](https://developer.apple.com/documentation/cryptokit/aes/gcm)，但须适配当前最低系统和 OC 接口，不静默替换旧协议 |
| JobsTimeUtils / JobsStringUtils / JobsRichTextUtils | formatter 参数、秒/毫秒契约、非法 UTF8/nonnull、short 输出语义、underline color 类型与 range guard 有补强空间 | 排入 P2 定向清单；先固定参数、失败和范围合同。空富文本 probe 本轮未抛异常，不写成“空串必崩”；按具体入口验收 |
| JobsLanMgr / JobsDeviceInfo | 全局语言快照与后台读取；持久 ID 失败/暂不可用语义 | 明确线程和错误合同，避免 Keychain 暂不可用造成身份漂移；语言按 locale 层级回退，保留缺 bundle 回退 |
| 复杂 UI 组件 | 弹窗、登录、菜单、键盘、导航/抽屉、列表等主要做入口/局部扫描 | 后续按真实使用频率验证多次配置/复用、空态重载、取消、离屏停止、scene、动态字体及无障碍。没有实测前不以“优化性能”名义全面重写 |
| 薄 Extra / 空实现 | AFSecurityPolicyExtra 未发现关闭信任/域名校验；This 与 FSCalendarExtra 为极小/空主体；LoadingImage 已有 bundle fallback | 暂无强制扩大实现的依据。只补真实输入/上游升级契约，不为提高“升级数量”强加功能 |

UI 组件的查询、网络和业务状态可归宿主，不能因组件自身没有 API 请求就认定违背前端回退规则。需要数据展示的实际 Demo/宿主流程再验收服务端优先、本地演示回退、完整空态和重载入口。

## 九、实施路线与完成标准 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 阶段 | 工作范围 | 完成标准 |
| --- | --- | --- |
| 第一批：止崩与保数据 | R01–R08、D01–D04；每项围绕最小内核修复 | 原触发路径有可重复回归；默认/失败/释放路径通过，旧数据/资源不被破坏 |
| 第二批：异步与状态 | A01–A05、S01–S07、R09、D05、多 Scene | 每个会话终态一次，旧回调隔离，失败真实传播，重复启停/退出恢复基线 |
| 第三批：工程护栏 | T01–T05，优先高扇出 Pod 与当前实际消费者 | 最小集成、资源/selector/依赖检查、关键测试接入现有 CI；发布产物可核验 |
| 第四批：能力/规模升级 | 大表、心跳、加密格式、复杂 UI 深审 | 有业务目标和设备基线，改造后可证明收益，兼容/迁移明确 |

不建议一次把 109 个 Pod 全部重构，也不建议批量替换 Jobs 的点语法。先让公开 DSL 单向委托可靠内核；析构走无弱注册清理；异步由统一队列/会话身份拥有状态；每次修复都防止同根因回归。

本报告没有给出工时承诺：部分问题可以局部修复，蓝牙协议、密文迁移和 CF/硬件回归取决于真实使用场景。每批应以验收结果收口，不以“改了多少文件”收口。

## 十、已执行验证与结论限制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 检查 | 已执行结果 | 能说明什么 / 不能说明什么 |
| --- | --- | --- |
| Ruby 语法 | 218 个自建 .podspec / .rb 全部 ruby -c 成功 | 配置语法有效，不等于 ObjC/Swift 构建通过 |
| CocoaPods 求值 | 1.17.0 下 109 个 Specification.from_file 成功，658 内部根边、0 环 | 当前声明能解析；未执行 pod install / spec lint / 依赖下载 |
| FileAccessor | 3,035 个源码匹配、1,149 个 public header、每 Pod 内 basename 冲突 0 | 实际配置的匹配结果；不能替代 module map / linker / 宿主验证 |
| 边界审计 | `ruby ScriptsByPods/pod_boundary_audit.rb/pod_boundary_audit.rb --dry-run`：改文件 0 / 改 import 0 | 只取得后续核查候选，未自动重排 Core/Support |
| 原随机函数片段 | clang -fsanitize=undefined -O0：两处 signed overflow、一处 division by zero | 复现原算法边界 UB；默认 recover exit 0 不表示通过 |
| Foundation 控制流 harness | `rollback_return=0` | 验证 finally 覆盖 catch 返回；没有连接 SQLite/FMDatabase |
| Snowflake 算术推演 | 875 ms 被截断，固定秒 4,097 次仅 4,096 个唯一编码 | 验证数学触发条件；未运行原 Pod 的并发生成 |
| AppIcon 路径推导 | 指定 Debug 组合 source==output | 验证输入删除风险的条件；没有执行删除或生成器 |
| 外部语义 | 核对当前 SDK LAError enum、YTK 3.0.6 和 Apple/CocoaPods 官方资料 | 避免误报 enum/multipart/Runtime 机制，不替代集成测试 |
| 文件边界 | 新增此根报告；原有 tracked diff 摘要保持一致 | 没有修改源码、README、podspec，未提交、推送 |

未执行：整工程 [**Xcode**](https://developer.apple.com/xcode) 构建、模拟器冷启动、iOS XCTest、录音/录像真机、实际外设命令、HTTP 拦截集成、真实事务故障注入、全量 Sanitizer 或发布归档。因此，递归/空 Block/类型错误的结论来自可闭合源码链；录制竞争和具体设备行为明确保留运行验证边界。

此前 AI 反复打磨已经带来明显基础：timer 代次/弱代理与 suspend 平衡、视频背压和切相机回滚、WebSocket 串行/旧连接过滤、GraphicCaptcha 空尺寸与字符防御、LoadingImage 本地 bundle fallback、Stepper 正常交互的夹紧/溢出守卫、PresentTransition 取消恢复，以及 DebugPanel 的 DEBUG/Scene 隔离。下一轮应围绕这些可靠内核补齐公开入口和失败终态，而不是抹掉既有成果。

## 十一、109 个实际 Pod 的逐项覆盖与必要性 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

**覆盖标记：S = 配置/文档/入口扫描或少量抽查；D = 表中指定关键流程深读；E = 极小主体全文阅读。D/E 都不代表整个 Pod 的每个文件逐行审完。** 每个实际 Pod 均完成配置盘点；源码深度在下表单独列出。未发现独立高优先级问题的扫描项保留“续审”，不写成“已稳定”。

源码数是原始文件盘点，包含头和 Support 副本，不代表编译单元数。优先级是该模块本轮最重要发现或后续重点。

| Pod | 原始源码数 | 源码审阅深度 | 升级必要性 / 依据 |
| --- | ---: | --- | --- |
| [AFSecurityPolicyExtra](./JobsByPods/AFSecurityPolicyExtra@Pods/) | 3 | E 全读薄封装 .m | 低；只转发三种 pinning 构造，未设置 allowInvalidCertificates/关闭域名校验，无凭据表明 TLS 漏洞；可补证书资源缺失/轮换的调用方验收。 |
| [BRPickerViewExtra](./JobsByPods/BRPickerViewExtra@Pods/) | 9 | S | 续审；薄适配与样式配置，按上游实际版本验证 public contract |
| [FDFullscreenPopGesture](./JobsByPods/FDFullscreenPopGesture@Pods/) | 9 | S | 续审；本地手势适配，来源版权与私有运行时边界应单列，不因根目录位置推定可重写上游 |
| [FMDatabaseExtra](./JobsByPods/FMDatabaseExtra@Pods/) | 3 | D 全读全部核心 .m/.h | P1，高，D03；事务结果、连接所有权和串行访问先补；硬编码学生表 insert/delete/query 为示例，应与正式通用入口分层。 |
| [FSCalendarExtra](./JobsByPods/FSCalendarExtra@Pods/) | 3 | S | 暂缓；Core 分类为空（12 行实现），扩功能须有实际需要 |
| [FileFolderHandleTool](./JobsByPods/FileFolderHandleTool@Pods/) | 3 | D 重点：创建/覆盖、bundle 迁出、读写、属性与图片/视频入口抽查 | P2，中高，D05；nil 内容抛异常与 NSError 风格不一致，建议统一可恢复错误。普通 write 有原子写，不宜报告成全模块非原子。 |
| [GKCustomNavigationBarExtra](./JobsByPods/GKCustomNavigationBarExtra@Pods/) | 69 | S | 续审；标题模型/view 适配，检查 nullable titleView 与主题/字体 |
| [HTMLDocumentExtra](./JobsByPods/HTMLDocumentExtra@Pods/) | 3 | S | 续审；38 行解析/文本适配，可先做空输入/无正文回归 |
| [HXPhotoManagerExtra](./JobsByPods/HXPhotoManagerExtra@Pods/) | 3 | S | 续审；29 行工厂，生命周期主要由上游 manager 承担 |
| [HXPhotoViewExtra](./JobsByPods/HXPhotoViewExtra@Pods/) | 3 | S | 续审；17 行基于 manager 的工厂，优先 manager 可空合同 |
| [IQKeyboardManagerExtra](./JobsByPods/IQKeyboardManagerExtra@Pods/) | 3 | S | 续审；57 行配置适配，确认与 JobsOCKeyboardMgr 同时启用策略 |
| [JXCategoryViewExtra](./JobsByPods/JXCategoryViewExtra@Pods/) | 27 | S | 续审；基础/标题/图/数字和自定义 cell 多种适配，优先数组数量一致与复用 |
| [JobsAPIs](./JobsByPods/JobsAPIs@Pods/) | 69 | D 重点：JobsBaseApi、自定义 request、UploadImageApi、RegisterApi、IP API、URL 环境入口 | P1，高，A04；HTTP GET 参数/JSON 构建与错误传播需一并验证。RegisterApi URL 为空属于未完成示例，不能当现网失败。 |
| [JobsAppDoor](./JobsByPods/JobsAppDoor@Pods/) | 50 | S + D 析构候选 | 续审；复杂两风格与公共输入件，RAC disposable 已清理，未完整审阅登录状态机 |
| [JobsAppIconRibbon](./JobsByPods/JobsAppIconRibbon@Pods/) | 1 | D 生成器路径和失败替换 | P1，D04；允许输入输出别名导致删除输入，优先加路径保护及暂存替换。 |
| [JobsAppTools](./JobsByPods/JobsAppTools@Pods/) | 13 | S 单例创建/销毁及公共入口抽查 | 条件性/P2：destroy 重置 dispatch_once 的生命周期/线程契约，尚未确认调用；先约束使用者。 |
| [JobsBasePopupView](./JobsByPods/JobsBasePopupView@Pods/) | 75 | S | 续审；模型驱动弹窗基座，优先多次配置/展示收尾合同 |
| [JobsBaseUI](./JobsByPods/JobsBaseUI@Pods/) | 275 | D 深查 JobsKeychainHelper；抽查基础对象入口 | 必要/P1：D02 account 隔离失效和失败前删除；补查询身份/错误与迁移契约。 |
| [JobsBioKit](./JobsByPods/JobsBioKit@Pods/) | 3 | D 全读核心 .m，核对 SDK LAError.h | P2，中高，S07；取消句柄/上下文管理可后续扩展，不影响此次错误映射修复。 |
| [JobsBitsMonitor](./JobsByPods/JobsBitsMonitor@Pods/) | 3 | D 全读核心 .m 与 nettools 回调链 | P2，中高，S03/S06；释放和多订阅先修，箭头/排版是后续小项。 |
| [JobsBlock](./JobsByPods/JobsBlock@Pods/) | 11 | D Block 类型体系、IMP helper、回调存取深查 | 必要/P2：与 JobsCallBackBlockDSL 的 NSObject.byObjBlock 重复实现；依赖广，先固定唯一实现与 ABI 合约。 |
| [JobsBluetooth](./JobsByPods/JobsBluetooth@Pods/) | 13 | D 全读 manager、profile、command，核对 demo 调用 | P1，高，A01；目前真实设备协议闭环明显落后于 API 声明，Mock 成功不足以验收。 |
| [JobsByOCPods](./JobsByPods/JobsByOCPods@Pods/) | 475 | D 深查 UICollectionView 注册、导航 transition；抽查集合/关联对象等高风险 UIKit/Foundation category | 必要/P1：R05 全局注册破坏 nib；R09 导航公开 API 递归；后续收口全局交换范围。 |
| [JobsCallBackBlockDSL](./JobsByPods/JobsCallBackBlockDSL@Pods/) | 3 | D NSObject callback setter getter 深查 | 必要/P2：同名 selector 冲突和延迟 Block 在 weak receiver 消失后的空 Block 调用。 |
| [JobsClass](./JobsByPods/JobsClass@Pods/) | 4 | S runtime 类/属性列表与值读取 getter 抽查 | 必要/P2：延迟 readModelPropertyValueByOrder 的 nil Block 边界；配合 runtime 类型测试。 |
| [JobsClockView](./JobsByPods/JobsClockView@Pods/) | 3 | D 启停/析构 | P1，R01；析构取得含 weakify 的 jobsStop getter，采用普通清理内核。 |
| [JobsCountdownBtn](./JobsByPods/JobsCountdownBtn@Pods/) | 3 | S 入口/依赖/生命周期候选 | 续审；重点倒计时停止、复用、后台与完成回调，未确认独立 P1。 |
| [JobsCryptography](./JobsByPods/JobsCryptography@Pods/) | 65 | D Jobs 自有 AES/AESCipher/Base64 与第三方底层返回链深查 | 必要/P2，安全格式需计划升级：D05 / 第八节加密格式 失败边界，旧 CBC 固定 IV/无认证格式需版本化迁移。 |
| [JobsCustomView](./JobsByPods/JobsCustomView@Pods/) | 81 | S | 续审；起止日期选择组合，优先顺序/范围与取消行为 |
| [JobsDebug](./JobsByPods/JobsDebug@Pods/) | 9 | S 集合 description 的 load/swizzle 与日志入口抽查 | 建议/P2：对全进程 description hooks 明确 DEBUG/opt-in 及冲突边界，抽查未发现独立必现崩溃。 |
| [JobsDebugPanel](./JobsByPods/JobsDebugPanel@Pods/) | 19 | D 当前未提交版本 manager、scene overlays、window hitTest、environment 更新深查 | 暂无强制重构证据：源码有 DEBUG 编译隔离、Scene 分类/状态筛选、非 key overlay、主队列环境切换；应增加多 Scene 与重复启停验证。 |
| [JobsDeviceInfo](./JobsByPods/JobsDeviceInfo@Pods/) | 50 | S deviceID/keychain 读取保存、标识 fallback 抽查 | 条件补强；持久化失败、未存在和暂不可用需专项验收，避免身份漂移；本轮不是设备故障复现。 |
| [JobsDropDownListView](./JobsByPods/JobsDropDownListView@Pods/) | 33 | S + 析构扫描 | 续审；锚点列表与缺数据/反复展示/窗口生命周期需运行验收 |
| [JobsFiltrationView](./JobsByPods/JobsFiltrationView@Pods/) | 9 | S | 续审；组合 HotLabel 展示，实际查询明确归宿主 |
| [JobsFuseAnimation](./JobsByPods/JobsFuseAnimation@Pods/) | 24 | S + 析构扫描 | 续审；协议驱动多动画族，timer 清理已有候选守卫，仍需停止/资源/复用验收 |
| [JobsGestureLock](./JobsByPods/JobsGestureLock@Pods/) | 13 | S | 续审；绘制/配置/存储/创建验证状态分层，存储与重试合同需专项深读 |
| [JobsGetWindow](./JobsByPods/JobsGetWindow@Pods/) | 2 | D window.h 所有主要窗口/Scene 查询入口深查 | 必要/P2：第八节多 Scene 多 Scene 查询选择错误，需要调用上下文和完整前台搜索。 |
| [JobsHotLabel](./JobsByPods/JobsHotLabel@Pods/) | 10 | S | 续审；单/多行标签表现，动态尺寸/空数据/复用压力需要后续验证 |
| [JobsIconfont](./JobsByPods/JobsIconfont@Pods/) | 3 | D load/cancel/cache token/public UIImageView DSL/dealloc 深查 | 必要/P1：R04 首次加载、取消幂等性、析构 weak/ABI。 |
| [JobsImageNumberView](./JobsByPods/JobsImageNumberView@Pods/) | 5 | D 数据源主体 | 续审；直接数组索引并依赖模型一致性，尚未实证故障；重配刷新合同值得补查 |
| [JobsImageRotation](./JobsByPods/JobsImageRotation@Pods/) | 5 | S + 析构/interval 扫描 | 续审；已见 isfinite 正区间归一化，生命周期用 JobsTimer；未把全部节奏问题判缺陷 |
| [JobsLanMgr](./JobsByPods/JobsLanMgr@Pods/) | 11 | D 全读 LanMgr/NSString 入口，支援 bundle 定位抽查 | 中；global bundle/language 没同步，后台翻译与设置竞争需统一快照；系统语言匹配建议使用 bundle 匹配能力，支持具体 locale 回退到语言基础。已有缺包 mainBundle 回退。 |
| [JobsLinkageMenuView](./JobsByPods/JobsLinkageMenuView@Pods/) | 73 | D 选择/缺内容 | 暂缓强制重构；safe object access 和缺内容回调已存在 |
| [JobsLoadingImage](./JobsByPods/JobsLoadingImage@Pods/) | 5 | E Core 主实现 | 暂缓；空参数和 bundle fallback 已覆盖；有重复加载性能需求时再加缓存 |
| [JobsLocker](./JobsByPods/JobsLocker@Pods/) | 7 | D Once/ConditionLock | 条件性；执行中同线程重入 executeOnce/reset 的等待契约需明确；普通锁保护不是改写理由。 |
| [JobsLuckyEnvelopeRain](./JobsByPods/JobsLuckyEnvelopeRain@Pods/) | 5 | S + 析构扫描 | 续审；双 timer 与并发上限配置，重点后台/移除/高频点击压力 |
| [JobsMakes](./JobsByPods/JobsMakes@Pods/) | 7 | S 主入口、对象工厂和可空 configuration Block 抽查 | 回归性补强：已抽查 factory 对配置 Block 有判空；保持工厂调用安全并验证特殊系统 initializer，无批量替换依据。 |
| [JobsMarqueeView](./JobsByPods/JobsMarqueeView@Pods/) | 3 | D 布局/计时/析构 | 必须；R01 析构弱引用，除此已见 timer identifier 去重移除与空数据保护 |
| [JobsMenuView](./JobsByPods/JobsMenuView@Pods/) | 13 | S | 续审；多个菜单子视图组合，配置重建/选择状态需要后续验证 |
| [JobsModel](./JobsByPods/JobsModel@Pods/) | 144 | S UIViewModel/TextModel 等数据束与默认值/懒加载抽查 | 暂无独立 P1：字段默认值和布局缓存可补边界用例；不应因 Model 多或 DSL 化就重写。 |
| [JobsModelDSL](./JobsByPods/JobsModelDSL@Pods/) | 101 | S 模型 DSL 入口及 UIViewModel textModel 等抽查 | 回归补强；模型入口的 nil/延迟 Block 合同需定向检查，抽查没有证明独立 P1 或应整体重写。 |
| [JobsMonitorNetwoking](./JobsByPods/JobsMonitorNetwoking@Pods/) | 3 | D 全读核心 .m：getifaddrs、差分、格式化 | P2，中高，S03/S06 附项；32-bit counter/负差分和 ifa_addr 判空。适宜与统一采样器收敛，保持旧 API。 |
| [JobsNavBar](./JobsByPods/JobsNavBar@Pods/) | 91 | S | 续审；展示回传归组件、导航决策归宿主，多场景/字体主题合同后续验收 |
| [JobsNavigationTransitionMgr](./JobsByPods/JobsNavigationTransitionMgr@Pods/) | 133 | D Core 主实现 | 应修；S02 手势终止门禁、取消语义与全屏尺寸假设 |
| [JobsNetWorkTools](./JobsByPods/JobsNetWorkTools@Pods/) | 3 | D 全读核心 .h/.m：采样、停止、singleton、timer | P2，中高，S03/S06 附项；interval、actual elapsed、重新启动、数据源区分与单例订阅。已有计数回绕 clamp。 |
| [JobsOCAudioRecorder](./JobsByPods/JobsOCAudioRecorder@Pods/) | 2 | D 重点：store/recorder/player/record-button，核对 demo | P1，高，A03；共享 AudioSession 与播放/录音协调、录音条目全量同步 AVAudioPlayer 扫描也应逐步治理。 |
| [JobsOCCalendar](./JobsByPods/JobsOCCalendar@Pods/) | 8 | S | 续审；自研日期和 scope，时区/DST/首末日期/多选需要专项边界回归 |
| [JobsOCComment](./JobsByPods/JobsOCComment@Pods/) | 10 | S | 续审；多模式/子回复列表，优先空态/增量与展开复用 |
| [JobsOCCountryCodeCtrl](./JobsByPods/JobsOCCountryCodeCtrl@Pods/) | 4 | S | 续审；本地 plist 选择，优先数据重复/缺旗帜/搜索与资源完整性 |
| [JobsOCDSL](./JobsByPods/JobsOCDSL@Pods/) | 200 | S 入口、UIView/CALayer 等系统 DSL 抽查，未入图文件读取现源码；第三方扩展边界排除 | 需要定向补强：系统 API DSL 的 nil/延迟 Block、签名与唯一 selector 回归；当前抽查未确认新的独立 P1，不应批量改写 DSL 风格。 |
| [JobsOCDefs](./JobsByPods/JobsOCDefs@Pods/) | 67 | S 宏入口、weak/strong、关联属性、JobsTheme 全局 setter hooks 抽查 | 建议回归优先：高扇出基础层，主题全局交换需要继承/多线程/重入验证；没有因宏数量或目录大而提出重构。 |
| [JobsOCExcel](./JobsByPods/JobsOCExcel@Pods/) | 13 | D Core 主实现 | 按规模；第八节 Excel 全量网格，现有缺格和索引守卫无需丢弃 |
| [JobsOCGraphicCaptcha](./JobsByPods/JobsOCGraphicCaptcha@Pods/) | 9 | D 绘制/刷新/生成 | 暂缓强制重写；过滤/字符 fallback/组合字符/空绘制守卫已有，限量契约可按需增强 |
| [JobsOCKeyboardMgr](./JobsByPods/JobsOCKeyboardMgr@Pods/) | 8 | D 选定配置/清理/坐标流程 | 续审；已有 weak-to-strong transform map 与事件清理，尚未完整验证多 scene / 输入切换 |
| [JobsOCMarkdown](./JobsByPods/JobsOCMarkdown@Pods/) | 11 | D Core 主实现 | 必须；R02 加载递归、R01 析构 getter；修复后再验收大文档和资源权限 |
| [JobsOCNumberStepper](./JobsByPods/JobsOCNumberStepper@Pods/) | 3 | D Core 主实现 + 公开头 | 应修；S04 公开 DSL 绕过已验证状态内核 |
| [JobsOCOpen](./JobsByPods/JobsOCOpen@Pods/) | 13 | D 重点：Opener、NSString 开链/电话/邮件，配置入口与 web controller 抽查 | 中；URL 校验与 completion 已有。所有 UIKit 入口需保证主队列；邮件代理 singleton 的 completion 被后一次请求覆盖，适宜改 controller 绑定代理；通用 open 的“提交”与真实“打开”结果区分。 |
| [JobsOCPatch](./JobsByPods/JobsOCPatch@Pods/) | 5 | D 安装、回滚、rollbackAll 与当前热更新 Demo 调用链深查 | 必要/P1：R07 补丁层可恢复释放的 IMP，继承/ABI/并发契约不完整。 |
| [JobsOCProtocols](./JobsByPods/JobsOCProtocols@Pods/) | 31 | S BaseProtocol 等协议头抽查 | 暂无独立强制升级证据：主要为契约声明；需要和实际调用/实现变化一起约束可选属性及空值。 |
| [JobsOCRefresher](./JobsByPods/JobsOCRefresher@Pods/) | 9 | D 核心 proxy/slot 状态机 | 必须；R01、R03 与 S01，先补崩溃/终态回归再扩动效 |
| [JobsOCRuntimeKits](./JobsByPods/JobsOCRuntimeKits@Pods/) | 23 | D DynamicInvoke、Swizzling、weak-association 深查 | 必要/P1：R06 的 NSInvocation 类型/缓冲区/内存；未使用的 weak-association helper 启用前必须修正。 |
| [JobsOCSearcher](./JobsByPods/JobsOCSearcher@Pods/) | 7 | D Core 主实现主要流程 | 续审；文本规范化、历史去重/容量和 index 守卫已有；查询归宿主，不将组件无 API 判缺陷 |
| [JobsOCSkeletonView](./JobsByPods/JobsOCSkeletonView@Pods/) | 7 | S | 续审；layer 动画挂载/原图恢复，重点复用中晚到图像与停止契约 |
| [JobsOCSnowflake](./JobsByPods/JobsOCSnowflake@Pods/) | 3 | D 生成/参数/时钟；算术验证 | P1，D01；毫秒截断、序列回卷与节点0/32别名。 |
| [JobsOCSplash](./JobsByPods/JobsOCSplash@Pods/) | 17 | D 重点：media cache 全读、VC 媒体加载/退出，GIF decoder 全读 | P2，中高，S05；视频已有 Wi-Fi-only、去重、退避、2xx/非空检查；图片复用同一校验并补缓存容量。GIF 全帧解码在 UI 路径，后续限制像素/帧数并后台解码。 |
| [JobsOCTimer](./JobsByPods/JobsOCTimer@Pods/) | 9 | D 启停/fireOnce/清理内核 | 维持内核，关联 A05；代次、弱代理与 suspend 平衡已有，重点验收管理器终态，不泛化析构缺陷。 |
| [JobsOCTimerMgr](./JobsByPods/JobsOCTimerMgr@Pods/) | 5 | D 注册/force finish/析构 | P1，R01；另有 P2 A05 先移除后丢完成；保留原 entry 身份过滤和 scope 策略。 |
| [JobsOCTools](./JobsByPods/JobsOCTools@Pods/) | 153 | D 入口及 CrashLog、ImageCodeView 高风险分类深查；其余仅抽查，第三方来源排除 | 必要/P1：R08 默认初始化递归；R08 当前启动 signal handler 使用不安全运行时/分配。 |
| [JobsOCUILabelScrolling](./JobsByPods/JobsOCUILabelScrolling@Pods/) | 9 | S | 续审；CoreText + timer 驱动，重点离屏停止/复用/字体布局变化 |
| [JobsOCVideoRecorder](./JobsByPods/JobsOCVideoRecorder@Pods/) | 20 | D 深读 capture/writer/controller 生命周期；配置与结果 | P1，高，A02；先解决会话队列、session 代次，再验证 permission 回调与后台重入。存在采样背压、切相机回滚等良好基础，无需重写整个实现。 |
| [JobsOCWebSocket](./JobsByPods/JobsOCWebSocket@Pods/) | 3 | D 重点：连接、失效、退避、heartbeat、send、delegate 全链 | 中；有 workQueue 串行、旧 socket 身份过滤、手动断开取消、最大重连次数与主线程回调。心跳只发 ping，无 pong deadline，半开连接检测需补；URL 写入在调用线程、连接在 workQueue，建议整个 connectWithURL 命令在该队列提交。未发现 TLS 信任绕过。 |
| [JobsPresentTransitionMgr](./JobsByPods/JobsPresentTransitionMgr@Pods/) | 5 | D 展示/动画/取消流程 | 暂缓强制重写；已使用 container/finalFrame、取消恢复，与导航转场分开判断 |
| [JobsProgressBar](./JobsByPods/JobsProgressBar@Pods/) | 3 | D 自动推进/析构/状态 | 必须；R01 析构，进一步 NaN/离屏 displayLink 验证需实跑 |
| [JobsRandomUtils](./JobsByPods/JobsRandomUtils@Pods/) | 3 | D 全读 .m/.h、抽取原 C 函数运行 UBSan | P2，中高，S06；已有单边 INT_MIN 保护，需补区间差和无偏抽样。 |
| [JobsRichTextUtils](./JobsByPods/JobsRichTextUtils@Pods/) | 17 | D 重点抽查 NSAttributedString、NSMutableAttributedString、RichText 拼装 | 中；已有 value/type/range guards，但 NSMutableAttributedString+Extra.m:107 把 underline color 限定为 NSNumber，而 RichText.m:109 传 UIColor，正常下划线颜色被丢弃；TextCor 返回 typedef 却是 UIFont，应为 UIColor；kern 140–142 缺 range guard。NSMaxRange 加法可溢出，宜用 location<=length、range.length<=length-location。 |
| [JobsScreenCapture](./JobsByPods/JobsScreenCapture@Pods/) | 7 | D 全读 observer/capturer/protection .m | 中；capturer 主线程渲染、add-only 相册权限、失败 NSError 和主线程 completion 已比较完整。protection 用 UITextField 内部 CanvasView 和 firstSubview fallback（ProtectionView.m:109–111），只能标实验能力/系统版本实测；fallback 不应把任意 subview 当作保护可用证据。没有官方 API 保证通用截图保护。 |
| [JobsStringUtils](./JobsByPods/JobsStringUtils@Pods/) | 3 | D 全读核心 .m/.h | 中；nil/NSNull/空白处理已完善。JobsStringUtils.m:66–67 对非法 UTF8仍可返回 nil，与 nonnull 冲突；toStringByShort/UnsignedShort 94–99 使用 `%c`，若表示数字应改 `%hd/%hu`，若表示字符应改名消歧。 |
| [JobsSuspend](./JobsByPods/JobsSuspend@Pods/) | 55 | D UIView 分类主体/公开头 | 应修；S03 weak 合同未落实；safeArea 夹紧和终止处理已有 |
| [JobsTabBarCtrl](./JobsByPods/JobsTabBarCtrl@Pods/) | 3 | S | 续审；子控制器/按钮数组协调，重点 child containment/索引/重配 |
| [JobsTimeUtils](./JobsByPods/JobsTimeUtils@Pods/) | 21 | D 重点抽查 timestamp、formatter、过期、日期差 | 中；NSObject+Time.m:263 忽略公开 timeFormatter 参数，方法返回 0 无法区分解析失败与相同时间；固定协议时间使用 POSIX locale/Gregorian，UI 用当前 locale。NSString+Time.m:76–81 过期检查只按秒解释，与同类 13 位毫秒接口需明确单位。 |
| [JobsUploadingProgressView](./JobsByPods/JobsUploadingProgressView@Pods/) | 3 | D 共享视图/计时/动画 | 续审；主窗口共享持有、动画重入、多 scene 需动态验证；未给出未经确认崩溃结论 |
| [JobsViewNavigator](./JobsByPods/JobsViewNavigator@Pods/) | 7 | S | 续审；UIView stack，重点重复 push/空栈 pop/动画中重入 |
| [JobsViewPush](./JobsByPods/JobsViewPush@Pods/) | 5 | S | 续审；覆盖推出 + 侧抽屉，重点宿主释放/交互取消/重复展示 |
| [JobsWallet](./JobsByPods/JobsWallet@Pods/) | 7 | S | 续审；卡片模型/cell/layout，重点空数组/布局失效/复用 |
| [LMJDropdownMenuExtra](./JobsByPods/LMJDropdownMenuExtra@Pods/) | 3 | S | 续审；运行时查 mainBtn，优先上游升级/缺 selector 后的兜底 |
| [MGSwipeTableCellExtra](./JobsByPods/MGSwipeTableCellExtra@Pods/) | 4 | S | 续审；29 行代理配置，优先 callback/复用安全 |
| [MJRefreshExtra](./JobsByPods/MJRefreshExtra@Pods/) | 93 | S | 续审；第三方 state/GIF 与 Lottie header/footer 适配，优先无对应头尾时的 nil Block 调用 |
| [RACExtra](./JobsByPods/RACExtra@Pods/) | 6 | D 全读 runtime .m、查看 scope/metamacro 入口 | 低至中；大量内容类似 runtime 支援，优先确认来源/许可证及与 ReactiveObjC 符号重名边界。已有 malloc failure、解析失败和 free；本轮没有确认新的稳定性缺陷。 |
| [ReachabilityExtra](./JobsByPods/ReachabilityExtra@Pods/) | 3 | E 全读薄封装 .m | 低；只返回当前对象设置 WWAN 属性。需将 reachability 作为提示而非请求成功判据，不为薄层硬凑重构。 |
| [SRWebSocketExtra](./JobsByPods/SRWebSocketExtra@Pods/) | 3 | E 全读薄封装 .m | 低；构造请求和设置 delegate queue，建议补 nonnull 入参契约；没有必要为包装层另造协议。 |
| [SYSAlertControllerExtra](./JobsByPods/SYSAlertControllerExtra@Pods/) | 7 | S | 续审；系统 Alert/ActionSheet 展示入口，优先 iPad popover 与正确 scene presenter |
| [SZTextViewExtra](./JobsByPods/SZTextViewExtra@Pods/) | 3 | S | 续审；73 行正文与占位配置，优先子类返回类型/可空 view |
| [TFPopupExtra](./JobsByPods/TFPopupExtra@Pods/) | 5 | S | 续审；弹框组合，优先重复展示/自动消失/宿主释放 |
| [This](./JobsByPods/This@Pods/) | 3 | E 极小 Core 主体 | 暂缓；当前主体空实现，暂无扩大功能或重写依据。 |
| [UIBaseTextFieldDSL](./JobsByPods/UIBaseTextFieldDSL@Pods/) | 3 | S | 续审；具体子类 DSL，优先字段所属类型、返回类型与 nil 语义 |
| [WHToastExtra](./JobsByPods/WHToastExtra@Pods/) | 11 | S | 续审；类/实例薄门面，重点线程/共享加载提示清理 |
| [YTKNetworkExtra](./JobsByPods/YTKNetworkExtra@Pods/) | 38 | D 重点：BaseRequest、YTKBaseRequest+Extra、response 映射/处理 | P1，中高；A04 关联；headers 惰性保存 token 可在复用 request/切账号后过期，responseModel 关联缓存不随 response 更新，应明确不可复用或按请求代次重置。参数 copy 后实际 NSMutableDictionary 可变性契约值得补。取消与 HTTP/JSON validation 已由上游处理，不能认作缺失。 |
| [ZFPlayerExtra](./JobsByPods/ZFPlayerExtra@Pods/) | 11 | S | 续审；管理器与短视频控制，优先 cell 复用后旧播放回调与资源释放 |
| [ZMJCellExtra](./JobsByPods/ZMJCellExtra@Pods/) | 3 | S | 续审；cell 定制内容适配，优先关联视图和复用清空 |

三个空占位目录没有列入上述 109 项：`JobsAppEnvironmentRibbon@Pods`、`JobsSwiftComment@Pods`、`JobsSwiftSearcher@Pods`。后续确实实现时再补相同的契约与回归要求。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
