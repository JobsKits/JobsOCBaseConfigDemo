# `JobsTimer`（OC 老工程）

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 老工程继续按主工程集成方式维护 `JobsTimer`，只与新 OC Pod 对齐行为，不引入 Pod 结构。

## 一、定位

这里是 OC 老工程集成于主工程的定时器实现，与 OC 新工程 `JobsOCTimer` 本地 Pod 保持同一生命周期语义，但不引入新的 Pod 形态。

## 二、核心保证

- 统一支持 `NSTimer`、GCD、`CADisplayLink` 和 `CFRunLoopTimer`。
- 非 GCD 内核必须在主线程创建与操作；GCD 内核支持跨线程生命周期调用。
- `NSTimer` / `CADisplayLink` 使用弱代理，`CFRunLoopTimer` 使用弱捕获 block，避免引擎反向持有 `JobsTimer`。
- generation token 拦截暂停、停止或重启后的旧回调。
- `DisplayLink` 按 `timeInterval` 节流并以常数时间跳过错过的节拍；四种内核都在首次完整间隔后触发。
- 非有限或小于等于 `0` 的 `timeInterval` 统一回退到 `1` 秒。
- 一次性和倒计时终态先失效引擎，再在同一队列依次执行 `tick`、`finish`。
- 应用进入 inactive / background 时自动暂停，重新活跃只恢复自动暂停项；手动 `pause` 会撤销自动恢复资格，手动 `resume` 会复核当前应用状态。

## 三、使用

```objc
JobsTimer *timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
    timer.byTimerType(JobsTimerTypeNSTimer)
    .byTimerStyle(TimerStyle_anticlockwise)
    .byTimeInterval(1)
    .byStartTime(10)
    .byQueue(dispatch_get_main_queue())
    .byPauseInBackground(YES)
    .byAutoManageAppState(YES);
});
[timer start];
```

## 四、同步边界

功能升级需要与 OC 新工程 `JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/` 对照；只平移源码语义，不把本地 Pod 结构或依赖带回老工程。

## 五、验证

```shell
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -scheme JobsOCBaseConfigDemo -configuration Debug -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build
```

`JobsOCBaseConfigDemoTests` 覆盖自动暂停恢复与手动暂停保护。

四种系统计时机制的完整差异、选型顺序与 Jobs 映射，统一查看 `../../../../OCBaseConfig/JobsMixFunc/JobsOCTimer/README.md`。
