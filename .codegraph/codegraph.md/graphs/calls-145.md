# `calls 符号关系 - 145`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T2["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S2 -->|calls| T2
  S3["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T3["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S3 -->|calls| T3
  S4["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T4["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S4 -->|calls| T4
  S5["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T5["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S5 -->|calls| T5
  S6["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T6["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S6 -->|calls| T6
  S7["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T7["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S7 -->|calls| T7
  S8["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T8["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S8 -->|calls| T8
  S9["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T9["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorLogoContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:23"]
  T10["method:JobsAppDoorLogoContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:23"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_5::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:33"]
  T11["method:JobsAppDoorLogoContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:23"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_5::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:40"]
  T12["method:JobsAppDoorInputViewBaseStyle_5::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:40"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_5::drawRect:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:44"]
  T13["method:UIView::setBorderWithColor:borderWidth:borderType:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:596"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_5::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:98"]
  T14["method:JobsAppDoorInputViewBaseStyle_5::registerNotification<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:52"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_5::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:98"]
  T15["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:69"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_5::securityModeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:143"]
  T16["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_5::authCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:186"]
  T17["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_5::chooseBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:209"]
  T18["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_5::zyTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:255"]
  T19["variable:BOOL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:425"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_5::zyTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:255"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_5::chooseBtnViewModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:292"]
  T21["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_5::jobsPageViewDataMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:309"]
  T22["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_5::jobsPageViewDataMutArr<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5.m:309"]
  T23["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S23 -->|calls| T23
  S24["method:AuthCodeLab::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:16"]
  T24["method:AuthCodeLab::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:16"]
  S24 -->|calls| T24
  S25["method:AuthCodeLab::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:16"]
  T25["method:AuthCodeLab::requestAuthCode<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
