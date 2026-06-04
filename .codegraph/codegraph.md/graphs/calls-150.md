# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::sendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:467"]
  T1["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::sendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:467"]
  T2["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T3["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T4["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T5["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T6["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T7["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T8["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T9["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T10["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T11["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T12["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T13["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T14["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T15["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:512"]
  T16["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S16 -->|calls| T16
  S17["function:init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:55"]
  T17["function:init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:55"]
  S17 -->|calls| T17
  S18["function:loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:61"]
  T18["function:loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:61"]
  S18 -->|calls| T18
  S19["function:loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:61"]
  T19["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S19 -->|calls| T19
  S20["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:92"]
  T20["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:92"]
  S20 -->|calls| T20
  S21["function:竖形按钮在左边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:139"]
  T21["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S21 -->|calls| T21
  S22["function:竖形按钮在左边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:139"]
  T22["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S22 -->|calls| T22
  S23["function:竖形按钮在右边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:158"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["function:竖形按钮在右边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:158"]
  T24["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S24 -->|calls| T24
  S25["function:竖形按钮在右边<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/ViewController/JobsAppDoorVC.m:158"]
  T25["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
