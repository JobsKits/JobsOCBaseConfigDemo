# `calls 符号关系 - 183`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T6["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S6 -->|calls| T6
  S7["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  T9["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S9 -->|calls| T9
  S10["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T10["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:412"]
  S10 -->|calls| T10
  S11["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T11["method:ASTextCellNode::defaultTextAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:429"]
  S11 -->|calls| T11
  S12["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  T12["method:ASTextCellNode::defaultTextInsets<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:434"]
  S12 -->|calls| T12
  S13["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:412"]
  T13["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S13 -->|calls| T13
  S14["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:412"]
  T14["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S14 -->|calls| T14
  S15["method:ASTextCellNode::setTextAttributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:444"]
  T15["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:478"]
  S15 -->|calls| T15
  S16["method:ASTextCellNode::setTextInsets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:458"]
  T16["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S16 -->|calls| T16
  S17["method:ASTextCellNode::setText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:470"]
  T17["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:478"]
  S17 -->|calls| T17
  S18["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:478"]
  T18["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S18 -->|calls| T18
  S19["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:478"]
  T19["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:1"]
  T20["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T21["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
