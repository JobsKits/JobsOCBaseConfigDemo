# `calls 符号关系 - 137`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC_Style2::viewDidLayoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:247"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC_Style2::jobsViewDidLayoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:252"]
  T2["method:JobsAppDoorVC_Style2::jobs_refreshVolumeControlFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:560"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC_Style2::viewWillAppear:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:262"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC_Style2::jobsViewWillAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:267"]
  T4["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC_Style2::jobsViewWillAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:267"]
  T5["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC_Style2::jobsViewWillAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:267"]
  T6["method:ASDisplayNode::byHidden<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:47"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC_Style2::jobsViewWillAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:267"]
  T7["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC_Style2::jobsViewWillAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:267"]
  T8["method:JobsAppDoorVC_Style2::jobs_resumeDoorVideoIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:368"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC_Style2::viewDidAppear:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:287"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC_Style2::jobsViewDidAppear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:292"]
  T10["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC_Style2::viewWillDisappear:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:302"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC_Style2::jobsViewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:307"]
  T12["method:JobsOCKeyboardMgr::clearConfigByOwner<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardMgr/JobsOCKeyboardMgr.m:109"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC_Style2::jobsViewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:307"]
  T13["method:JobsOCKeyboardMgr::shared<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardMgr/JobsOCKeyboardMgr.m:36"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC_Style2::jobsViewWillDisappear<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:307"]
  T14["method:JobsAppDoorVC_Style2::jobs_setVolumePanelVisible:animated:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:599"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T15["method:JobsAppDoorVC_Style2::jobs_activeDoorContentViewForKeyboard<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:324"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T16["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T17["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T18["method:JobsDouyinRefreshView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsFuseAnimation/JobsDouyinRefreshView/JobsDouyinRefreshView/JobsDouyinRefreshView.m:146"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T19["method:JobsOCKeyboardMgr::shared<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardMgr/JobsOCKeyboardMgr.m:36"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T20["function:jobsMakeOCKeyboardConfig<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.h:79"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T21["method:JobsOCKeyboardConfig::byAccessoryPolicy<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:241"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T22["method:JobsOCKeyboardConfig::byTopSpacing<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:187"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T23["method:JobsOCKeyboardConfig::byExtraSpacing<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:178"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T24["method:JobsOCKeyboardConfig::byFollowViews<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:151"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T25["method:ZFPlayerController::byContainerView<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:11"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
