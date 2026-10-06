# `calls 符号关系 - 039`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T1["method:JobsCorModel::byGreen<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:20"]
  S1 -->|calls| T1
  S2["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T2["method:JobsCorModel::byRed<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:11"]
  S2 -->|calls| T2
  S3["method:UIColor::colorWithHexString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:110"]
  T3["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  S3 -->|calls| T3
  S4["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:140"]
  T4["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S4 -->|calls| T4
  S5["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:140"]
  T5["method:NSMutableArray::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:140"]
  T6["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIColor::rgbCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:197"]
  T7["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:78"]
  S7 -->|calls| T7
  S8["method:UIColor::rgbCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:197"]
  T8["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S8 -->|calls| T8
  S9["method:UIColor::rgbCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:197"]
  T9["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S9 -->|calls| T9
  S10["method:UIColor::rgbCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:197"]
  T10["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S10 -->|calls| T10
  S11["method:UIColor::rgbCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:197"]
  T11["method:NSMutableArray::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:226"]
  T12["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S12 -->|calls| T12
  S13["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:226"]
  T13["method:JobsCorModel::byBlue<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:29"]
  S13 -->|calls| T13
  S14["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:226"]
  T14["method:JobsCorModel::byGreen<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:20"]
  S14 -->|calls| T14
  S15["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:226"]
  T15["method:JobsCorModel::byRed<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:11"]
  S15 -->|calls| T15
  S16["method:UIColor::image<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:266"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:UIColor::jobsImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:270"]
  T17["method:UIColor::imageByRect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:282"]
  S17 -->|calls| T17
  S18["method:UIGestureRecognizer::gestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:11"]
  T18["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S18 -->|calls| T18
  S19["method:UIGestureRecognizer::GestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:22"]
  T19["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S19 -->|calls| T19
  S20["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:17"]
  T20["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S20 -->|calls| T20
  S21["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T21["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S21 -->|calls| T21
  S22["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:49"]
  T22["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S22 -->|calls| T22
  S23["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:65"]
  T23["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S23 -->|calls| T23
  S24["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:81"]
  T24["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:11"]
  S24 -->|calls| T24
  S25["method:UITextView::switchs<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T25["method:UITextView::byContentInset<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
