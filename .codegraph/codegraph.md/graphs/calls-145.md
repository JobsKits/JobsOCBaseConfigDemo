# `calls 符号关系 - 145`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsNavBar::initWithSize:<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:71"]
  T1["method:JobsNavBar::init<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:42"]
  S1 -->|calls| T1
  S2["method:JobsNavBar::viewSizeByModel<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:92"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:JobsNavBar::viewSizeByModel<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:92"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:JobsNavBar::navBarConfig<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:117"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:JobsNavBar::titleLab<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:136"]
  T5["method:UILabel::byAttributedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:48"]
  S5 -->|calls| T5
  S6["method:JobsNavBar::titleLab<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:136"]
  T6["method:UILabel::byText<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:39"]
  S6 -->|calls| T6
  S7["method:JobsNavBar::titleLab<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:136"]
  T7["method:UILabel::makeLabelByShowingType<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:58"]
  S7 -->|calls| T7
  S8["method:JobsNavBar::backBtn<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:157"]
  T8["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S8 -->|calls| T8
  S9["method:JobsNavBar::backBtn<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:157"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:JobsNavBar::backBtn<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:157"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:JobsNavBar::backBtn<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:157"]
  T11["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:JobsNavBar::closeBtn<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:171"]
  T12["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S12 -->|calls| T12
  S13["method:JobsNavBar::closeBtn<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:171"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S13 -->|calls| T13
  S14["method:JobsNavBar::closeBtn<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:171"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:JobsNavBar::closeBtn<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBar/JobsNavBar.m:171"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsNavBarConfig::closeBtnModel<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBarConfig/JobsNavBarConfig.m:55"]
  T16["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S16 -->|calls| T16
  S17["method:JobsNavBarConfig::font<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBarConfig/JobsNavBarConfig.m:84"]
  T17["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  S17 -->|calls| T17
  S18["method:JobsNavBarConfig::font<br/>JobsByPods/JobsNavBar@Pods/Core/JobsNavBarConfig/JobsNavBarConfig.m:84"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:BaseButton::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:33"]
  T19["method:BaseButton::init<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:33"]
  S19 -->|calls| T19
  S20["method:BaseButton::buttonWithConfiguration:primaryAction:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:45"]
  T20["method:BaseButton::buttonWithConfiguration:primaryAction:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:45"]
  S20 -->|calls| T20
  S21["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:55"]
  T21["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:55"]
  S21 -->|calls| T21
  S22["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:55"]
  T22["method:BaseButton::resetSubViews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:96"]
  S22 -->|calls| T22
  S23["method:BaseButton::layoutSubviews<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:55"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:78"]
  T24["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:78"]
  S24 -->|calls| T24
  S25["method:BaseButton::hitTest:withEvent:<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseButton/BaseButton.m:78"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
