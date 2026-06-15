# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSURL::normalURLPlus<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:22"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S1 -->|calls| T1
  S2["method:NSURL::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:48"]
  T2["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  T3["method:NSUserDefaults::swizzleSetObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:59"]
  S3 -->|calls| T3
  S4["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  T4["method:NSUserDefaults::swizzleSetValue:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:72"]
  S4 -->|calls| T4
  S5["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  T5["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  S5 -->|calls| T5
  S6["method:UIButton::revolution<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:12"]
  T6["method:CABasicAnimation::animationByKeyPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CABasicAnimation/CABasicAnimation+Extra/CABasicAnimation+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIButton::startRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:29"]
  T7["method:UIButton::stopRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:21"]
  S7 -->|calls| T7
  S8["method:UICollectionView::registerCollectionElementKindSectionHeaderClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:62"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["method:UICollectionView::registerCollectionElementKindSectionFooterClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:82"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:UIControl::__uxy_sendAction:to:forEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+XY/UIControl+XY.m:41"]
  T10["method:UIControl::__uxy_sendAction:to:forEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+XY/UIControl+XY.m:41"]
  S10 -->|calls| T10
  S11["method:UIGestureRecognizer::rac_recognizer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIGestureRecognizer/UIGestureRecognizer+RAC/UIGestureRecognizer+ReactiveCocoa/UIGestureRecognizer+ReactiveCocoa.m:12"]
  T11["method:UIGestureRecognizer::rac_initializeRAC<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIGestureRecognizer/UIGestureRecognizer+RAC/UIGestureRecognizer+ReactiveCocoa/UIGestureRecognizer+ReactiveCocoa.m:24"]
  S11 -->|calls| T11
  S12["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T12["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S12 -->|calls| T12
  S13["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T13["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S13 -->|calls| T13
  S14["method:UIImage::imageWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T14["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S14 -->|calls| T14
  S15["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T15["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S15 -->|calls| T15
  S16["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T16["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S16 -->|calls| T16
  S17["method:UIImage::cropSquareImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Tailor/UIImage+Tailor.m:12"]
  T17["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S17 -->|calls| T17
  S18["method:UIImageView::imageViewWithGIFFile:frame:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+GIF/UIImageView+GIF.m:12"]
  T18["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S18 -->|calls| T18
  S19["method:UIImageView::imageViewWithGIFFile:frame:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+GIF/UIImageView+GIF.m:12"]
  T19["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S19 -->|calls| T19
  S20["method:UINavigationController::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+Extra/UINavigationController+Extra.m:12"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UITextField::isValidate:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:13"]
  T21["method:UITextField::shakeAnimationForView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:25"]
  S21 -->|calls| T21
  S22["method:UITextField::isEmptyText<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:19"]
  T22["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S22 -->|calls| T22
  S23["method:UITextField::isEmptyText<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:19"]
  T23["method:UITextField::shakeAnimationForView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:25"]
  S23 -->|calls| T23
  S24["method:UIView::currentController<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIViewController::navCtrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Extra/UIViewController+Extra.m:32"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
