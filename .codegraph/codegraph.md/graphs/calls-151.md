# `calls 符号关系 - 151`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T1["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:260"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T2["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T3["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorForgotCodeContentView::backToLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:125"]
  T4["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T5["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T6["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T7["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T8["method:UIView::makeLabelByShowingType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:745"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T9["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T10["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T11["method:UITextView::byTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:33"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T12["method:UILabel::byText<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:327"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T13["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T14["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T15["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T16["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T17["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T19["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorForgotCodeContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:155"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorForgotCodeContentView::passwordInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:177"]
  T21["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:20"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorForgotCodeContentView::passwordInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:177"]
  T22["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorForgotCodeContentView::passwordInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:177"]
  T23["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorForgotCodeContentView::passwordInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:177"]
  T24["method:JobsAppDoorInputViewBaseStyle_3::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/输入框样式/DoorInputView/输入框样式_3/JobsAppDoorInputViewBaseStyle_3/JobsAppDoorInputViewBaseStyle_3.m:130"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorForgotCodeContentView::passwordInputView<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:177"]
  T25["method:JobsAppDoorForgotCodeContentView::jobs_passwordInputModelWithPlaceholder<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:97"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
