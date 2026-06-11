# `calls 符号关系 - 102`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T1["method:ASDisplayNode::shouldStoreUnflattenedLayouts<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:3677"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::calculateLayoutLayoutSpec:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:36"]
  T2["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::layoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+LayoutSpec.mm:154"]
  T3["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::_locked_addYogaChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:75"]
  T4["method:ASDisplayNode::insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:99"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::_locked_removeYogaChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:86"]
  T5["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:99"]
  T6["method:ASDisplayNode::_locked_insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:105"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::_locked_insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:105"]
  T7["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::_locked_insertYogaChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:105"]
  T8["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::setYogaLayoutInProgress:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:177"]
  T9["method:ASDisplayNode::updateYogaMeasureFuncIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:293"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  T10["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  T11["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T12["method:ASDisplayNode::layoutForYogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:188"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T13["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T14["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T15["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::setupYogaCalculatedLayoutAndSetNeedsLayoutForChangedNodes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:205"]
  T16["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  T17["method:ASDisplayNode::implementsLayoutMethod<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:42"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::updateYogaMeasureFuncIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:293"]
  T18["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::updateYogaMeasureFuncIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:293"]
  T19["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::invalidateCalculatedYogaLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:302"]
  T20["method:ASDisplayNode::shouldHaveYogaMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:282"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T21["method:ASDisplayNode::locked_shouldLayoutFromYogaRoot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:1078"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T22["function:NSStringFromASSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:95"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::calculateLayoutYoga:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:322"]
  T23["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T24["method:ASDisplayNode::lockToRootIfNeededForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:443"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::calculateLayoutFromYogaRoot:willApply:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Yoga.mm:355"]
  T25["function:ASSizeRangeEqualToSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:290"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
