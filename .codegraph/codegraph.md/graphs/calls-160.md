# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputViewBaseStyle_1::magicTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:248"]
  T1["method:JobsAppDoorInputViewBaseStyle_1::block:value:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:111"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputViewBaseStyle_10::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:38"]
  T2["method:NSObject::byViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:306"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputViewBaseStyle_10::layoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:46"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputViewBaseStyle_10::jobsLayoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:51"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T5["method:JobsTextField::byLeftView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:131"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T6["method:UIImageView::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:11"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T7["method:FMBannerAdsModel::byLeftViewMode<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2063"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T8["method:BaseTextView::byPlaceholder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:23"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T9["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T10["method:JobsAppDoorInputViewBaseStyleModel::byKeyboardType<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:152"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T11["method:JobsAppDoorInputViewBaseStyleModel::byReturnKeyType<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:125"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T12["method:JobsAppDoorInputViewBaseStyleModel::byKeyboardAppearance<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:134"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T13["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T14["method:FMBannerAdsModel::byUseCustomClearButton<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2090"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T15["method:FMBannerAdsModel::byIsShowDelBtn<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2081"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T16["method:FMBannerAdsModel::byRightViewOffsetX<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2027"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T18["method:UIViewController::byRequestParams<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+BaseVC/UIViewController+BaseVC.m:146"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T19["method:JobsTextView::byPlaceholderColor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:94"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T20["method:IQKeyboardManager::byPlaceholderFont<br/>JobsByPods/IQKeyboardManagerExtra@Pods/Core/IQKeyboardManager+Extra/IQKeyboardManager+Extra.m:39"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T21["method:FMBannerAdsModel::byLeftViewOffsetX<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2018"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T23["method:FMBannerAdsModel::byPlaceHolderAlignment<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1991"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T24["method:FMBannerAdsModel::byPlaceHolderOffset<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2009"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m:64"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
