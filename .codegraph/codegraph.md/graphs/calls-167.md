# `calls 符号关系 - 167`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputViewBaseStyle_2::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':138"]
  T1["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':77"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputViewBaseStyle_2::changeTextFieldAnimationColor:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':149"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputViewBaseStyle_2::jobsChangeTextFieldAnimationColor<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':154"]
  T3["method:JobsAppDoorInputViewBaseStyleModel::byAnimationColor<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:341"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputViewBaseStyle_2::getTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':163"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputViewBaseStyle_2::textFieldValue<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':177"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_2::imageCodeView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':191"]
  T6["function:JobsFontRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_String/MacroDef_String.h:25"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_2::imageCodeView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':191"]
  T7["method:JobsAppDoorInputViewBaseStyleModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:1223"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_2::imageCodeView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':191"]
  T8["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_2::imageCodeView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':191"]
  T9["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_2::imageCodeView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':191"]
  T10["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_2::imageCodeView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':191"]
  T11["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_2::imageCodeView<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':191"]
  T12["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':205"]
  T13["function:jobsMakeMagicTextField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.h:60"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':205"]
  T14["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':205"]
  T15["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':205"]
  T16["method:UITextField::byDelegate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:22"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':205"]
  T17["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':205"]
  T18["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':205"]
  T19["method:UITextField::jobsTextFieldEventFilterBlock:subscribeNextBlock:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:13"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':205"]
  T20["variable:retBoolByIDBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:118"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':205"]
  T21["method:JobsAppDoorInputViewBaseStyle_2::block:value:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m':109"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_3::init<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m':27"]
  T22["method:UIView::setLayerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:620"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_3::init<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m':27"]
  T23["function:jobsMakeLocationModel<br/>'JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsLocationModel/JobsLocationModel.h':46"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_3::init<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m':27"]
  T24["method:JobsAppDoorInputViewBaseStyleModel::byLayerCor<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:3356"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_3::init<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m':27"]
  T25["method:JobsLocationModel::byJobsWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsLocationModel/JobsLocationModel+DSL/JobsLocationModel+DSL.m:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
