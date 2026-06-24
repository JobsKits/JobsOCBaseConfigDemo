# `calls 符号关系 - 173`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASDisplayLayer::displayImmediately<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:158"]
  T1["method:_ASDisplayLayer::display<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  S1 -->|calls| T1
  S2["method:_ASDisplayLayer::display<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  T2["method:_ASDisplayLayer::_hackResetNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:168"]
  S2 -->|calls| T2
  S3["method:_ASDisplayLayer::display<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  T3["method:_ASDisplayLayer::display<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:175"]
  S3 -->|calls| T3
  S4["method:_ASDisplayLayer::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:204"]
  T4["method:_ASDisplayLayer::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:204"]
  S4 -->|calls| T4
  S5["method:_ASDisplayView::layerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:48"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:_ASDisplayView::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:54"]
  T6["method:_ASDisplayView::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:54"]
  S6 -->|calls| T6
  S7["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  T7["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S7 -->|calls| T7
  S8["method:_ASDisplayView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:107"]
  T8["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S8 -->|calls| T8
  S9["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T9["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S9 -->|calls| T9
  S10["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T10["method:ASDisplayNode::closestViewController<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Convenience.mm:17"]
  S10 -->|calls| T10
  S11["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  T13["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S13 -->|calls| T13
  S14["method:_ASDisplayView::sizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:247"]
  T14["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S14 -->|calls| T14
  S15["method:_ASDisplayView::contentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:260"]
  T15["function:ASDisplayNodeUIContentModeFromCAContentsGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:148"]
  S15 -->|calls| T15
  S16["method:_ASDisplayView::setContentMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:265"]
  T16["function:ASDisplayNodeCAContentsGravityFromUIContentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:133"]
  S16 -->|calls| T16
  S17["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  T17["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  S17 -->|calls| T17
  S18["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  T18["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  S18 -->|calls| T18
  S19["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  T19["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  S19 -->|calls| T19
  S20["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  T20["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  S20 -->|calls| T20
  S21["method:_ASDisplayView::__forwardTouchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:327"]
  T21["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  S21 -->|calls| T21
  S22["method:_ASDisplayView::__forwardTouchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:332"]
  T22["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  S22 -->|calls| T22
  S23["method:_ASDisplayView::__forwardTouchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:337"]
  T23["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  S23 -->|calls| T23
  S24["method:_ASDisplayView::__forwardTouchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:342"]
  T24["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  S24 -->|calls| T24
  S25["method:_ASDisplayView::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:347"]
  T25["method:_ASDisplayView::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:347"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
