# `calls 符号关系 - 141`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T1["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S1 -->|calls| T1
  S2["function:setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["function:setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T3["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S3 -->|calls| T3
  S4["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  T4["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S4 -->|calls| T4
  S5["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T5["method:ASTextContainer::makeImmutable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:200"]
  S5 -->|calls| T5
  S6["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T6["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S6 -->|calls| T6
  S7["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T7["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S7 -->|calls| T7
  S8["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T8["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S8 -->|calls| T8
  S9["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T9["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S9 -->|calls| T9
  S10["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T10["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S10 -->|calls| T10
  S11["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T11["method:ASTextDebugOption::sharedDebugOption<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:125"]
  S11 -->|calls| T11
  S12["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T12["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  S12 -->|calls| T12
  S13["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T13["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S13 -->|calls| T13
  S14["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  T14["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S14 -->|calls| T14
  S15["function:didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T15["function:didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  S15 -->|calls| T15
  S16["function:didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T16["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S16 -->|calls| T16
  S17["function:linkAttributeValueAtPoint:attributeName:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:625"]
  T17["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T18["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T19["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T20["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T21["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T24["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S24 -->|calls| T24
  S25["function:animated<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:833"]
  T25["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
