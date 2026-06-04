# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTabBarCtrl::byDataSourceWithButtons:controllers:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:537"]
  T1["method:JobsTabBarCtrl::setDataSourceByButtons:controllers:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:249"]
  S1 -->|calls| T1
  S2["method:LZTabBar::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:19"]
  T2["method:LZTabBar::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:19"]
  S2 -->|calls| T2
  S3["method:LZTabBar::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:25"]
  T3["method:LZTabBar::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:25"]
  S3 -->|calls| T3
  S4["method:LZTabBar::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:25"]
  T4["method:LZTabBar::setupItems<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:32"]
  S4 -->|calls| T4
  S5["method:LZTabBar::setupItems<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:32"]
  T5["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S5 -->|calls| T5
  S6["method:LZTabBar::topLine<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:52"]
  T6["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S6 -->|calls| T6
  S7["method:LZTabBar::effectView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:60"]
  T7["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S7 -->|calls| T7
  S8["method:LZTabBarConfig::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarConfig/LZTabBarConfig.m:12"]
  T8["method:LZTabBarConfig::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarConfig/LZTabBarConfig.m:12"]
  S8 -->|calls| T8
  S9["method:LZTabBarController::initWithBlock:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:31"]
  T9["method:LZTabBar::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:19"]
  S9 -->|calls| T9
  S10["method:LZTabBarController::initWithBlock:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:31"]
  T10["method:LZTabBarController::setupViewControllers<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:93"]
  S10 -->|calls| T10
  S11["method:LZTabBarController::initWithBlock:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:31"]
  T11["method:LZTabBarController::setupTabBar<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:106"]
  S11 -->|calls| T11
  S12["method:LZTabBarController::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:44"]
  T12["method:LZTabBarController::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:44"]
  S12 -->|calls| T12
  S13["method:LZTabBarController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:48"]
  T13["method:LZTabBarController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:48"]
  S13 -->|calls| T13
  S14["method:LZTabBarController::setupViewControllers<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:93"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:LZTabBarController::setupTabBar<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:106"]
  T15["function:jobsMakeLZTabBarItem<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.h:57"]
  S15 -->|calls| T15
  S16["method:LZTabBarController::tabBar:didSelectItem:atIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:152"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:LZTabBarController::tabBar:didSelectItem:atIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:152"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:LZTabBarController::viewWillTransitionToSize:withTransitionCoordinator:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:183"]
  T18["method:LZTabBarController::viewWillTransitionToSize:withTransitionCoordinator:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:183"]
  S18 -->|calls| T18
  S19["method:LZTabBarItem::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.m:21"]
  T19["method:LZTabBarItem::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.m:21"]
  S19 -->|calls| T19
  S20["method:LZTabBarItem::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.m:35"]
  T20["method:LZTabBarItem::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.m:35"]
  S20 -->|calls| T20
  S21["method:UITabBar::didAddSubview:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:20"]
  T21["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S21 -->|calls| T21
  S22["method:UITabBar::didAddSubview:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:20"]
  T22["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S22 -->|calls| T22
  S23["method:UITabBar::didAddSubview:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:20"]
  T23["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S23 -->|calls| T23
  S24["method:UITabBar::tl_setSelectedItem:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:37"]
  T24["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  S24 -->|calls| T24
  S25["method:UITabBar::tl_setSelectedItem:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:37"]
  T25["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
