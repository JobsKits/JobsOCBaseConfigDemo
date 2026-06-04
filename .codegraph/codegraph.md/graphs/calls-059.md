# `calls 符号关系 - 059`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T1["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S1 -->|calls| T1
  S2["method:UIImageView::imageViewWithGIFFile:frame:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+GIF/UIImageView+GIF.m:12"]
  T2["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S2 -->|calls| T2
  S3["method:UIImageView::imageViewWithGIFFile:frame:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+GIF/UIImageView+GIF.m:12"]
  T3["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S3 -->|calls| T3
  S4["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T4["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T5["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T6["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T7["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T8["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UILabel::makeLabelGesture<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UILabel/UILabel+Gesture/UILabel+Gesture.m:12"]
  T9["method:UILabel::clickLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UILabel/UILabel+Gesture/UILabel+Gesture.m:38"]
  S9 -->|calls| T9
  S10["method:UILabel::stopScrolling<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UILabel/UILabel+Scroll/UILabel+Scroll.m:42"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UILabel::startScrollingIfNeededWithInterval<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UILabel/UILabel+Scroll/UILabel+Scroll.m:58"]
  T11["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S11 -->|calls| T11
  S12["method:UINavigationController::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+Extra/UINavigationController+Extra.m:12"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:UINavigationController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:16"]
  T13["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S13 -->|calls| T13
  S14["method:UINavigationController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:16"]
  T14["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S14 -->|calls| T14
  S15["method:UINavigationController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:16"]
  T15["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S15 -->|calls| T15
  S16["method:UINavigationController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:16"]
  T16["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S16 -->|calls| T16
  S17["method:UINavigationController::safePopToViewController:animated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:60"]
  T17["method:UINavigationController::safePopToViewController:animated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:60"]
  S17 -->|calls| T17
  S18["method:UINavigationController::safePushViewController:animated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:78"]
  T18["method:UINavigationController::safePushViewController:animated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:78"]
  S18 -->|calls| T18
  S19["method:UINavigationController::ty_popToRootViewControllerBySetControllersAnimated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:88"]
  T19["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  S19 -->|calls| T19
  S20["method:UIViewController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:99"]
  T20["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S20 -->|calls| T20
  S21["method:UIScrollView::alphaAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:78"]
  T21["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S21 -->|calls| T21
  S22["method:UIScrollView::alphaAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:78"]
  T22["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S22 -->|calls| T22
  S23["method:UIScrollView::shakeAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:136"]
  T23["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S23 -->|calls| T23
  S24["method:UIScrollView::shakeAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:136"]
  T24["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S24 -->|calls| T24
  S25["method:UIScrollView::layDownAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:277"]
  T25["method:NSValue::byRect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
