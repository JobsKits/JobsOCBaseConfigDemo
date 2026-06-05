# `calls 符号关系 - 012`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::jobsUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T2["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S2 -->|calls| T2
  S3["method:NSString::URLRequest<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T3["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:NSString::jobsFileUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T4["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSString::urlProtect<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T5["method:NSString::containsString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T6["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T7["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T8["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T9["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T10["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T11["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:338"]
  T12["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:390"]
  T13["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S13 -->|calls| T13
  S14["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:521"]
  T14["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:534"]
  T15["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:549"]
  T16["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:12"]
  S16 -->|calls| T16
  S17["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T17["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T18["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T19["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T20["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T21["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:JobsBasePopupTextView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:23"]
  T22["method:JobsBasePopupTextView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:23"]
  S22 -->|calls| T22
  S23["method:JobsBasePopupTextView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:23"]
  T23["method:JobsBasePopupTextView::setupDefaults<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:119"]
  S23 -->|calls| T23
  S24["method:JobsBasePopupTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:55"]
  T24["method:JobsBasePopupTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:55"]
  S24 -->|calls| T24
  S25["method:JobsBasePopupTextView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:68"]
  T25["method:JobsBasePopupTextView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:68"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
