# `calls 符号关系 - 138`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T1["method:ASTextDebugOption::sharedDebugOption<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:125"]
  S1 -->|calls| T1
  S2["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T2["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  S2 -->|calls| T2
  S3["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T3["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S3 -->|calls| T3
  S4["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  T4["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S4 -->|calls| T4
  S5["function:didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T5["function:didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  S5 -->|calls| T5
  S6["function:didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:616"]
  T6["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S6 -->|calls| T6
  S7["function:linkAttributeValueAtPoint:attributeName:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:625"]
  T7["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T8["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T9["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T10["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T11["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T14["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S14 -->|calls| T14
  S15["function:animated<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:833"]
  T15["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T17["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T18["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T19["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T20["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T21["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T22["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S22 -->|calls| T22
  S23["function:withEvent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1024"]
  T23["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  S23 -->|calls| T23
  S24["function:withEvent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1024"]
  T24["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:1"]
  T25["method:ASCellNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:211"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
