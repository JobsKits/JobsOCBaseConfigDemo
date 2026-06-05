# `calls 符号关系 - 024`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsInitBtnByConfiguration:background:buttonConfigTitleAlignment:textAlignment:subTextAlignment:normalImage:highlightImage:attributedTitle:selectedAttributedTitle:attributedSubtitle:title:subTitle:titleFont:subTitleFont:titleCor:subTitleCor:titleLineBreakMode:subtitleLineBreakMode:baseBackgroundColor:backgroundImage:highlightBackgroundImage:imagePadding:titlePadding:imagePlacement:contentHorizontalAlignment:contentVerticalAlignment:contentInsets:cornerRadiusValue:roundingCorners:roundingCornersRadii:layerBorderCor:borderWidth:selected:primaryAction:longPressGestureEventBlock:clickEventBlock:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:55"]
  T1["method:UIButton::jobsBtnLongPressGestureEventByBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:237"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:338"]
  T2["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:390"]
  T3["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:521"]
  T4["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:534"]
  T5["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:549"]
  T6["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:12"]
  S6 -->|calls| T6
  S7["method:UICollectionView::registerCollectionElementKindSectionHeaderClass_<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:68"]
  T7["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S7 -->|calls| T7
  S8["method:UICollectionView::registerCollectionElementKindSectionFooterClass_<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:88"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T9["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S9 -->|calls| T9
  S10["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T10["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S10 -->|calls| T10
  S11["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T11["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S11 -->|calls| T11
  S12["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T12["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S12 -->|calls| T12
  S13["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T13["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S13 -->|calls| T13
  S14["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  T14["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S14 -->|calls| T14
  S15["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  T15["method:UIImage::frameDurationAtIndex:source:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:47"]
  S15 -->|calls| T15
  S16["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T16["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S16 -->|calls| T16
  S17["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T17["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S17 -->|calls| T17
  S18["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T18["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S18 -->|calls| T18
  S19["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T19["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T20["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T21["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T22["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T23["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  T24["method:UITableView::rectForHeaderInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:172"]
  S24 -->|calls| T24
  S25["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  T25["method:UITableView::rectForFooterInSection<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+Extra/UITableView+Extra.m:180"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
