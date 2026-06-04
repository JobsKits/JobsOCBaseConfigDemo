# `calls 符号关系 - 144`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T1["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T2["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T3["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T4["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T5["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T6["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T7["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T8["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T9["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T10["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T11["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T12["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T13["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S13 -->|calls| T13
  S14["function:init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:55"]
  T14["function:init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:55"]
  S14 -->|calls| T14
  S15["function:loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:61"]
  T15["function:loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:61"]
  S15 -->|calls| T15
  S16["function:loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:61"]
  T16["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S16 -->|calls| T16
  S17["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:92"]
  T17["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:92"]
  S17 -->|calls| T17
  S18["function:竖形按钮在左边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:139"]
  T18["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S18 -->|calls| T18
  S19["function:竖形按钮在左边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:139"]
  T19["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S19 -->|calls| T19
  S20["function:竖形按钮在右边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:158"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["function:竖形按钮在右边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:158"]
  T21["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S21 -->|calls| T21
  S22["function:竖形按钮在右边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:158"]
  T22["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S22 -->|calls| T22
  S23["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T24["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S24 -->|calls| T24
  S25["file:JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:1"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
