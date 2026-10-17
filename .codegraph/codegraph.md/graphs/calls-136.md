# `calls 符号关系 - 136`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T1["method:JobsAppDoorVC_Style2::byGk_navLeftBarButtonItems<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1142"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T2["method:JobsAppDoorVC_Style2::byGk_navRightBarButtonItem<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1178"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T3["method:JobsAppDoorVC_Style2::byGk_navRightBarButtonItems<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1151"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T4["method:JobsAppDoorVC_Style2::byGk_navBarAlpha<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1133"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T5["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  T6["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC_Style2::jobs_applyConfigurationFromRequestParams<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:170"]
  T7["method:NSObject::byViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:306"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC_Style2::jobs_applyConfigurationFromRequestParams<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:170"]
  T8["method:JobsAppDoorVC_Style2::byConfiguration<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:68"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC_Style2::jobs_applyConfigurationFromRequestParams<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:170"]
  T9["method:JobsAppDoorConfig::byBackgroundType<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:87"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC_Style2::loadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:188"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC_Style2::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:193"]
  T11["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC_Style2::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:193"]
  T12["method:JobsAppDoorVC_Style2::jobs_applyConfigurationFromRequestParams<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:170"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC_Style2::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:193"]
  T13["method:UIViewController::byView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+BaseVC/UIViewController+BaseVC.m:127"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC_Style2::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:193"]
  T14["method:ASVideoPlayerNode::play<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVideoPlayerNode.mm:729"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC_Style2::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:193"]
  T15["method:UIButtonModel::byTextModelBlock<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:3091"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC_Style2::jobsLoadView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:193"]
  T16["method:UITextModel::byText<br/>JobsByPods/JobsModelDSL@Pods/Core/UITextModel/UITextModel+DSL/UITextModel+DSL.m:101"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC_Style2::viewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:215"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC_Style2::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:220"]
  T18["method:JobsAppDoorVC_Style2::jobs_hideDoorNavigationChrome<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:136"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC_Style2::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:220"]
  T19["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC_Style2::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:220"]
  T20["method:JobsAppDoorVC_Style2::byLogoContentViewY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1107"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC_Style2::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:220"]
  T21["method:JobsAppDoorVC_Style2::byLoginContentViewY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1089"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC_Style2::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:220"]
  T22["method:JobsAppDoorVC_Style2::byRegisterContentViewY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1116"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC_Style2::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:220"]
  T23["method:JobsAppDoorVC_Style2::byLoginCustomerServiceBtnY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1098"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC_Style2::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:220"]
  T24["method:JobsAppDoorVC_Style2::byRegisterCustomerServiceBtnY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1125"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC_Style2::jobsViewDidLoad<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:220"]
  T25["method:JobsAppDoorVC_Style2::byLoginDoorInputEditing<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/ViewController/JobsAppDoorVC_Style2/JobsAppDoorVC_Style2.m:1062"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
