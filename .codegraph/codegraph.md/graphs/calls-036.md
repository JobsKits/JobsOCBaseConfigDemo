# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABComponentLayer::addLayer:viewWidth:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:71"]
  T1["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  S1 -->|calls| T1
  S2["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  T2["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S2 -->|calls| T2
  S3["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  T3["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  S3 -->|calls| T3
  S4["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  T4["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S4 -->|calls| T4
  S5["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  T5["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S5 -->|calls| T5
  S6["method:TABComponentLayer::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:264"]
  T6["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  S6 -->|calls| T6
  S7["method:TABComponentLayer::copyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:319"]
  T7["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  S7 -->|calls| T7
  S8["method:TABComponentLayer::copyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:319"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["method:TABComponentLayer::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:376"]
  T9["method:TABComponentLayer::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:376"]
  S9 -->|calls| T9
  S10["method:TABComponentLayer::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:388"]
  T10["method:TABComponentLayer::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:388"]
  S10 -->|calls| T10
  S11["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:34"]
  T11["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:49"]
  S11 -->|calls| T11
  S12["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:target:action:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:41"]
  T12["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:49"]
  S12 -->|calls| T12
  S13["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:49"]
  T13["method:TABAnimatedPullLoadingComponent::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:60"]
  S13 -->|calls| T13
  S14["method:TABAnimatedPullLoadingComponent::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:60"]
  T14["method:TABAnimatedPullLoadingComponent::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:60"]
  S14 -->|calls| T14
  S15["method:TABAnimatedPullLoadingComponent::dealloc<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:67"]
  T15["method:TABAnimatedPullLoadingComponent::removeObservers<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:111"]
  S15 -->|calls| T15
  S16["method:TABAnimatedPullLoadingComponent::willMoveToSuperview:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:71"]
  T16["method:TABAnimatedPullLoadingComponent::addObservers<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:105"]
  S16 -->|calls| T16
  S17["method:TABAnimatedPullLoadingComponent::scrollViewContentOffsetDidChange:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:133"]
  T17["method:TABAnimatedPullLoadingComponent::happenOffsetY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:174"]
  S17 -->|calls| T17
  S18["method:TABAnimatedPullLoadingComponent::happenOffsetY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:174"]
  T18["method:TABAnimatedPullLoadingComponent::heightForContentBreakView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:183"]
  S18 -->|calls| T18
  S19["method:TABAnimatedPullLoadingComponent::setState:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:188"]
  T19["method:TABAnimatedPullLoadingComponent::addObservers<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:105"]
  S19 -->|calls| T19
  S20["method:TABAnimatedPullLoadingComponent::setState:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:188"]
  T20["method:TABAnimatedPullLoadingComponent::removeObservers<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:111"]
  S20 -->|calls| T20
  S21["method:UIScrollView::tab_addPullLoadingActionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:19"]
  T21["method:UIScrollView::tab_getClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:72"]
  S21 -->|calls| T21
  S22["method:UIScrollView::tab_addPullLoadingActionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:19"]
  T22["method:UIScrollView::tab_getViewHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:76"]
  S22 -->|calls| T22
  S23["method:UIScrollView::tab_addPullLoadingActionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:19"]
  T23["method:UIScrollView::tab_addPullLoadingClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:25"]
  S23 -->|calls| T23
  S24["method:UIScrollView::tab_addPullLoadingClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:25"]
  T24["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:34"]
  S24 -->|calls| T24
  S25["method:UIScrollView::tab_addPullLoadingClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/UIScrollView+TABAnimated.m:25"]
  T25["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
