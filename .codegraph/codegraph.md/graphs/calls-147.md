# `calls 符号关系 - 147`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T1["method:UISlider::byMinimumValue<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:12"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T2["method:JobsAppDoorVC_Style2::jobs_currentDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:472"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC_Style2::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:983"]
  T3["method:JobsAppDoorVC_Style2::jobs_volumeSliderValueChanged<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:644"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC_Style2::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1004"]
  T4["function:jobsMakeZFAVPlayerManager<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFPlayerExtra/ZFPlayerExtra.h:59"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC_Style2::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1004"]
  T5["function:isiPhoneX_series<br/>JobsByPods/JobsGetWindow@Pods/Core/window/window.h:136"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC_Style2::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1004"]
  T6["method:ZFPlayerController::byAssetURL<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:38"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC_Style2::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1004"]
  T7["method:ZFAVPlayerManager::byShouldAutoPlay<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.m:75"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC_Style2::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1004"]
  T8["function:JobsAppDoorResourceURL<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:125"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC_Style2::player<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1015"]
  T9["method:ZFPlayerController::byControlView<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:29"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC_Style2::player<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1015"]
  T10["method:ZFAVPlayerManager::byReplay<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.m:133"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC_Style2::customPlayerControlView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1029"]
  T11["method:CustomZFPlayerControlView::actionCustomZFPlayerControlViewBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.m:75"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T12["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T13["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T14["function:jobsMakeImageView<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:379"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T15["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T16["method:UIImageView::byImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:17"]
  S16 -->|calls| T16
  S17["file:JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h:1"]
  T17["function:JobsAppDoorResourceBundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:18"]
  S17 -->|calls| T17
  S18["file:JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h:1"]
  T18["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S18 -->|calls| T18
  S19["file:JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h:1"]
  T19["function:JobsAppDoorCustomerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:48"]
  S19 -->|calls| T19
  S20["file:JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h:1"]
  T20["function:JobsAppDoorResourceURL<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:125"]
  S20 -->|calls| T20
  S21["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  T21["function:JobsAppDoorResourceBundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:18"]
  S21 -->|calls| T21
  S22["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  T22["function:JobsAppDoorResourceBundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:18"]
  S22 -->|calls| T22
  S23["function:JobsAppDoorCustomerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:48"]
  T23["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S23 -->|calls| T23
  S24["function:JobsAppDoorCustomerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:48"]
  T24["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S24 -->|calls| T24
  S25["function:JobsAppDoorCustomerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:48"]
  T25["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
