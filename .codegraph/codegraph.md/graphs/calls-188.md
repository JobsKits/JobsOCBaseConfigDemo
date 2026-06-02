# `calls 符号关系 - 188`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T1["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S1 -->|calls| T1
  S2["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T3["method:JobsAppDoorContentView::p_animationToRegister<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:279"]
  S3 -->|calls| T3
  S4["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T4["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:95"]
  S4 -->|calls| T4
  S5["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T5["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S5 -->|calls| T5
  S6["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T6["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S6 -->|calls| T6
  S7["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T7["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S7 -->|calls| T7
  S8["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T8["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S8 -->|calls| T8
  S9["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T9["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S9 -->|calls| T9
  S10["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  T10["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::abandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:455"]
  T11["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::abandonLoginBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:455"]
  T12["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::sendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:467"]
  T13["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::sendBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:467"]
  T14["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T15["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T16["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T17["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T18["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T19["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T20["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T23["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:483"]
  T25["variable:id<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:48"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
