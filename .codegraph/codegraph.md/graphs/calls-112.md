# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T1["function:ASImageAlphaInfoIsOpaque<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:55"]
  S1 -->|calls| T1
  S2["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T2["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S2 -->|calls| T2
  S3["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T3["method:ASImageNode::imageModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:738"]
  S3 -->|calls| T3
  S4["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T4["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S4 -->|calls| T4
  S5["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T5["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S5 -->|calls| T5
  S6["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T6["method:ASImageNode::debugLabelAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:765"]
  S6 -->|calls| T6
  S7["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:590"]
  T7["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S7 -->|calls| T7
  S8["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:609"]
  T8["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S8 -->|calls| T8
  S9["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:622"]
  T9["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:622"]
  S9 -->|calls| T9
  S10["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:622"]
  T10["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:609"]
  S10 -->|calls| T10
  S11["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T11["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  S11 -->|calls| T11
  S12["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T12["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:609"]
  S12 -->|calls| T12
  S13["method:ASImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:638"]
  T13["method:ASImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:638"]
  S13 -->|calls| T13
  S14["method:ASImageNode::setCropEnabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:654"]
  T14["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  S14 -->|calls| T14
  S15["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T15["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S15 -->|calls| T15
  S16["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T16["method:_ASDisplayLayer::displayImmediately<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:158"]
  S16 -->|calls| T16
  S17["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T17["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S17 -->|calls| T17
  S18["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T18["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S18 -->|calls| T18
  S19["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T19["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S19 -->|calls| T19
  S20["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T20["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  S20 -->|calls| T20
  S21["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T21["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S21 -->|calls| T21
  S22["function:ASImageNodeRoundBorderModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:791"]
  T22["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S22 -->|calls| T22
  S23["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:813"]
  T23["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T24["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S24 -->|calls| T24
  S25["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  T25["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
