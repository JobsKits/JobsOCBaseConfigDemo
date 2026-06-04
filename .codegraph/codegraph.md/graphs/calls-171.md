# `calls 符号关系 - 171`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::initByTextModel<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T1["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T2["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T3["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T4["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T5["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T6["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T7["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:338"]
  T8["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:390"]
  T9["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:521"]
  T10["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:534"]
  T11["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:549"]
  T12["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:12"]
  S12 -->|calls| T12
  S13["method:UIColor::jobsCor<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T13["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S13 -->|calls| T13
  S14["method:UIColor::jobsCor<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T14["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S14 -->|calls| T14
  S15["method:UIColor::jobsColorByHex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:58"]
  T15["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:44"]
  S15 -->|calls| T15
  S16["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T16["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S16 -->|calls| T16
  S17["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T17["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S17 -->|calls| T17
  S18["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T18["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S18 -->|calls| T18
  S19["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T19["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S19 -->|calls| T19
  S20["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T20["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S20 -->|calls| T20
  S21["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T21["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S21 -->|calls| T21
  S22["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T22["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S22 -->|calls| T22
  S23["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T23["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S23 -->|calls| T23
  S24["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T24["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S24 -->|calls| T24
  S25["method:UIColor::colorWithHexString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:111"]
  T25["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
