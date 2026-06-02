# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T1["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T2["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UITextView::switchs<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  T3["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S3 -->|calls| T3
  S4["method:UIView::labelAutoFontByWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:21"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:33"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIView::buttonAutoFontByWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:46"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UIView::getFrameWithFreeWidth:maxHight:textSpace:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:122"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UIView::getFrameWithFreeWidth:maxHight:textSpace:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:122"]
  T12["method:NSMutableAttributedString::addkCTKernAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:134"]
  S12 -->|calls| T12
  S13["method:UIView::getFrameWithFreeHight:maxWidth:textSpace:lineSpace:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:150"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIView::addSubview<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  T14["method:UIView::addSubview<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S14 -->|calls| T14
  S15["method:UIView::refresh<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:61"]
  T15["method:BaseImageView::layoutIfNeeded<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:55"]
  S15 -->|calls| T15
  S16["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  T16["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S16 -->|calls| T16
  S17["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T17["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S17 -->|calls| T17
  S18["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T18["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S18 -->|calls| T18
  S19["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T19["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S19 -->|calls| T19
  S20["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T20["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S20 -->|calls| T20
  S21["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T21["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S21 -->|calls| T21
  S22["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T22["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S22 -->|calls| T22
  S23["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T23["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S23 -->|calls| T23
  S24["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T24["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S24 -->|calls| T24
  S25["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T25["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
