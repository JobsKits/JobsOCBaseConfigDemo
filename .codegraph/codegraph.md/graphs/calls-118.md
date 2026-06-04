# `calls 符号关系 - 118`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T1["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S1 -->|calls| T1
  S2["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T2["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S2 -->|calls| T2
  S3["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T3["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S3 -->|calls| T3
  S4["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T4["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S4 -->|calls| T4
  S5["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T5["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S5 -->|calls| T5
  S6["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T6["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S6 -->|calls| T6
  S7["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T7["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S7 -->|calls| T7
  S8["method:UIColor::colorWithHexString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:111"]
  T8["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  S8 -->|calls| T8
  S9["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T9["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S9 -->|calls| T9
  S10["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T10["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S10 -->|calls| T10
  S11["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T11["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S11 -->|calls| T11
  S12["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T12["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S12 -->|calls| T12
  S13["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T13["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T14["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T15["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T16["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T17["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:UITextView::switchs<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:15"]
  T18["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S18 -->|calls| T18
  S19["method:UIView::labelAutoFontByWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:21"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:33"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::buttonAutoFontByWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:46"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
