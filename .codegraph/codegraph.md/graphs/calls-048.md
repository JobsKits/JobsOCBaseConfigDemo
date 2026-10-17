# `calls 符号关系 - 048`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXCategoryTimelineView::jobsRefreshDataSource<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:100"]
  T1["method:JXCategoryTimelineView::byDataSource<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:55"]
  S1 -->|calls| T1
  S2["method:JXCategoryTimelineView::refreshDataSource<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:113"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:118"]
  T3["method:JXCategoryTimelineCellModel::byTimeTitle<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCellModel/JXCategoryTimelineCellModel.m:23"]
  S3 -->|calls| T3
  S4["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:118"]
  T4["method:JXCategoryTimelineCellModel::byTimeTitleNormalColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCellModel/JXCategoryTimelineCellModel.m:32"]
  S4 -->|calls| T4
  S5["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:118"]
  T5["method:JXCategoryTimelineCellModel::byTimeTitleSelectedColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCellModel/JXCategoryTimelineCellModel.m:41"]
  S5 -->|calls| T5
  S6["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:118"]
  T6["method:JXCategoryTimelineCellModel::byTimeTitleFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCellModel/JXCategoryTimelineCellModel.m:50"]
  S6 -->|calls| T6
  S7["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:118"]
  T7["method:JXCategoryTimelineCellModel::byTimeTitleSelectedFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCellModel/JXCategoryTimelineCellModel.m:59"]
  S7 -->|calls| T7
  S8["method:JXCategoryTitleBackgroundCell::jobsInitializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:24"]
  T8["method:JXCategoryTitleBackgroundCell::byBgLayer<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:96"]
  S8 -->|calls| T8
  S9["method:JXCategoryTitleBackgroundCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:35"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:JXCategoryTitleBackgroundCell::layoutSubviews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:40"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:JXCategoryTitleBackgroundCell::jobsLayoutSubviews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:45"]
  T11["method:NSTextAttachment::byBounds<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:123"]
  S11 -->|calls| T11
  S12["method:JXCategoryTitleBackgroundCell::jobsLayoutSubviews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:45"]
  T12["method:CALayer::byPosition<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:56"]
  S12 -->|calls| T12
  S13["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T13["method:FMBannerAdsModel::byBorderWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:299"]
  S13 -->|calls| T13
  S14["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T14["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:20"]
  S14 -->|calls| T14
  S15["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T15["method:UIBackgroundConfiguration::byBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:11"]
  S15 -->|calls| T15
  S16["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T16["method:CALayer::byBorderColor<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:485"]
  S16 -->|calls| T16
  S17["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T17["method:UIBackgroundConfiguration::byBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:11"]
  S17 -->|calls| T17
  S18["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T18["method:CALayer::byBorderColor<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:485"]
  S18 -->|calls| T18
  S19["method:JXCategoryTitleBackgroundCell::reloadData:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:90"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T20["method:JXCategoryTitleBackgroundView::byCellWidthIncrement<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:187"]
  S20 -->|calls| T20
  S21["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T21["method:JXCategoryTitleBackgroundView::byNormalBackgroundColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:152"]
  S21 -->|calls| T21
  S22["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T22["method:JXCategoryTitleBackgroundView::byNormalBorderColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:161"]
  S22 -->|calls| T22
  S23["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T23["method:JXCategoryTitleBackgroundView::bySelectedBackgroundColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:170"]
  S23 -->|calls| T23
  S24["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T24["method:JXCategoryTitleBackgroundView::bySelectedBorderColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:179"]
  S24 -->|calls| T24
  S25["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T25["method:JXCategoryTitleBackgroundView::byBorderLineWidth<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:143"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
