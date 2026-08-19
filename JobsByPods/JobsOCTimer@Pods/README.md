# `JobsOCTimer`

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

> 这份自述用于记录 `JobsOCTimer` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。
补充描述：JobsOCTimer provides timer utilities and related helpers.


## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCTimer` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Timer utilities for Jobs. |
| 首页 | [https://example.local/JobsOCTimer](https://example.local/JobsOCTimer) |
| 许可证 | `MIT / LICENSE` |
| 作者 | `Jobs / lg295060456@gmail.com` |
| podspec | `JobsByPods/JobsOCTimer@Pods/JobsOCTimer.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 作为 Jobs 项目内的独立能力 Pod，向 App 或其它 Pod 提供 `JobsOCTimer` 相关能力。
- 当 `JobsOCTimer` 的 `Core`、`Support`、资源、依赖或公开头文件发生变化时，同步更新本 README，避免后续排查只看源码不看边界。
- 参与本地 Pods 拆分时，先确认能力归属，再决定放入当前 Pod、迁移到 `Support`，还是下沉为更基础的公共 Pod。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCTimer@Pods/
├── JobsOCTimer.podspec  # Pod 描述文件
├── JobsOCTimer.h  # 根聚合头文件
├── README.md  # 当前自述
├── JobsPodspecKit.rb  # 本地 podspec 基座
├── Core/  # 公开 API 与核心实现，2 个文件
├── Support/  # 内部支撑层，7 个文件
└── LICENSE  # 许可证文件
```

- `JobsOCTimer.podspec` 是当前 Pod 的 [**CocoaPods**](https://cocoapods.org/) 描述入口。
- `README.md` 是当前文件，负责说明用途、边界、依赖、资源和风险。
- 若目录中存在 `JobsPodspecKit.rb`，说明该 Pod 使用 Jobs 本地 podspec 基座动态映射 `Support`。

## 四、`Core` / `Support` 边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 当前包含 2 个文件，其中源码 / 头文件 2 个；按 Jobs 规范，它是 `JobsOCTimer` 对外公开 API 和核心实现的边界。
- `Support` 当前包含 7 个文件，其中源码 / 头文件 6 个；它只服务当前 Pod 内部实现，不建议被 App 层或其它 Pod 直接引用。
- `Core` 里需要暴露给外部的头文件应进入 `public_header_files`；实现细节、兼容代码、内部分类优先放在 `Support`。
- `Support/UIKit/NSObject/NSObject+Queue` 的主队列延时诊断只保留 `JobsLog` 与 `PrintRetainCount` 控制台输出，不通过 Toast 干扰 App 页面。
- 不要用互相依赖或扩大 `HEADER_SEARCH_PATHS` 掩盖边界问题，必要时把公共能力下沉到更底层 Pod。

## 五、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 5.1、公开头文件

- `JobsOCTimer.h`
- `Core/**/*.h`

### 5.2、源码入口

- `JobsOCTimer.h`
- `Core/**/*.{h,m,mm}`

### 5.3、默认安装边界

- `Core` 通过 Pod 根级 `source_files` 直接映射真实磁盘目录，不再创建虚拟 `Core` subspec，避免 [**Xcode**](https://developer.apple.com/xcode) 的 Development Pods 出现 `Core/Core`。
- `Support` 仅在真实目录存在时按 podspec 映射；`Resource` 与 `Core` 平级承载非代码资源。

### 5.4、系统框架

- `Foundation`
- `UIKit`

### 5.5、Pod 依赖

- `WHToast`
- `SDWebImage`
- `JobsBlock`
- `JobsOCDefs`
- `JobsStringUtils`
- `JobsOCProtocols`
- `JobsLanMgr`
- `JobsMakes`
- `WHToastExtra`

## 六、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

推荐在 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 代码里使用保护性引用，优先走 [**CocoaPods**](https://cocoapods.org/) 生成的公共头映射：

```objc
#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
#endif
```

- 自建 Pod 对外优先引用公共入口头，不要绕开聚合头直接引用 `Support` 内部子头。
- `JobsOCTimer.h` 是统一公开入口；调用方不绕开聚合头引用 `Core` 内部子头。

### 6.1、基础用法

```objc
@jobs_weakify(self)
JobsTimer *timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
    timer.byTimerType(JobsTimerTypeNSTimer)
    .byTimerStyle(TimerStyle_anticlockwise)
    .byTimeInterval(1)
    .byStartTime(10)
    .byQueue(dispatch_get_main_queue())
    .byPauseInBackground(YES)
    .byAutoManageAppState(YES)
    .byOnTick(^(CGFloat time) {
        @jobs_strongify(self)
        // 刷新倒计时 UI
    })
    .byOnFinish(^(JobsTimer * _Nullable timer) {
        @jobs_strongify(self)
        // 倒计时结束
    });
});
[timer start];
```

`NSTimer`、`DisplayLink`、`RunLoop` 内核必须在主线程创建和操作；GCD 内核允许跨线程生命周期调用。四种内核都在首次完整间隔后触发，`DisplayLink` 会按 `timeInterval` 节流，并以常数时间跳过错过的节拍。非有限或小于等于 `0` 的 `timeInterval` 统一回退到 `1` 秒。

`byPauseInBackground(YES)` 与 `byAutoManageAppState(YES)` 启用后，应用失去活跃态即自动暂停，重新活跃时只恢复自动暂停项。公共 `pause` 会撤销自动恢复资格，公共 `resume` 会立即复核当前应用状态，因此 inactive→active 不会漏恢复，手动恢复也不会让 Timer 在后台继续运行。

## 七、资源说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 当前目录扫描到资源类文件 1 个，`Resource` 目录文件 0 个。
- podspec 资源声明如下：

- podspec 未显式声明 `resources`，如新增图片、xib、bundle、json、plist 等资源，需要同步补齐。

## 八、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsOCTimer` 后，优先按风险从低到高验证：

```shell
ruby -c JobsOCTimer.podspec
```

```shell
pod lib lint JobsOCTimer.podspec --allow-warnings --verbose
```

```shell
pod install --no-repo-update
```

- 如果本机 [**Ruby**](https://www.ruby-lang.org) / [**CocoaPods**](https://cocoapods.org/) 环境不适合实际执行，至少保留未执行声明，并检查 `PodspecDependencyReport` 里的依赖链路。
- 增删依赖后重点排查循环引用、公开头暴露和 `Support` 泄漏。

## 九、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `Core` 头文件会进入公开 API 边界，新增 import 时要确认不会把内部实现细节暴露给外部。
- `Support` 只服务当前 Pod；App 层或其它 Pod 不应依赖 `Support/**/*.h` 的搜索路径命中。
- `JobsTimer` 回调快照不要在 `stateLock` 持有期间读取带锁 getter，避免 tick / fireOnce 首次回调时自锁卡住。
- `JobsTimer` 的 GCD 内核在 `pause` / `resume` 时会切换 generation token，恢复前必须重新绑定 `dispatch_source` 的 event handler 到新 token，并重置下一次触发时间，避免恢复后 tick 被旧 token 校验拦截。
- `NSTimer` 与 `CADisplayLink` 通过弱代理回调，`CFRunLoopTimer` 使用弱捕获 block；不要改回强 target 或未托管裸指针，否则会重新引入生命周期风险。
- 一次性或倒计时终态先失效底层引擎，再在同一回调队列按 `tick`、`finish` 顺序派发；重复 timer 的排队回调执行前会再次校验 generation。
- 应用状态暂停必须走独立的自动暂停路径；不要在通知回调里先写标记再调用公共 `pause`，否则手动 / 自动暂停语义会互相覆盖。
- 第三方手动托管 Pod 要保留上游来源信息，只做本地托管适配，不抹掉作者、homepage 和 license。
- 执行 `pod install` 成功后，如生成了新的 `PodspecDependencyReport`，以报告为准继续校正上下依赖关系。
- `JobsOCBaseConfigDemoTests` 覆盖 inactive→active 自动恢复和手动暂停不被误恢复。

## 十、系统计时机制对比与选型 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 10.1、先统一概念

日常所说的“iOS 系统 Timer”并不都属于 UIKit：

- `NSTimer` 位于 [**Foundation**](https://developer.apple.com/documentation/foundation/nstimer)。
- `DispatchSourceTimer / dispatch_source_t` Timer 位于 [**Dispatch**](https://developer.apple.com/documentation/dispatch/dispatchsourcetimer)。
- `CADisplayLink` 位于 [**QuartzCore**](https://developer.apple.com/documentation/quartzcore/cadisplaylink)。
- `CFRunLoopTimerRef` 位于 [**Core Foundation**](https://developer.apple.com/documentation/corefoundation/cfrunlooptimer)，并与 `NSTimer` toll-free bridged。

四套 API 对应四种调度模型。它们都不是硬实时机制，也都不会赋予 App 后台保活能力。

### 10.2、四种内核怎么选

| 系统机制 | 调度模型 | 优势 | 代价与风险 | 推荐场景 | `JobsTimerType` |
| ---- | ---- | ---- | ---- | ---- | ---- |
| `NSTimer` | 依赖指定线程的 RunLoop 与 Mode | API 简单；适合 UI 低频刷新；支持 `tolerance` 节能 | RunLoop 忙或 Mode 不匹配会延后；不是实时计时器；需处理失效与引用关系 | 轮播、验证码、普通 UI 倒计时 | `JobsTimerTypeNSTimer` |
| `DispatchSourceTimer`（GCD Timer） | 在指定 Dispatch Queue 上投递事件，不依赖 RunLoop | 可选择串行/并发队列；适合非 UI 调度；leeway 可平衡功耗 | suspend/resume/cancel 状态必须配平；仍受 QoS、系统负载和队列阻塞影响 | 心跳、轮询、缓存清理、工作队列节拍 | `JobsTimerTypeGCD` |
| `CADisplayLink` | 跟随显示刷新周期回调 | 与屏幕刷新协调；提供时间戳；适配高刷屏 | 实际帧率会受硬件、低电量、温控和主线程负载影响；不适合业务倒计时 | 逐帧动画、进度绘制、视觉插值 | `JobsTimerTypeDisplayLink` |
| `CFRunLoopTimerRef` | Core Foundation 级 RunLoop Timer | 可显式控制 RunLoop、Mode、下一次触发时间与上下文 | C API 更冗长；所有权与线程亲和更容易出错；仍受 RunLoop 延迟 | 基础设施、精细 RunLoop 集成或 C/CF 互操作 | `JobsTimerTypeRunLoop` |

### 10.3、经常被误当成 Timer 的 API

| API | 适合 | 不适合 |
| ---- | ---- | ---- |
| `dispatch_after` | 一次性延迟执行 | 重复、暂停、恢复、统一生命周期管理 |
| `performSelector:withObject:afterDelay:` | 当前 RunLoop 上的一次性延迟消息 | 跨队列调度、重复任务、复杂取消治理 |
| `BGTaskScheduler` | 由系统择机执行后台刷新或维护任务 | 秒级准点触发、常驻后台 Timer |

### 10.4、场景决策顺序

1. 回调必须跟屏幕刷新同步，选择 `JobsTimerTypeDisplayLink`。
2. 必须脱离 RunLoop，或需要在工作队列执行，选择 `JobsTimerTypeGCD`。
3. 只是主线程低频 UI 刷新，选择 `JobsTimerTypeNSTimer`，并使用 common Mode。
4. 需要直接控制 RunLoop Timer 或进行 Core Foundation 互操作，选择 `JobsTimerTypeRunLoop`。
5. 只有一次延迟动作，使用 `dispatch_after` 等一次性 API，不创建重复 Timer。
6. App 被系统挂起后仍需工作，改用匹配业务资格的后台系统机制；四种 Timer 都不是后台保活方案。

### 10.5、正确性底线

- GCD Timer 只是避开 RunLoop Mode 影响，不等于硬实时；队列阻塞、QoS、系统负载和 leeway 都可能带来延迟。
- 倒计时以绝对 `endAt` 为时间真值，每次 tick 重新计算剩余时间，不把 tick 次数当时间。
- 动画按 `timestamp` / `targetTimestamp` 或单调时钟计算进度，不假设 DisplayLink 每帧必到。
- 可接受少量延迟的重复任务设置合理 `tolerance` / leeway，减少无意义唤醒。
- 单个局部 Timer 使用 `JobsTimer`；需要 identifier 去重、列表复用、Scope、前后台策略或批量治理时使用 `JobsOCTimerMgr`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
