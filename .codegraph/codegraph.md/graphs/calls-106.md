# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::viewDidAppear:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:250"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::jobsViewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:255"]
  T2["method:JobsAppDoorContentView::animationToLogin<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:207"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::jobsViewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:255"]
  T3["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::jobsViewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:255"]
  T4["method:JobsAppDoorVC::jobs_resumeDoorVideoIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:405"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::jobsViewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:255"]
  T5["method:JobsAppDoorVC::jobs_bringDoorControlsToFront<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:752"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::viewWillDisappear:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:269"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::jobsViewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:274"]
  T7["method:BaseViewController::viewWillDisappear:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:141"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::jobsViewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:274"]
  T8["method:JobsOCKeyboardMgr::clearConfigByOwner<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardMgr/JobsOCKeyboardMgr.m:109"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::jobsViewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:274"]
  T9["method:JobsOCKeyboardMgr::shared<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardMgr/JobsOCKeyboardMgr.m:36"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::jobsViewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:274"]
  T10["method:JobsAppDoorVC::jobs_setVolumePanelVisible:animated:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:765"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  T11["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  T12["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  T13["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  T14["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:463"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  T15["method:JobsAppDoorVC::jobs_refreshLogoVisibilityForKeyboardVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:356"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  T16["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  T17["method:JobsAppDoorConfig::registerContentY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:67"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  T18["method:JobsAppDoorConfig::registerContentHeight<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:55"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::竖形按钮在右边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:314"]
  T20["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::竖形按钮在右边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:314"]
  T21["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::竖形按钮在右边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:314"]
  T22["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::竖形按钮在右边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:314"]
  T23["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:463"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::竖形按钮在右边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:314"]
  T24["method:JobsAppDoorVC::jobs_refreshLogoVisibilityForKeyboardVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:356"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::竖形按钮在右边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:314"]
  T25["method:JobsOCKeyboardMgr::shared<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardMgr/JobsOCKeyboardMgr.m:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
