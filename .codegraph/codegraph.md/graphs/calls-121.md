# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T1["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T2["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T3["method:UIButton::onClickBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T4["method:UIButton::makeNewLineShows<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:341"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T5["method:UIButton::initByStyleTop<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:259"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T6["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:39"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T7["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T8["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorLoginContentView::toRegisterBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:373"]
  T10["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T11["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T12["method:MasonryModel::byTop<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:53"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T13["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T14["method:UIView::bySizeToFit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:196"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T15["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T16["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T17["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T18["method:UILabel::byText<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:327"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T19["function:JobsFontRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_String/MacroDef_String.h:25"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorLoginContentView::titleLab<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:395"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T22["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T23["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:16"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T24["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorLoginContentView::abandonLoginBtn<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle2/View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.m:412"]
  T25["method:UIButton::onLongPressGestureBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
