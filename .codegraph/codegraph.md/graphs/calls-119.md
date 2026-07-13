# `calls 符号关系 - 119`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASScrollView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:48"]
  T1["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S1 -->|calls| T1
  S2["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T2["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S2 -->|calls| T2
  S3["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T3["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S3 -->|calls| T3
  S4["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T4["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S4 -->|calls| T4
  S5["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T5["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S5 -->|calls| T5
  S6["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T6["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S6 -->|calls| T6
  S7["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T7["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S7 -->|calls| T7
  S8["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T8["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S8 -->|calls| T8
  S9["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T9["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S9 -->|calls| T9
  S10["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T10["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S10 -->|calls| T10
  S11["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T11["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S11 -->|calls| T11
  S12["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T12["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S12 -->|calls| T12
  S13["method:ASScrollNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T13["method:ASScrollNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  S13 -->|calls| T13
  S14["method:ASScrollNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T14["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S14 -->|calls| T14
  S15["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T15["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S15 -->|calls| T15
  S16["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T16["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S16 -->|calls| T16
  S17["method:ASScrollNode::setScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:178"]
  T17["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S17 -->|calls| T17
  S18["method:ASTabBarController::setViewControllers:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:54"]
  T18["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S18 -->|calls| T18
  S19["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  T19["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  S19 -->|calls| T19
  S20["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  T20["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S20 -->|calls| T20
  S21["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T21["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S21 -->|calls| T21
  S22["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T22["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S22 -->|calls| T22
  S23["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T23["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S23 -->|calls| T23
  S24["method:ASTabBarController::setSelectedViewController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:75"]
  T24["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.h:1"]
  T25["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
