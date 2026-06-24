# `calls 符号关系 - 149`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:includeSelf<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:70"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T2["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T3["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T4["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T5["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T6["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T7["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T8["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T9["function:ASLockingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T10["function:ASPointsOfInterestLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:58"]
  S10 -->|calls| T10
  S11["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  T11["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S11 -->|calls| T11
  S12["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  T12["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S12 -->|calls| T12
  S13["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  T13["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S13 -->|calls| T13
  S14["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  T14["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S14 -->|calls| T14
  S15["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  T15["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S15 -->|calls| T15
  S16["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  T16["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S16 -->|calls| T16
  S17["function:ASLockingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:53"]
  T17["function:ASLoggingIsEnabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:25"]
  S17 -->|calls| T17
  S18["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T18["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  S18 -->|calls| T18
  S19["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T19["method:ASControlNode::enableHitTestDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:57"]
  S19 -->|calls| T19
  S20["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T20["property:ASDisplayNode::hitTestSlop<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.h:484"]
  S20 -->|calls| T20
  S21["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T21["function:ASLayerToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S21 -->|calls| T21
  S22["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T22["method:ASControlNode::setEdgesOfIntersectionForChildRect:parentRect:rectEdge:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:160"]
  S22 -->|calls| T22
  S23["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T23["method:ASControlNode::setEdgesOfIntersectionForChildRect:parentRect:rectEdge:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:160"]
  S23 -->|calls| T23
  S24["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T24["method:ASControlNode::debugHighlightOverlay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:512"]
  S24 -->|calls| T24
  S25["method:ASControlNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:63"]
  T25["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
