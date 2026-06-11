# `calls 符号关系 - 094`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T1["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T2["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T3["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T4["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S4 -->|calls| T4
  S5["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  T5["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S5 -->|calls| T5
  S6["method:ASControlNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:95"]
  T6["method:ASControlNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:95"]
  S6 -->|calls| T6
  S7["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  T7["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S7 -->|calls| T7
  S8["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T8["method:ASControlNode::beginTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:491"]
  S8 -->|calls| T8
  S9["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T9["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S9 -->|calls| T9
  S10["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T10["method:ASControlNode::continueTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:496"]
  S10 -->|calls| T10
  S11["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T11["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  S11 -->|calls| T11
  S12["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T12["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S12 -->|calls| T12
  S13["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T13["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S13 -->|calls| T13
  S14["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T14["method:ASControlNode::endTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:506"]
  S14 -->|calls| T14
  S15["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T15["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S15 -->|calls| T15
  S16["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T16["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S16 -->|calls| T16
  S17["method:ASControlNode::_cancelTrackingWithEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:238"]
  T17["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S17 -->|calls| T17
  S18["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:251"]
  T18["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:251"]
  S18 -->|calls| T18
  S19["method:ASControlNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:263"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:ASControlNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:263"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T21["method:ASControlNode::enableHitTestDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:57"]
  S21 -->|calls| T21
  S22["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T22["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S22 -->|calls| T22
  S23["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T23["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S23 -->|calls| T23
  S24["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T24["function:ASControlNode::_ASEnumerateControlEventsIncludedInMaskWithBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:472"]
  S24 -->|calls| T24
  S25["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:283"]
  T25["function:ASControlNode::_ASControlNodeEventKeyForControlEvent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:467"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
