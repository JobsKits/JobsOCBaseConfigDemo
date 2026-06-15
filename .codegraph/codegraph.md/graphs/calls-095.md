# `calls 符号关系 - 095`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T1["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T2["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T3["method:DemoCellNode::animateLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples_extra/BackgroundPropertySetting/Sample/DemoCellNode.swift:39"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T4["method:ASDisplayNode::_finishOrCancelTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:592"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T5["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::cancelLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:768"]
  T6["method:ASDisplayNode::_finishOrCancelTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:592"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::cancelLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:768"]
  T7["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T8["method:ASDisplayNode::_layoutSublayouts<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:510"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T9["method:_ASTransitionContext::removedSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/_ASTransitionContext.mm:76"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T10["method:_ASTransitionContext::insertedSubnodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/_ASTransitionContext.mm:71"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T11["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::animateLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:820"]
  T13["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  T14["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T15["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T16["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T17["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T18["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T19["method:ASDisplayNode::_assertSubnodeState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:963"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T20["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:409"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T21["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T22["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:199"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T23["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:199"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  T24["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T25["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
