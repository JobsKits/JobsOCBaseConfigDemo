# `calls 符号关系 - 117`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T1["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S1 -->|calls| T1
  S2["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T2["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S2 -->|calls| T2
  S3["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  T3["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S3 -->|calls| T3
  S4["method:ASImageNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:191"]
  T4["method:ASImageNode::invalidateAnimatedImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:386"]
  S4 -->|calls| T4
  S5["method:ASImageNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:199"]
  T5["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S5 -->|calls| T5
  S6["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T6["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S6 -->|calls| T6
  S7["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T7["method:ASImageNode::shouldShowImageScalingOverlay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:33"]
  S7 -->|calls| T7
  S8["method:ASImageNode::_locked_setImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:239"]
  T8["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S8 -->|calls| T8
  S9["method:ASImageNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:288"]
  T9["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S9 -->|calls| T9
  S10["method:ASImageNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:288"]
  T10["property:ASDisplayNode::threadSafeBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:116"]
  S10 -->|calls| T10
  S11["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T11["method:ASImageNode::imageModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:738"]
  S11 -->|calls| T11
  S12["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T12["function:ASCroppedImageBackingSizeAndDrawRectInBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASImageNode+CGExtras.mm:36"]
  S12 -->|calls| T12
  S13["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T13["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S13 -->|calls| T13
  S14["method:ASImageNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:334"]
  T14["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S14 -->|calls| T14
  S15["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T15["method:Mutex::Mutex<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S15 -->|calls| T15
  S16["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T16["method:ASImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:164"]
  S16 -->|calls| T16
  S17["method:ASImageNode::contentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:448"]
  T17["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  S17 -->|calls| T17
  S18["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T18["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S18 -->|calls| T18
  S19["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T19["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S19 -->|calls| T19
  S20["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T20["method:ASDisplayNode::willDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:470"]
  S20 -->|calls| T20
  S21["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T21["function:ASImageAlphaInfoIsOpaque<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:55"]
  S21 -->|calls| T21
  S22["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T22["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S22 -->|calls| T22
  S23["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T23["method:ASImageNode::imageModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:738"]
  S23 -->|calls| T23
  S24["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T24["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S24 -->|calls| T24
  S25["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T25["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
