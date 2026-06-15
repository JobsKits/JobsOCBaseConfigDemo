# `calls 符号关系 - 110`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T1["variable:invalidateCalculatedLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:170"]
  S1 -->|calls| T1
  S2["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T2["method:ASEditableTextNode::_delegateDidUpdateText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:823"]
  S2 -->|calls| T2
  S3["method:ASEditableTextNode::textViewDidChangeSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:724"]
  T3["method:ASEditableTextNode::_delegateDidChangeSelectionFromSelectedRange:toSelectedRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:811"]
  S3 -->|calls| T3
  S4["method:ASEditableTextNode::textViewDidEndEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:745"]
  T4["method:ASEditableTextNode::_delegateDidFinishEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:840"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.h:1"]
  T5["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S5 -->|calls| T5
  S6["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  T6["function:ASExperimentalFeaturesGetNames<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.mm:13"]
  S6 -->|calls| T6
  S7["method:ASImageNode::_locked_setAnimatedImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:40"]
  T7["method:ASImageNode::animatedImageSet:previousAnimatedImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:87"]
  S7 -->|calls| T7
  S8["method:ASImageNode::setCoverImageCompleted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:116"]
  T8["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S8 -->|calls| T8
  S9["method:ASImageNode::_locked_setCoverImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:143"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:ASImageNode::_locked_setCoverImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:143"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T11["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S11 -->|calls| T11
  S12["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T12["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S12 -->|calls| T12
  S13["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T13["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  S13 -->|calls| T13
  S14["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T14["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S14 -->|calls| T14
  S15["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T15["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S15 -->|calls| T15
  S16["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  T16["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S16 -->|calls| T16
  S17["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  T17["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S17 -->|calls| T17
  S18["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  T18["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  S18 -->|calls| T18
  S19["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  T19["method:ASTestAnimatedImage::clearAnimatedImageCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Tests/ASNetworkImageNodeTests.mm:205"]
  S19 -->|calls| T19
  S20["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  T20["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  S20 -->|calls| T20
  S21["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  T21["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S21 -->|calls| T21
  S22["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  T22["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  S22 -->|calls| T22
  S23["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  T23["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S23 -->|calls| T23
  S24["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  T24["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  S24 -->|calls| T24
  S25["method:ASImageNode::displayLinkFired:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:323"]
  T25["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
