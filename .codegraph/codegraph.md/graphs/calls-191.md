# `calls 符号关系 - 191`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T2["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S2 -->|calls| T2
  S3["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T3["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S3 -->|calls| T3
  S4["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T4["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S4 -->|calls| T4
  S5["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T5["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorLogoContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:23"]
  T6["method:JobsAppDoorLogoContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:23"]
  S6 -->|calls| T6
  S7["function:(void)<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader.h:31"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["function:(void)<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader.h:31"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["function:(void)<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader.h:35"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["function:(void)<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader.h:35"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_1::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:28"]
  T11["method:JobsAppDoorInputViewBaseStyle_1::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:28"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_1::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:28"]
  T12["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:49"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_1::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:35"]
  T13["method:JobsAppDoorInputViewBaseStyle_1::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:28"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_1::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:35"]
  T14["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:49"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_1::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:43"]
  T15["method:JobsAppDoorInputViewBaseStyle_1::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:43"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_1::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:43"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_1::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:43"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:62"]
  T18["method:UIImageView::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:62"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:62"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:62"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:62"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:62"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_1::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:103"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_1::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1.m:103"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
