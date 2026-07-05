# `calls 符号关系 - 120`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T1["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S1 -->|calls| T1
  S2["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T2["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S2 -->|calls| T2
  S3["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T3["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T4["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T5["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T6["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T7["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T8["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T9["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T10["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T11["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T12["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T13["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T14["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S14 -->|calls| T14
  S15["method:_ASTablePendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:51"]
  T15["method:_ASTablePendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:51"]
  S15 -->|calls| T15
  S16["method:_ASTablePendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:51"]
  T16["method:ASAbstractLayoutController::defaultTuningParameters<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:90"]
  S16 -->|calls| T16
  S17["method:_ASTablePendingState::tuningParametersForRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:74"]
  T17["method:_ASTablePendingState::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:84"]
  S17 -->|calls| T17
  S18["method:_ASTablePendingState::setTuningParameters:forRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:79"]
  T18["method:_ASTablePendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:90"]
  S18 -->|calls| T18
  S19["method:ASTableNode::initWithStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:114"]
  T19["method:ASTableNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:127"]
  S19 -->|calls| T19
  S20["method:ASTableNode::initWithStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:114"]
  T20["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  S20 -->|calls| T20
  S21["method:ASTableNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:133"]
  T21["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S21 -->|calls| T21
  S22["method:ASTableNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:146"]
  T22["method:ASTableNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:146"]
  S22 -->|calls| T22
  S23["method:ASTableNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:200"]
  T23["method:ASTableNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:200"]
  S23 -->|calls| T23
  S24["method:ASTableNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:205"]
  T24["method:ASTableNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:205"]
  S24 -->|calls| T24
  S25["method:ASTableNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:211"]
  T25["method:ASTableNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:211"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
