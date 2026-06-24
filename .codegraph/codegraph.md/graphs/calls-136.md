# `calls 符号关系 - 136`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T1["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S1 -->|calls| T1
  S2["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T2["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S2 -->|calls| T2
  S3["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T4["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S4 -->|calls| T4
  S5["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T5["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S5 -->|calls| T5
  S6["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T6["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S6 -->|calls| T6
  S7["method:ASTextNode::setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:555"]
  T7["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S7 -->|calls| T7
  S8["method:ASTextNode::setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:555"]
  T8["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S8 -->|calls| T8
  S9["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T9["method:ASTextNodeDrawParameter::initWithRendererAttributes:backgroundColor:textContainerInsets:contentScale:opaque:bounds:traitCollection:willDisplayNodeContentWithRenderingContext:didDisplayNodeContentWithRenderingContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:168"]
  S9 -->|calls| T9
  S10["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T10["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:397"]
  S10 -->|calls| T10
  S11["method:ASTextNode::drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:570"]
  T11["property:ASDisplayNode::threadSafeBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:116"]
  S11 -->|calls| T11
  S12["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T12["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S12 -->|calls| T12
  S13["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T13["method:ASDisplayNode::willDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:470"]
  S13 -->|calls| T13
  S14["method:ASTextNode::displayWithParameters:isCancelled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:591"]
  T14["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S14 -->|calls| T14
  S15["method:ASTextNode::linkAttributeValueAtPoint:attributeName:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:639"]
  T15["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S15 -->|calls| T15
  S16["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:650"]
  T16["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S16 -->|calls| T16
  S17["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T17["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S17 -->|calls| T17
  S18["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T18["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S18 -->|calls| T18
  S19["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T19["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S19 -->|calls| T19
  S20["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T20["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S20 -->|calls| T20
  S21["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:ASTextNode::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:750"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:ASTextNode::setHighlightRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:804"]
  T23["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S23 -->|calls| T23
  S24["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:809"]
  T24["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S24 -->|calls| T24
  S25["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T25["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
