# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::normalStateAttributedTitleBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:463"]
  T1["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S1 -->|calls| T1
  S2["method:UIButton::highlightedStateAttributedTitleBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:472"]
  T2["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S2 -->|calls| T2
  S3["method:UIButton::disabledStateAttributedTitleBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:481"]
  T3["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S3 -->|calls| T3
  S4["method:UIButton::selectedStateAttributedTitleBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:490"]
  T4["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S4 -->|calls| T4
  S5["method:UIButton::focusedStateAttributedTitleBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:499"]
  T5["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S5 -->|calls| T5
  S6["method:UIButton::applicationStateAttributedTitleBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:508"]
  T6["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S6 -->|calls| T6
  S7["method:UIButton::reservedStateAttributedTitleBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:517"]
  T7["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S7 -->|calls| T7
  S8["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:12"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIColor::jobsCor<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:53"]
  T9["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S9 -->|calls| T9
  S10["method:UIColor::jobsCor<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:53"]
  T10["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S10 -->|calls| T10
  S11["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T11["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T12["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T13["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T14["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T15["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:UITextView::switchs<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T16["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S16 -->|calls| T16
  S17["method:UITextView::contentSizeToFitByFont<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:184"]
  T17["function:helveticaNeue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:145"]
  S17 -->|calls| T17
  S18["method:UITextView::replacementText:beginNewLineBlock:delBlock:normalInputBlock:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:251"]
  T18["method:NSString::validateContainsEmoji<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:46"]
  S18 -->|calls| T18
  S19["method:UITextView::indicateWordLimitLab<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+IndicateWordLimit/UITextView+IndicateWordLimit.m:14"]
  T19["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S19 -->|calls| T19
  S20["method:UITextView::indicateWordLimitLab<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+IndicateWordLimit/UITextView+IndicateWordLimit.m:14"]
  T20["method:UILabel::makeLabelByShowingType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:58"]
  S20 -->|calls| T20
  S21["method:UITextView::offsetX<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+IndicateWordLimit/UITextView+IndicateWordLimit.m:65"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:UITextView::offsetY<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UITextView/UITextView+IndicateWordLimit/UITextView+IndicateWordLimit.m:79"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:UIView::addSubview<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  T23["method:UIView::addSubview<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:UIView::refresh<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:25"]
  T24["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S24 -->|calls| T24
  S25["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:86"]
  T25["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:86"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
