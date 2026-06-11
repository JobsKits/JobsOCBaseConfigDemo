# `calls 符号关系 - 006`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T1["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S1 -->|calls| T1
  S2["method:NSString::range<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T2["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S2 -->|calls| T2
  S3["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::toast<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T4["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S4 -->|calls| T4
  S5["method:NSString::jobsUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S5 -->|calls| T5
  S6["method:NSString::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T6["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSString::jobsFileUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T7["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  T8["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T9["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSURL::normalURLPlus<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:22"]
  T10["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S10 -->|calls| T10
  S11["method:NSURL::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:48"]
  T11["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  T12["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  S12 -->|calls| T12
  S13["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  T13["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  S13 -->|calls| T13
  S14["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  T14["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  S14 -->|calls| T14
  S15["method:UIButton::revolution<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:12"]
  T15["method:CABasicAnimation::animationByKeyPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CABasicAnimation/CABasicAnimation+Extra/CABasicAnimation+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:UIButton::startRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:29"]
  T16["method:UIButton::stopRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:21"]
  S16 -->|calls| T16
  S17["method:UICollectionView::registerCollectionElementKindSectionHeaderClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:62"]
  T17["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S17 -->|calls| T17
  S18["method:UICollectionView::registerCollectionElementKindSectionFooterClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:82"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:UIControl::__uxy_sendAction:to:forEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+XY/UIControl+XY.m:41"]
  T19["method:UIControl::__uxy_sendAction:to:forEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+XY/UIControl+XY.m:41"]
  S19 -->|calls| T19
  S20["method:UIGestureRecognizer::rac_recognizer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIGestureRecognizer/UIGestureRecognizer+RAC/UIGestureRecognizer+ReactiveCocoa/UIGestureRecognizer+ReactiveCocoa.m:12"]
  T20["method:UIGestureRecognizer::rac_initializeRAC<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIGestureRecognizer/UIGestureRecognizer+RAC/UIGestureRecognizer+ReactiveCocoa/UIGestureRecognizer+ReactiveCocoa.m:24"]
  S20 -->|calls| T20
  S21["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T21["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S21 -->|calls| T21
  S22["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T22["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S22 -->|calls| T22
  S23["method:UIImage::imageWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T23["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S23 -->|calls| T23
  S24["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T24["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S24 -->|calls| T24
  S25["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T25["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
