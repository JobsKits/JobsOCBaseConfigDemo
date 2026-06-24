# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T1["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  S1 -->|calls| T1
  S2["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T2["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S2 -->|calls| T2
  S3["method:ASImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:550"]
  T3["method:ASImageNode::debugLabelAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:765"]
  S3 -->|calls| T3
  S4["method:ASImageNode::setNeedsDisplayWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:590"]
  T4["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S4 -->|calls| T4
  S5["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:609"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:622"]
  T6["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:622"]
  S6 -->|calls| T6
  S7["method:ASImageNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:622"]
  T7["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:609"]
  S7 -->|calls| T7
  S8["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T8["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  S8 -->|calls| T8
  S9["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  T9["method:ASImageNode::_setNeedsDisplayOnTemplatedImages<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:609"]
  S9 -->|calls| T9
  S10["method:ASImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:638"]
  T10["method:ASImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:638"]
  S10 -->|calls| T10
  S11["method:ASImageNode::setCropEnabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:654"]
  T11["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  S11 -->|calls| T11
  S12["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T12["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S12 -->|calls| T12
  S13["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T13["method:_ASDisplayLayer::displayImmediately<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:158"]
  S13 -->|calls| T13
  S14["method:ASImageNode::setCropEnabled:recropImmediately:inBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:659"]
  T14["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S14 -->|calls| T14
  S15["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T15["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S15 -->|calls| T15
  S16["method:ASImageNode::setCropRect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:690"]
  T16["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S16 -->|calls| T16
  S17["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T17["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  S17 -->|calls| T17
  S18["method:ASImageNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:752"]
  T18["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S18 -->|calls| T18
  S19["function:ASImageNodeRoundBorderModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:791"]
  T19["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S19 -->|calls| T19
  S20["function:ASImageNodeTintColorModificationBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:813"]
  T20["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:1"]
  T21["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S21 -->|calls| T21
  S22["function:ASPerformBlockWithoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:75"]
  T22["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S22 -->|calls| T22
  S23["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T23["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S23 -->|calls| T23
  S24["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T24["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S24 -->|calls| T24
  S25["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  T25["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
