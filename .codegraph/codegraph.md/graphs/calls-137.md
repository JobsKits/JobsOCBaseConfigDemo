# `calls 符号关系 - 137`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T1["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S1 -->|calls| T1
  S2["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T4["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S4 -->|calls| T4
  S5["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T6["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S6 -->|calls| T6
  S7["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T7["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S7 -->|calls| T7
  S8["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T8["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S8 -->|calls| T8
  S9["method:ASTextNode::rectsForTextRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:952"]
  T9["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S9 -->|calls| T9
  S10["method:ASTextNode::highlightRectsForTextRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:957"]
  T10["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S10 -->|calls| T10
  S11["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T11["method:ASTextKitRenderer::rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:27"]
  S11 -->|calls| T11
  S12["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T12["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S12 -->|calls| T12
  S13["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T13["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S13 -->|calls| T13
  S14["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T14["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S14 -->|calls| T14
  S15["method:ASTextNode::trailingRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:980"]
  T15["method:ASTextNode::trailingRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:980"]
  S15 -->|calls| T15
  S16["method:ASTextNode::trailingRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:980"]
  T16["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S16 -->|calls| T16
  S17["method:ASTextNode::trailingRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:980"]
  T17["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S17 -->|calls| T17
  S18["method:ASTextNode::frameForTextRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:988"]
  T18["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S18 -->|calls| T18
  S19["method:ASTextNode::frameForTextRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:988"]
  T19["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S19 -->|calls| T19
  S20["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:999"]
  T20["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:999"]
  S20 -->|calls| T20
  S21["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:999"]
  T21["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  S21 -->|calls| T21
  S22["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  T22["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S22 -->|calls| T22
  S23["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  T23["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  S23 -->|calls| T23
  S24["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  T24["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  S24 -->|calls| T24
  S25["method:ASTextNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1043"]
  T25["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
