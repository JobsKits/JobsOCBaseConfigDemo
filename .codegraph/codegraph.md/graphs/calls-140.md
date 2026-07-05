# `calls 符号关系 - 140`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T1["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T2["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T3["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T4["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T5["function:DefaultTruncationAttributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1278"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T6["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T7["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T8["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T9["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T10["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T11["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T12["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T13["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T14["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T15["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.h:1"]
  T16["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S16 -->|calls| T16
  S17["function:ASAssetIsEqual<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["function:ASAssetIsEqual<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["function:ASAssetIsEqual<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["function:ASAssetIsEqual<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:ASVideoNode::initWithCache:downloader:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:97"]
  T21["method:ASVideoNode::initWithCache:downloader:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:97"]
  S21 -->|calls| T21
  S22["method:ASVideoNode::initWithCache:downloader:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:97"]
  T22["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S22 -->|calls| T22
  S23["method:ASVideoNode::constructPlayerNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:114"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASVideoNode::constructPlayerItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:126"]
  T24["method:ASVideoPlayerNode::asset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:191"]
  S24 -->|calls| T24
  S25["method:ASVideoNode::prepareToPlayAsset:withKeys:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:144"]
  T25["method:ASVideoNode::constructPlayerItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:126"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
