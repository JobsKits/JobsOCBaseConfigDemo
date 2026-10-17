# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputViewBaseStyle_2::imageCodeView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:191"]
  T1["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:205"]
  T2["function:jobsMakeMagicTextField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.h:60"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:205"]
  T3["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:205"]
  T4["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:205"]
  T5["method:UITextField::byDelegate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:22"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:205"]
  T6["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:205"]
  T7["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:205"]
  T8["method:UITextField::jobsTextFieldEventFilterBlock:subscribeNextBlock:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:13"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:205"]
  T9["variable:retBoolByIDBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:118"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_2::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:205"]
  T10["method:JobsAppDoorInputViewBaseStyle_2::block:value:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:109"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_3::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:27"]
  T11["method:UIView::setLayerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:620"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_3::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:27"]
  T12["function:jobsMakeLocationModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsLocationModel/JobsLocationModel.h:46"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_3::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:27"]
  T13["method:JobsAppDoorInputViewBaseStyleModel::byLayerCor<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:3356"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_3::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:27"]
  T14["method:JobsLocationModel::byJobsWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsLocationModel/JobsLocationModel+DSL/JobsLocationModel+DSL.m:29"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_3::initWithSize:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:37"]
  T15["method:UIView::setLayerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:620"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_3::initWithSize:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:37"]
  T16["function:jobsMakeLocationModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsLocationModel/JobsLocationModel.h:46"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_3::initWithSize:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:37"]
  T17["method:JobsAppDoorInputViewBaseStyleModel::byLayerCor<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:3356"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_3::initWithSize:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:37"]
  T18["method:JobsLocationModel::byJobsWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsLocationModel/JobsLocationModel+DSL/JobsLocationModel+DSL.m:29"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_3::layoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:48"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_3::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:62"]
  T20["method:JobsMagicTextField::byPlaceholdAnimationable<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:21"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_3::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:62"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_3::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:62"]
  T22["method:UIButtonConfiguration::byBackground<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:75"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_3::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:62"]
  T23["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_3::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:62"]
  T24["method:JobsAppDoorInputViewBaseStyleModel::byDisabledBackground<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:179"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_3::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:62"]
  T25["method:JobsAppDoorInputViewBaseStyleModel::byKeyboardType<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:152"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
