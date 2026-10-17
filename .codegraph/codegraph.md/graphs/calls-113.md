# `calls 符号关系 - 113`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T1["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T2["method:JobsAppDoorVC::byAppDoorModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1261"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T3["method:JobsAppDoorContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:154"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T6["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T7["method:UIButton::jobsResetImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:120"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T8["method:UIButton::jobsResetImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:110"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T10["method:UIButton::byTitleEdgeInsets<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIButton+DSLs/UIButton+DSL/UIButton+DSL.m:302"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T11["method:UIButton::byImageEdgeInsets<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIButton+DSLs/UIButton+DSL/UIButton+DSL.m:311"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T14["function:JobsAppDoorCustomerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:48"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T15["method:UIImage::dw_RescaleImageToSize<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:153"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T16["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T17["method:UIView::byVisible<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:89"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T18["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T19["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T20["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:20"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T21["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T22["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T23["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T24["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::customerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:981"]
  T25["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
