# `calls 符号关系 - 081`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCellNode::setSelected:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:135"]
  T1["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S1 -->|calls| T1
  S2["method:ASCellNode::setHighlighted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:151"]
  T2["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S2 -->|calls| T2
  S3["method:ASCellNode::canUpdateToNodeModel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:182"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASCellNode::viewController<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:192"]
  T4["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S4 -->|calls| T4
  S5["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:266"]
  T5["method:ASCellNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:266"]
  S5 -->|calls| T5
  S6["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:275"]
  T6["method:ASCellNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:275"]
  S6 -->|calls| T6
  S7["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T7["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S7 -->|calls| T7
  S8["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T8["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S8 -->|calls| T8
  S9["method:ASCellNode::requestsVisibilityNotifications<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:281"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:ASCellNode::handleVisibilityChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:297"]
  T10["method:ASCellNode::cellNodeVisibilityEvent:inScrollView:withCellFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:261"]
  S10 -->|calls| T10
  S11["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T11["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S11 -->|calls| T11
  S12["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T17["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S17 -->|calls| T17
  S18["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T18["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S18 -->|calls| T18
  S19["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T21["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S21 -->|calls| T21
  S22["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T22["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:412"]
  S22 -->|calls| T22
  S23["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T23["method:ASTextCellNode::defaultTextAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:429"]
  S23 -->|calls| T23
  S24["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T24["method:ASTextCellNode::defaultTextInsets<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:434"]
  S24 -->|calls| T24
  S25["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:412"]
  T25["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
