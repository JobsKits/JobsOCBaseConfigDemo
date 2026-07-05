# `calls 符号关系 - 119`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T1["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T2["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S2 -->|calls| T2
  S3["method:ASScrollView::layerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:26"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASScrollView::scrollNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:31"]
  T4["function:ASViewToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S4 -->|calls| T4
  S5["method:ASScrollView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:48"]
  T5["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S5 -->|calls| T5
  S6["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T6["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S6 -->|calls| T6
  S7["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T7["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S7 -->|calls| T7
  S8["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T8["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S8 -->|calls| T8
  S9["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T9["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S9 -->|calls| T9
  S10["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T10["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S10 -->|calls| T10
  S11["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T11["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S11 -->|calls| T11
  S12["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T12["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S12 -->|calls| T12
  S13["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T13["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S13 -->|calls| T13
  S14["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T14["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S14 -->|calls| T14
  S15["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T15["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S15 -->|calls| T15
  S16["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T16["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S16 -->|calls| T16
  S17["method:ASScrollNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T17["method:ASScrollNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  S17 -->|calls| T17
  S18["method:ASScrollNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T18["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S18 -->|calls| T18
  S19["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T19["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S19 -->|calls| T19
  S20["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T20["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S20 -->|calls| T20
  S21["method:ASScrollNode::setScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:178"]
  T21["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S21 -->|calls| T21
  S22["method:ASTabBarController::setViewControllers:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:54"]
  T22["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S22 -->|calls| T22
  S23["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  T23["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  S23 -->|calls| T23
  S24["method:ASTabBarController::setViewControllers:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:60"]
  T24["method:ASTabBarController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:29"]
  S24 -->|calls| T24
  S25["method:ASTabBarController::setSelectedIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTabBarController.mm:66"]
  T25["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
