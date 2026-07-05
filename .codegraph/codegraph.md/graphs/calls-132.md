# `calls 符号关系 - 132`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T1["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S1 -->|calls| T1
  S2["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:303"]
  T2["method:NSString::substringToIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S2 -->|calls| T2
  S3["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T3["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S3 -->|calls| T3
  S4["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T4["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:303"]
  S4 -->|calls| T4
  S5["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T5["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S5 -->|calls| T5
  S6["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T6["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:322"]
  S6 -->|calls| T6
  S7["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T7["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:303"]
  S7 -->|calls| T7
  S8["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T8["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S8 -->|calls| T8
  S9["method:ASTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:334"]
  T9["method:ASTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:334"]
  S9 -->|calls| T9
  S10["method:ASTextNode::_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:372"]
  T10["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S10 -->|calls| T10
  S11["method:ASTextNode::_locked_rendererWithBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:390"]
  T11["function:rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:135"]
  S11 -->|calls| T11
  S12["method:ASTextNode::_locked_rendererWithBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:390"]
  T12["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:397"]
  S12 -->|calls| T12
  S13["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:397"]
  T13["method:ASTextNode::_locked_composedTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1440"]
  S13 -->|calls| T13
  S14["method:ASTextNode::setTextContainerInset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:429"]
  T14["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S14 -->|calls| T14
  S15["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T15["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S15 -->|calls| T15
  S16["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T17["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S17 -->|calls| T17
  S18["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T18["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S18 -->|calls| T18
  S19["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T19["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  S19 -->|calls| T19
  S20["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T20["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S20 -->|calls| T20
  S21["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T21["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S21 -->|calls| T21
  S22["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T23["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S23 -->|calls| T23
  S24["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T24["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S24 -->|calls| T24
  S25["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T25["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
