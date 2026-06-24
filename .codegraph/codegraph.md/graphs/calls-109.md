# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASTextInputTraitsPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:38"]
  T1["method:_ASTextInputTraitsPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:38"]
  S1 -->|calls| T1
  S2["method:ASEditableTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:145"]
  T2["method:ASEditableTextNode::initWithTextKitComponents:placeholderTextKitComponents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:151"]
  S2 -->|calls| T2
  S3["method:ASEditableTextNode::initWithTextKitComponents:placeholderTextKitComponents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:151"]
  T3["method:ASEditableTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:145"]
  S3 -->|calls| T3
  S4["method:ASEditableTextNode::initWithTextKitComponents:placeholderTextKitComponents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:151"]
  T4["method:ASEditableTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:145"]
  S4 -->|calls| T4
  S5["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T5["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  S5 -->|calls| T5
  S6["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T6["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  S6 -->|calls| T6
  S7["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T7["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  S7 -->|calls| T7
  S8["method:ASEditableTextNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:174"]
  T8["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S8 -->|calls| T8
  S9["method:ASEditableTextNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:233"]
  T9["method:ASEditableTextNode::isDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:367"]
  S9 -->|calls| T9
  S10["method:ASEditableTextNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  T10["method:ASEditableTextNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  S10 -->|calls| T10
  S11["method:ASEditableTextNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:251"]
  T11["method:ASEditableTextNode::_layoutTextView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:465"]
  S11 -->|calls| T11
  S12["method:ASEditableTextNode::textView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:317"]
  T12["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S12 -->|calls| T12
  S13["method:ASEditableTextNode::setMaximumLinesToDisplay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:325"]
  T13["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S13 -->|calls| T13
  S14["method:ASEditableTextNode::attributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:394"]
  T14["method:ASEditableTextNode::isDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:367"]
  S14 -->|calls| T14
  S15["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T15["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S15 -->|calls| T15
  S16["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T16["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S16 -->|calls| T16
  S17["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T17["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S17 -->|calls| T17
  S18["method:ASEditableTextNode::textInputTraits<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:519"]
  T18["method:_ASTextInputTraitsPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:38"]
  S18 -->|calls| T18
  S19["method:ASEditableTextNode::textViewShouldBeginEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:688"]
  T19["method:ASEditableTextNode::_delegateShouldBeginEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:788"]
  S19 -->|calls| T19
  S20["method:ASEditableTextNode::textViewDidBeginEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:694"]
  T20["method:ASEditableTextNode::_delegateDidBeginEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:796"]
  S20 -->|calls| T20
  S21["method:ASEditableTextNode::textView:shouldChangeTextInRange:replacementText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:700"]
  T21["method:ASEditableTextNode::_delegateShouldChangeTextInRange:replacementText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:802"]
  S21 -->|calls| T21
  S22["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T22["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S22 -->|calls| T22
  S23["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T23["variable:invalidateCalculatedLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:170"]
  S23 -->|calls| T23
  S24["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T24["method:ASEditableTextNode::_delegateDidUpdateText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:823"]
  S24 -->|calls| T24
  S25["method:ASEditableTextNode::textViewDidChangeSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:724"]
  T25["method:ASEditableTextNode::_delegateDidChangeSelectionFromSelectedRange:toSelectedRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:811"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
