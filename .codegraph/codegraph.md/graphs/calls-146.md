# `calls 符号关系 - 146`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T1["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T2["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T3["function:ASLockingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T4["function:ASPointsOfInterestLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:58"]
  S4 -->|calls| T4
  S5["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  T5["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S5 -->|calls| T5
  S6["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  T6["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S6 -->|calls| T6
  S7["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  T7["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S7 -->|calls| T7
  S8["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  T8["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S8 -->|calls| T8
  S9["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  T9["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S9 -->|calls| T9
  S10["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  T10["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S10 -->|calls| T10
  S11["function:ASLockingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  T11["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S11 -->|calls| T11
  S12["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T12["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  S12 -->|calls| T12
  S13["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T13["method:ASControlNode::enableHitTestDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:57"]
  S13 -->|calls| T13
  S14["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T14["property:ASDisplayNode::hitTestSlop<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.h:484"]
  S14 -->|calls| T14
  S15["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T15["function:ASLayerToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S15 -->|calls| T15
  S16["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T16["method:ASControlNode::setEdgesOfIntersectionForChildRect:parentRect:rectEdge:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:160"]
  S16 -->|calls| T16
  S17["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T17["method:ASControlNode::setEdgesOfIntersectionForChildRect:parentRect:rectEdge:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:160"]
  S17 -->|calls| T17
  S18["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T18["method:ASControlNode::debugHighlightOverlay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:512"]
  S18 -->|calls| T18
  S19["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T19["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S19 -->|calls| T19
  S20["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T20["method:ASControlNode::drawEdgeIfClippedWithEdges:color:borderWidth:imgRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:179"]
  S20 -->|calls| T20
  S21["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T21["method:ASControlNode::drawEdgeIfClippedWithEdges:color:borderWidth:imgRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:179"]
  S21 -->|calls| T21
  S22["method:ASRangeController::layoutDebugOverlayIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:254"]
  T22["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S22 -->|calls| T22
  S23["method:ASRangeController::layoutDebugOverlayIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:254"]
  T23["method:_ASRangeDebugOverlayView::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:314"]
  S23 -->|calls| T23
  S24["method:ASRangeController::addRangeControllerToRangeDebugOverlay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:259"]
  T24["method:_ASRangeDebugOverlayView::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:314"]
  S24 -->|calls| T24
  S25["method:ASRangeController::updateRangeController:withScrollableDirections:scrollDirection:rangeMode:displayTuningParameters:preloadTuningParameters:interfaceState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:264"]
  T25["method:ASRangeController::updateRangeController:withScrollableDirections:scrollDirection:rangeMode:displayTuningParameters:preloadTuningParameters:interfaceState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:264"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
