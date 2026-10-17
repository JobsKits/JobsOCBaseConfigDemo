# `calls 符号关系 - 105`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T1["method:UIViewController::byView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+BaseVC/UIViewController+BaseVC.m:127"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T2["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T3["method:JobsAppDoorVC::byLogoContentViewY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1252"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T4["method:JobsAppDoorVC::byJobsAppDoorContentViewY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1243"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T5["method:JobsAppDoorVC::byCustomerServiceBtnY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1225"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T6["method:FMBannerAdsModel::byNavBgImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:731"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T7["method:FMBannerAdsModel::byNavBgCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:740"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T8["method:FMBannerAdsModel::byBgCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:785"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T9["method:UIButtonModel::byTextModelBlock<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:3091"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T10["method:UIButtonModel::byBackBtnTitleModelBlock<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:3111"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T11["method:UITextModel::byText<br/>JobsByPods/JobsModelDSL@Pods/Core/UITextModel/UITextModel+DSL/UITextModel+DSL.m:101"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T12["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T13["method:UITextModel::byTextCor<br/>JobsByPods/JobsModelDSL@Pods/Core/UITextModel/UITextModel+DSL/UITextModel+DSL.m:119"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:156"]
  T14["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::viewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:195"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:200"]
  T16["method:BaseViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/BaseViewController/BaseViewController.m:83"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:200"]
  T17["method:UIView::byVisible<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:89"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:200"]
  T18["method:JobsAppDoorVC::jobs_installVolumeDismissGestureIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:469"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:200"]
  T19["method:JobsAppDoorVC::jobs_refreshVolumeControlFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:715"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:200"]
  T20["method:JobsAppDoorVC::jobs_bringDoorControlsToFront<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:752"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:219"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::jobsViewDidLayoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:224"]
  T22["method:JobsAppDoorVC::jobs_refreshVolumeControlFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:715"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::viewWillAppear:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:234"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::jobsViewWillAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:239"]
  T24["method:JobsAppDoorVC::jobs_refreshLogoVisibilityForKeyboardVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:356"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::jobsViewWillAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:239"]
  T25["method:JobsAppDoorVC::jobs_resumeDoorVideoIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:405"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
