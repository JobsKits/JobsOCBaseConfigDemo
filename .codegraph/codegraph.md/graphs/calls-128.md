# `calls 符号关系 - 128`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T1["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S1 -->|calls| T1
  S2["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  T2["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S2 -->|calls| T2
  S3["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T3["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S3 -->|calls| T3
  S4["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T4["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S4 -->|calls| T4
  S5["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:925"]
  T5["method:ASTextNode::setHighlightRange:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:809"]
  S5 -->|calls| T5
  S6["method:ASTextNode::rectsForTextRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:952"]
  T6["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S6 -->|calls| T6
  S7["method:ASTextNode::highlightRectsForTextRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:957"]
  T7["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S7 -->|calls| T7
  S8["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T8["method:ASTextKitRenderer::rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitRenderer+Positioning.mm:27"]
  S8 -->|calls| T8
  S9["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T9["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S9 -->|calls| T9
  S10["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T10["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S10 -->|calls| T10
  S11["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  T11["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S11 -->|calls| T11
  S12["method:ASTextNode::trailingRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:980"]
  T12["method:ASTextNode::trailingRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:980"]
  S12 -->|calls| T12
  S13["method:ASTextNode::trailingRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:980"]
  T13["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S13 -->|calls| T13
  S14["method:ASTextNode::trailingRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:980"]
  T14["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S14 -->|calls| T14
  S15["method:ASTextNode::frameForTextRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:988"]
  T15["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S15 -->|calls| T15
  S16["method:ASTextNode::frameForTextRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:988"]
  T16["function:ASTextNode::ASTextNodeAdjustRenderRectForShadowPadding<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:946"]
  S16 -->|calls| T16
  S17["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:999"]
  T17["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:999"]
  S17 -->|calls| T17
  S18["method:ASTextNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:999"]
  T18["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  S18 -->|calls| T18
  S19["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  T19["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S19 -->|calls| T19
  S20["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  T20["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  S20 -->|calls| T20
  S21["method:ASTextNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1022"]
  T21["method:ASTextNode::_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1006"]
  S21 -->|calls| T21
  S22["method:ASTextNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1043"]
  T22["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S22 -->|calls| T22
  S23["method:ASTextNode::placeholderImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1043"]
  T23["method:ASTextNode::_rectsForTextRange:measureOption:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:962"]
  S23 -->|calls| T23
  S24["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  T24["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  S24 -->|calls| T24
  S25["method:ASTextNode::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1080"]
  T25["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
