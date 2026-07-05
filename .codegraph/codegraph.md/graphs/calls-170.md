# `calls 符号关系 - 170`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  T1["method:_ASDisplayView::actionForLayer:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:83"]
  S1 -->|calls| T1
  S2["method:_ASDisplayView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:107"]
  T2["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S2 -->|calls| T2
  S3["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T3["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S3 -->|calls| T3
  S4["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T4["method:ASDisplayNode::closestViewController<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Convenience.mm:17"]
  S4 -->|calls| T4
  S5["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:_ASDisplayView::didMoveToSuperview<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:160"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  T7["method:_ASDisplayView::insertSubview:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:221"]
  S7 -->|calls| T7
  S8["method:_ASDisplayView::sizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:247"]
  T8["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S8 -->|calls| T8
  S9["method:_ASDisplayView::contentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:260"]
  T9["function:ASDisplayNodeUIContentModeFromCAContentsGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:148"]
  S9 -->|calls| T9
  S10["method:_ASDisplayView::setContentMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:265"]
  T10["function:ASDisplayNodeCAContentsGravityFromUIContentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:133"]
  S10 -->|calls| T10
  S11["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  T11["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  S11 -->|calls| T11
  S12["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  T12["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  S12 -->|calls| T12
  S13["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  T13["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  S13 -->|calls| T13
  S14["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  T14["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  S14 -->|calls| T14
  S15["method:_ASDisplayView::__forwardTouchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:327"]
  T15["method:_ASDisplayView::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:287"]
  S15 -->|calls| T15
  S16["method:_ASDisplayView::__forwardTouchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:332"]
  T16["method:_ASDisplayView::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:297"]
  S16 -->|calls| T16
  S17["method:_ASDisplayView::__forwardTouchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:337"]
  T17["method:_ASDisplayView::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:307"]
  S17 -->|calls| T17
  S18["method:_ASDisplayView::__forwardTouchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:342"]
  T18["method:_ASDisplayView::touchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:317"]
  S18 -->|calls| T18
  S19["method:_ASDisplayView::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:347"]
  T19["method:_ASDisplayView::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:347"]
  S19 -->|calls| T19
  S20["method:_ASDisplayView::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:367"]
  T20["method:_ASDisplayView::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:367"]
  S20 -->|calls| T20
  S21["method:_ASDisplayView::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:387"]
  T21["method:_ASDisplayView::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:387"]
  S21 -->|calls| T21
  S22["method:_ASDisplayView::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:387"]
  T22["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  S22 -->|calls| T22
  S23["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  T23["method:ASEditableTextNode::canBecomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:495"]
  S23 -->|calls| T23
  S24["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  T24["method:_ASDisplayView::canBecomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:397"]
  S24 -->|calls| T24
  S25["method:_ASDisplayView::becomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:410"]
  T25["method:ASEditableTextNode::becomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:500"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
