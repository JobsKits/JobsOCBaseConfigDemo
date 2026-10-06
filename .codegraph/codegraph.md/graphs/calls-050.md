# `calls 符号关系 - 050`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXCategoryTitleBackgroundCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:35"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:JXCategoryTitleBackgroundCell::layoutSubviews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:40"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:JXCategoryTitleBackgroundCell::jobsLayoutSubviews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:45"]
  T3["method:NSTextAttachment::byBounds<br/>JobsByPods/JobsOCDSL@Pods/Core/AutoSupplement/JobsSystemAPIDSLSupplement/JobsSystemAPIDSLSupplement.m:123"]
  S3 -->|calls| T3
  S4["method:JXCategoryTitleBackgroundCell::jobsLayoutSubviews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:45"]
  T4["method:CALayer::byPosition<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:56"]
  S4 -->|calls| T4
  S5["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T5["method:FMBannerAdsModel::byBorderWidth<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:299"]
  S5 -->|calls| T5
  S6["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T6["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:20"]
  S6 -->|calls| T6
  S7["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T7["method:UIBackgroundConfiguration::byBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:11"]
  S7 -->|calls| T7
  S8["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T8["method:CALayer::byBorderColor<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:485"]
  S8 -->|calls| T8
  S9["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T9["method:UIBackgroundConfiguration::byBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:11"]
  S9 -->|calls| T9
  S10["method:JXCategoryTitleBackgroundCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:68"]
  T10["method:CALayer::byBorderColor<br/>JobsByPods/JobsOCDSL@Pods/Core/QuartzCore/CALayer+DSL/CALayer+DSL.m:485"]
  S10 -->|calls| T10
  S11["method:JXCategoryTitleBackgroundCell::reloadData:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:90"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T12["method:JXCategoryTitleBackgroundView::byCellWidthIncrement<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:187"]
  S12 -->|calls| T12
  S13["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T13["method:JXCategoryTitleBackgroundView::byNormalBackgroundColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:152"]
  S13 -->|calls| T13
  S14["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T14["method:JXCategoryTitleBackgroundView::byNormalBorderColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:161"]
  S14 -->|calls| T14
  S15["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T15["method:JXCategoryTitleBackgroundView::bySelectedBackgroundColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:170"]
  S15 -->|calls| T15
  S16["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T16["method:JXCategoryTitleBackgroundView::bySelectedBorderColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:179"]
  S16 -->|calls| T16
  S17["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T17["method:JXCategoryTitleBackgroundView::byBorderLineWidth<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:143"]
  S17 -->|calls| T17
  S18["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T18["method:JXCategoryTitleBackgroundView::byBackgroundCornerRadius<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:116"]
  S18 -->|calls| T18
  S19["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T19["method:JXCategoryTitleBackgroundView::byBackgroundWidth<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:134"]
  S19 -->|calls| T19
  S20["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T20["method:JXCategoryTitleBackgroundView::byBackgroundHeight<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:125"]
  S20 -->|calls| T20
  S21["method:JXCategoryTitleBackgroundView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:59"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:JXCategoryTitleBackgroundView::preferredCellClass<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:73"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:JXCategoryTitleBackgroundView::jobsRefreshDataSource<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:78"]
  T23["method:JXCategoryTitleBackgroundView::byDataSource<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:32"]
  S23 -->|calls| T23
  S24["method:JXCategoryTitleBackgroundView::refreshDataSource<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:87"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T25["method:JXCategoryTitleBackgroundCellModel::byNormalBackgroundColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:62"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
