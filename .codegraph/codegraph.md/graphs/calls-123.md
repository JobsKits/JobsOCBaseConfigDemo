# `calls 符号关系 - 123`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T1["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S1 -->|calls| T1
  S2["method:ASScrollNode::setScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:178"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["method:ASTabBarController::setViewControllers:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:54"]
  T3["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S3 -->|calls| T3
  S4["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  T4["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  S4 -->|calls| T4
  S5["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  T5["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S5 -->|calls| T5
  S6["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T6["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S6 -->|calls| T6
  S7["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T7["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S7 -->|calls| T7
  S8["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T8["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S8 -->|calls| T8
  S9["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T9["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
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
  T13["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T14["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T15["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T16["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T17["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T18["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T19["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T20["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S20 -->|calls| T20
  S21["method:_ASTablePendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:51"]
  T21["method:_ASTablePendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:51"]
  S21 -->|calls| T21
  S22["method:_ASTablePendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:51"]
  T22["method:ASAbstractLayoutController::defaultTuningParameters<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:90"]
  S22 -->|calls| T22
  S23["method:_ASTablePendingState::tuningParametersForRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:74"]
  T23["method:_ASTablePendingState::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:84"]
  S23 -->|calls| T23
  S24["method:_ASTablePendingState::setTuningParameters:forRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:79"]
  T24["method:_ASTablePendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:90"]
  S24 -->|calls| T24
  S25["method:ASTableNode::initWithStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:114"]
  T25["method:ASTableNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:127"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
