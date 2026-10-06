# `calls 符号关系 - 164`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorInputViewBaseStyle_10::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':117"]
  T1["method:UITextView::byUserInteractionEnabled<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:109"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorInputViewBaseStyle_10::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':117"]
  T2["method:JobsAppDoorInputViewBaseStyle_10::byDoorInputViewBaseStyleModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':200"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorInputViewBaseStyle_10::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':117"]
  T3["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorInputViewBaseStyle_10::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':117"]
  T4["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorInputViewBaseStyle_10::jobsRichViewByModel<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':117"]
  T5["method:JobsAppDoorInputViewBaseStyle_10::configTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':64"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorInputViewBaseStyle_10::getTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':129"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorInputViewBaseStyle_10::textFieldValue<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':143"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T8["function:jobsMakeZYTextField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/ZYTextField/ZYTextField.h:80"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T9["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T10["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T11["method:UITextField::byDelegate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:22"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T12["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T13["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T14["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T15["function:inputSize_02<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader/JobsAppDoorInputViewHeader.h':35"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T16["variable:BOOL<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:425"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_10::zyTextField<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':158"]
  T17["variable:retBoolByIDBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:118"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_10::titleLab<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':180"]
  T18["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_10::titleLab<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':180"]
  T19["method:UIView::makeLabelByShowingType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:745"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_10::titleLab<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':180"]
  T20["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_10::titleLab<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':180"]
  T21["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_10::titleLab<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':180"]
  T22["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_10::titleLab<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':180"]
  T23["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_10::titleLab<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':180"]
  T24["method:UILabel::byText<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:327"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_10::titleLab<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_10/JobsAppDoorInputViewBaseStyle_10/JobsAppDoorInputViewBaseStyle_10.m':180"]
  T25["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
