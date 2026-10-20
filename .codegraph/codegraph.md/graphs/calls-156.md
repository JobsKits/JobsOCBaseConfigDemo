# `calls 符号关系 - 156`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:inputSize<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader/JobsAppDoorInputViewHeader.h:31"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S1 -->|calls| T1
  S2["function:inputSize<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader/JobsAppDoorInputViewHeader.h:31"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S2 -->|calls| T2
  S3["function:inputSize_02<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader/JobsAppDoorInputViewHeader.h:35"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S3 -->|calls| T3
  S4["function:inputSize_02<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader/JobsAppDoorInputViewHeader.h:35"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S4 -->|calls| T4
  S5["function:JobsAppDoorVerificationCodeBtnWidth<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:10"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_1::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:35"]
  T6["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_1::initWithSize:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:42"]
  T7["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_1::layoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:50"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_1::jobsLayoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:55"]
  T9["method:MasonryModel::byWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:98"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_1::jobsLayoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:55"]
  T10["function:JobsAppDoorVerificationCodeBtnWidth<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:10"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T11["method:JobsAppDoorInputViewBaseStyle_1::byTitleStr_1<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:281"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T12["method:JobsAppDoorInputViewBaseStyle_1::byTitleStr_2<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:290"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T13["method:UIView::setLayerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:620"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T14["function:jobsMakeLocationModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsLocationModel/JobsLocationModel.h:46"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T15["method:FMBannerAdsModel::byJobsWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:335"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T16["method:JobsLocationModel::byLayerCor<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsLocationModel/JobsLocationModel+DSL/JobsLocationModel+DSL.m:2405"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T17["method:JobsMagicTextField::byPlaceholdAnimationable<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:21"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T21["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T22["method:UIBackgroundConfiguration::byImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:65"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T23["method:JobsTextField::byLeftView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsTextField/JobsTextField.m:131"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T24["method:UITextField::byLeftViewMode<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:219"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T25["method:UITextField::byPlaceholder<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UITextField+DSLs/UITextField+DSL/UITextField+DSL.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
