# `calls 符号关系 - 132`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T1["method:ASTextContainer::makeImmutable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:200"]
  S1 -->|calls| T1
  S2["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S2 -->|calls| T2
  S3["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T3["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S3 -->|calls| T3
  S4["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T4["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S4 -->|calls| T4
  S5["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T5["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S5 -->|calls| T5
  S6["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T6["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S6 -->|calls| T6
  S7["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T7["method:ASTextDebugOption::sharedDebugOption<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:125"]
  S7 -->|calls| T7
  S8["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T8["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  S8 -->|calls| T8
  S9["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T9["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S9 -->|calls| T9
  S10["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  T10["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S10 -->|calls| T10
  S11["function:didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T11["function:didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  S11 -->|calls| T11
  S12["function:didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T12["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S12 -->|calls| T12
  S13["function:linkAttributeValueAtPoint:attributeName:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:625"]
  T13["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T14["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T15["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T16["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T17["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T20["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S20 -->|calls| T20
  S21["function:animated<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:833"]
  T21["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T24["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T25["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
