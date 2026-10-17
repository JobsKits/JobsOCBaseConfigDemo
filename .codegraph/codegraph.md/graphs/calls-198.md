# `calls 符号关系 - 198`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T1["method:UIButton::onLongPressGestureBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S1 -->|calls| T1
  S2["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T2["method:UIButton::onClickBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S2 -->|calls| T2
  S3["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T3["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  S3 -->|calls| T3
  S4["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T4["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S4 -->|calls| T4
  S5["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T5["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S5 -->|calls| T5
  S6["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T6["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S6 -->|calls| T6
  S7["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S7 -->|calls| T7
  S8["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S8 -->|calls| T8
  S9["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T9["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S9 -->|calls| T9
  S10["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T10["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S10 -->|calls| T10
  S11["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S11 -->|calls| T11
  S12["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T12["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S12 -->|calls| T12
  S13["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T13["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S13 -->|calls| T13
  S14["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S14 -->|calls| T14
  S15["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T15["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S15 -->|calls| T15
  S16["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T16["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S16 -->|calls| T16
  S17["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T17["method:YTKBaseRequest::byTag<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/YTKNetwork+DSL/YTKBaseRequest/YTKBaseRequest+DSL/YTKBaseRequest+DSL.m:11"]
  S17 -->|calls| T17
  S18["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T18["method:UIButton::onLongPressGestureBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:475"]
  S18 -->|calls| T18
  S19["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T19["method:UIButton::onClickBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:449"]
  S19 -->|calls| T19
  S20["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T20["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  S20 -->|calls| T20
  S21["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T21["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S21 -->|calls| T21
  S22["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T22["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S22 -->|calls| T22
  S23["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T23["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S23 -->|calls| T23
  S24["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S24 -->|calls| T24
  S25["method:JobsBasePopupView::btn2<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:122"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
