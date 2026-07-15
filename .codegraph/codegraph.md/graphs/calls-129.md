# `calls 符号关系 - 129`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T1["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  S1 -->|calls| T1
  S2["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T2["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S2 -->|calls| T2
  S3["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T3["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S3 -->|calls| T3
  S4["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T4["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S4 -->|calls| T4
  S5["method:ASTextNode::touchesBegan:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1113"]
  T5["method:ASTextNode::_setHighlightRange:forAttributeName:value:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:814"]
  S5 -->|calls| T5
  S6["method:ASTextNode::touchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1148"]
  T6["method:ASTextNode::touchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1148"]
  S6 -->|calls| T6
  S7["method:ASTextNode::touchesCancelled:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1148"]
  T7["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:925"]
  S7 -->|calls| T7
  S8["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  T8["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  S8 -->|calls| T8
  S9["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  T9["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S9 -->|calls| T9
  S10["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  T10["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S10 -->|calls| T10
  S11["method:ASTextNode::touchesEnded:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1156"]
  T11["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:925"]
  S11 -->|calls| T11
  S12["method:ASTextNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1175"]
  T12["method:ASTextNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1175"]
  S12 -->|calls| T12
  S13["method:ASTextNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1175"]
  T13["method:ASTextNode::_linkAttributeValueAtPoint:attributeName:range:inAdditionalTruncationMessage:forHighlighting:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:650"]
  S13 -->|calls| T13
  S14["method:ASTextNode::touchesMoved:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1175"]
  T14["method:ASTextNode::_clearHighlightIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:925"]
  S14 -->|calls| T14
  S15["method:ASTextNode::_handleLongPress:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1201"]
  T15["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  S15 -->|calls| T15
  S16["method:ASTextNode::_pendingLinkTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1214"]
  T16["method:ASTextNode::_pendingTruncationTap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1221"]
  S16 -->|calls| T16
  S17["method:ASTextNode::setShadowColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1247"]
  T17["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S17 -->|calls| T17
  S18["method:ASTextNode::setShadowColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1247"]
  T18["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S18 -->|calls| T18
  S19["method:ASTextNode::setShadowColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1247"]
  T19["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S19 -->|calls| T19
  S20["method:ASTextNode::setShadowColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1247"]
  T20["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S20 -->|calls| T20
  S21["method:ASTextNode::setShadowOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1269"]
  T21["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S21 -->|calls| T21
  S22["method:ASTextNode::setShadowOpacity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1281"]
  T22["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S22 -->|calls| T22
  S23["method:ASTextNode::setShadowRadius:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1293"]
  T23["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S23 -->|calls| T23
  S24["method:ASTextNode::shadowPadding<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1300"]
  T24["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S24 -->|calls| T24
  S25["method:ASTextNode::setTruncationAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1323"]
  T25["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
