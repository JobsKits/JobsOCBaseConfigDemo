# `calls 符号关系 - 163`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputViewBaseStyle_2::initWithSize:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:36"]
  T1["method:JobsLocationModel::byJobsWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsLocationModel/JobsLocationModel+DSL/JobsLocationModel+DSL.m:29"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputViewBaseStyle_2::layoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:47"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputViewBaseStyle_2::drawRect:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:61"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputViewBaseStyle_2::jobsDrawRect<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:66"]
  T4["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:58"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T5["method:FMBannerAdsModel::byLeftViewMode<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2063"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T6["method:JobsTextField::byLeftView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:131"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T7["function:jobsMakeImageView<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:379"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T8["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T9["method:UIImageView::byImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:17"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T10["method:UITextField::byReturnKeyType<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:292"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T11["method:UITextField::byKeyboardAppearance<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:274"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T12["method:UITextField::byPlaceholder<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:77"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T13["method:UITextField::byKeyboardType<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:283"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T14["method:UITextField::byTextCor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:31"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T15["method:ZYTextField::byUseCustomClearButton<br/>JobsByPods/UIBaseTextFieldDSL@Pods/Core/UIBaseTextField+DSL/UIBaseTextField+DSL.m:81"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T16["method:ZYTextField::byIsShowDelBtn<br/>JobsByPods/UIBaseTextFieldDSL@Pods/Core/UIBaseTextField+DSL/UIBaseTextField+DSL.m:72"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T17["method:UITextField::byRightViewOffsetX<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:328"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T19["method:UITextField::byPlaceholderColor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:86"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T20["method:UITextField::byLeftViewOffsetX<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:319"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T22["method:UITextField::byPlaceholderFont<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:101"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T23["method:JobsMagicTextField::byAnimationColor<br/>JobsByPods/UIBaseTextFieldDSL@Pods/Core/UIBaseTextField+DSL/UIBaseTextField+DSL.m:237"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T24["method:UITextField::byPlaceHolderAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:310"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_2::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_2/JobsAppDoorInputViewBaseStyle_2/JobsAppDoorInputViewBaseStyle_2.m:77"]
  T25["method:ZYTextField::byPlaceHolderOffset<br/>JobsByPods/UIBaseTextFieldDSL@Pods/Core/UIBaseTextField+DSL/UIBaseTextField+DSL.m:180"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
