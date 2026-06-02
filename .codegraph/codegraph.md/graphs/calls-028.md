# `calls 符号关系 - 028`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::initByTextModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:UIButton::initByTextModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T2["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S2 -->|calls| T2
  S3["method:UIButton::initByTextModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T3["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T4["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T5["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T6["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T7["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T8["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T9["method:UIButton::jobsBtnClickEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:223"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T10["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:338"]
  T11["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:390"]
  T12["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:521"]
  T13["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S13 -->|calls| T13
  S14["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:534"]
  T14["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:549"]
  T15["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:12"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsSetBtnTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:24"]
  T16["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsSetBtnSubTitleFont:btnSubTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:30"]
  T17["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:390"]
  T18["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsResetSubTitleBaseForegroundColor<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:415"]
  T19["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S19 -->|calls| T19
  S20["method:UIButton::jobsResetTitleFont<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:439"]
  T20["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsResetSubTitleFont<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:447"]
  T21["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S21 -->|calls| T21
  S22["method:UIButton::selectedAttributedTitleBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:454"]
  T22["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S22 -->|calls| T22
  S23["method:UIButton::normalStateAttributedTitleBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:463"]
  T23["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S23 -->|calls| T23
  S24["method:UIButton::highlightedStateAttributedTitleBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:472"]
  T24["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S24 -->|calls| T24
  S25["method:UIButton::disabledStateAttributedTitleBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:481"]
  T25["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
