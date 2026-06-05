# `calls 符号关系 - 099`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsTimerMgr::pause:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:229"]
  T1["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S1 -->|calls| T1
  S2["method:JobsTimerMgr::pause:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:229"]
  T2["method:JobsTimer::pause<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:418"]
  S2 -->|calls| T2
  S3["method:JobsTimerMgr::resume:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:248"]
  T3["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S3 -->|calls| T3
  S4["method:JobsTimerMgr::resume:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:248"]
  T4["method:JobsTimer::resume<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:450"]
  S4 -->|calls| T4
  S5["method:JobsTimerMgr::fireOnceAndRemove:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:267"]
  T5["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S5 -->|calls| T5
  S6["method:JobsTimerMgr::fireOnceAndRemove:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:267"]
  T6["method:JobsTimer::fireOnce<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:479"]
  S6 -->|calls| T6
  S7["method:JobsTimerMgr::stopAndRemove:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:291"]
  T7["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S7 -->|calls| T7
  S8["method:JobsTimerMgr::stopAndRemove:<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:291"]
  T8["method:JobsTimer::stop<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:512"]
  S8 -->|calls| T8
  S9["method:JobsTimerMgr::stopAndRemoveAll<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:310"]
  T9["function:jobs_runOnMainSyncIfNeeded<br/>JobsByPods/JobsOCTimerMgr@Pods/Core/JobsTimerMgr.m:45"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:277"]
  T10["method:JobsPodspecKitForJobsOCTimerManager::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:266"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:273"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsOCTimerManager::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimerMgr@Pods/JobsPodspecKit.rb:277"]
  S12 -->|calls| T12
  S13["method:AESCrypt::decrypt:password:<br/>JobsByPods/JobsOCTools@Pods/Core/AESCrypt-ObjC/AESCrypt.m:34"]
  T13["method:NSData::dataByBase64String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base64/Base64（系统拓展）/NSData+Base64/NSData+Base64.m:24"]
  S13 -->|calls| T13
  S14["method:GXCardItemDemoCell::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardItemDemoCell/GXCardItemDemoCell.m:12"]
  T14["method:GXCardItemDemoCell::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardItemDemoCell/GXCardItemDemoCell.m:12"]
  S14 -->|calls| T14
  S15["method:HAHandleDemoView::initWithFrame:<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:28"]
  T15["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S15 -->|calls| T15
  S16["method:HAHandleDemoView::handleBtnTouchDownAction<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:44"]
  T16["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  S16 -->|calls| T16
  S17["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  T17["method:ASDisplayNode::bounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S17 -->|calls| T17
  S18["method:HAHandleDemoView::calculateMaxSide<br/>JobsByPods/JobsOCTools@Pods/Core/HAHandleDemoView/HAHandleDemoView.m:85"]
  T18["method:ASDisplayNode::bounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:299"]
  S18 -->|calls| T18
  S19["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T19["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S19 -->|calls| T19
  S20["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T20["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S20 -->|calls| T20
  S21["method:TBCityIconFont::fontWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:23"]
  T21["method:TBCityIconFont::fontName<br/>JobsByPods/JobsOCTools@Pods/Core/IconFont/TBCityIconFont/TBCityIconFont.m:39"]
  S21 -->|calls| T21
  S22["method:BaseContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/BaseContentView/BaseContentView.m:18"]
  T22["method:BaseContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/BaseContentView/BaseContentView.m:18"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorLogoContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:23"]
  T23["method:JobsAppDoorLogoContentView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:23"]
  S23 -->|calls| T23
  S24["method:AuthCodeLab::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:16"]
  T24["method:AuthCodeLab::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:16"]
  S24 -->|calls| T24
  S25["method:AuthCodeLab::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:16"]
  T25["method:AuthCodeLab::requestAuthCode<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_6/AuthCodeLab/AuthCodeLab.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
