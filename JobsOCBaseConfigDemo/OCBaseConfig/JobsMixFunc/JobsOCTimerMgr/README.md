# `JobsTimerMgr`（OC 老工程）

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 老工程的标准 Timer Manager 与新 OC `JobsOCTimerMgr` 保持同一状态机语义。

## 一、定位

`JobsTimerMgr` 是 OC 老工程的主计时管理器，按 identifier 管理 `JobsTimer`，提供原子覆盖、生命周期控制、回调叠加与前后台策略。实现与 OC 新工程 `JobsOCTimerMgr` 保持能力对齐，但继续集成在主工程目录中。

## 二、推荐 DSL

```objc
NSString *identifier = @"home.countdown";
NSString *scopeIdentifier = @"home.page";

JobsTimerMgr.shared
.byUpsertScopedTimer(identifier,
                     scopeIdentifier,
                     JobsTimerTypeNSTimer,
                     JobsTimerBackgroundPolicyPauseAndResume,
                     YES,
                     ^(JobsTimer * _Nullable timer) {
    timer.byTimerStyle(TimerStyle_anticlockwise)
    .byTimeInterval(1)
    .byStartTime(10);
}, nil)
.byOnTick(identifier, ^(CGFloat time) {
    // 更新倒计时 UI
})
.byOnFinishVoid(identifier, ^{
    // 倒计时结束
});
```

## 三、并发保证

- 同 identifier 先在串行隔离队列中原子替换，再在队列外停止旧 timer。
- 回调执行前核对 Entry 身份，旧 timer 的残留事件不会命中新 timer 的回调组。
- `fireOnceAndRemove` 删除前核对 timer 身份，避免误删并发替换项。
- `stopAndRemove:expectedTimer:` 同时核对 identifier 与 Timer 实例，旧 Cell / Model 的延迟清理不会误杀新注册项。
- 页面多 Timer 统一使用 Scope；消失、重现、释放时分别调用 `pauseScope:`、`resumeScope:`、`stopAndRemoveScope:`，且不会误恢复手动暂停项。
- 时时彩倒计时以 Model 的绝对 `endAt` 为时间真值，Timer tick 只触发 UI 重算。
- 失去活跃态时暂停，重新活跃只恢复自动暂停项，不改变手动暂停状态。
- `startImmediately`、`start:`、`resume:` 后同步当前应用状态；应用已经 inactive / background 时启动也不会绕过策略。
- cancel 策略只在真实 background 时停止并移除，短暂 inactive 不会误取消。

## 四、验证

使用老工程主 scheme 完整编译，并编译 `JobsOCBaseConfigDemoTests`；测试覆盖实例安全取消和 Scope 生命周期。变更同步到新 OC 工程时只对齐行为，不复制 Pod 目录结构。

## 五、系统计时机制对比与 Manager 选型

### 5.1、Manager 不替代内核选择

`JobsTimerMgr` 解决的是 Timer 的所有权、identifier、回调组、Scope 和批量生命周期，不替代底层 `timerType` 选择。

| 系统机制 | 调度模型 | 优势 | 代价与风险 | 推荐场景 | `JobsTimerType` |
| ---- | ---- | ---- | ---- | ---- | ---- |
| [**NSTimer**](https://developer.apple.com/documentation/foundation/nstimer) | 指定线程的 RunLoop + Mode | 简单；适合 UI 低频刷新；支持 `tolerance` | RunLoop 忙或 Mode 不匹配会延后；需处理失效与引用关系 | 轮播、验证码、普通 UI 倒计时 | `JobsTimerTypeNSTimer` |
| [**DispatchSourceTimer**](https://developer.apple.com/documentation/dispatch/dispatchsourcetimer) | 指定 Dispatch Queue，不依赖 RunLoop | 队列可控；适合非 UI；leeway 可平衡功耗 | suspend/resume/cancel 必须配平；队列阻塞照样延迟 | 心跳、轮询、缓存维护 | `JobsTimerTypeGCD` |
| [**CADisplayLink**](https://developer.apple.com/documentation/quartzcore/cadisplaylink) | 跟随显示刷新周期 | 视觉节奏匹配；提供时间戳 | 实际帧率会变化；主线程繁忙会掉帧 | 逐帧动画、进度绘制 | `JobsTimerTypeDisplayLink` |
| [**CFRunLoopTimerRef**](https://developer.apple.com/documentation/corefoundation/cfrunlooptimer) | Core Foundation RunLoop + Mode | 可控制 Mode、Context 和下一次触发时间 | C API 冗长；所有权和线程亲和复杂 | RunLoop 基础设施、C/CF 互操作 | `JobsTimerTypeRunLoop` |

四种机制都不是硬实时 Timer，也都不是后台保活方案。

### 5.2、决策顺序

1. 屏幕逐帧刷新选择 `JobsTimerTypeDisplayLink`。
2. 非 UI 工作队列、心跳或轮询选择 `JobsTimerTypeGCD`。
3. 主线程低频 UI 刷新选择 `JobsTimerTypeNSTimer`，Mode 使用 common。
4. 需要直接控制 RunLoop Timer 或 C/CF 互操作时选择 `JobsTimerTypeRunLoop`。
5. 只有一次延迟动作时使用 `dispatch_after` 等一次性 API。
6. App 被系统挂起后需要执行工作时，使用符合业务资格的后台系统机制。

### 5.3、什么时候必须上 Manager

- 同一业务可能重复创建 Timer 时，使用稳定 identifier。
- Cell 复用时，使用 Model identifier + `expectedTimer` 精准解绑。
- 页面或业务域包含多条 Timer 时，使用 Scope 整组 pause/resume/remove。
- 倒计时以绝对 `endAt` 为时间真值，Timer tick 只触发重算。
- 单个对象私有、生命周期清晰且无需跨对象查找时，可以直接使用 `JobsTimer`。
