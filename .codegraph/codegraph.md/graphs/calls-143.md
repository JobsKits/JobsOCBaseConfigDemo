# `calls 符号关系 - 143`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T1["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T2["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.h:1"]
  T3["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  T4["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S4 -->|calls| T4
  S5["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  T5["method:ASVideoPlayerNode::_initControlsAndVideoNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:138"]
  S5 -->|calls| T5
  S6["method:ASVideoPlayerNode::initWithAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:110"]
  T6["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S6 -->|calls| T6
  S7["method:ASVideoPlayerNode::_initControlsAndVideoNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:138"]
  T7["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S7 -->|calls| T7
  S8["method:ASVideoPlayerNode::_initControlsAndVideoNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:138"]
  T8["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S8 -->|calls| T8
  S9["method:ASVideoPlayerNode::assetURL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:157"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:ASVideoPlayerNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:170"]
  T10["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S10 -->|calls| T10
  S11["method:ASVideoPlayerNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:170"]
  T11["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S11 -->|calls| T11
  S12["method:ASVideoPlayerNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:170"]
  T12["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S12 -->|calls| T12
  S13["method:ASVideoPlayerNode::setAsset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:170"]
  T13["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S13 -->|calls| T13
  S14["method:ASVideoPlayerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:198"]
  T14["method:ASVideoPlayerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:198"]
  S14 -->|calls| T14
  S15["method:ASVideoPlayerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:198"]
  T15["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  S15 -->|calls| T15
  S16["method:ASVideoPlayerNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:205"]
  T16["method:ASVideoPlayerNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:205"]
  S16 -->|calls| T16
  S17["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T17["method:ASVideoPlayerNode::createDefaultControlElementArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:299"]
  S17 -->|calls| T17
  S18["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T18["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S18 -->|calls| T18
  S19["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T19["method:ASVideoPlayerNode::_locked_createPlaybackButton<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:338"]
  S19 -->|calls| T19
  S20["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T20["method:ASVideoPlayerNode::_locked_createElapsedTextField<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:388"]
  S20 -->|calls| T20
  S21["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T21["method:ASVideoPlayerNode::_locked_createDurationTextField<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:406"]
  S21 -->|calls| T21
  S22["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T22["method:ASVideoPlayerNode::_locked_createScrubber<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:425"]
  S22 -->|calls| T22
  S23["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T23["method:ASVideoPlayerNode::_locked_createFullScreenButton<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:366"]
  S23 -->|calls| T23
  S24["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T24["method:ASVideoPlayerNode::_locked_createControlFlexGrowSpacer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:473"]
  S24 -->|calls| T24
  S25["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
