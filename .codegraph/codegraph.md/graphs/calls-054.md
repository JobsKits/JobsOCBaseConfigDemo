# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::imageURL<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SDWebImage/UIButton+SDWebImage.m:203"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIButton::imageURL<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SDWebImage/UIButton+SDWebImage.m:203"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIButton::initByTitle<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T3["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S3 -->|calls| T3
  S4["method:UIButton::initByAttributedString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T4["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S4 -->|calls| T4
  S5["method:UIButton::initByNormalImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T5["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S5 -->|calls| T5
  S6["method:UIButton::initByBackgroundImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T6["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S6 -->|calls| T6
  S7["method:UIButton::initByTitles<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T7["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S7 -->|calls| T7
  S8["method:UIButton::initByAttributedStrings<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T8["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S8 -->|calls| T8
  S9["method:UIButton::initByTitle_font<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T9["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S9 -->|calls| T9
  S10["method:UIButton::initByStyle1<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T10["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S10 -->|calls| T10
  S11["method:UIButton::initByStyle2<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T11["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S11 -->|calls| T11
  S12["method:UIButton::initByStyle3<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T12["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S12 -->|calls| T12
  S13["method:UIButton::initByStyle4<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T13["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S13 -->|calls| T13
  S14["method:UIButton::initByStyle5<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T14["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsInit<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  T15["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S15 -->|calls| T15
  S16["method:UIButton::initByViewModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T16["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S16 -->|calls| T16
  S17["method:UIButton::initByViewModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T17["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S17 -->|calls| T17
  S18["method:UIButton::initByButtonModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T18["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S18 -->|calls| T18
  S19["method:UIButton::initByButtonModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  T19["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S19 -->|calls| T19
  S20["method:UIButton::initByTextModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:UIButton::initByTextModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:UIButton::initByTextModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:UIButton::initByTextModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:UIButton::initByTextModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T24["method:UIButton::longPressGestureActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:22"]
  S24 -->|calls| T24
  S25["method:UIButton::initByTextModel<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:404"]
  T25["method:UIButton::clickActionBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
