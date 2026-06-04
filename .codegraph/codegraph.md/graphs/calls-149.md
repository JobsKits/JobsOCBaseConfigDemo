# `calls 符号关系 - 149`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:RYCuteView::initWithFrame:<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:44"]
  T1["method:RYCuteView::commonInit<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:56"]
  S1 -->|calls| T1
  S2["method:RYCuteView::initWithCoder:<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:50"]
  T2["method:RYCuteView::commonInit<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:56"]
  S2 -->|calls| T2
  S3["method:RYCuteView::commonInit<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:56"]
  T3["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S3 -->|calls| T3
  S4["method:RYCuteView::commonInit<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:56"]
  T4["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S4 -->|calls| T4
  S5["method:RYCuteView::commonInit<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:56"]
  T5["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S5 -->|calls| T5
  S6["method:RYCuteView::commonInit<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:56"]
  T6["method:RYCuteView::configAction<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:95"]
  S6 -->|calls| T6
  S7["method:RYCuteView::shapeLayer<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:157"]
  T7["method:UIColor::colorWithHexString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:111"]
  S7 -->|calls| T7
  S8["method:RYCuteView::curveView<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:169"]
  T8["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S8 -->|calls| T8
  S9["method:RYCuteView::displayTimer<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:182"]
  T9["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S9 -->|calls| T9
  S10["method:SlideToUnlockView::init<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:26"]
  T10["method:SlideToUnlockView::init<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:26"]
  S10 -->|calls| T10
  S11["method:SlideToUnlockView::init<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:26"]
  T11["method:SlideToUnlockView::commonInit<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:32"]
  S11 -->|calls| T11
  S12["method:SlideToUnlockView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:44"]
  T12["method:SlideToUnlockView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:44"]
  S12 -->|calls| T12
  S13["method:SlideToUnlockView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:44"]
  T13["method:SlideToUnlockView::byUpdateLayoutForProgress<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:67"]
  S13 -->|calls| T13
  S14["method:SlideToUnlockView::setProgress:<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:50"]
  T14["method:SlideToUnlockView::byUpdateLayoutForProgress<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:67"]
  S14 -->|calls| T14
  S15["method:SlideToUnlockView::byResetAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:85"]
  T15["method:SlideToUnlockView::byUpdateLayoutForProgress<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:67"]
  S15 -->|calls| T15
  S16["method:SlideToUnlockView::trackView<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:94"]
  T16["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S16 -->|calls| T16
  S17["method:SlideToUnlockView::titleLabel<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:110"]
  T17["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S17 -->|calls| T17
  S18["method:SlideToUnlockView::thumbView<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:127"]
  T18["method:UIView::addGesture<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:140"]
  S18 -->|calls| T18
  S19["method:SlideToUnlockView::thumbView<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:127"]
  T19["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S19 -->|calls| T19
  S20["method:SlideToUnlockView::thumbView<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:127"]
  T20["method:SlideToUnlockView::byUpdateLayoutForProgress<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:67"]
  S20 -->|calls| T20
  S21["method:SlideToUnlockView::thumbView<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:127"]
  T21["method:SlideToUnlockView::byResetAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:85"]
  S21 -->|calls| T21
  S22["method:SlideToUnlockView::thumbView<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:127"]
  T22["method:SlideToUnlockView::byResetAnimated<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:85"]
  S22 -->|calls| T22
  S23["method:SlideToUnlockView::thumbView<br/>JobsByPods/JobsOCTools@Pods/Core/SlideToUnlockView/SlideToUnlockView.m:127"]
  T23["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S23 -->|calls| T23
  S24["method:JobsCustomTabBarConfig::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsCustomTabBarCtr/JobsCustomTabBarConfig/JobsCustomTabBarConfig.m:46"]
  T24["method:JobsCustomTabBarConfig::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsCustomTabBarCtr/JobsCustomTabBarConfig/JobsCustomTabBarConfig.m:46"]
  S24 -->|calls| T24
  S25["method:JobsTabBarCtrl::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:23"]
  T25["method:JobsTabBarCtrl::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/JobsTabBarCtrl/JobsTabBarCtrl.m:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
