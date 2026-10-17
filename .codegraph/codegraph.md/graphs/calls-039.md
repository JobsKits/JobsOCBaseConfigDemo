# `calls 符号关系 - 039`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:226"]
  T1["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S1 -->|calls| T1
  S2["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:226"]
  T2["method:JobsCorModel::byBlue<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:29"]
  S2 -->|calls| T2
  S3["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:226"]
  T3["method:JobsCorModel::byGreen<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:20"]
  S3 -->|calls| T3
  S4["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:226"]
  T4["method:JobsCorModel::byRed<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:11"]
  S4 -->|calls| T4
  S5["method:UIColor::image<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:266"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:UIColor::jobsImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:270"]
  T6["method:UIColor::imageByRect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:282"]
  S6 -->|calls| T6
  S7["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:17"]
  T7["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S7 -->|calls| T7
  S8["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T8["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S8 -->|calls| T8
  S9["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:49"]
  T9["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S9 -->|calls| T9
  S10["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:65"]
  T10["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S10 -->|calls| T10
  S11["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:81"]
  T11["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S11 -->|calls| T11
  S12["method:UITextView::switchs<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T12["method:UITextView::byContentInset<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:51"]
  S12 -->|calls| T12
  S13["method:UITextView::switchs<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T13["method:UITextView::byTextContainerInset<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:42"]
  S13 -->|calls| T13
  S14["method:UITextView::switchs<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T14["method:UITextView::byTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:33"]
  S14 -->|calls| T14
  S15["method:UITextView::switchs<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T15["method:UITextView::byLineFragmentPadding<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextView+DSLs/UITextView+DSL/UITextView+DSL.m:319"]
  S15 -->|calls| T15
  S16["method:UITextView::switchs<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T16["method:UITextView::byContentOffset<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:60"]
  S16 -->|calls| T16
  S17["method:UITextView::jobsTextViewSubscribeNextBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:78"]
  T17["variable:subscribeNextBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UISlider/UISlider+Extra/UISlider+Extra.h:38"]
  S17 -->|calls| T17
  S18["method:UITextView::jobsTextViewFilterBlock:subscribeNextBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:89"]
  T18["variable:filterBlock<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.h:53"]
  S18 -->|calls| T18
  S19["method:UITextView::jobsTextViewFilterBlock:subscribeNextBlock:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:89"]
  T19["variable:subscribeNextBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UISlider/UISlider+Extra/UISlider+Extra.h:38"]
  S19 -->|calls| T19
  S20["method:UIView::layerBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:17"]
  T20["method:CALayer::byBorderColor<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:485"]
  S20 -->|calls| T20
  S21["method:UIView::layerBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:17"]
  T21["method:FMBannerAdsModel::byBorderWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:299"]
  S21 -->|calls| T21
  S22["method:UIView::layerBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:17"]
  T22["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:20"]
  S22 -->|calls| T22
  S23["method:UIView::layerBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:17"]
  T23["method:FMBannerAdsModel::byMasksToBounds<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:308"]
  S23 -->|calls| T23
  S24["method:UIView::layerByBorderCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:29"]
  T24["method:CALayer::byBorderColor<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:485"]
  S24 -->|calls| T24
  S25["method:UIView::layerByBorderWidth<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:38"]
  T25["method:FMBannerAdsModel::byBorderWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:299"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
