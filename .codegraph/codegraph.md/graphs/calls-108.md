# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::createContentsForkey:drawParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:479"]
  T1["method:ASImageNode::imageModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:738"]
  S1 -->|calls| T1
  S2["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T2["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S2 -->|calls| T2
  S3["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T3["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S3 -->|calls| T3
  S4["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T4["method:ASImageNode::debugLabelAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:765"]
  S4 -->|calls| T4
  S5["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:590"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:609"]
  T6["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S6 -->|calls| T6
  S7["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:622"]
  T7["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:622"]
  S7 -->|calls| T7
  S8["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:622"]
  T8["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:609"]
  S8 -->|calls| T8
  S9["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T9["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  S9 -->|calls| T9
  S10["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T10["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:609"]
  S10 -->|calls| T10
  S11["method:ASImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:638"]
  T11["method:ASImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:638"]
  S11 -->|calls| T11
  S12["method:ASImageNode::setCropEnabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:654"]
  T12["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  S12 -->|calls| T12
  S13["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T13["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S13 -->|calls| T13
  S14["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T14["method:_ASDisplayLayer::displayImmediately<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:158"]
  S14 -->|calls| T14
  S15["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T15["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S15 -->|calls| T15
  S16["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T16["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S16 -->|calls| T16
  S17["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T17["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S17 -->|calls| T17
  S18["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T18["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  S18 -->|calls| T18
  S19["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T19["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S19 -->|calls| T19
  S20["function:ASImageNodeRoundBorderModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:791"]
  T20["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S20 -->|calls| T20
  S21["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:813"]
  T21["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T22["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S22 -->|calls| T22
  S23["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  T23["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S23 -->|calls| T23
  S24["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T24["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S24 -->|calls| T24
  S25["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T25["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
