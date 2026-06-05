# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:AuthCodeLab::touchesBegan:withEvent:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:23"]
  T1["method:AuthCodeLab::requestAuthCode<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:28"]
  S1 -->|calls| T1
  S2["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  T2["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  S2 -->|calls| T2
  S3["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  T3["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  S3 -->|calls| T3
  S4["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  T4["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S4 -->|calls| T4
  S5["method:JobsRightMenuView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:51"]
  T5["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  S5 -->|calls| T5
  S6["method:JobsRightMenuView::resetUI<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:77"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:JobsRightMenuView::stackImageView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:113"]
  T7["method:UIImageView::byImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:18"]
  S7 -->|calls| T7
  S8["method:JobsRightMenuView::stackView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:128"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:JobsRightMenuView::stackView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:128"]
  T9["method:UIStackView::add<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIStackView/UIStackView+Extra/UIStackView+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:JobsScale::scaleX<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:77"]
  T10["method:JobsScale::screenWidth<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:28"]
  S10 -->|calls| T10
  S11["method:JobsScale::scaleY<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:82"]
  T11["method:JobsScale::screenHeight<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:53"]
  S11 -->|calls| T11
  S12["function:JXScaleSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:93"]
  T12["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S12 -->|calls| T12
  S13["function:JXScaleSetupUsingSafeArea<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:103"]
  T13["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S13 -->|calls| T13
  S14["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  T14["function:JXScaleSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:93"]
  S14 -->|calls| T14
  S15["function:w<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:124"]
  T15["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S15 -->|calls| T15
  S16["function:h<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:129"]
  T16["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S16 -->|calls| T16
  S17["function:fz<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:134"]
  T17["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S17 -->|calls| T17
  S18["function:JXScaleX<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:140"]
  T18["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S18 -->|calls| T18
  S19["function:JXScaleY<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:145"]
  T19["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S19 -->|calls| T19
  S20["method:JobsUserHeaderDataViewTBVCell::cellStyleValue1WithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:29"]
  T20["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S20 -->|calls| T20
  S21["method:JobsUserHeaderDataViewTBVCell::cellStyleValue2WithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:38"]
  T21["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S21 -->|calls| T21
  S22["method:JobsUserHeaderDataViewTBVCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:47"]
  T22["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S22 -->|calls| T22
  S23["method:JobsUserHeaderDataViewTBVCell::titleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:76"]
  T23["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S23 -->|calls| T23
  S24["method:JobsWelcomeVC::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:25"]
  T24["method:JobsWelcomeVC::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:25"]
  S24 -->|calls| T24
  S25["method:JobsWelcomeVC::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:25"]
  T25["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
