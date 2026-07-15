# `calls 符号关系 - 099`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  T1["function:ASDisplayNodeFindAllSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:195"]
  S1 -->|calls| T1
  S2["function:ASDisplayNodeFindAllSubnodesOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:202"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  T3["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S3 -->|calls| T3
  S4["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  T4["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S4 -->|calls| T4
  S5["function:ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:226"]
  T5["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S5 -->|calls| T5
  S6["function:ASDisplayNodeFindFirstSubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:231"]
  T6["function:_ASDisplayNodeFindFirstNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:211"]
  S6 -->|calls| T6
  S7["function:ASDisplayNodeFindFirstSubnodeOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:236"]
  T7["function:ASDisplayNodeFindFirstSubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:231"]
  S7 -->|calls| T7
  S8["function:ASDisplayNodeFindFirstSubnodeOfClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:236"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  T9["function:ASFindClosestViewOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:266"]
  S9 -->|calls| T9
  S10["function:ASDisplayNodeFindClosestCommonAncestor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:277"]
  T10["function:_ASDisplayNodeIsAncestorOfDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:243"]
  S10 -->|calls| T10
  S11["method:_ASTextInputTraitsPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:38"]
  T11["method:_ASTextInputTraitsPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:38"]
  S11 -->|calls| T11
  S12["method:ASEditableTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:145"]
  T12["method:ASEditableTextNode::initWithTextKitComponents:placeholderTextKitComponents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:151"]
  S12 -->|calls| T12
  S13["method:ASEditableTextNode::initWithTextKitComponents:placeholderTextKitComponents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:151"]
  T13["method:ASEditableTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:145"]
  S13 -->|calls| T13
  S14["method:ASEditableTextNode::initWithTextKitComponents:placeholderTextKitComponents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:151"]
  T14["method:ASEditableTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:145"]
  S14 -->|calls| T14
  S15["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T15["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  S15 -->|calls| T15
  S16["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T16["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  S16 -->|calls| T16
  S17["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T17["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  S17 -->|calls| T17
  S18["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T18["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S18 -->|calls| T18
  S19["method:ASEditableTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:233"]
  T19["method:ASEditableTextNode::isDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:367"]
  S19 -->|calls| T19
  S20["method:ASEditableTextNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  T20["method:ASEditableTextNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  S20 -->|calls| T20
  S21["method:ASEditableTextNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  T21["method:ASEditableTextNode::_layoutTextView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:465"]
  S21 -->|calls| T21
  S22["method:ASEditableTextNode::textView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:317"]
  T22["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S22 -->|calls| T22
  S23["method:ASEditableTextNode::setMaximumLinesToDisplay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:325"]
  T23["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S23 -->|calls| T23
  S24["method:ASEditableTextNode::attributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:394"]
  T24["method:ASEditableTextNode::isDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:367"]
  S24 -->|calls| T24
  S25["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T25["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
