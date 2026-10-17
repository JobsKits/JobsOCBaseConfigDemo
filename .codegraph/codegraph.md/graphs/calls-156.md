# `calls 符号关系 - 156`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorLogoContentView::mainImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:46"]
  T1["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorLogoContentView::mainImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:46"]
  T2["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorLogoContentView::mainImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:46"]
  T3["method:ASDisplayNode::byContentMode<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:56"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorLogoContentView::mainImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:46"]
  T4["method:UIImageView::byImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImageView/UIImageView+Extra/UIImageView+Extra.m:17"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorLogoContentView::mainImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:46"]
  T5["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorLogoContentView::mainImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:46"]
  T6["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S6 -->|calls| T6
  S7["function:inputSize<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader/JobsAppDoorInputViewHeader.h:31"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S7 -->|calls| T7
  S8["function:inputSize<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader/JobsAppDoorInputViewHeader.h:31"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S8 -->|calls| T8
  S9["function:inputSize_02<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader/JobsAppDoorInputViewHeader.h:35"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S9 -->|calls| T9
  S10["function:inputSize_02<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/JobsAppDoorInputViewHeader/JobsAppDoorInputViewHeader.h:35"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S10 -->|calls| T10
  S11["function:JobsAppDoorVerificationCodeBtnWidth<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:10"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorInputViewBaseStyle_1::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:35"]
  T12["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorInputViewBaseStyle_1::initWithSize:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:42"]
  T13["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorInputViewBaseStyle_1::layoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:50"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorInputViewBaseStyle_1::jobsLayoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:55"]
  T15["method:MasonryModel::byWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:98"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorInputViewBaseStyle_1::jobsLayoutSubviews<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:55"]
  T16["function:JobsAppDoorVerificationCodeBtnWidth<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:10"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T17["method:JobsAppDoorInputViewBaseStyle_1::byTitleStr_1<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:281"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T18["method:JobsAppDoorInputViewBaseStyle_1::byTitleStr_2<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:290"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T19["method:UIView::setLayerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:620"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T20["function:jobsMakeLocationModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsLocationModel/JobsLocationModel.h:46"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T21["method:FMBannerAdsModel::byJobsWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:335"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle_1::setting<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:65"]
  T22["method:JobsLocationModel::byLayerCor<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsLocationModel/JobsLocationModel+DSL/JobsLocationModel+DSL.m:2405"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T23["method:JobsMagicTextField::byPlaceholdAnimationable<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:21"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorInputViewBaseStyle_1::configTextField<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_1/JobsAppDoorInputViewBaseStyle_1/JobsAppDoorInputViewBaseStyle_1.m:78"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
