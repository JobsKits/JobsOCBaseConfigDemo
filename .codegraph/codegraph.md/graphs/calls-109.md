# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T1["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S1 -->|calls| T1
  S2["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["method:ASEditableTextNode::setAttributedText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:405"]
  T3["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S3 -->|calls| T3
  S4["method:ASEditableTextNode::textInputTraits<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:519"]
  T4["method:_ASTextInputTraitsPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:38"]
  S4 -->|calls| T4
  S5["method:ASEditableTextNode::textViewShouldBeginEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:688"]
  T5["method:ASEditableTextNode::_delegateShouldBeginEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:788"]
  S5 -->|calls| T5
  S6["method:ASEditableTextNode::textViewDidBeginEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:694"]
  T6["method:ASEditableTextNode::_delegateDidBeginEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:796"]
  S6 -->|calls| T6
  S7["method:ASEditableTextNode::textView:shouldChangeTextInRange:replacementText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:700"]
  T7["method:ASEditableTextNode::_delegateShouldChangeTextInRange:replacementText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:802"]
  S7 -->|calls| T7
  S8["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T8["method:ASEditableTextNode::_updateDisplayingPlaceholder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:447"]
  S8 -->|calls| T8
  S9["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T9["variable:invalidateCalculatedLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:170"]
  S9 -->|calls| T9
  S10["method:ASEditableTextNode::textViewDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:706"]
  T10["method:ASEditableTextNode::_delegateDidUpdateText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:823"]
  S10 -->|calls| T10
  S11["method:ASEditableTextNode::textViewDidChangeSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:724"]
  T11["method:ASEditableTextNode::_delegateDidChangeSelectionFromSelectedRange:toSelectedRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:811"]
  S11 -->|calls| T11
  S12["method:ASEditableTextNode::textViewDidEndEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:745"]
  T12["method:ASEditableTextNode::_delegateDidFinishEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASEditableTextNode.mm:840"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.h:1"]
  T13["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  S13 -->|calls| T13
  S14["function:ASExperimentalFeaturesFromArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.mm:46"]
  T14["function:ASExperimentalFeaturesGetNames<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASExperimentalFeatures.mm:13"]
  S14 -->|calls| T14
  S15["method:ASImageNode::_locked_setAnimatedImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:40"]
  T15["method:ASImageNode::animatedImageSet:previousAnimatedImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:87"]
  S15 -->|calls| T15
  S16["method:ASImageNode::setCoverImageCompleted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:116"]
  T16["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S16 -->|calls| T16
  S17["method:ASImageNode::_locked_setCoverImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:143"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:ASImageNode::_locked_setCoverImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:143"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T19["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S19 -->|calls| T19
  S20["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T20["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S20 -->|calls| T20
  S21["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T21["method:ASImageNode::_locked_stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:262"]
  S21 -->|calls| T21
  S22["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T22["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S22 -->|calls| T22
  S23["method:ASImageNode::_locked_setShouldAnimate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:186"]
  T23["method:ASImageNode::stopAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:254"]
  S23 -->|calls| T23
  S24["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  T24["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  S24 -->|calls| T24
  S25["method:ASImageNode::_locked_startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:221"]
  T25["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
