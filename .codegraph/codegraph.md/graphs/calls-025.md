# `calls 符号关系 - 025`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T1["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S1 -->|calls| T1
  S2["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T2["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S2 -->|calls| T2
  S3["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T3["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S3 -->|calls| T3
  S4["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T4["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S4 -->|calls| T4
  S5["method:UIColor::colorWithHexString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:111"]
  T5["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  S5 -->|calls| T5
  S6["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T6["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S6 -->|calls| T6
  S7["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T7["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S7 -->|calls| T7
  S8["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T8["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S8 -->|calls| T8
  S9["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T9["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S9 -->|calls| T9
  S10["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T10["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T11["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T12["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T13["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T14["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:JobsBasePopupTextView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:23"]
  T15["method:JobsBasePopupTextView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:23"]
  S15 -->|calls| T15
  S16["method:JobsBasePopupTextView::init<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:23"]
  T16["method:JobsBasePopupTextView::setupDefaults<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:119"]
  S16 -->|calls| T16
  S17["method:JobsBasePopupTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:55"]
  T17["method:JobsBasePopupTextView::initWithFrame:textContainer:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:55"]
  S17 -->|calls| T17
  S18["method:JobsBasePopupTextView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:68"]
  T18["method:JobsBasePopupTextView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:68"]
  S18 -->|calls| T18
  S19["method:JobsBasePopupTextView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:68"]
  T19["method:JobsBasePopupTextView::adjustContentOffset<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:115"]
  S19 -->|calls| T19
  S20["method:JobsBasePopupTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:78"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:JobsBasePopupTextView::canPerformAction:withSender:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:78"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:JobsBasePopupTextView::setupDefaults<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/BaseTextView/BaseTextView.m:119"]
  T22["method:UITextView::switchs<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  S22 -->|calls| T22
  S23["method:UITextView::switchs<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T23["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S23 -->|calls| T23
  S24["method:UIView::backgroundImageView<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::backgroundImageView<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
