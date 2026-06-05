# `calls 符号关系 - 089`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::URLRequest<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T1["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:NSString::jobsFileUrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T2["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:NSString::urlProtect<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T3["method:NSString::containsString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S3 -->|calls| T3
  S4["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T4["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSURL::normalURLPlus<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:22"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S5 -->|calls| T5
  S6["method:NSURL::URLRequest<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:48"]
  T6["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T7["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T8["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T9["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T10["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T11["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:57"]
  T12["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:340"]
  T13["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S13 -->|calls| T13
  S14["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:392"]
  T14["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:186"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:523"]
  T15["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:536"]
  T16["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:551"]
  T17["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:12"]
  S17 -->|calls| T17
  S18["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T18["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S18 -->|calls| T18
  S19["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T19["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S19 -->|calls| T19
  S20["method:UIImage::imageWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T20["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S20 -->|calls| T20
  S21["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T21["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S21 -->|calls| T21
  S22["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T22["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S22 -->|calls| T22
  S23["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  T23["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S23 -->|calls| T23
  S24["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  T24["method:UIImage::frameDurationAtIndex:source:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:47"]
  S24 -->|calls| T24
  S25["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T25["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
