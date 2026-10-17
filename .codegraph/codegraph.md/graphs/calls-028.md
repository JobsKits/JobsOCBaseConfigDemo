# `calls 符号关系 - 028`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T1["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:248"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:64"]
  T2["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:267"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  T3["function:jobsMakeTextView::jobsMakeMutDic<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:809"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  T4["function:jobsMakeTextView::jobsMakeMutDic<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:809"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsBtnClickEventBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:239"]
  T5["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:248"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsBtnLongPressGestureEventBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:258"]
  T6["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:267"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:267"]
  T7["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:267"]
  T8["method:UIView::addGesture<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:71"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:267"]
  T9["method:UIGestureRecognizer::gestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:11"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:267"]
  T10["function:jobsMakeLongPressGesture<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:163"]
  S10 -->|calls| T10
  S11["method:UIButton::btnClickActionWithParamarrays<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:283"]
  T11["method:NSObject::methodName:targetObj:paramarrays:<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+DynamicInvoke/NSObject+DynamicInvoke.m:213"]
  S11 -->|calls| T11
  S12["method:UIButton::changeAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  T12["method:UICollectionViewLayoutAttributes::byTransform<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:479"]
  S12 -->|calls| T12
  S13["method:UIButton::enabledBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:330"]
  T13["method:UIGestureRecognizer::byEnabled<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:30"]
  S13 -->|calls| T13
  S14["method:UIButton::enabledBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:330"]
  T14["method:UIButton::normalStateTitleColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:371"]
  S14 -->|calls| T14
  S15["method:UIButton::enabledBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:330"]
  T15["method:UIButton::titleColorForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:665"]
  S15 -->|calls| T15
  S16["method:UIButton::makeNewLineShows<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:341"]
  T16["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:260"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  T17["method:UIButton::jobsResetTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:278"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  T18["method:UIButton::normalStateTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:535"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  T19["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:408"]
  S19 -->|calls| T19
  S20["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  T20["method:UIButton::normalStateTitleColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:371"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  T21["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S21 -->|calls| T21
  S22["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  T22["method:UIButtonConfiguration::byTitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:192"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  T23["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  T24["method:UIButton::titleColorForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:665"]
  S24 -->|calls| T24
  S25["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T25["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
