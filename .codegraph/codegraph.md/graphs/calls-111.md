# `calls 符号关系 - 111`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorVC::jobs_setVolumePanelVisible:animated:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:765"]
  T1["variable:completion<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.h:48"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorVC::jobs_setVolumePanelVisible:animated:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:765"]
  T2["variable:completion<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.h:48"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorVC::jobs_toggleVolumePanel<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:800"]
  T3["method:JobsAppDoorVC::jobs_setVolumePanelVisible:animated:<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:765"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorVC::jobs_volumeSliderValueChanged<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:810"]
  T4["method:JobsAppDoorVC::jobs_applyDoorVolume<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:545"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T5["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T6["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T7["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T10["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T11["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T13["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T14["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:82"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorVC::logoContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:845"]
  T15["method:JobsAppDoorVC::byLogoContentViewY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1252"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T16["method:UIView::cornerCutToCircleWithCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:47"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T17["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T18["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T19["method:JobsAppDoorVC::byForgotCodeContentViewY<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:1234"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T20["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T21["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T22["method:UIButton::jobsTitleForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:654"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T23["method:BaseContentView::removeContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:102"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T24["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorVC::forgotCodeContentView<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:859"]
  T25["method:JobsAppDoorVC::jobs_refreshKeyboardMgrConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/ViewController/JobsAppDoorVC/JobsAppDoorVC.m:366"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
