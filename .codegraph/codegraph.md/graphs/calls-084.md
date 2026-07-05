# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASConfigurationManager::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T1["method:ASConfiguration::textureConfiguration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.mm:48"]
  S1 -->|calls| T1
  S2["method:ASConfigurationManager::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T2["method:ASConfigurationManager::defaultConfiguration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:31"]
  S2 -->|calls| T2
  S3["method:ASConfigurationManager::test_resetWithConfiguration:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:93"]
  T3["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S3 -->|calls| T3
  S4["method:ASConfigurationManager::test_resetWithConfiguration:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:93"]
  T4["method:ASConfigurationManager::defaultConfiguration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:31"]
  S4 -->|calls| T4
  S5["function:_ASActivateExperimentalFeature<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:102"]
  T5["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S5 -->|calls| T5
  S6["function:ASNotifyInitialized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:107"]
  T6["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
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
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T10["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T11["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S11 -->|calls| T11
  S12["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  T12["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S12 -->|calls| T12
  S13["method:ASControlNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:95"]
  T13["method:ASControlNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:95"]
  S13 -->|calls| T13
  S14["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  T14["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S14 -->|calls| T14
  S15["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T15["method:ASControlNode::beginTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:491"]
  S15 -->|calls| T15
  S16["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T16["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S16 -->|calls| T16
  S17["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T17["method:ASControlNode::continueTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:496"]
  S17 -->|calls| T17
  S18["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T18["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  S18 -->|calls| T18
  S19["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T19["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S19 -->|calls| T19
  S20["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T20["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S20 -->|calls| T20
  S21["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T21["method:ASControlNode::endTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:506"]
  S21 -->|calls| T21
  S22["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T22["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S22 -->|calls| T22
  S23["method:ASControlNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:202"]
  T23["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S23 -->|calls| T23
  S24["method:ASControlNode::_cancelTrackingWithEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:238"]
  T24["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S24 -->|calls| T24
  S25["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:251"]
  T25["method:ASControlNode::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:251"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
