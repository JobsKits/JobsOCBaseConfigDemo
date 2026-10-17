# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T1["method:UIButton::jobsResetImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:120"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T2["method:UIButton::jobsResetImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:110"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T3["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T4["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T6["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:39"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T8["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T9["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T10["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T11["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T13["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T16["method:ASDisplayNode::byContentMode<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:56"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T17["method:FMBannerAdsModel::byLineBreakMode<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:893"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T18["method:UILabel::byAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:451"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T19["method:UITextView::byTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:33"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorForgotCodeContentView::contactCustomerServiceBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:290"]
  T20["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:260"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorInputViewBaseStyle::textFieldInputModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputViewBaseStyle/JobsAppDoorInputViewBaseStyle.m:56"]
  T21["method:JobsAppDoorInputViewTFModel::byResString<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputViewBaseStyle/JobsAppDoorInputViewBaseStyle.m:40"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorInputViewBaseStyle::textFieldInputModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputViewBaseStyle/JobsAppDoorInputViewBaseStyle.m:56"]
  T22["method:JobsAppDoorInputViewTFModel::byPlaceHolder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorInputViewBaseStyle/JobsAppDoorInputViewBaseStyle.m:31"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorLogoContentView::drawRect:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:29"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorLogoContentView::jobsDrawRect<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:34"]
  T24["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorLogoContentView::mainImgV<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorLogoContentView/JobsAppDoorLogoContentView.m:46"]
  T25["function:jobsMakeImageView<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:379"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
