# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC_Style2::player<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1015"]
  T1["method:ZFPlayerController::byControlView<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/ZFPlayer+DSL/ZFPlayerController/ZFPlayerController+DSL/ZFPlayerController+DSL.m:29"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC_Style2::player<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1015"]
  T2["method:ZFAVPlayerManager::byReplay<br/>JobsByPods/ZFPlayerExtra@Pods/Core/ZFAVPlayerManager/ZFAVPlayerManager+ZFPlayerExtraDSL/ZFAVPlayerManager+ZFPlayerExtraDSL.m:133"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC_Style2::customPlayerControlView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1029"]
  T3["method:CustomZFPlayerControlView::actionCustomZFPlayerControlViewBlock<br/>'JobsByPods/JobsByOCPods@Pods/Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.m':75"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T4["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T5["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T6["function:jobsMakeImageView<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:379"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T7["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC_Style2::bgImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1040"]
  T8["method:UIImageView::byImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:17"]
  S8 -->|calls| T8
  S9["'file:JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h'<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h':1"]
  T9["function:JobsAppDoorResourceBundle<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':18"]
  S9 -->|calls| T9
  S10["'file:JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h'<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h':1"]
  T10["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S10 -->|calls| T10
  S11["'file:JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h'<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h':1"]
  T11["function:JobsAppDoorCustomerServiceIconImage<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':48"]
  S11 -->|calls| T11
  S12["'file:JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h'<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h':1"]
  T12["function:JobsAppDoorResourceURL<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':125"]
  S12 -->|calls| T12
  S13["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  T13["function:JobsAppDoorResourceBundle<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':18"]
  S13 -->|calls| T13
  S14["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  T14["function:JobsAppDoorResourceBundle<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':18"]
  S14 -->|calls| T14
  S15["function:JobsAppDoorCustomerServiceIconImage<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':48"]
  T15["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S15 -->|calls| T15
  S16["function:JobsAppDoorCustomerServiceIconImage<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':48"]
  T16["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S16 -->|calls| T16
  S17["function:JobsAppDoorCustomerServiceIconImage<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':48"]
  T17["function:JobsAppDoorImageNamed<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':36"]
  S17 -->|calls| T17
  S18["function:JobsAppDoorResourceURL<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':125"]
  T18["function:JobsAppDoorResourceBundle<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':18"]
  S18 -->|calls| T18
  S19["function:JobsAppDoorResourceURL<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':125"]
  T19["function:JobsAppDoorResourceBundle<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m':18"]
  S19 -->|calls| T19
  S20["method:BaseContentView::setFrame:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':30"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:BaseContentView::jobsSetFrame<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':35"]
  T21["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':60"]
  S21 -->|calls| T21
  S22["method:BaseContentView::drawRect:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':45"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:BaseContentView::jobsDrawRect<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':50"]
  T23["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':60"]
  S23 -->|calls| T23
  S24["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':60"]
  T24["method:BaseContentView::byInitialContentViewRect<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':126"]
  S24 -->|calls| T24
  S25["method:BaseContentView::showContentViewWithOffsetY<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':80"]
  T25["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m':60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
