# `calls 符号关系 - 105`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:XLSphereView::inertiaStep<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:119"]
  T1["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  S1 -->|calls| T1
  S2["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T2["method:XLSphereView::timerStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:96"]
  S2 -->|calls| T2
  S3["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T3["method:XLSphereView::inertiaStop<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:113"]
  S3 -->|calls| T3
  S4["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T4["method:XLSphereView::updateFrameOfPoint:direction:andAngle:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:68"]
  S4 -->|calls| T4
  S5["method:XLSphereView::handlePanGesture:<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:131"]
  T5["method:XLSphereView::inertiaStart<br/>JobsByPods/JobsOCTools@Pods/Core/XLSphereView/XLSphereView.m:107"]
  S5 -->|calls| T5
  S6["method:XWCountryCodeController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:26"]
  T6["method:XWCountryCodeController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:26"]
  S6 -->|calls| T6
  S7["method:XWCountryCodeController::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:26"]
  T7["method:XWCountryCodeController::creatSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:34"]
  S7 -->|calls| T7
  S8["method:XWCountryCodeController::creatSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:34"]
  T8["method:TestTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Base/View/TestTableView.m:21"]
  S8 -->|calls| T8
  S9["method:XWCountryCodeController::selectCodeIndex:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:82"]
  T9["method:XWCountryCodeController::showCodeStringIndex:jieQue:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:59"]
  S9 -->|calls| T9
  S10["method:XWCountryCodeController::updateSearchResultsForSearchController:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:104"]
  T10["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S10 -->|calls| T10
  S11["method:XWCountryCodeController::updateSearchResultsForSearchController:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:104"]
  T11["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S11 -->|calls| T11
  S12["method:XWCountryCodeController::tableView:cellForRowAtIndexPath:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:142"]
  T12["method:XWCountryCodeController::showCodeStringIndex:jieQue:<br/>JobsByPods/JobsOCTools@Pods/Core/XWCountryCodeController/XWCountryCodeController.m:59"]
  S12 -->|calls| T12
  S13["method:XXTools::addMarkLabelWithText:maxWidth:superView:cornerRadius:<br/>JobsByPods/JobsOCTools@Pods/Core/XXTools/XXTools.m:24"]
  T13["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S13 -->|calls| T13
  S14["method:XXTools::addMarkLabelWithText:maxWidth:superView:cornerRadius:<br/>JobsByPods/JobsOCTools@Pods/Core/XXTools/XXTools.m:24"]
  T14["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S14 -->|calls| T14
  S15["method:ImageCodeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:23"]
  T15["method:ImageCodeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:23"]
  S15 -->|calls| T15
  S16["method:ImageCodeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:23"]
  T16["method:ImageCodeView::setupUI<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:34"]
  S16 -->|calls| T16
  S17["method:ImageCodeView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:29"]
  T17["method:ImageCodeView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:29"]
  S17 -->|calls| T17
  S18["method:ImageCodeView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:29"]
  T18["method:ImageCodeView::setupUI<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:34"]
  S18 -->|calls| T18
  S19["method:ImageCodeView::setCodeStr:<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:93"]
  T19["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S19 -->|calls| T19
  S20["method:ImageCodeView::font<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:135"]
  T20["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S20 -->|calls| T20
  S21["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollViewVC/JobsScrollViewVC.m:19"]
  T21["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollViewVC/JobsScrollViewVC.m:19"]
  S21 -->|calls| T21
  S22["function:scrollYView<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollViewVC/JobsScrollViewVC.m:38"]
  T22["method:JobsScrollYView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:80"]
  S22 -->|calls| T22
  S23["function:scrollYView<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollViewVC/JobsScrollViewVC.m:38"]
  T23["method:JobsScrollYView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:72"]
  S23 -->|calls| T23
  S24["method:JobsScrollYView::init<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:32"]
  T24["method:JobsScrollYView::init<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:32"]
  S24 -->|calls| T24
  S25["method:JobsScrollYView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:54"]
  T25["method:JobsScrollYView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:54"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
