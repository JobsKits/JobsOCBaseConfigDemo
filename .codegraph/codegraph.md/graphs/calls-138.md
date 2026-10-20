# `calls 符号关系 - 138`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T1["method:GTCaptcha4Model::byTargetView<br/>JobsByPods/JobsModelDSL@Pods/Core/GTCaptcha4Model/GTCaptcha4Model+DSL/GTCaptcha4Model+DSL.m:47"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T2["method:JobsOCKeyboardConfig::byOwner<br/>JobsByPods/JobsOCKeyboardMgr@Pods/Core/JobsOCKeyboardConfig/JobsOCKeyboardConfig.m:97"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC_Style2::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:335"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC_Style2::jobs_resumeDoorVideoIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:368"]
  T5["method:JobsAppDoorVC_Style2::jobs_isVideoDoorMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:359"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC_Style2::jobs_resumeDoorVideoIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:368"]
  T6["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC_Style2::jobs_applicationDidEnterBackground:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:396"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC_Style2::jobsJobs_applicationDidEnterBackground<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:401"]
  T8["method:JobsAppDoorVC_Style2::jobs_isVideoDoorMode<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:359"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC_Style2::jobsJobs_applicationDidEnterBackground<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:401"]
  T9["method:JobsAppDoorVC_Style2::byVideoPausedByApplicationState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1071"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC_Style2::jobs_applicationDidBecomeActive:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:414"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC_Style2::jobsJobs_applicationDidBecomeActive<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:419"]
  T11["method:JobsAppDoorVC_Style2::byVideoPausedByApplicationState<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1071"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC_Style2::jobsJobs_applicationDidBecomeActive<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:419"]
  T12["method:JobsAppDoorVC_Style2::jobs_resumeDoorVideoIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:368"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC_Style2::jobs_installVolumeDismissGestureIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:432"]
  T13["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIGestureRecognizer+DSLs/UIGestureRecognizer+DSL/UIGestureRecognizer+DSL.m:42"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC_Style2::jobs_installVolumeDismissGestureIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:432"]
  T14["method:UIGestureRecognizer::byDelegate<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:20"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC_Style2::jobs_installVolumeDismissGestureIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:432"]
  T15["method:_ASDisplayView::addGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:280"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC_Style2::jobs_volumeDismissTap:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:446"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC_Style2::jobsJobs_volumeDismissTap<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:451"]
  T17["method:JobsAppDoorVC_Style2::jobs_setVolumePanelVisible:animated:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:599"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC_Style2::jobs_volumeValueByPanelPoint<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:489"]
  T18["method:JobsAppDoorVC_Style2::jobs_currentDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:472"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC_Style2::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:502"]
  T19["method:JobsAnimationLabel::byValue<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:45"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC_Style2::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:502"]
  T20["method:ZFPlayerController::byMuted<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:74"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC_Style2::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:502"]
  T21["method:ZFPlayerController::byVolume<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:65"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC_Style2::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:502"]
  T22["method:NSObject::byMuted<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:171"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC_Style2::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:502"]
  T23["method:NSObject::byVolume<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:180"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC_Style2::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:502"]
  T24["method:ZFAVPlayerManager::byMuted<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.m:39"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC_Style2::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:502"]
  T25["method:ZFAVPlayerManager::byVolume<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.m:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
