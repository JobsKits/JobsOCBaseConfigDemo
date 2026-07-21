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

JobsTimerMgr.shared
.byUpsertTimer(identifier,
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
- 失去活跃态时暂停，重新活跃只恢复自动暂停项，不改变手动暂停状态。
- `startImmediately`、`start:`、`resume:` 后同步当前应用状态；应用已经 inactive / background 时启动也不会绕过策略。
- cancel 策略只在真实 background 时停止并移除，短暂 inactive 不会误取消。

## 四、验证

使用老工程主 scheme 完整编译，并编译 `JobsOCBaseConfigDemoTests`；变更同步到新 OC 工程时只对齐行为，不复制 Pod 目录结构。
