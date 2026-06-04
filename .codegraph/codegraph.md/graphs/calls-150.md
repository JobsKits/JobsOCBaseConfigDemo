# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTabBarCtrl::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:45"]
  T1["method:JobsTabBarCtrl::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:45"]
  S1 -->|calls| T1
  S2["method:JobsTabBarCtrl::viewDidLayoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:57"]
  T2["method:JobsTabBarCtrl::viewDidLayoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:57"]
  S2 -->|calls| T2
  S3["method:JobsTabBarCtrl::viewDidLayoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:57"]
  T3["method:JobsTabBarCtrl::layoutButtonsByRule<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:126"]
  S3 -->|calls| T3
  S4["method:JobsTabBarCtrl::viewDidLayoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:57"]
  T4["method:JobsTabBarCtrl::onButtonsLayouted<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:522"]
  S4 -->|calls| T4
  S5["method:JobsTabBarCtrl::viewDidLayoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:57"]
  T5["method:JobsTabBarCtrl::syncContentOffsetAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:199"]
  S5 -->|calls| T5
  S6["method:JobsTabBarCtrl::applySelectionStateAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:187"]
  T6["method:JobsTabBarCtrl::syncContentOffsetAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:199"]
  S6 -->|calls| T6
  S7["method:JobsTabBarCtrl::applySelectionStateAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:187"]
  T7["method:JobsTabBarCtrl::scrollTabBarToVisibleIndex:animated:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:209"]
  S7 -->|calls| T7
  S8["method:JobsTabBarCtrl::suppressVerticalInView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:216"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:JobsTabBarCtrl::suppressVerticalInView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:216"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:JobsTabBarCtrl::suppressVerticalInView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:216"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:JobsTabBarCtrl::suppressVerticalInView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:216"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["method:JobsTabBarCtrl::suppressVerticalInView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:216"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:JobsTabBarCtrl::suppressVerticalInView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:216"]
  T13["method:JobsTabBarCtrl::suppressVerticalInView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:216"]
  S13 -->|calls| T13
  S14["method:JobsTabBarCtrl::setDataSourceByButtons:controllers:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:249"]
  T14["method:JobsTabBarCtrl::selectIndex:animated:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:307"]
  S14 -->|calls| T14
  S15["method:JobsTabBarCtrl::setDataSourceByButtons:controllers:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:249"]
  T15["method:UIViewController::addChildViewController<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Extra/UIViewController+Extra.m:23"]
  S15 -->|calls| T15
  S16["method:JobsTabBarCtrl::setDataSourceByButtons:controllers:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:249"]
  T16["method:JobsTabBarCtrl::suppressVerticalInView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:216"]
  S16 -->|calls| T16
  S17["method:JobsTabBarCtrl::setDataSourceByButtons:controllers:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:249"]
  T17["method:JobsTabBarCtrl::applySelectionStateAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:187"]
  S17 -->|calls| T17
  S18["method:JobsTabBarCtrl::setDataSourceByButtons:controllers:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:249"]
  T18["method:JobsTabBarCtrl::onButtonsBuilt<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:513"]
  S18 -->|calls| T18
  S19["method:JobsTabBarCtrl::selectIndex:animated:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:307"]
  T19["method:JobsTabBarCtrl::applySelectionStateAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:187"]
  S19 -->|calls| T19
  S20["method:JobsTabBarCtrl::scrollViewDidEndDecelerating:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:331"]
  T20["method:JobsTabBarCtrl::applySelectionStateAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:187"]
  S20 -->|calls| T20
  S21["method:JobsTabBarCtrl::scrollViewDidEndScrollingAnimation:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:341"]
  T21["method:JobsTabBarCtrl::applySelectionStateAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:187"]
  S21 -->|calls| T21
  S22["method:JobsTabBarCtrl::byDataSourceWithButtons:controllers:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:537"]
  T22["method:JobsTabBarCtrl::setDataSourceByButtons:controllers:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:249"]
  S22 -->|calls| T22
  S23["method:LZTabBar::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:19"]
  T23["method:LZTabBar::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:19"]
  S23 -->|calls| T23
  S24["method:LZTabBar::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:25"]
  T24["method:LZTabBar::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:25"]
  S24 -->|calls| T24
  S25["method:LZTabBar::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:25"]
  T25["method:LZTabBar::setupItems<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/LZTabBarController/LZTabBar/LZTabBar.m:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
