# `calls 符号关系 - 107`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  T1["method:ASImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:301"]
  S1 -->|calls| T1
  S2["method:ASImageNode::displayLinkFired:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:323"]
  T2["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S2 -->|calls| T2
  S3["method:ASImageNode::displayLinkFired:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:323"]
  T3["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.h:1"]
  T4["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:813"]
  S4 -->|calls| T4
  S5["method:ASImageNodeContentsKey::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:81"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:ASImageNodeContentsKey::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:81"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:ASImageNodeContentsKey::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:110"]
  T7["function:ASHashBytes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S7 -->|calls| T7
  S8["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T8["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S8 -->|calls| T8
  S9["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T9["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S9 -->|calls| T9
  S10["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T10["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S10 -->|calls| T10
  S11["method:ASImageNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:191"]
  T11["method:ASImageNode::invalidateAnimatedImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:386"]
  S11 -->|calls| T11
  S12["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T12["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S12 -->|calls| T12
  S13["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T13["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S13 -->|calls| T13
  S14["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T14["method:ASImageNode::shouldShowImageScalingOverlay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:33"]
  S14 -->|calls| T14
  S15["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T15["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S15 -->|calls| T15
  S16["method:ASImageNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:288"]
  T16["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S16 -->|calls| T16
  S17["method:ASImageNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:288"]
  T17["property:ASDisplayNode::threadSafeBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:116"]
  S17 -->|calls| T17
  S18["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T18["method:ASImageNode::imageModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:738"]
  S18 -->|calls| T18
  S19["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T19["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  S19 -->|calls| T19
  S20["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T20["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S20 -->|calls| T20
  S21["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T21["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S21 -->|calls| T21
  S22["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T22["method:Mutex::Mutex<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S22 -->|calls| T22
  S23["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T23["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S23 -->|calls| T23
  S24["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T24["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  S24 -->|calls| T24
  S25["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T25["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
