# `calls 符号关系 - 163`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:XLChannelItem::initUI<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:25"]
  T1["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S1 -->|calls| T1
  S2["method:XLChannelItem::initUI<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:25"]
  T2["method:XLChannelItem::addBorderLayer<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:41"]
  S2 -->|calls| T2
  S3["method:XLChannelItem::addBorderLayer<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:41"]
  T3["method:XLChannelItem::backgroundColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:62"]
  S3 -->|calls| T3
  S4["method:XLChannelItem::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:57"]
  T4["method:XLChannelItem::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:57"]
  S4 -->|calls| T4
  S5["method:XLChannelItem::setIsMoving:<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:79"]
  T5["method:XLChannelItem::backgroundColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:62"]
  S5 -->|calls| T5
  S6["method:XLChannelItem::setIsFixed:<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:90"]
  T6["method:XLChannelItem::lightTextColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:70"]
  S6 -->|calls| T6
  S7["method:XLChannelItem::setIsFixed:<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:90"]
  T7["method:XLChannelItem::textColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:66"]
  S7 -->|calls| T7
  S8["method:XLSphereView::init<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:24"]
  T8["method:XLSphereView::init<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:24"]
  S8 -->|calls| T8
  S9["method:XLSphereView::init<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:24"]
  T9["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S9 -->|calls| T9
  S10["method:XLSphereView::setItems:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:34"]
  T10["method:XLSphereView::setTagOfPoint:andIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:80"]
  S10 -->|calls| T10
  S11["method:XLSphereView::setItems:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:34"]
  T11["method:XLSphereView::timerStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:91"]
  S11 -->|calls| T11
  S12["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  T12["method:XLSphereView::setTagOfPoint:andIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:80"]
  S12 -->|calls| T12
  S13["method:XLSphereView::autoTurnRotation<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:101"]
  T13["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  S13 -->|calls| T13
  S14["method:XLSphereView::inertiaStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:107"]
  T14["method:XLSphereView::timerStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:96"]
  S14 -->|calls| T14
  S15["method:XLSphereView::inertiaStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:113"]
  T15["method:XLSphereView::timerStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:91"]
  S15 -->|calls| T15
  S16["method:XLSphereView::inertiaStep<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:119"]
  T16["method:XLSphereView::inertiaStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:113"]
  S16 -->|calls| T16
  S17["method:XLSphereView::inertiaStep<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:119"]
  T17["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  S17 -->|calls| T17
  S18["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T18["method:XLSphereView::timerStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:96"]
  S18 -->|calls| T18
  S19["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T19["method:XLSphereView::inertiaStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:113"]
  S19 -->|calls| T19
  S20["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T20["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  S20 -->|calls| T20
  S21["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T21["method:XLSphereView::inertiaStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:107"]
  S21 -->|calls| T21
  S22["method:XWCountryCodeController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:26"]
  T22["method:XWCountryCodeController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:26"]
  S22 -->|calls| T22
  S23["method:XWCountryCodeController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:26"]
  T23["method:XWCountryCodeController::creatSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:34"]
  S23 -->|calls| T23
  S24["method:XWCountryCodeController::creatSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:34"]
  T24["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S24 -->|calls| T24
  S25["method:XWCountryCodeController::selectCodeIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:82"]
  T25["method:XWCountryCodeController::showCodeStringIndex:jieQue:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
