# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T1["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T2["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T4["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T5["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T7["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T9["method:UIButtonConfiguration::byTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:201"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T10["method:UIButton::byConfiguration<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UIButton+DSLs/UIButton+DSL/UIButton+DSL.m:16"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T11["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T12["method:FMBannerAdsModel::byContentHorizontalAlignment<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1298"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T13["method:UIGestureRecognizer::byEnabled<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:30"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T14["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorContentView::storeCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1019"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T18["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T19["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T20["method:UIImage::dw_RescaleImageToSize<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:153"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T21["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T22["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T23["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T24["method:FSCalendarCell::byTitleLabel<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/FSCalendar+DSL/FSCalendar+DSL/FSCalendar+DSL.m:834"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorContentView::findCodeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:1075"]
  T25["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
