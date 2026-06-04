# `calls 符号关系 - 161`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::initByButtonModel<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T1["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S1 -->|calls| T1
  S2["method:UIButton::initByButtonModel<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T2["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S2 -->|calls| T2
  S3["method:UIButton::initByTextModel<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T3["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S3 -->|calls| T3
  S4["method:UIButton::initByTextModel<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T4["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S4 -->|calls| T4
  S5["method:UIButton::titleTextView<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:28"]
  T5["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  S5 -->|calls| T5
  S6["method:UIButton::subtitleTextView<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:47"]
  T6["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T7["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T8["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T9["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T10["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T11["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T12["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:340"]
  T13["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S13 -->|calls| T13
  S14["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:392"]
  T14["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:523"]
  T15["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:536"]
  T16["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:551"]
  T17["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:12"]
  S17 -->|calls| T17
  S18["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T18["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S18 -->|calls| T18
  S19["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T19["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S19 -->|calls| T19
  S20["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T20["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S20 -->|calls| T20
  S21["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T21["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S21 -->|calls| T21
  S22["function:_jobs_bind<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:21"]
  T22["function:jobs_targetsMap<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:13"]
  S22 -->|calls| T22
  S23["method:UIControl::jobs_onChange:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:42"]
  T23["function:_jobs_bind<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:21"]
  S23 -->|calls| T23
  S24["method:UIView::addGesture<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:51"]
  T24["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S24 -->|calls| T24
  S25["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  T25["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
