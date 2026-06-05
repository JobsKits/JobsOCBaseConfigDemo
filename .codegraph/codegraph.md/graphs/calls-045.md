# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T1["function:JobsApplyJPImageresizerBlurAppearance<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:10"]
  S1 -->|calls| T1
  S2["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T2["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S2 -->|calls| T2
  S3["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T3["method:UIViewController::fixErrorBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:318"]
  S3 -->|calls| T3
  S4["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T4["method:UIViewController::fixStartBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:328"]
  S4 -->|calls| T4
  S5["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T5["method:UIViewController::fixProgressBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:338"]
  S5 -->|calls| T5
  S6["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T6["method:UIViewController::fixCompleteBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:348"]
  S6 -->|calls| T6
  S7["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T7["function:JobsApplyJPImageresizerBlurAppearance<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:10"]
  S7 -->|calls| T7
  S8["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T8["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S8 -->|calls| T8
  S9["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T9["method:UIViewController::fixErrorBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:318"]
  S9 -->|calls| T9
  S10["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T10["method:UIViewController::fixStartBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:328"]
  S10 -->|calls| T10
  S11["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T11["method:UIViewController::fixProgressBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:338"]
  S11 -->|calls| T11
  S12["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T12["method:UIViewController::fixCompleteBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:348"]
  S12 -->|calls| T12
  S13["method:UIViewController::scrollViewDidScroll:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JXCategory/UIViewController+JXPagerViewListViewDelegate/UIViewController+JXPagerViewListViewDelegate.m:12"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIViewController::scrollViewDidScroll:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JXCategory/UIViewController+JXPagerViewListViewDelegate/UIViewController+JXPagerViewListViewDelegate.m:12"]
  T14["method:UIViewController::scrollCallback<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JXCategory/UIViewController+JXPagerViewListViewDelegate/UIViewController+JXPagerViewListViewDelegate.m:85"]
  S14 -->|calls| T14
  S15["method:UIViewController::addLottieImage:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Lottie/UIViewController+Lottie.m:13"]
  T15["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S15 -->|calls| T15
  S16["method:UIViewController::lottieImagePlay<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Lottie/UIViewController+Lottie.m:25"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:UIViewController::on<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:32"]
  T17["method:UIViewController::containBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:12"]
  S17 -->|calls| T17
  S18["method:UIViewController::upgrade<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:45"]
  T18["method:UIViewController::containBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:12"]
  S18 -->|calls| T18
  S19["method:UIViewController::remake<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:59"]
  T19["method:UIViewController::containBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:12"]
  S19 -->|calls| T19
  S20["method:UIViewController::uninstall<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:98"]
  T20["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S20 -->|calls| T20
  S21["method:UIViewController::uninstallAllLayoutAttribute<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:110"]
  T21["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S21 -->|calls| T21
  S22["method:UIViewController::jobsMasonryBeforeBlock:masonryAfterBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:124"]
  T22["method:UIViewController::uninstallAllLayoutAttribute<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+Masonry/UIViewController+Masonry.m:110"]
  S22 -->|calls| T22
  S23["method:UIViewController::swiz_dismissViewControllerAnimated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:44"]
  T23["method:UIViewController::swiz_dismissViewControllerAnimated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:44"]
  S23 -->|calls| T23
  S24["method:UIViewController::swiz_presentViewController:animated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:50"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIViewController::swiz_presentViewController:animated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:50"]
  T25["method:UIViewController::swiz_presentViewController:animated:completion:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+SafeTransition/UIViewController+SafeTransition.m:50"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
