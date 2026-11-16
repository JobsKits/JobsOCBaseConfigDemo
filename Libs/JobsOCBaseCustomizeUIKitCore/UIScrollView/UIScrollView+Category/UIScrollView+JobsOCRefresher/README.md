# JobsOCRefresher 刷新与动画协议

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、目录与公开入口](#layout)
- [二、动画注入与替换](#animator)
- [三、状态与 inset 归属](#state)
- [四、验证入口](#validation)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

`JobsOCRefresher` 直接集成于主工程，通过 [**UIKit**](https://developer.apple.com/documentation/uikit) 的 `UIScrollView` 分类提供上下左右刷新与加载更多。刷新状态和 inset 归属由组件管理，动画表现统一交给 `JobsRefreshAnimatorProtocol`，不新增 Pod。

## 一、<span id="layout">目录与公开入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件组 | 职责 |
| --- | --- |
| [JobsOCRefresher.h](./JobsOCRefresher.h) | 主工程聚合头。 |
| [JobsOCRefreshDefines](./JobsOCRefreshDefines/JobsOCRefreshDefines.h) | 方向、位置、刷新 / 加载语义与状态。 |
| [JobsOCRefreshConfig](./JobsOCRefreshConfig/JobsOCRefreshConfig.h) | 触发距离、组件长度、文案、声音、震动与 `animator`。 |
| [JobsOCRefreshComponent](./JobsOCRefreshComponent/JobsOCRefreshComponent.h) | 将刷新状态映射成动画阶段，托管协议视图、状态文案和最近刷新时间。 |
| [UIScrollView+JobsOCRefresher](./UIScrollView+JobsOCRefresher/UIScrollView+JobsOCRefresher.h) | 挂载、切换状态、热替换动画与移除组件。 |

每组 `.h` / `.m` 放在完整基名的同名目录。依赖复用主工程已集成的 `JobsBlock`、`JobsLanMgr`、`JobsMakes`、`JobsOCDSL`、`JobsOCDefs` 和 `JobsFuseAnimation`。

## 二、<span id="animator">动画注入与替换</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 默认配置使用 `JobsSystemRefreshView.refreshView()`；直接创建的配置未设置 `animator` 或原位替换传入 `nil` 时，也回退系统动画。
- 配置通过 `byAnimator(...)` 注入动画。挂载后使用 `jobs_replaceRefreshAnimator:atPosition:` 原位替换，停用旧动画并让新动画立即接收当前状态和进度；不重建刷新状态机。
- 单图、多图轮播、GIF、Lottie、今日头条和抖音动画由 `JobsFuseAnimation` 的对应协议实现提供。素材解码和计时留在动画组件内；刷新配置不再暴露素材类型枚举或各类素材字段。
- 自定义动画实现 `refreshAnimatorView()`、`refreshAnimatorPreferredSize()` 和 `refreshAnimatorApplyPhase:progress:`。

```objc
JobsOCRefreshConfig *config = JobsOCRefreshConfig.defaultHeaderConfig();
config
    .byShowsText(NO)
    .byAnimator(JobsSystemRefreshView.refreshView());
[scrollView jobs_byRefreshHeaderWithConfig:config action:^{
    [scrollView jobs_switchRefreshAt:JobsOCRefreshPositionHeader
                             toState:JobsOCRefreshStateIdle];
}];
[scrollView jobs_replaceRefreshAnimator:nil
                            atPosition:JobsOCRefreshPositionHeader];
```

可操作示例位于 `业务逻辑/功能模块/Demo@JobsOCRefresher`，通过协议对象切换表现；它没有独立的旧素材配置分支。

## 三、<span id="state">状态与 inset 归属</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

四个方向的槽位独立处理。替换或移除槽位时，只归还该槽位追加的 inset；宿主其它边的 inset 保留。失败、禁用、无更多数据与正常结束均完成收尾，过期的结束动画 completion 不能覆盖后续刷新。状态操作在主线程完成。

动画进度归一化到 `0...1`；无文字模式只布局动画，隐藏最近刷新时间。横向与纵向布局分别使用动画器提供的期望尺寸，不依赖具体素材类。

## 四、<span id="validation">验证入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改后核对配置、DSL、状态映射和所有消费方；使用真实主工程编译参数编译核心与 Demo，再运行界面检查四向刷新和运行中动画替换。独立编译通过不代表完整主工程或真机交互已经验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
