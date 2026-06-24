# `calls 符号关系 - 148`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoPlayerNode::videoNode:willChangePlayerState:toState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:522"]
  T1["method:ASVideoPlayerNode::removeSpinner<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:672"]
  S1 -->|calls| T1
  S2["method:ASVideoPlayerNode::didTapVideoNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:583"]
  T2["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  S2 -->|calls| T2
  S3["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  T3["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S3 -->|calls| T3
  S4["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  T4["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S4 -->|calls| T4
  S5["method:ASVideoPlayerNode::showSpinner<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:637"]
  T5["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S5 -->|calls| T5
  S6["method:ASVideoPlayerNode::showSpinner<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:637"]
  T6["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S6 -->|calls| T6
  S7["method:ASVideoPlayerNode::didTapPlaybackButton:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:688"]
  T7["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  S7 -->|calls| T7
  S8["method:ASVideoPlayerNode::seekToTime:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:717"]
  T8["method:ASVideoPlayerNode::togglePlayPause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:628"]
  S8 -->|calls| T8
  S9["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  T9["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S9 -->|calls| T9
  S10["method:ASVideoPlayerNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:734"]
  T10["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S10 -->|calls| T10
  S11["method:ASVideoPlayerNode::isPlaying<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:739"]
  T11["method:ASVideoNode::isPlaying<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:704"]
  S11 -->|calls| T11
  S12["method:ASVideoPlayerNode::resetToPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:744"]
  T12["method:ASVideoNode::resetToPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:721"]
  S12 -->|calls| T12
  S13["method:ASVideoPlayerNode::layoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:779"]
  T13["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S13 -->|calls| T13
  S14["method:ASVideoPlayerNode::defaultLayoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:813"]
  T14["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S14 -->|calls| T14
  S15["method:ASVideoPlayerNode::defaultLayoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:813"]
  T15["method:ASVideoPlayerNode::controlsForLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:749"]
  S15 -->|calls| T15
  S16["method:ASVideoPlayerNode::setControlsDisabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:886"]
  T16["method:ASVideoPlayerNode::removeControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:311"]
  S16 -->|calls| T16
  S17["method:ASVideoPlayerNode::setControlsDisabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:886"]
  T17["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  S17 -->|calls| T17
  S18["method:ASIGListSectionControllerMethods::cellForItemAtIndex:sectionController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:22"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:ASIGListSupplementaryViewSourceMethods::viewForSupplementaryElementOfKind:atIndex:sectionController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:38"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["function:ASMainThreadAssertionsAreDisabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASAssert.mm:41"]
  T20["function:ASMainThreadAssertionsDisabledKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASAssert.mm:32"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T21["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T22["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T23["function:ASLayerToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T24["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T25["method:ASResponderChainEnumerator::nextObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
