# `calls 符号关系 - 174`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputViewBaseStyle_4::changeTextFieldAnimationColor:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':155"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputViewBaseStyle_4::jobsChangeTextFieldAnimationColor<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':160"]
  T2["method:JobsAppDoorInputViewBaseStyleModel::byAnimationColor<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:341"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputViewBaseStyle_4::getTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':169"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputViewBaseStyle_4::textFieldValue<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':183"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputViewBaseStyle_4::graphicCaptchaConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':197"]
  T5["method:JobsOCGraphicCaptchaConfig::mixedConfig<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaConfig/JobsOCGraphicCaptchaConfig.m:136"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_4::setGraphicCaptchaConfig:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':203"]
  T6["method:JobsOCGraphicCaptchaConfig::mixedConfig<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaConfig/JobsOCGraphicCaptchaConfig.m:136"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_4::setGraphicCaptchaConfig:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':203"]
  T7["method:JobsOCGraphicCaptchaView::byConfig<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaView/JobsOCGraphicCaptchaView.m:32"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T8["method:JobsOCGraphicCaptchaView::byCaptchaBackgroundColor<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaView/JobsOCGraphicCaptchaView.m:59"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T9["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T10["method:JobsDouyinRefreshView::byConfig<br/>JobsByPods/JobsFuseAnimation@Pods/Core/JobsFuseAnimation/JobsDouyinRefreshView/JobsDouyinRefreshView/JobsDouyinRefreshView.m:146"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T11["function:UIFontWeightSemiboldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:43"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T12["method:JobsAppDoorInputViewBaseStyleModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:1223"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T13["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T14["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T15["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T16["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T18["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T19["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T21["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T22["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T24["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_4::captchaView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_4/JobsAppDoorInputViewBaseStyle_4/JobsAppDoorInputViewBaseStyle_4.m':208"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
