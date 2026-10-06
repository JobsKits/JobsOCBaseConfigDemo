# `calls 符号关系 - 175`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T1["method:UIView::refresh<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:28"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T2["method:UIView::cornerCutToCircleWithCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:47"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T4["function:jobsMakeMagicTextField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.h:60"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T5["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T6["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T7["method:UITextField::byDelegate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:22"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T8["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T9["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T10["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T12["method:UITextField::jobsTextFieldEventFilterBlock:subscribeNextBlock:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:13"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T13["variable:retBoolByIDBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:118"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_4::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':225"]
  T14["method:JobsAppDoorInputViewBaseStyle_4::block:value:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':98"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_5::layoutSubviews<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':47"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_5::drawRect:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':61"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_5::registerNotification<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':79"]
  T17["method:JobsDropDownListView::dropDownListViewDisappear<br/>JobsByPods/JobsDropDownListView@Pods/Core/JobsDropDownListView/JobsDropDownListView.m:103"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':101"]
  T18["method:BaseTextView::byPlaceholder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:23"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':101"]
  T19["method:UIButtonConfiguration::byBackground<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:75"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':101"]
  T20["method:JobsAppDoorInputViewBaseStyleModel::byKeyboardType<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:152"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':101"]
  T21["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':101"]
  T22["method:FMBannerAdsModel::byUseCustomClearButton<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2090"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':101"]
  T23["method:FMBannerAdsModel::byIsShowDelBtn<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2081"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':101"]
  T24["method:FMBannerAdsModel::byRightViewOffsetX<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2027"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_5::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_5/JobsAppDoorInputViewBaseStyle_5/JobsAppDoorInputViewBaseStyle_5.m':101"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
