# `calls 符号关系 - 037`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImageView::imageViewWithGIFFile:frame:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+GIF/UIImageView+GIF.m:12"]
  T1["method:ASImageNode::startAnimating<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode+AnimatedImage.mm:213"]
  S1 -->|calls| T1
  S2["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T2["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T3["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T4["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T5["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T6["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UILabel::makeLabelGesture<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UILabel/UILabel+Gesture/UILabel+Gesture.m:12"]
  T7["method:UILabel::clickLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UILabel/UILabel+Gesture/UILabel+Gesture.m:38"]
  S7 -->|calls| T7
  S8["method:UINavigationController::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+Extra/UINavigationController+Extra.m:12"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UINavigationController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:16"]
  T9["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S9 -->|calls| T9
  S10["method:UINavigationController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:16"]
  T10["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S10 -->|calls| T10
  S11["method:UINavigationController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:16"]
  T11["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S11 -->|calls| T11
  S12["method:UINavigationController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:16"]
  T12["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S12 -->|calls| T12
  S13["method:UINavigationController::safePopToViewController:animated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:60"]
  T13["method:UINavigationController::safePopToViewController:animated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:60"]
  S13 -->|calls| T13
  S14["method:UINavigationController::safePushViewController:animated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:78"]
  T14["method:UINavigationController::safePushViewController:animated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:78"]
  S14 -->|calls| T14
  S15["method:UINavigationController::ty_popToRootViewControllerBySetControllersAnimated:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:88"]
  T15["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  S15 -->|calls| T15
  S16["method:UIViewController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+SafeTransition/UINavigationController+SafeTransition.m:99"]
  T16["function:TYFFSwizzleMethod<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:42"]
  S16 -->|calls| T16
  S17["method:UIScrollView::alphaAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:78"]
  T17["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S17 -->|calls| T17
  S18["method:UIScrollView::alphaAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:78"]
  T18["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S18 -->|calls| T18
  S19["method:UIScrollView::shakeAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:136"]
  T19["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S19 -->|calls| T19
  S20["method:UIScrollView::shakeAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:136"]
  T20["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S20 -->|calls| T20
  S21["method:UIScrollView::layDownAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:277"]
  T21["method:NSValue::byRect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:36"]
  S21 -->|calls| T21
  S22["method:UIScrollView::roteAnimWithSortingType:animationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:317"]
  T22["method:UIScrollView::sortingType:cells:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+AnimationKit/UIScrollView+AnimationKit.m:12"]
  S22 -->|calls| T22
  S23["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIScrollView::reloadDatas<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIScrollView/UIScrollView+UIScrollViewProtocol/UIScrollView+UIScrollViewProtocol.m:24"]
  T25["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
