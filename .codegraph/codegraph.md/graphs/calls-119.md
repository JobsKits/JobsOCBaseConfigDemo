# `calls 符号关系 - 119`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T1["method:UICollectionViewLayoutAttributes::byTransform<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:479"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T2["method:UIControl::onJobsChange<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIControl+DSLs/UIControl+DSL/UIControl+DSL.m:101"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T3["method:UISlider::byThumbTintColor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:57"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T4["method:UISlider::byMaximumTrackTintColor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:48"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T5["method:UISlider::byMinimumTrackTintColor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:39"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T6["method:JobsAnimationLabel::byValue<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:45"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T7["method:UISlider::byMaximumValue<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:21"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T8["method:UISlider::byMinimumValue<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UISlider+DSLs/UISlider+DSL/UISlider+DSL.m:12"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T9["method:JobsAppDoorVC::jobs_currentDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:515"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::volumeSlider<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1136"]
  T10["method:JobsAppDoorVC::jobs_volumeSliderValueChanged<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:810"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1157"]
  T11["function:jobsMakeZFAVPlayerManager<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFPlayerExtra/ZFPlayerExtra.h:59"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1157"]
  T12["function:isiPhoneX_series<br/>JobsByPods/JobsGetWindow@Pods/Core/window/window.h:136"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1157"]
  T13["method:ZFPlayerController::byAssetURL<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:38"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1157"]
  T14["method:ZFAVPlayerManager::byShouldAutoPlay<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.m:75"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::playerManager<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1157"]
  T15["function:JobsAppDoorResourceURL<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':125"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::player<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1168"]
  T16["method:ZFPlayerController::byControlView<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:29"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::player<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1168"]
  T17["method:ZFAVPlayerManager::byReplay<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.m:133"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::customPlayerControlView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1182"]
  T18["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::customPlayerControlView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1182"]
  T19["method:CustomZFPlayerControlView::actionCustomZFPlayerControlViewBlock<br/>'JobsByPods/JobsByOCPods@Pods/Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.m':75"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1194"]
  T20["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1194"]
  T21["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1194"]
  T22["function:jobsMakeImageView<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:379"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1194"]
  T23["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1194"]
  T24["method:UIImageView::byImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:17"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorLoginContentView::init<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:37"]
  T25["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
