# `calls 符号关系 - 110`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::titleTextView<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:28"]
  T1["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  S1 -->|calls| T1
  S2["method:UIButton::subtitleTextView<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+TextView/UIButton+TextView.m:47"]
  T2["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T3["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T4["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T5["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T6["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T7["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T8["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:340"]
  T9["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:392"]
  T10["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:523"]
  T11["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:536"]
  T12["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:551"]
  T13["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:12"]
  S13 -->|calls| T13
  S14["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T14["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S14 -->|calls| T14
  S15["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T15["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S15 -->|calls| T15
  S16["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T16["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S16 -->|calls| T16
  S17["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T17["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S17 -->|calls| T17
  S18["function:_jobs_bind<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:21"]
  T18["function:jobs_targetsMap<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:13"]
  S18 -->|calls| T18
  S19["method:UIControl::jobs_onChange:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:42"]
  T19["function:_jobs_bind<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:21"]
  S19 -->|calls| T19
  S20["method:UIView::addGesture<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:51"]
  T20["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S20 -->|calls| T20
  S21["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  T21["method:UIView::addSubview<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:83"]
  S21 -->|calls| T21
  S22["method:UIView::panGR<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:25"]
  T22["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S22 -->|calls| T22
  S23["method:NSString::chinaTime<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:15"]
  T23["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:49"]
  S23 -->|calls| T23
  S24["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:25"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S24 -->|calls| T24
  S25["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSString+Time/NSString+Time.m:25"]
  T25["method:NSDate::initDateBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
