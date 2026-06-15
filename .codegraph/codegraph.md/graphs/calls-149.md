# `calls 符号关系 - 149`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  T1["method:ASVideoNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:660"]
  S1 -->|calls| T1
  S2["method:ASVideoPlayerNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:734"]
  T2["method:ASVideoNode::pause<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:694"]
  S2 -->|calls| T2
  S3["method:ASVideoPlayerNode::isPlaying<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:739"]
  T3["method:ASVideoNode::isPlaying<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:704"]
  S3 -->|calls| T3
  S4["method:ASVideoPlayerNode::resetToPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:744"]
  T4["method:ASVideoNode::resetToPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoNode.mm:721"]
  S4 -->|calls| T4
  S5["method:ASVideoPlayerNode::layoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:779"]
  T5["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S5 -->|calls| T5
  S6["method:ASVideoPlayerNode::defaultLayoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:813"]
  T6["method:ASVideoPlayerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:99"]
  S6 -->|calls| T6
  S7["method:ASVideoPlayerNode::defaultLayoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:813"]
  T7["method:ASVideoPlayerNode::controlsForLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:749"]
  S7 -->|calls| T7
  S8["method:ASVideoPlayerNode::setControlsDisabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:886"]
  T8["method:ASVideoPlayerNode::removeControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:311"]
  S8 -->|calls| T8
  S9["method:ASVideoPlayerNode::setControlsDisabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:886"]
  T9["method:ASVideoPlayerNode::createControls<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:229"]
  S9 -->|calls| T9
  S10["method:ASIGListSectionControllerMethods::cellForItemAtIndex:sectionController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:22"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:ASIGListSupplementaryViewSourceMethods::viewForSupplementaryElementOfKind:atIndex:sectionController:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/AsyncDisplayKit+IGListKitMethods.mm:38"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["function:ASMainThreadAssertionsAreDisabled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASAssert.mm:41"]
  T12["function:ASMainThreadAssertionsDisabledKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASAssert.mm:32"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T13["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T14["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T15["function:ASLayerToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:75"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T16["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T17["method:ASResponderChainEnumerator::nextObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:28"]
  S17 -->|calls| T17
  S18["function:includeSelf<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:70"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASDisplayNode+Ancestry.mm:1"]
  T19["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T20["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T21["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T22["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T23["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T24["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.h:1"]
  T25["function:ASMainThreadDeallocationLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
