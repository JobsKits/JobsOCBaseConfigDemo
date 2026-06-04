# `calls 符号关系 - 153`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputViewBaseStyle_5::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:33"]
  T1["method:JobsAppDoorLogoContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:23"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputViewBaseStyle_5::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:40"]
  T2["method:JobsAppDoorInputViewBaseStyle_5::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:40"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputViewBaseStyle_5::drawRect:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:44"]
  T3["method:UIView::setBorderWithColor:borderWidth:borderType:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:596"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputViewBaseStyle_5::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:98"]
  T4["method:JobsAppDoorInputViewBaseStyle_5::registerNotification<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:52"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputViewBaseStyle_5::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:98"]
  T5["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:69"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_5::securityModeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:143"]
  T6["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_5::authCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:186"]
  T7["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_5::chooseBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:209"]
  T8["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_5::zyTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:255"]
  T9["variable:BOOL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:425"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_5::zyTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:255"]
  T10["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_5::chooseBtnViewModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:292"]
  T11["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_5::jobsPageViewDataMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:309"]
  T12["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_5::jobsPageViewDataMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:309"]
  T13["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S13 -->|calls| T13
  S14["method:AuthCodeLab::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:16"]
  T14["method:AuthCodeLab::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:16"]
  S14 -->|calls| T14
  S15["method:AuthCodeLab::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:16"]
  T15["method:AuthCodeLab::requestAuthCode<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:28"]
  S15 -->|calls| T15
  S16["method:AuthCodeLab::touchesBegan:withEvent:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:23"]
  T16["method:AuthCodeLab::requestAuthCode<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:28"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_6::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:26"]
  T17["method:JobsAppDoorInputViewBaseStyle_6::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:26"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_6::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:36"]
  T18["method:JobsAppDoorInputViewBaseStyle_6::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:26"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_6::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:46"]
  T19["method:JobsAppDoorInputViewBaseStyle_6::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:46"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_6::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:59"]
  T20["method:UIImageView::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_6::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:99"]
  T21["method:JobsAppDoorInputViewBaseStyle_6::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:59"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_6::magicTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:140"]
  T22["method:JobsAppDoorInputViewBaseStyle_6::block:value:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/JobsAppDoorInputViewBaseStyle_6.m:81"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_7::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_7/JobsAppDoorInputViewBaseStyle_7.m:32"]
  T23["method:JobsAppDoorInputViewBaseStyle_7::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_7/JobsAppDoorInputViewBaseStyle_7.m:32"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_7::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_7/JobsAppDoorInputViewBaseStyle_7.m:42"]
  T24["method:JobsAppDoorInputViewBaseStyle_7::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_7/JobsAppDoorInputViewBaseStyle_7.m:32"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_7::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_7/JobsAppDoorInputViewBaseStyle_7.m:52"]
  T25["method:JobsAppDoorInputViewBaseStyle_7::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_7/JobsAppDoorInputViewBaseStyle_7.m:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
