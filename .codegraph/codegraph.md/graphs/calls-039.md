# `calls 符号关系 - 039`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABAnimatedProduction::recommendHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:81"]
  T1["method:TABAnimatedProduction::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:89"]
  S1 -->|calls| T1
  S2["method:TABAnimatedProduction::recommendHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:81"]
  T2["method:TABAnimatedProduction::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:99"]
  S2 -->|calls| T2
  S3["method:TABAnimatedProduction::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:89"]
  T3["method:TABComponentLayer::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:388"]
  S3 -->|calls| T3
  S4["method:TABAnimatedProduction::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProduction.m:99"]
  T4["method:TABComponentLayer::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:376"]
  S4 -->|calls| T4
  S5["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  T5["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  S5 -->|calls| T5
  S6["method:TABComponentLayer::resetFrameWithRect:animatedHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:46"]
  T6["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S6 -->|calls| T6
  S7["method:TABComponentLayer::addLayer:viewWidth:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:71"]
  T7["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S7 -->|calls| T7
  S8["method:TABComponentLayer::addLayer:viewWidth:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:71"]
  T8["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S8 -->|calls| T8
  S9["method:TABComponentLayer::addLayer:viewWidth:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:71"]
  T9["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S9 -->|calls| T9
  S10["method:TABComponentLayer::addLayer:viewWidth:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:71"]
  T10["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S10 -->|calls| T10
  S11["method:TABComponentLayer::addLayer:viewWidth:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:71"]
  T11["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  S11 -->|calls| T11
  S12["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  T12["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S12 -->|calls| T12
  S13["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  T13["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  S13 -->|calls| T13
  S14["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  T14["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S14 -->|calls| T14
  S15["method:TABComponentLayer::_addLinesLayer:animatedHeight:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:109"]
  T15["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S15 -->|calls| T15
  S16["method:TABComponentLayer::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:264"]
  T16["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  S16 -->|calls| T16
  S17["method:TABComponentLayer::copyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:319"]
  T17["method:TABComponentLayer::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:22"]
  S17 -->|calls| T17
  S18["method:TABComponentLayer::copyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:319"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:TABComponentLayer::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:376"]
  T19["method:TABComponentLayer::tab_maxY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:376"]
  S19 -->|calls| T19
  S20["method:TABComponentLayer::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:388"]
  T20["method:TABComponentLayer::tab_minY<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABComponentLayer.m:388"]
  S20 -->|calls| T20
  S21["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:actionHandler:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:34"]
  T21["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:49"]
  S21 -->|calls| T21
  S22["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:target:action:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:41"]
  T22["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:49"]
  S22 -->|calls| T22
  S23["method:TABAnimatedPullLoadingComponent::initWithScrollView:targetClass:viewHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:49"]
  T23["method:TABAnimatedPullLoadingComponent::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:60"]
  S23 -->|calls| T23
  S24["method:TABAnimatedPullLoadingComponent::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:60"]
  T24["method:TABAnimatedPullLoadingComponent::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:60"]
  S24 -->|calls| T24
  S25["method:TABAnimatedPullLoadingComponent::dealloc<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:67"]
  T25["method:TABAnimatedPullLoadingComponent::removeObservers<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/PullLoading/TABAnimatedPullLoadingComponent.m:111"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
