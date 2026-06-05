# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T1["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T2["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:338"]
  T3["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:390"]
  T4["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:521"]
  T5["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:534"]
  T6["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:549"]
  T7["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:12"]
  S7 -->|calls| T7
  S8["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T8["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T9["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T10["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T11["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T12["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UITextView::switchs<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  T13["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S13 -->|calls| T13
  S14["method:UIView::addSubview<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  T14["method:UIView::addSubview<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S14 -->|calls| T14
  S15["method:UIView::addGestureRecognizer<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  T15["method:UIView::addGestureRecognizer<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S15 -->|calls| T15
  S16["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T16["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S16 -->|calls| T16
  S17["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T17["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S17 -->|calls| T17
  S18["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T18["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S18 -->|calls| T18
  S19["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T19["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S19 -->|calls| T19
  S20["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T20["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S20 -->|calls| T20
  S21["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T21["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S21 -->|calls| T21
  S22["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T22["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S22 -->|calls| T22
  S23["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T23["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S23 -->|calls| T23
  S24["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T24["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S24 -->|calls| T24
  S25["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T25["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
