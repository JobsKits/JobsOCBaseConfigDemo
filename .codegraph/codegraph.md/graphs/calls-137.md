# `calls 符号关系 - 137`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T1["function:DefaultLinkAttributeNames<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:178"]
  S1 -->|calls| T1
  S2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T2["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S2 -->|calls| T2
  S3["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  T3["method:NSString::substringToIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S3 -->|calls| T3
  S4["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T4["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  S4 -->|calls| T4
  S5["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T5["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S5 -->|calls| T5
  S6["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T6["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S6 -->|calls| T6
  S7["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T7["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  S7 -->|calls| T7
  S8["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T8["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S8 -->|calls| T8
  S9["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T9["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S9 -->|calls| T9
  S10["function:didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  T10["function:didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  S10 -->|calls| T10
  S11["function:setTextContainerInset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:315"]
  T11["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S11 -->|calls| T11
  S12["function:calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T12["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S12 -->|calls| T12
  S13["function:calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T13["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S13 -->|calls| T13
  S14["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T14["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S14 -->|calls| T14
  S15["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T15["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S15 -->|calls| T15
  S16["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T16["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S16 -->|calls| T16
  S17["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T17["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S17 -->|calls| T17
  S18["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T18["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S18 -->|calls| T18
  S19["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T19["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S19 -->|calls| T19
  S20["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T20["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S20 -->|calls| T20
  S21["function:setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T21["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S21 -->|calls| T21
  S22["function:setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T22["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S22 -->|calls| T22
  S23["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  T23["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S23 -->|calls| T23
  S24["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T24["method:ASTextContainer::makeImmutable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:200"]
  S24 -->|calls| T24
  S25["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T25["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
