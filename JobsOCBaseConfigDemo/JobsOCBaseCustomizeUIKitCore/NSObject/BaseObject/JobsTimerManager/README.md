# `JobsTimerManager`（兼容层）

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#jobs-toc-heading-1)
- [一、兼容边界](#jobs-toc-heading-2)
- [二、应用状态策略](#jobs-toc-heading-3)
- [三、迁移与验证](#jobs-toc-heading-4)

</details>
<!-- jobs-toc:end -->

---

## <span id="jobs-toc-heading-1" data-jobs-toc="v2">🔥 <font id=前言>前言</font></span><!-- jobs-toc:heading-end -->

> `JobsTimerManager` 是老工程保留的兼容管理器；新业务优先使用 `JobsTimerMgr`。

## <span id="jobs-toc-heading-2" data-jobs-toc="v2">一、兼容边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- 注册字典通过懒加载 getter 保证首次 upsert、查询和控制均可用。
- 同 identifier 原子替换 Entry，再在隔离队列外停止旧 Timer。
- 回调与删除操作核对 Entry / Timer 身份，不会影响并发替换后的新注册项。
- 兼容层同步提供 `stopAndRemove:expectedTimer:` 与 Scope 暂停、恢复、整组清理 API；新业务仍优先使用 `JobsTimerMgr`。

## <span id="jobs-toc-heading-3" data-jobs-toc="v2">二、应用状态策略 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

- `PauseAndResume` 在失去活跃态时暂停，重新活跃只恢复自动暂停项。
- 手动暂停会保留为手动状态，`didBecomeActive` 不会误恢复。
- `startImmediately`、`start:`、`resume:` 后同步当前应用状态。
- `Cancel` 只在真实 background 时停止并移除，短暂 inactive 不会误取消。
- Scope 只恢复 `_JobsTimerPauseStateScopePaused`，不会覆盖 `_JobsTimerPauseStateManualPaused`。

## <span id="jobs-toc-heading-4" data-jobs-toc="v2">三、迁移与验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a></span><!-- jobs-toc:heading-end -->

删除兼容层前，先执行以下扫描，确认调用方都已迁移：

```shell
rg "JobsTimerManager" JobsOCBaseConfigDemo
```

完成修改后，编译老工程主 scheme 与 `JobsOCBaseConfigDemoTests`，并确认 `JobsTimerMgr`、`JobsTimerManager` 两套行为保持一致。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
