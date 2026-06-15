# `calls 符号关系 - 141`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  T1["method:NSString::substringToIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S1 -->|calls| T1
  S2["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T2["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  S2 -->|calls| T2
  S3["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T3["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S3 -->|calls| T3
  S4["function:propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:239"]
  T4["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S4 -->|calls| T4
  S5["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T5["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  S5 -->|calls| T5
  S6["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T6["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S6 -->|calls| T6
  S7["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T7["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S7 -->|calls| T7
  S8["function:didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  T8["function:didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  S8 -->|calls| T8
  S9["function:setTextContainerInset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:315"]
  T9["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S9 -->|calls| T9
  S10["function:calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T10["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S10 -->|calls| T10
  S11["function:calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T11["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S11 -->|calls| T11
  S12["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T12["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S12 -->|calls| T12
  S13["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T13["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S13 -->|calls| T13
  S14["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T14["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S14 -->|calls| T14
  S15["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T16["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S16 -->|calls| T16
  S17["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T17["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S17 -->|calls| T17
  S18["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T18["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S18 -->|calls| T18
  S19["function:setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T19["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S19 -->|calls| T19
  S20["function:setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T20["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S20 -->|calls| T20
  S21["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  T21["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S21 -->|calls| T21
  S22["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T22["method:ASTextContainer::makeImmutable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:200"]
  S22 -->|calls| T22
  S23["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T23["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S23 -->|calls| T23
  S24["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T24["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S24 -->|calls| T24
  S25["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T25["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
