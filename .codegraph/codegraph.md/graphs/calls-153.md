# `calls 符号关系 - 153`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T1["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T2["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T3["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T4["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T5["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T6["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T7["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T8["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T9["method:JobsAppDoorForgotCodeContentView::jobs_canConfirmPassword<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:86"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T10["function:toastBy<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast/NSObject+WHToast.h:66"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T11["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T12["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T13["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T14["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorForgotCodeContentView::confirmBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:235"]
  T16["method:JobsAppDoorForgotCodeContentView::jobs_updateConfirmBtnState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:73"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorForgotCodeContentView::backHomeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:265"]
  T17["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorForgotCodeContentView::backHomeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:265"]
  T18["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorForgotCodeContentView::backHomeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:265"]
  T19["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorForgotCodeContentView::backHomeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:265"]
  T20["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorForgotCodeContentView::backHomeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:265"]
  T21["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:351"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorForgotCodeContentView::backHomeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:265"]
  T22["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:373"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorForgotCodeContentView::backHomeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:265"]
  T23["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:362"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorForgotCodeContentView::backHomeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:265"]
  T24["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorForgotCodeContentView::backHomeBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:265"]
  T25["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
