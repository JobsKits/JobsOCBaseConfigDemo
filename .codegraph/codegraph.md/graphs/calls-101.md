# `calls 符号关系 - 101`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::cancelLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:768"]
  T1["method:ASDisplayNode::_finishOrCancelTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:592"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::cancelLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:768"]
  T2["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T3["method:ASDisplayNode::_layoutSublayouts<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:510"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T4["method:_ASTransitionContext::removedSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/_ASTransitionContext.mm:76"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T5["method:_ASTransitionContext::insertedSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/_ASTransitionContext.mm:71"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T6["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T7["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T8["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  T9["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T10["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T11["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T12["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T13["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T14["method:ASDisplayNode::_assertSubnodeState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:963"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T15["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:409"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T16["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T17["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:199"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T18["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:199"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  T19["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T20["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T21["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T22["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T23["method:ASLayoutSpec::findDuplicatedElementsInSubtree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:180"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T24["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T25["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
