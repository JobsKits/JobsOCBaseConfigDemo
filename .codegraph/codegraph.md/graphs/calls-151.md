# `calls 符号关系 - 151`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:LZTabBar::setupItems<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:32"]
  T1["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S1 -->|calls| T1
  S2["method:LZTabBar::topLine<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:52"]
  T2["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S2 -->|calls| T2
  S3["method:LZTabBar::effectView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:60"]
  T3["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S3 -->|calls| T3
  S4["method:LZTabBarConfig::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarConfig/LZTabBarConfig.m:12"]
  T4["method:LZTabBarConfig::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarConfig/LZTabBarConfig.m:12"]
  S4 -->|calls| T4
  S5["method:LZTabBarController::initWithBlock:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:31"]
  T5["method:LZTabBar::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:19"]
  S5 -->|calls| T5
  S6["method:LZTabBarController::initWithBlock:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:31"]
  T6["method:LZTabBarController::setupViewControllers<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:93"]
  S6 -->|calls| T6
  S7["method:LZTabBarController::initWithBlock:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:31"]
  T7["method:LZTabBarController::setupTabBar<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:106"]
  S7 -->|calls| T7
  S8["method:LZTabBarController::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:44"]
  T8["method:LZTabBarController::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:44"]
  S8 -->|calls| T8
  S9["method:LZTabBarController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:48"]
  T9["method:LZTabBarController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:48"]
  S9 -->|calls| T9
  S10["method:LZTabBarController::setupViewControllers<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:93"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:LZTabBarController::setupTabBar<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:106"]
  T11["function:jobsMakeLZTabBarItem<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.h:57"]
  S11 -->|calls| T11
  S12["method:LZTabBarController::tabBar:didSelectItem:atIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:152"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:LZTabBarController::tabBar:didSelectItem:atIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:152"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:LZTabBarController::viewWillTransitionToSize:withTransitionCoordinator:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:183"]
  T14["method:LZTabBarController::viewWillTransitionToSize:withTransitionCoordinator:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarController/LZTabBarController.m:183"]
  S14 -->|calls| T14
  S15["method:LZTabBarItem::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.m:21"]
  T15["method:LZTabBarItem::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.m:21"]
  S15 -->|calls| T15
  S16["method:LZTabBarItem::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.m:35"]
  T16["method:LZTabBarItem::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBarItem/LZTabBarItem.m:35"]
  S16 -->|calls| T16
  S17["method:UITabBar::didAddSubview:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:20"]
  T17["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S17 -->|calls| T17
  S18["method:UITabBar::didAddSubview:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:20"]
  T18["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S18 -->|calls| T18
  S19["method:UITabBar::didAddSubview:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:20"]
  T19["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S19 -->|calls| T19
  S20["method:UITabBar::tl_setSelectedItem:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:37"]
  T20["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  S20 -->|calls| T20
  S21["method:UITabBar::tl_setSelectedItem:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:37"]
  T21["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  S21 -->|calls| T21
  S22["method:UITabBar::tl_setSelectedItem:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:37"]
  T22["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  S22 -->|calls| T22
  S23["method:UITabBar::tl_setSelectedItem:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:37"]
  T23["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  S23 -->|calls| T23
  S24["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  T24["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S24 -->|calls| T24
  S25["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
