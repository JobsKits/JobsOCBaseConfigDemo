# `calls 符号关系 - 135`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T1["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S1 -->|calls| T1
  S2["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T2["method:ASTextNode::shadowOffset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1264"]
  S2 -->|calls| T2
  S3["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T3["method:ASTextNode::shadowColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1242"]
  S3 -->|calls| T3
  S4["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T4["method:ASTextNode::shadowOpacity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1276"]
  S4 -->|calls| T4
  S5["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T5["method:ASTextNode::shadowRadius<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1288"]
  S5 -->|calls| T5
  S6["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T6["function:ASTextNode::DefaultLinkAttributeNames<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:243"]
  S6 -->|calls| T6
  S7["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T7["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S7 -->|calls| T7
  S8["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:303"]
  T8["method:NSString::substringToIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S8 -->|calls| T8
  S9["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T9["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  S9 -->|calls| T9
  S10["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T10["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:303"]
  S10 -->|calls| T10
  S11["method:ASTextNode::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:312"]
  T11["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S11 -->|calls| T11
  S12["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T12["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:322"]
  S12 -->|calls| T12
  S13["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T13["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:303"]
  S13 -->|calls| T13
  S14["method:ASTextNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:322"]
  T14["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S14 -->|calls| T14
  S15["method:ASTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:334"]
  T15["method:ASTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:334"]
  S15 -->|calls| T15
  S16["method:ASTextNode::_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:372"]
  T16["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S16 -->|calls| T16
  S17["method:ASTextNode::_locked_rendererWithBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:390"]
  T17["function:rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:135"]
  S17 -->|calls| T17
  S18["method:ASTextNode::_locked_rendererWithBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:390"]
  T18["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:397"]
  S18 -->|calls| T18
  S19["method:ASTextNode::_locked_rendererAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:397"]
  T19["method:ASTextNode::_locked_composedTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1440"]
  S19 -->|calls| T19
  S20["method:ASTextNode::setTextContainerInset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:429"]
  T20["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S20 -->|calls| T20
  S21["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T21["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S21 -->|calls| T21
  S22["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:ASTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:441"]
  T23["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S23 -->|calls| T23
  S24["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T24["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S24 -->|calls| T24
  S25["method:ASTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:496"]
  T25["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
