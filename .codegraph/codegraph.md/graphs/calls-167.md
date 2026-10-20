# `calls 符号关系 - 167`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputViewBaseStyle_3::textFieldShouldBeginEditing:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:109"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputViewBaseStyle_3::viewSizeByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:124"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputViewBaseStyle_3::viewSizeByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:124"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputViewBaseStyle_3::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:130"]
  T4["method:JobsAppDoorInputViewBaseStyle_3::byDoorInputViewBaseStyleModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:283"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputViewBaseStyle_3::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:130"]
  T5["method:FMBannerAdsModel::byIsShowDelBtn<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2081"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_3::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:130"]
  T6["method:JobsAppDoorInputViewBaseStyle_3::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:62"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_3::changeTextFieldAnimationColor:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:140"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_3::jobsChangeTextFieldAnimationColor<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:145"]
  T8["method:JobsAppDoorInputViewBaseStyleModel::byAnimationColor<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:341"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_3::getTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:154"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_3::textFieldValue<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:168"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_3::textFieldDidBeginEditing:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:192"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_3::textFieldDidBeginEditing<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:195"]
  T12["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T13["function:jobsMakeImageView<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:379"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T14["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T15["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T16["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T17["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T19["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T20["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_3::leftIMGV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:204"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_3::securityModeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:221"]
  T23["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_3::securityModeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:221"]
  T24["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_3::securityModeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:221"]
  T25["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
