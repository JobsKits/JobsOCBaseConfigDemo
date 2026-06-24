# `calls 符号关系 - 095`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::_completeLayoutTransition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:942"]
  T1["method:ASLayoutTransition::commitTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:87"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T2["method:ASDisplayNode::_assertSubnodeState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:963"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T3["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:409"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T4["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T5["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:199"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::_pendingLayoutTransitionDidComplete<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1009"]
  T6["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:199"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  T7["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T8["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T9["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T10["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T11["method:ASLayoutSpec::findDuplicatedElementsInSubtree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:180"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T13["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T14["method:ASDisplayNode::shouldStoreUnflattenedLayouts<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:3677"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T15["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::layoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:154"]
  T16["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::_locked_addYogaChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:75"]
  T17["method:ASDisplayNode::insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:99"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::_locked_removeYogaChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:86"]
  T18["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:99"]
  T19["method:ASDisplayNode::_locked_insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:105"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::_locked_insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:105"]
  T20["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::_locked_insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:105"]
  T21["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::setYogaLayoutInProgress:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:177"]
  T22["method:ASDisplayNode::updateYogaMeasureFuncIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:293"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  T23["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  T24["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T25["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
