# `calls 符号关系 - 087`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASConfiguration::initWithDictionary:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.mm:15"]
  T1["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S1 -->|calls| T1
  S2["method:ASConfiguration::initWithDictionary:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.mm:15"]
  T2["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S2 -->|calls| T2
  S3["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  T3["method:ASConfigurationManager::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  S3 -->|calls| T3
  S4["method:ASConfigurationManager::defaultConfiguration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:31"]
  T4["method:ASConfigurationManager::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  S4 -->|calls| T4
  S5["method:ASConfigurationManager::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T5["method:ASConfigurationManager::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  S5 -->|calls| T5
  S6["method:ASConfigurationManager::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T6["variable:copy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:29"]
  S6 -->|calls| T6
  S7["method:ASConfigurationManager::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T7["method:ASConfiguration::textureConfiguration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.mm:48"]
  S7 -->|calls| T7
  S8["method:ASConfigurationManager::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:39"]
  T8["method:ASConfigurationManager::defaultConfiguration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:31"]
  S8 -->|calls| T8
  S9["method:ASConfigurationManager::test_resetWithConfiguration:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:93"]
  T9["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S9 -->|calls| T9
  S10["method:ASConfigurationManager::test_resetWithConfiguration:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:93"]
  T10["method:ASConfigurationManager::defaultConfiguration<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:31"]
  S10 -->|calls| T10
  S11["function:_ASActivateExperimentalFeature<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:102"]
  T11["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S11 -->|calls| T11
  S12["function:ASNotifyInitialized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:107"]
  T12["function:ASConfigurationManagerGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfigurationInternal.mm:17"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T13["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T14["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T15["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T16["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.h:1"]
  T17["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S17 -->|calls| T17
  S18["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  T18["method:ASControlNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:81"]
  S18 -->|calls| T18
  S19["method:ASControlNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:95"]
  T19["method:ASControlNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:95"]
  S19 -->|calls| T19
  S20["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  T20["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S20 -->|calls| T20
  S21["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T21["method:ASControlNode::beginTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:491"]
  S21 -->|calls| T21
  S22["method:ASControlNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:129"]
  T22["method:ASControlNode::sendActionsForControlEvents:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:423"]
  S22 -->|calls| T22
  S23["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T23["method:ASControlNode::continueTrackingWithTouch:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:496"]
  S23 -->|calls| T23
  S24["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T24["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  S24 -->|calls| T24
  S25["method:ASControlNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:160"]
  T25["function:ASControlNode::_ASControlNodeGetExpandedBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:485"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
