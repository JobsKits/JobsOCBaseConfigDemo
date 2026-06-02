# `calls 符号关系 - 027`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  T1["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S1 -->|calls| T1
  S2["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  T2["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S2 -->|calls| T2
  S3["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  T3["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S3 -->|calls| T3
  S4["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  T4["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S4 -->|calls| T4
  S5["method:BaseButton::resetSubViews<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/BaseButton/BaseButton.m:94"]
  T5["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S5 -->|calls| T5
  S6["method:UIButton::initByTitle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T6["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S6 -->|calls| T6
  S7["method:UIButton::initByAttributedString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T7["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S7 -->|calls| T7
  S8["method:UIButton::initByNormalImage<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T8["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S8 -->|calls| T8
  S9["method:UIButton::initByBackgroundImage<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T9["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S9 -->|calls| T9
  S10["method:UIButton::initByTitles<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T10["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S10 -->|calls| T10
  S11["method:UIButton::initByAttributedStrings<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T11["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S11 -->|calls| T11
  S12["method:UIButton::initByTitle_font<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T12["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S12 -->|calls| T12
  S13["method:UIButton::initByStyle1<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T13["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S13 -->|calls| T13
  S14["method:UIButton::initByStyle2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T14["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S14 -->|calls| T14
  S15["method:UIButton::initByStyle3<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T15["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S15 -->|calls| T15
  S16["method:UIButton::initByStyle4<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T16["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S16 -->|calls| T16
  S17["method:UIButton::initByStyle5<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T17["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsInit<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  T18["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S18 -->|calls| T18
  S19["method:UIButton::initByViewModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T19["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S19 -->|calls| T19
  S20["method:UIButton::initByViewModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T20["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S20 -->|calls| T20
  S21["method:UIButton::initByButtonModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T21["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S21 -->|calls| T21
  S22["method:UIButton::initByButtonModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T22["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S22 -->|calls| T22
  S23["method:UIButton::initByTextModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:UIButton::initByTextModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:UIButton::initByTextModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
