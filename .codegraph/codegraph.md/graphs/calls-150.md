# `calls 符号关系 - 150`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:97"]
  T1["method:FMBannerAdsModel::byIsShowDelBtn<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:2081"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:97"]
  T2["method:BaseTextView::byPlaceholder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/BaseTextView/BaseTextView.m:23"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:97"]
  T3["method:JobsAppDoorInputViewBaseStyleModel::byLeftViewIMG<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsAppDoorInputViewBaseStyleModel/JobsAppDoorInputViewBaseStyleModel+DSL/JobsAppDoorInputViewBaseStyleModel+DSL.m:17"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:97"]
  T4["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:97"]
  T5["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:97"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:97"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:97"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T9["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T10["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T11["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T12["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T13["method:FSCalendarCell::byTitleLabel<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/FSCalendar+DSL/FSCalendar+DSL/FSCalendar+DSL.m:834"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T14["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T15["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T16["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T17["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:437"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T18["method:UIButton::jobsResetImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:120"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T19["method:UIButton::jobsResetImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:110"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T20["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T21["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T23["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T24["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T25["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
