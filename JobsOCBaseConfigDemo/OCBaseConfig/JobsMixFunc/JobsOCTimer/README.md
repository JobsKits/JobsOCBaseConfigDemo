# `JobsOCTimer`（OC 老工程）

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsOCTimer` 是 OC 老工程的统一计时入口。老工程继续按主工程方式集成 `JobsTimer`，与 OC 新工程保持四内核和生命周期语义对齐，但不引入本地 Pod 结构。

## 一、实现边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 公开聚合入口：`./JobsOCTimer.h`。
- 核心实现：`../../../JobsOCBaseCustomizeUIKitCore/NSObject/BaseObject/JobsTImer/JobsTimer.h/.m`。
- 行为对齐：支持 `NSTimer`、GCD Timer、`CADisplayLink`、`CFRunLoopTimerRef`。
- 单个 Timer 的底层生命周期由 `JobsTimer` 负责；多 Timer、identifier、Scope 与批量治理使用同级 `JobsOCTimerMgr`。

## 二、四种系统计时机制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

日常所说的“iOS 系统 Timer”并不都属于 UIKit：

- `NSTimer` 位于 [**Foundation**](https://developer.apple.com/documentation/foundation/nstimer)。
- `DispatchSourceTimer / dispatch_source_t` Timer 位于 [**Dispatch**](https://developer.apple.com/documentation/dispatch/dispatchsourcetimer)。
- `CADisplayLink` 位于 [**QuartzCore**](https://developer.apple.com/documentation/quartzcore/cadisplaylink)。
- `CFRunLoopTimerRef` 位于 [**Core Foundation**](https://developer.apple.com/documentation/corefoundation/cfrunlooptimer)，并与 `NSTimer` toll-free bridged。

| 系统机制 | 调度模型 | 优势 | 代价与风险 | 推荐场景 | `JobsTimerType` |
| ---- | ---- | ---- | ---- | ---- | ---- |
| `NSTimer` | 指定线程的 RunLoop + Mode | 简单；适合 UI 低频刷新；支持 `tolerance` | RunLoop 忙或 Mode 不匹配会延后；需处理失效与引用关系 | 轮播、验证码、普通 UI 倒计时 | `JobsTimerTypeNSTimer` |
| `DispatchSourceTimer`（GCD Timer） | 指定 Dispatch Queue，不依赖 RunLoop | 队列可控；适合非 UI 调度；leeway 可平衡功耗 | suspend/resume/cancel 必须配平；仍受 QoS、系统负载和队列阻塞影响 | 心跳、轮询、缓存维护、工作队列节拍 | `JobsTimerTypeGCD` |
| `CADisplayLink` | 跟随显示刷新周期 | 视觉节奏匹配；提供时间戳；适配高刷屏 | 实际帧率会变化；主线程繁忙会掉帧；不适合业务倒计时 | 逐帧动画、进度绘制、视觉插值 | `JobsTimerTypeDisplayLink` |
| `CFRunLoopTimerRef` | Core Foundation RunLoop + Mode | 可控制 RunLoop、Mode、Context 和下一次触发时间 | C API 冗长；所有权与线程亲和复杂；仍受 RunLoop 延迟 | RunLoop 基础设施、C/CF 互操作 | `JobsTimerTypeRunLoop` |

四种机制都不是硬实时 Timer，也不会赋予 App 后台保活能力。

## 三、选型顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1. 跟屏幕逐帧同步：`JobsTimerTypeDisplayLink`。
2. 脱离 RunLoop，在工作队列做心跳、轮询或维护：`JobsTimerTypeGCD`。
3. 主线程低频 UI 刷新：`JobsTimerTypeNSTimer`，使用 common Mode。
4. 需要直接控制 RunLoop Timer 或 C/CF 互操作：`JobsTimerTypeRunLoop`。
5. 只有一次延迟动作：使用 `dispatch_after` 等一次性 API，不创建重复 Timer。
6. App 被系统挂起后仍需工作：使用匹配业务资格的后台系统机制，不使用普通 Timer。

## 四、Jobs 封装解决的痛点 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 统一四内核的 `start/pause/resume/fireOnce/stop` 和回调入口。
- 非 GCD 内核统一主线程、主 RunLoop 亲和；GCD 内核允许跨线程生命周期调用。
- `NSTimer` / `CADisplayLink` 使用弱代理，`CFRunLoopTimerRef` 使用弱捕获 Block。
- generation token 拦截暂停、停止或重启后的旧回调；GCD suspend/cancel 状态由封装配平。
- 倒计时以绝对 `endAt` 为时间真值，每次 tick 重算剩余时间，不把 tick 次数当时间。
- 需要 identifier 去重、Cell 复用安全、Scope 或前后台策略时升级到 `JobsOCTimerMgr`。

## 五、引用与使用 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#import "JobsOCTimer.h"

JobsTimer *timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
    timer.byTimerType(JobsTimerTypeNSTimer)
    .byTimerStyle(TimerStyle_anticlockwise)
    .byTimeInterval(1)
    .byStartTime(10)
    .byRunLoopMode(NSRunLoopCommonModes)
    .byQueue(dispatch_get_main_queue())
    .byPauseInBackground(YES)
    .byAutoManageAppState(YES);
});
[timer start];
```

## 六、验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 对照 `JobsTimerType` 四个枚举与 `JobsTimer.m` 的 start/pause/resume/stop 分支。
- 使用老工程主 scheme 和 `JobsOCBaseConfigDemoTests` 验证自动暂停恢复、手动暂停保护与回调防穿透。
- 与 OC 新工程对齐行为时只平移源码语义，不复制 Pod 目录与依赖形态。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
