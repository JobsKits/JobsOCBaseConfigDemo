# `calls 符号关系 - 091`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::scrollViewDidScroll:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JXCategory/UIViewController+JXPagerViewListViewDelegate/UIViewController+JXPagerViewListViewDelegate.m:12"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIViewController::scrollViewDidScroll:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JXCategory/UIViewController+JXPagerViewListViewDelegate/UIViewController+JXPagerViewListViewDelegate.m:12"]
  T2["method:UIViewController::scrollCallback<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JXCategory/UIViewController+JXPagerViewListViewDelegate/UIViewController+JXPagerViewListViewDelegate.m:85"]
  S2 -->|calls| T2
  S3["method:UIViewController::addLottieImage:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Lottie/UIViewController+Lottie.m:13"]
  T3["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S3 -->|calls| T3
  S4["method:UIViewController::lottieImagePlay<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Lottie/UIViewController+Lottie.m:25"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIViewController::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+MJRefresh/UIViewController+MJRefresh.m:31"]
  T5["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIViewController::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+MJRefresh/UIViewController+MJRefresh.m:31"]
  T6["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIViewController::on<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:32"]
  T7["method:UIViewController::containBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:12"]
  S7 -->|calls| T7
  S8["method:UIViewController::upgrade<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:45"]
  T8["method:UIViewController::containBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:12"]
  S8 -->|calls| T8
  S9["method:UIViewController::remake<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:59"]
  T9["method:UIViewController::containBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:12"]
  S9 -->|calls| T9
  S10["method:UIViewController::uninstall<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:98"]
  T10["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S10 -->|calls| T10
  S11["method:UIViewController::uninstallAllLayoutAttribute<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:110"]
  T11["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S11 -->|calls| T11
  S12["method:UIViewController::jobsMasonryBeforeBlock:masonryAfterBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:124"]
  T12["method:UIViewController::uninstallAllLayoutAttribute<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:110"]
  S12 -->|calls| T12
  S13["method:UIViewController::swiz_dismissViewControllerAnimated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:44"]
  T13["method:UIViewController::swiz_dismissViewControllerAnimated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:44"]
  S13 -->|calls| T13
  S14["method:UIViewController::swiz_presentViewController:animated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:50"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIViewController::swiz_presentViewController:animated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:50"]
  T15["method:UIViewController::swiz_presentViewController:animated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:50"]
  S15 -->|calls| T15
  S16["method:UIViewController::checkPresented:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:85"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:XLBubbleTransition::showBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:40"]
  T17["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S17 -->|calls| T17
  S18["method:XLBubbleTransition::showBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:40"]
  T18["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S18 -->|calls| T18
  S19["method:XLBubbleTransition::showBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:40"]
  T19["method:XLBubbleTransition::radiusOfBubbleInView:startPoint:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:158"]
  S19 -->|calls| T19
  S20["method:XLBubbleTransition::hideBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:100"]
  T20["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S20 -->|calls| T20
  S21["method:XLBubbleTransition::hideBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:100"]
  T21["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S21 -->|calls| T21
  S22["method:XLBubbleTransition::hideBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:100"]
  T22["method:XLBubbleTransition::radiusOfBubbleInView:startPoint:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:158"]
  S22 -->|calls| T22
  S23["method:UIViewController::navCtrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Extra/UIViewController+Extra.m:32"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIViewController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:12"]
  T24["method:UIViewController::exchangeMethod<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:34"]
  S24 -->|calls| T24
  S25["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T25["method:NSPointerArray::pointerByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
