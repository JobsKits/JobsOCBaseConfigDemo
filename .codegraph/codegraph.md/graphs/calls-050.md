# `calls 符号关系 - 050`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXCategoryFactory::interpolationColorFrom:to:percent:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryFactory.m:19"]
  T1["method:JXCategoryFactory::interpolationFrom:to:percent:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryFactory.m:13"]
  S1 -->|calls| T1
  S2["method:JXCategoryFactory::interpolationColorFrom:to:percent:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryFactory.m:19"]
  T2["method:JXCategoryFactory::interpolationFrom:to:percent:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryFactory.m:13"]
  S2 -->|calls| T2
  S3["method:JXCategoryDotView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Dot/JXCategoryDotView.m:12"]
  T3["method:JXCategoryDotView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Dot/JXCategoryDotView.m:12"]
  S3 -->|calls| T3
  S4["method:JXCategoryDotView::preferredCellClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Dot/JXCategoryDotView.m:21"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:JXCategoryDotView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Dot/JXCategoryDotView.m:34"]
  T5["method:JXCategoryDotView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Dot/JXCategoryDotView.m:34"]
  S5 -->|calls| T5
  S6["method:JXCategoryImageView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Image/JXCategoryImageView.m:18"]
  T6["method:JXCategoryImageView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Image/JXCategoryImageView.m:18"]
  S6 -->|calls| T6
  S7["method:JXCategoryImageView::preferredCellClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Image/JXCategoryImageView.m:27"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["method:JXCategoryImageView::refreshSelectedCellModel:unselectedCellModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Image/JXCategoryImageView.m:41"]
  T8["method:JXCategoryImageView::refreshSelectedCellModel:unselectedCellModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Image/JXCategoryImageView.m:41"]
  S8 -->|calls| T8
  S9["method:JXCategoryImageView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Image/JXCategoryImageView.m:51"]
  T9["method:JXCategoryImageView::refreshCellModel:index:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Image/JXCategoryImageView.m:51"]
  S9 -->|calls| T9
  S10["method:JXCategoryImageView::refreshLeftCellModel:rightCellModel:ratio:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Image/JXCategoryImageView.m:75"]
  T10["method:JXCategoryImageView::refreshLeftCellModel:rightCellModel:ratio:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Image/JXCategoryImageView.m:75"]
  S10 -->|calls| T10
  S11["method:JXCategoryIndicatorLineView::jx_refreshState:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/IndicatorViews/JXCategoryIndicatorLineView.m:30"]
  T11["method:JXCategoryIndicatorLineView::getIndicatorLineViewCornerRadius<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/IndicatorViews/JXCategoryIndicatorLineView.m:117"]
  S11 -->|calls| T11
  S12["method:JXCategoryIndicatorView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:18"]
  T12["method:JXCategoryIndicatorView::initializeData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:18"]
  S12 -->|calls| T12
  S13["method:JXCategoryIndicatorView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:29"]
  T13["method:JXCategoryIndicatorView::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:29"]
  S13 -->|calls| T13
  S14["method:JXCategoryIndicatorView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:39"]
  T14["method:JXCategoryIndicatorView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:39"]
  S14 -->|calls| T14
  S15["method:JXCategoryIndicatorView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:39"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:JXCategoryIndicatorView::refreshState<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:39"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:JXCategoryIndicatorView::refreshSelectedCellModel:unselectedCellModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:81"]
  T17["method:JXCategoryIndicatorView::refreshSelectedCellModel:unselectedCellModel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:81"]
  S17 -->|calls| T17
  S18["method:JXCategoryIndicatorView::contentOffsetOfContentScrollViewDidChanged:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:94"]
  T18["method:JXCategoryIndicatorView::refreshLeftCellModel:rightCellModel:ratio:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:182"]
  S18 -->|calls| T18
  S19["method:JXCategoryIndicatorView::contentOffsetOfContentScrollViewDidChanged:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:94"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:JXCategoryIndicatorView::contentOffsetOfContentScrollViewDidChanged:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:94"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:JXCategoryIndicatorView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:151"]
  T21["method:JXCategoryIndicatorView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:151"]
  S21 -->|calls| T21
  S22["method:JXCategoryIndicatorView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:151"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:JXCategoryIndicatorView::selectCellAtIndex:selectedType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Indicator/JXCategoryIndicatorView.m:151"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["method:JXCategoryNumberCell::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Number/JXCategoryNumberCell.m:17"]
  T24["method:JXCategoryNumberCell::initializeViews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Number/JXCategoryNumberCell.m:17"]
  S24 -->|calls| T24
  S25["method:JXCategoryNumberCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Number/JXCategoryNumberCell.m:29"]
  T25["method:JXCategoryNumberCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Number/JXCategoryNumberCell.m:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
