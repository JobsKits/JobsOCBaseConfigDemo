# `calls 符号关系 - 116`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  T1["function:ASExperimentalFeaturesGetNames<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.mm:13"]
  S1 -->|calls| T1
  S2["method:ASImageNode::_locked_setAnimatedImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:40"]
  T2["method:ASImageNode::animatedImageSet:previousAnimatedImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:87"]
  S2 -->|calls| T2
  S3["method:ASImageNode::setCoverImageCompleted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:116"]
  T3["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S3 -->|calls| T3
  S4["method:ASImageNode::_locked_setCoverImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:143"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:ASImageNode::_locked_setCoverImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:143"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T6["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S6 -->|calls| T6
  S7["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T7["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S7 -->|calls| T7
  S8["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T8["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  S8 -->|calls| T8
  S9["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T9["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S9 -->|calls| T9
  S10["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T10["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S10 -->|calls| T10
  S11["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  T11["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S11 -->|calls| T11
  S12["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  T12["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S12 -->|calls| T12
  S13["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  T13["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  S13 -->|calls| T13
  S14["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  T14["method:ASTestAnimatedImage::clearAnimatedImageCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Tests/ASNetworkImageNodeTests.mm:205"]
  S14 -->|calls| T14
  S15["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  T15["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  S15 -->|calls| T15
  S16["method:ASImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:280"]
  T16["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S16 -->|calls| T16
  S17["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  T17["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  S17 -->|calls| T17
  S18["method:ASImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:293"]
  T18["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S18 -->|calls| T18
  S19["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  T19["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  S19 -->|calls| T19
  S20["method:ASImageNode::displayLinkFired:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:323"]
  T20["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S20 -->|calls| T20
  S21["method:ASImageNode::displayLinkFired:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:323"]
  T21["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.h:1"]
  T22["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:813"]
  S22 -->|calls| T22
  S23["method:ASImageNodeContentsKey::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:81"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:ASImageNodeContentsKey::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:81"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:ASImageNodeContentsKey::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:110"]
  T25["function:ASHashBytes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
