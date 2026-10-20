# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::jobs_installVolumeDismissGestureIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:469"]
  T1["method:UIGestureRecognizer::GestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:22"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::jobs_installVolumeDismissGestureIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:469"]
  T2["function:jobsMakeTapGesture<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:156"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::jobs_installVolumeDismissGestureIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:469"]
  T3["method:UIGestureRecognizer::byDelegate<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:20"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::jobs_installVolumeDismissGestureIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:469"]
  T4["method:UIGestureRecognizer::byCancelsTouchesInView<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIGestureRecognizer+DSLs/UIGestureRecognizer+DSL/UIGestureRecognizer+DSL.m:42"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::jobs_installVolumeDismissGestureIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:469"]
  T5["method:UIView::addGesture<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:71"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::jobs_volumeDismissTap:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:489"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::jobsJobs_volumeDismissTap<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:494"]
  T7["method:JobsAppDoorVC::jobs_setVolumePanelVisible:animated:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:765"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::jobs_volumeValueByPanelPoint<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:532"]
  T8["method:JobsAppDoorVC::jobs_currentDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:515"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  T9["method:JobsAnimationLabel::byValue<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:45"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  T10["method:ZFPlayerController::byMuted<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:74"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  T11["method:ZFPlayerController::byVolume<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:65"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  T12["method:NSObject::byMuted<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:171"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  T13["method:NSObject::byVolume<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:180"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  T14["method:ZFAVPlayerManager::byMuted<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.m:39"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  T15["method:ZFAVPlayerManager::byVolume<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.m:30"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  T16["method:JobsAppDoorVC::jobs_updateVolumePercentText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:592"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::jobs_volumePanelValueGesture:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:570"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::jobsJobs_volumePanelValueGesture<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:575"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::jobsJobs_volumePanelValueGesture<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:575"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::jobsJobs_volumePanelValueGesture<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:575"]
  T20["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::jobsJobs_volumePanelValueGesture<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:575"]
  T21["method:JobsAppDoorVC::jobs_volumeValueByPanelPoint<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:532"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::jobs_updateVolumePercentText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:592"]
  T22["method:JobsAppDoorVC::jobs_currentDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:515"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::jobs_updateVolumePercentText<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:592"]
  T23["variable:NSInteger<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.h:16"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::jobs_countryCodeTitleByCountryName:code:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:603"]
  T24["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::jobs_countryCodeTitleByCountryName:code:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:603"]
  T25["method:JobsAppDoorVC::jobs_isTaiwanCountryName<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:612"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
