# `calls 符号关系 - 147`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T1["function:_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:230"]
  S1 -->|calls| T1
  S2["function:propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:249"]
  T2["function:ASStringWithQuotesIfMultiword<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:94"]
  S2 -->|calls| T2
  S3["function:didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  T3["function:didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:261"]
  S3 -->|calls| T3
  S4["function:setTextContainerInset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:315"]
  T4["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S4 -->|calls| T4
  S5["function:calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T5["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S5 -->|calls| T5
  S6["function:calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:340"]
  T6["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S6 -->|calls| T6
  S7["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T7["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S7 -->|calls| T7
  S8["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T8["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S8 -->|calls| T8
  S9["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T9["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S9 -->|calls| T9
  S10["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T11["method:ASLayoutElementStyle::descender<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:519"]
  S11 -->|calls| T11
  S12["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T12["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S12 -->|calls| T12
  S13["function:setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:388"]
  T13["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S13 -->|calls| T13
  S14["function:setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T14["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S14 -->|calls| T14
  S15["function:setExclusionPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:435"]
  T15["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S15 -->|calls| T15
  S16["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  T16["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S16 -->|calls| T16
  S17["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T17["method:ASTextContainer::makeImmutable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:200"]
  S17 -->|calls| T17
  S18["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T18["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S18 -->|calls| T18
  S19["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T19["function:prepareAttributedString:isForIntrinsicSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:450"]
  S19 -->|calls| T19
  S20["function:drawParametersForAsyncLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:518"]
  T20["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S20 -->|calls| T20
  S21["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T21["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  S21 -->|calls| T21
  S22["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T22["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S22 -->|calls| T22
  S23["function:drawRect:withParameters:isCancelled:isRasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:562"]
  T23["method:ASTextDebugOption::sharedDebugOption<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:125"]
  S23 -->|calls| T23
  S24["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T24["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  S24 -->|calls| T24
  S25["function:tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:593"]
  T25["function:_setNeedsDisplayOnTintedTextColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:600"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
