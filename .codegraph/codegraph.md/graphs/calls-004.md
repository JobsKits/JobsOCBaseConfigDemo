# `calls 符号关系 - 004`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T1["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S1 -->|calls| T1
  S2["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  T2["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  S2 -->|calls| T2
  S3["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T3["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:NSLocale::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSLocale/NSLocale+Extra/NSLocale+Extra.m:18"]
  T4["method:NSLocale::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSLocale/NSLocale+Extra/NSLocale+Extra.m:18"]
  S4 -->|calls| T4
  S5["method:NSString::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T5["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSString::jobsFileUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T6["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  T7["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T8["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:NSURL::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:48"]
  T9["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  T10["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  S10 -->|calls| T10
  S11["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  T11["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  S11 -->|calls| T11
  S12["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  T12["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  S12 -->|calls| T12
  S13["method:UIButton::revolution<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:12"]
  T13["method:CABasicAnimation::animationByKeyPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CABasicAnimation/CABasicAnimation+Extra/CABasicAnimation+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIButton::startRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:29"]
  T14["method:UIButton::stopRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:21"]
  S14 -->|calls| T14
  S15["method:UIGestureRecognizer::rac_recognizer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIGestureRecognizer/UIGestureRecognizer+RAC/UIGestureRecognizer+ReactiveCocoa/UIGestureRecognizer+ReactiveCocoa.m:12"]
  T15["method:UIGestureRecognizer::rac_initializeRAC<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIGestureRecognizer/UIGestureRecognizer+RAC/UIGestureRecognizer+ReactiveCocoa/UIGestureRecognizer+ReactiveCocoa.m:24"]
  S15 -->|calls| T15
  S16["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T16["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S16 -->|calls| T16
  S17["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T17["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S17 -->|calls| T17
  S18["method:UIImage::imageWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T18["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S18 -->|calls| T18
  S19["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T19["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S19 -->|calls| T19
  S20["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T20["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S20 -->|calls| T20
  S21["method:UIImage::cropSquareImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Tailor/UIImage+Tailor.m:12"]
  T21["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S21 -->|calls| T21
  S22["method:UIImageView::imageViewWithGIFFile:frame:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+GIF/UIImageView+GIF.m:12"]
  T22["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S22 -->|calls| T22
  S23["method:UIImageView::imageViewWithGIFFile:frame:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+GIF/UIImageView+GIF.m:12"]
  T23["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S23 -->|calls| T23
  S24["method:UINavigationController::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+Extra/UINavigationController+Extra.m:12"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UITextField::isValidate:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:13"]
  T25["method:UITextField::shakeAnimationForView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
