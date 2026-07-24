# `calls 符号关系 - 191`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T1["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T2["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S2 -->|calls| T2
  S3["function:changes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:972"]
  T3["method:NSIndexSet::as_smallDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:68"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T4["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T5["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T6["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T7["method:ASCellNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:324"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:1"]
  T8["function:NSStringFromASHierarchyChangeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASHierarchyChangeSet.mm:45"]
  S8 -->|calls| T8
  S9["function:_ASPendingState::ASPendingStateApplyMetricsToLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:178"]
  T9["function:ASBoundsAndPositionForFrame<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:83"]
  S9 -->|calls| T9
  S10["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  T10["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  S10 -->|calls| T10
  S11["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  T11["function:ASDefaultAllowsGroupOpacity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:20"]
  S11 -->|calls| T11
  S12["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  T12["function:ASDefaultAllowsEdgeAntialiasing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:31"]
  S12 -->|calls| T12
  S13["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  T13["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S13 -->|calls| T13
  S14["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  T14["function:ASDisplayNodeCAContentsGravityFromUIContentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:133"]
  S14 -->|calls| T14
  S15["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  T15["function:_ASPendingState::ASPendingStateApplyMetricsToLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:178"]
  S15 -->|calls| T15
  S16["method:_ASPendingState::applyToLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:932"]
  T16["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S16 -->|calls| T16
  S17["method:_ASPendingState::applyToView:withSpecialPropertiesHandling:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:1043"]
  T17["method:_ASDisplayView::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:253"]
  S17 -->|calls| T17
  S18["method:_ASPendingState::applyToView:withSpecialPropertiesHandling:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:1043"]
  T18["function:_ASPendingState::ASPendingStateApplyMetricsToLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:178"]
  S18 -->|calls| T18
  S19["method:_ASPendingState::applyToView:withSpecialPropertiesHandling:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:1043"]
  T19["method:ASBridgedPropertiesTestView::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Tests/ASBridgedPropertiesTests.mm:29"]
  S19 -->|calls| T19
  S20["method:_ASPendingState::pendingViewStateFromLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:1271"]
  T20["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  S20 -->|calls| T20
  S21["method:_ASPendingState::pendingViewStateFromLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:1271"]
  T21["function:ASDisplayNodeUIContentModeFromCAContentsGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:148"]
  S21 -->|calls| T21
  S22["method:_ASPendingState::pendingViewStateFromView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:1310"]
  T22["method:_ASPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASPendingState.mm:232"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
