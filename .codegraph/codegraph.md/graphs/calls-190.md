# `calls 符号关系 - 190`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:55"]
  T1["function:init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:55"]
  S1 -->|calls| T1
  S2["function:loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:61"]
  T2["function:loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:61"]
  S2 -->|calls| T2
  S3["function:loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:61"]
  T3["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S3 -->|calls| T3
  S4["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:92"]
  T4["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:92"]
  S4 -->|calls| T4
  S5["function:竖形按钮在左边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:139"]
  T5["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S5 -->|calls| T5
  S6["function:竖形按钮在左边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:139"]
  T6["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S6 -->|calls| T6
  S7["function:竖形按钮在左边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:139"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["function:竖形按钮在右边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:158"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["function:竖形按钮在右边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:158"]
  T9["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S9 -->|calls| T9
  S10["function:竖形按钮在右边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:158"]
  T10["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S10 -->|calls| T10
  S11["function:keyboardDidChangeFrameNotification:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:203"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["function:keyboardDidChangeFrameNotification:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:203"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["function:keyboardDidChangeFrameNotification:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:203"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S13 -->|calls| T13
  S14["function:logoContentView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:247"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["function:logoContentView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:247"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["function:logoContentView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:247"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S16 -->|calls| T16
  S17["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T18["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S18 -->|calls| T18
  S19["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T22["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S22 -->|calls| T22
  S23["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T23["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S23 -->|calls| T23
  S24["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T24["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S24 -->|calls| T24
  S25["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T25["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
