# `calls 符号关系 - 146`

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
  S2["function:initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:23"]
  T2["method:JobsAppDoorLogoContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:23"]
  S2 -->|calls| T2
  S3["function:layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:36"]
  T3["function:layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:36"]
  S3 -->|calls| T3
  S4["function:configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:43"]
  T4["method:UIImageView::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:12"]
  S4 -->|calls| T4
  S5["function:jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:87"]
  T5["function:configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:43"]
  S5 -->|calls| T5
  S6["function:countDownBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:106"]
  T6["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S6 -->|calls| T6
  S7["function:zyTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:132"]
  T7["variable:BOOL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:425"]
  S7 -->|calls| T7
  S8["function:zyTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:132"]
  T8["function:block:value:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_9/JobsAppDoorInputViewBaseStyle_9.m:63"]
  S8 -->|calls| T8
  S9["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  T9["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  S9 -->|calls| T9
  S10["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  T10["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  S10 -->|calls| T10
  S11["method:JobsRightMenuView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:44"]
  T11["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S11 -->|calls| T11
  S12["method:JobsRightMenuView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:51"]
  T12["method:JobsRightMenuView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:26"]
  S12 -->|calls| T12
  S13["method:JobsRightMenuView::resetUI<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:77"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:JobsRightMenuView::stackImageView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:113"]
  T14["method:UIImageView::byImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:18"]
  S14 -->|calls| T14
  S15["method:JobsRightMenuView::stackView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:128"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:JobsRightMenuView::stackView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsRightMenuView/JobsRightMenuView.m:128"]
  T16["method:UIStackView::add<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIStackView/UIStackView+Extra/UIStackView+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:JobsScale::scaleX<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:77"]
  T17["method:JobsScale::screenWidth<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:28"]
  S17 -->|calls| T17
  S18["method:JobsScale::scaleY<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:82"]
  T18["method:JobsScale::screenHeight<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:53"]
  S18 -->|calls| T18
  S19["function:JXScaleSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:93"]
  T19["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S19 -->|calls| T19
  S20["function:JXScaleSetupUsingSafeArea<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:103"]
  T20["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S20 -->|calls| T20
  S21["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  T21["function:JXScaleSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:93"]
  S21 -->|calls| T21
  S22["function:w<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:124"]
  T22["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S22 -->|calls| T22
  S23["function:h<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:129"]
  T23["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S23 -->|calls| T23
  S24["function:fz<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:134"]
  T24["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S24 -->|calls| T24
  S25["function:JXScaleX<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:140"]
  T25["function:_ensureSetup<br/>JobsByPods/JobsOCTools@Pods/Core/JobsScale/JobsScale.m:114"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
