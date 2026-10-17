# `calls 符号关系 - 047`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXCategoryTimelineCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:32"]
  T1["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S1 -->|calls| T1
  S2["method:JXCategoryTimelineCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:32"]
  T2["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S2 -->|calls| T2
  S3["method:JXCategoryTimelineCell::reloadData:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:50"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T4["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S4 -->|calls| T4
  S5["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T5["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S5 -->|calls| T5
  S6["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T6["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S6 -->|calls| T6
  S7["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T7["method:UILabel::byTextAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:397"]
  S7 -->|calls| T7
  S8["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T8["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S8 -->|calls| T8
  S9["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T9["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S9 -->|calls| T9
  S10["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T10["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S10 -->|calls| T10
  S11["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S11 -->|calls| T11
  S12["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T12["function:UIFontBoldSystemFontOfSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:131"]
  S12 -->|calls| T12
  S13["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S13 -->|calls| T13
  S14["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T14["method:JXCategoryTimelineView::byTitleFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:19"]
  S14 -->|calls| T14
  S15["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T15["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S15 -->|calls| T15
  S16["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S16 -->|calls| T16
  S17["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T17["function:UIFontBoldSystemFontOfSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:131"]
  S17 -->|calls| T17
  S18["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S18 -->|calls| T18
  S19["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T19["method:JXCategoryTimelineView::byTitleSelectedFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:28"]
  S19 -->|calls| T19
  S20["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T20["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font/MacroDef_Font.h:35"]
  S20 -->|calls| T20
  S21["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S21 -->|calls| T21
  S22["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T22["method:JXCategoryTimelineView::byTitleColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:37"]
  S22 -->|calls| T22
  S23["method:JXCategoryTimelineView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:64"]
  T23["method:JXCategoryTimelineView::byTitleSelectedColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:46"]
  S23 -->|calls| T23
  S24["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:81"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:JXCategoryTimelineView::preferredCellClass<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:95"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
