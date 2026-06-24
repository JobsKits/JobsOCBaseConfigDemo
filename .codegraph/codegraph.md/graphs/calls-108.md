# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  T1["function:_ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:181"]
  S1 -->|calls| T1
  S2["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  T2["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  S2 -->|calls| T2
  S3["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  T4["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S4 -->|calls| T4
  S5["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  T5["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S5 -->|calls| T5
  S6["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  T6["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S6 -->|calls| T6
  S7["function:ASDisplayNodeFindFirstSubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:231"]
  T7["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S7 -->|calls| T7
  S8["function:ASDisplayNodeFindFirstSubnodeOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:236"]
  T8["function:ASDisplayNodeFindFirstSubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:231"]
  S8 -->|calls| T8
  S9["function:ASDisplayNodeFindFirstSubnodeOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:236"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  T10["function:ASFindClosestViewOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:266"]
  S10 -->|calls| T10
  S11["function:ASDisplayNodeFindClosestCommonAncestor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:277"]
  T11["function:_ASDisplayNodeIsAncestorOfDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:243"]
  S11 -->|calls| T11
  S12["method:_ASTextInputTraitsPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:38"]
  T12["method:_ASTextInputTraitsPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:38"]
  S12 -->|calls| T12
  S13["method:ASEditableTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:145"]
  T13["method:ASEditableTextNode::initWithTextKitComponents:placeholderTextKitComponents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:151"]
  S13 -->|calls| T13
  S14["method:ASEditableTextNode::initWithTextKitComponents:placeholderTextKitComponents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:151"]
  T14["method:ASEditableTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:145"]
  S14 -->|calls| T14
  S15["method:ASEditableTextNode::initWithTextKitComponents:placeholderTextKitComponents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:151"]
  T15["method:ASEditableTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:145"]
  S15 -->|calls| T15
  S16["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T16["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  S16 -->|calls| T16
  S17["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T17["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  S17 -->|calls| T17
  S18["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T18["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  S18 -->|calls| T18
  S19["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T19["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S19 -->|calls| T19
  S20["method:ASEditableTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:233"]
  T20["method:ASEditableTextNode::isDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:367"]
  S20 -->|calls| T20
  S21["method:ASEditableTextNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  T21["method:ASEditableTextNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  S21 -->|calls| T21
  S22["method:ASEditableTextNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  T22["method:ASEditableTextNode::_layoutTextView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:465"]
  S22 -->|calls| T22
  S23["method:ASEditableTextNode::textView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:317"]
  T23["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S23 -->|calls| T23
  S24["method:ASEditableTextNode::setMaximumLinesToDisplay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:325"]
  T24["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S24 -->|calls| T24
  S25["method:ASEditableTextNode::attributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:394"]
  T25["method:ASEditableTextNode::isDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:367"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
