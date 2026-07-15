# `calls 符号关系 - 065`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASButtonNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  T1["method:ASButtonNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h:1"]
  T2["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h:1"]
  T3["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h:1"]
  T4["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S4 -->|calls| T4
  S5["method:ASCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:48"]
  T5["method:ASCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S5 -->|calls| T5
  S6["method:ASCellNode::initWithViewControllerBlock:didLoadBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:61"]
  T6["method:ASCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S6 -->|calls| T6
  S7["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  T7["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  S7 -->|calls| T7
  S8["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:ASCellNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:105"]
  T10["method:ASCellNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:105"]
  S10 -->|calls| T10
  S11["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:112"]
  T11["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:112"]
  S11 -->|calls| T11
  S12["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:121"]
  T12["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:121"]
  S12 -->|calls| T12
  S13["method:ASCellNode::setSelected:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:135"]
  T13["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S13 -->|calls| T13
  S14["method:ASCellNode::setHighlighted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:151"]
  T14["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S14 -->|calls| T14
  S15["method:ASCellNode::canUpdateToNodeModel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:182"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:ASCellNode::viewController<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:192"]
  T16["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S16 -->|calls| T16
  S17["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:266"]
  T17["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:266"]
  S17 -->|calls| T17
  S18["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:275"]
  T18["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:275"]
  S18 -->|calls| T18
  S19["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T19["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S19 -->|calls| T19
  S20["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T20["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S20 -->|calls| T20
  S21["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:ASCellNode::handleVisibilityChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:297"]
  T22["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S22 -->|calls| T22
  S23["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T23["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S23 -->|calls| T23
  S24["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
