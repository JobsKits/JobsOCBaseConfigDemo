# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASConfigurationManager::test_resetWithConfiguration:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:93"]
  T1["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S1 -->|calls| T1
  S2["method:ASConfigurationManager::test_resetWithConfiguration:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:93"]
  T2["method:ASConfigurationManager::defaultConfiguration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:31"]
  S2 -->|calls| T2
  S3["function:_ASActivateExperimentalFeature<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:102"]
  T3["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S3 -->|calls| T3
  S4["function:ASNotifyInitialized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:107"]
  T4["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T5["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T6["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T7["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T8["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T9["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S9 -->|calls| T9
  S10["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  T10["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S10 -->|calls| T10
  S11["method:ASControlNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:95"]
  T11["method:ASControlNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:95"]
  S11 -->|calls| T11
  S12["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  T12["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S12 -->|calls| T12
  S13["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T13["method:ASControlNode::beginTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:491"]
  S13 -->|calls| T13
  S14["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T14["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S14 -->|calls| T14
  S15["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T15["method:ASControlNode::continueTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:496"]
  S15 -->|calls| T15
  S16["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T16["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  S16 -->|calls| T16
  S17["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T17["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S17 -->|calls| T17
  S18["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T18["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S18 -->|calls| T18
  S19["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T19["method:ASControlNode::endTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:506"]
  S19 -->|calls| T19
  S20["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T20["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S20 -->|calls| T20
  S21["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T21["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S21 -->|calls| T21
  S22["method:ASControlNode::_cancelTrackingWithEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:238"]
  T22["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S22 -->|calls| T22
  S23["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:251"]
  T23["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:251"]
  S23 -->|calls| T23
  S24["method:ASControlNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:263"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:ASControlNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:263"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
