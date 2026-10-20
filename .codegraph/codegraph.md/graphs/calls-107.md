# `calls 符号关系 - 107`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::jobs_refreshLogoVisibilityForKeyboardVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:356"]
  T1["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T2["method:JobsAppDoorVC::jobs_activeDoorContentViewForKeyboard<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:346"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T4["method:JobsAppDoorConfig::registerFieldCount<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:46"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T5["method:JobsDouyinRefreshView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsFuseAnimation/JobsDouyinRefreshView/JobsDouyinRefreshView/JobsDouyinRefreshView.m:146"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T6["method:JobsOCKeyboardMgr::shared<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardMgr/JobsOCKeyboardMgr.m:36"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T7["function:jobsMakeOCKeyboardConfig<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.h:79"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T8["method:JobsOCKeyboardConfig::byResultBlock<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:250"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T9["method:JobsOCKeyboardConfig::byAccessoryPolicy<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:241"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T10["method:JobsOCKeyboardConfig::byTopSpacing<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:187"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T11["method:JobsOCKeyboardConfig::byExtraSpacing<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:178"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T12["method:JobsOCKeyboardConfig::byFollowViews<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:151"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T13["method:ZFPlayerController::byContainerView<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:11"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T14["method:GTCaptcha4Model::byTargetView<br/>JobsByPods/JobsModelDSL@Pods/Core/GTCaptcha4Model/GTCaptcha4Model+DSL/GTCaptcha4Model+DSL.m:47"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T15["method:JobsOCKeyboardConfig::byOwner<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:97"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  T17["method:JobsAppDoorVC::jobs_refreshLogoVisibilityForKeyboardVisible<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:356"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::jobs_resumeDoorVideoIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:405"]
  T18["method:JobsAppDoorVC::jobs_isVideoDoorMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:396"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::jobs_resumeDoorVideoIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:405"]
  T19["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::jobs_applicationDidEnterBackground:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:433"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::jobsJobs_applicationDidEnterBackground<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:438"]
  T21["method:JobsAppDoorVC::jobs_isVideoDoorMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:396"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::jobsJobs_applicationDidEnterBackground<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:438"]
  T22["method:JobsAppDoorVC::byVideoPausedByApplicationState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1216"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::jobs_applicationDidBecomeActive:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:451"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::jobsJobs_applicationDidBecomeActive<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:456"]
  T24["method:JobsAppDoorVC::byVideoPausedByApplicationState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1216"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::jobsJobs_applicationDidBecomeActive<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:456"]
  T25["method:JobsAppDoorVC::jobs_resumeDoorVideoIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:405"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
