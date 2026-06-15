# `calls 符号关系 - 092`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T1["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T2["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T3["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T4["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T5["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::closestViewController<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Convenience.mm:17"]
  T6["function:ASFindClosestViewOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:266"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::closestViewController<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Convenience.mm:17"]
  T7["method:UIResponder::asdk_responderChainEnumerator<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:40"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::style:propertyDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:30"]
  T8["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:51"]
  T9["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  T10["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::layoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:83"]
  T11["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  T12["method:ASDisplayNode::_isLayoutTransitionInvalid<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:564"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  T13["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  T14["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::layoutThatFits:parentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:88"]
  T15["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::setPrimitiveTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:132"]
  T16["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:151"]
  T17["method:ASDisplayNode::asciiArtName<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:156"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::constrainedSizeForCalculatedLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:202"]
  T18["method:ASDisplayNode::_locked_constrainedSizeForCalculatedLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:208"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T19["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T20["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::_u_setNeedsLayoutFromAbove<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:243"]
  T21["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T22["function:ASCeilSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:270"]
  T23["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T24["method:ASDisplayNode::_locked_isLayoutTransitionInvalid<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:570"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::_u_measureNodeWithBoundsIfNecessary:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:331"]
  T25["function:ASCeilSizeValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:220"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
