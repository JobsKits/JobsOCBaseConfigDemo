# `JobsTimerManager`（兼容层）

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsTimerManager` 是老工程保留的兼容管理器；新业务优先使用 `JobsTimerMgr`。

## 一、兼容边界

- 注册字典通过懒加载 getter 保证首次 upsert、查询和控制均可用。
- 同 identifier 原子替换 Entry，再在隔离队列外停止旧 Timer。
- 回调与删除操作核对 Entry / Timer 身份，不会影响并发替换后的新注册项。

## 二、应用状态策略

- `PauseAndResume` 在失去活跃态时暂停，重新活跃只恢复自动暂停项。
- 手动暂停会保留为手动状态，`didBecomeActive` 不会误恢复。
- `startImmediately`、`start:`、`resume:` 后同步当前应用状态。
- `Cancel` 只在真实 background 时停止并移除，短暂 inactive 不会误取消。

## 三、迁移与验证

删除兼容层前，先执行以下扫描，确认调用方都已迁移：

```shell
rg "JobsTimerManager" JobsOCBaseConfigDemo
```

完成修改后，编译老工程主 scheme 与 `JobsOCBaseConfigDemoTests`，并确认 `JobsTimerMgr`、`JobsTimerManager` 两套行为保持一致。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
