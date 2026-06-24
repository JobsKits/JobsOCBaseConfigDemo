# `calls 符号关系 - 140`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T1["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S1 -->|calls| T1
  S2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S2 -->|calls| T2
  S3["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T3["method:ASTextNode::shadowOffset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1264"]
  S3 -->|calls| T3
  S4["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T4["method:ASTextNode::shadowColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1242"]
  S4 -->|calls| T4
  S5["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T5["method:ASTextNode::shadowOpacity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1276"]
  S5 -->|calls| T5
  S6["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T6["method:ASTextNode::shadowRadius<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1288"]
  S6 -->|calls| T6
  S7["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T7["function:DefaultLinkAttributeNames<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:178"]
  S7 -->|calls| T7
  S8["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T8["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S8 -->|calls| T8
  S9["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  T9["method:NSString::substringToIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S9 -->|calls| T9
  S10["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T10["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  S10 -->|calls| T10
  S11["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T11["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S11 -->|calls| T11
  S12["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T12["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S12 -->|calls| T12
  S13["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T13["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  S13 -->|calls| T13
  S14["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T14["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S14 -->|calls| T14
  S15["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T15["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S15 -->|calls| T15
  S16["function:didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  T16["function:didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  S16 -->|calls| T16
  S17["function:setTextContainerInset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:315"]
  T17["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S17 -->|calls| T17
  S18["function:calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T18["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S18 -->|calls| T18
  S19["function:calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T19["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S19 -->|calls| T19
  S20["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T20["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S20 -->|calls| T20
  S21["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T21["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S21 -->|calls| T21
  S22["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T22["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S22 -->|calls| T22
  S23["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T24["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S24 -->|calls| T24
  S25["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T25["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
