# `calls 符号关系 - 146`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T1["function:ASAssetIsEqual<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:21"]
  S1 -->|calls| T1
  S2["method:ASVideoNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:528"]
  T2["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  S2 -->|calls| T2
  S3["method:ASVideoNode::setAndFetchAsset:url:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:543"]
  T3["method:ASVideoNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:439"]
  S3 -->|calls| T3
  S4["method:ASVideoNode::setGravity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:620"]
  T4["function:ASContentModeFromVideoGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:28"]
  S4 -->|calls| T4
  S5["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T5["method:ASVideoNode::constructPlayerNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:114"]
  S5 -->|calls| T5
  S6["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T6["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S6 -->|calls| T6
  S7["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  T7["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  S7 -->|calls| T7
  S8["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  T8["method:ASVideoPlayerNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:734"]
  S8 -->|calls| T8
  S9["method:ASVideoNode::resetToPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:721"]
  T9["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S9 -->|calls| T9
  S10["method:ASVideoNode::applicationDidBecomeActive:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:737"]
  T10["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S10 -->|calls| T10
  S11["method:ASVideoNode::didPlayToEnd:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:744"]
  T11["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S11 -->|calls| T11
  S12["method:ASVideoNode::didPlayToEnd:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:744"]
  T12["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S12 -->|calls| T12
  S13["method:ASVideoNode::setPlayerNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:811"]
  T13["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T14["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T15["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T16["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T17["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T18["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T19["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T20["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T21["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
