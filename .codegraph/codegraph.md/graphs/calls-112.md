# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T1["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T2["method:UIViewController::backBtnClickEvent<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIViewController/UIViewController+BackBtn/UIViewController+BackBtn.m:13"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T3["method:JobsAppDoorVC::jobsDestroySingleton<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:85"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T4["method:UIView::cornerCutToCircleWithCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:47"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T5["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T6["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T7["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T8["method:JobsAppDoorContentView::byConfiguration<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:114"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T9["method:JobsAppDoorVC::byJobsAppDoorContentViewY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1243"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T10["method:UIButton::jobsTitleForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:654"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T11["method:JobsAppDoorVC::jobs_pushCountryCodeCtrlBySender<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:684"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T12["method:JobsAppDoorVC::byCurrentActivateTFIndex<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1270"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T13["method:JobsAppDoorVC::byLastTimeActivateTFIndex<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1279"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T14["method:JobsAppDoorVC::竖形按钮在左边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:291"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T15["method:JobsAppDoorVC::竖形按钮在右边<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:314"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T16["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T17["method:MasonryModel::byTop<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:53"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T19["method:JobsAppDoorVC::byCustomerServiceBtnY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1225"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T20["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T21["method:UIViewController::backBtnClickEvent<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIViewController/UIViewController+BackBtn/UIViewController+BackBtn.m:13"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T22["method:JobsAppDoorVC::jobsDestroySingleton<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:85"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T23["method:BaseContentView::removeContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:102"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T24["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::jobsAppDoorContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:905"]
  T25["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
