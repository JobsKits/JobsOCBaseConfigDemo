# `calls 符号关系 - 154`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:XLChannelItem::setIsMoving:<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:79"]
  T1["method:XLChannelItem::backgroundColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:62"]
  S1 -->|calls| T1
  S2["method:XLChannelItem::setIsFixed:<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:90"]
  T2["method:XLChannelItem::lightTextColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:70"]
  S2 -->|calls| T2
  S3["method:XLChannelItem::setIsFixed:<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:90"]
  T3["method:XLChannelItem::textColor<br/>JobsByPods/JobsOCTools@Pods/Core/XLChannelControls/XLChannelItem/XLChannelItem.m:66"]
  S3 -->|calls| T3
  S4["method:XLSphereView::init<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:24"]
  T4["method:XLSphereView::init<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:24"]
  S4 -->|calls| T4
  S5["method:XLSphereView::init<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:24"]
  T5["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S5 -->|calls| T5
  S6["method:XLSphereView::setItems:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:34"]
  T6["method:XLSphereView::setTagOfPoint:andIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:80"]
  S6 -->|calls| T6
  S7["method:XLSphereView::setItems:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:34"]
  T7["method:XLSphereView::timerStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:91"]
  S7 -->|calls| T7
  S8["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  T8["method:XLSphereView::setTagOfPoint:andIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:80"]
  S8 -->|calls| T8
  S9["method:XLSphereView::autoTurnRotation<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:101"]
  T9["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  S9 -->|calls| T9
  S10["method:XLSphereView::inertiaStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:107"]
  T10["method:XLSphereView::timerStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:96"]
  S10 -->|calls| T10
  S11["method:XLSphereView::inertiaStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:113"]
  T11["method:XLSphereView::timerStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:91"]
  S11 -->|calls| T11
  S12["method:XLSphereView::inertiaStep<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:119"]
  T12["method:XLSphereView::inertiaStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:113"]
  S12 -->|calls| T12
  S13["method:XLSphereView::inertiaStep<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:119"]
  T13["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  S13 -->|calls| T13
  S14["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T14["method:XLSphereView::timerStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:96"]
  S14 -->|calls| T14
  S15["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T15["method:XLSphereView::inertiaStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:113"]
  S15 -->|calls| T15
  S16["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T16["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  S16 -->|calls| T16
  S17["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T17["method:XLSphereView::inertiaStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:107"]
  S17 -->|calls| T17
  S18["method:XWCountryCodeController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:26"]
  T18["method:XWCountryCodeController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:26"]
  S18 -->|calls| T18
  S19["method:XWCountryCodeController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:26"]
  T19["method:XWCountryCodeController::creatSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:34"]
  S19 -->|calls| T19
  S20["method:XWCountryCodeController::creatSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:34"]
  T20["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S20 -->|calls| T20
  S21["method:XWCountryCodeController::selectCodeIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:82"]
  T21["method:XWCountryCodeController::showCodeStringIndex:jieQue:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:59"]
  S21 -->|calls| T21
  S22["method:XWCountryCodeController::updateSearchResultsForSearchController:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:104"]
  T22["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S22 -->|calls| T22
  S23["method:XWCountryCodeController::updateSearchResultsForSearchController:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:104"]
  T23["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S23 -->|calls| T23
  S24["method:XWCountryCodeController::tableView:cellForRowAtIndexPath:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:142"]
  T24["method:XWCountryCodeController::showCodeStringIndex:jieQue:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:59"]
  S24 -->|calls| T24
  S25["method:XXTools::addMarkLabelWithText:maxWidth:superView:cornerRadius:<br/>JobsByPods/JobsOCTools@Pods/Core/XXTools/XXTools.m:24"]
  T25["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
