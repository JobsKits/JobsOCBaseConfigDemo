# `calls 符号关系 - 197`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBasePopupView::viewSizeByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:56"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S1 -->|calls| T1
  S2["method:JobsBasePopupView::viewSizeByModel<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:56"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S2 -->|calls| T2
  S3["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T3["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S3 -->|calls| T3
  S4["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T4["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S4 -->|calls| T4
  S5["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T5["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S5 -->|calls| T5
  S6["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T6["method:UITextView::byTextAlignment<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:35"]
  S6 -->|calls| T6
  S7["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T7["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S7 -->|calls| T7
  S8["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T8["method:UILabel::byFont<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:388"]
  S8 -->|calls| T8
  S9["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T9["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S9 -->|calls| T9
  S10["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T10["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S10 -->|calls| T10
  S11["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T11["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S11 -->|calls| T11
  S12["method:JobsBasePopupView::titleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:62"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S12 -->|calls| T12
  S13["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T13["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S13 -->|calls| T13
  S14["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T14["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S14 -->|calls| T14
  S15["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T15["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S15 -->|calls| T15
  S16["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T16["method:UITextView::byTextAlignment<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:35"]
  S16 -->|calls| T16
  S17["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T17["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S17 -->|calls| T17
  S18["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T18["method:UILabel::byFont<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:388"]
  S18 -->|calls| T18
  S19["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T19["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S19 -->|calls| T19
  S20["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T20["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S20 -->|calls| T20
  S21["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T21["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S21 -->|calls| T21
  S22["method:JobsBasePopupView::subTitleLab<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:80"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S22 -->|calls| T22
  S23["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T23["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S23 -->|calls| T23
  S24["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T24["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S24 -->|calls| T24
  S25["method:JobsBasePopupView::btn1<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView/JobsBasePopupView.m:98"]
  T25["method:YTKBaseRequest::byTag<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/YTKNetwork+DSL/YTKBaseRequest/YTKBaseRequest+DSL/YTKBaseRequest+DSL.m:11"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
