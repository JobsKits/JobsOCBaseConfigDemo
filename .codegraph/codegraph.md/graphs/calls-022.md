# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::initByTitle_font<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T1["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S1 -->|calls| T1
  S2["method:UIButton::initByTitle_font<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T2["method:JXCategoryTimelineView::byTitleFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:19"]
  S2 -->|calls| T2
  S3["method:UIButton::initByTitle_font<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T3["method:UIViewModel::byTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/UIViewModel/UIViewModel+DSL/UIViewModel+DSL.m:1199"]
  S3 -->|calls| T3
  S4["method:UIButton::initByStyle1<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T4["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S4 -->|calls| T4
  S5["method:UIButton::initByStyle1<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T5["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  S5 -->|calls| T5
  S6["method:UIButton::initByStyle1<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T6["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S6 -->|calls| T6
  S7["method:UIButton::initByStyle1<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T7["method:FMBannerAdsModel::byTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1478"]
  S7 -->|calls| T7
  S8["method:UIButton::initByStyle1<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T8["method:JXCategoryTimelineView::byTitleFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:19"]
  S8 -->|calls| T8
  S9["method:UIButton::initByStyle1<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T9["method:UIViewModel::byTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/UIViewModel/UIViewModel+DSL/UIViewModel+DSL.m:1199"]
  S9 -->|calls| T9
  S10["method:UIButton::initByStyle2<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T10["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S10 -->|calls| T10
  S11["method:UIButton::initByStyle2<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T11["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  S11 -->|calls| T11
  S12["method:UIButton::initByStyle2<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T12["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S12 -->|calls| T12
  S13["method:UIButton::initByStyle2<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T13["method:UIButtonConfiguration::byImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:282"]
  S13 -->|calls| T13
  S14["method:UIButton::initByStyle2<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T14["method:UIButtonConfiguration::byImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:273"]
  S14 -->|calls| T14
  S15["method:UIButton::initByStyle2<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T15["method:FMBannerAdsModel::byTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1478"]
  S15 -->|calls| T15
  S16["method:UIButton::initByStyle2<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T16["method:JXCategoryTimelineView::byTitleFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:19"]
  S16 -->|calls| T16
  S17["method:UIButton::initByStyle2<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T17["method:UIButtonConfiguration::byTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:174"]
  S17 -->|calls| T17
  S18["method:UIButton::initByStyle2<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T18["method:UIViewModel::byImage<br/>JobsByPods/JobsModelDSL@Pods/Core/UIViewModel/UIViewModel+DSL/UIViewModel+DSL.m:497"]
  S18 -->|calls| T18
  S19["method:UIButton::initByStyle3<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T19["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S19 -->|calls| T19
  S20["method:UIButton::initByStyle3<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T20["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  S20 -->|calls| T20
  S21["method:UIButton::initByStyle3<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T21["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S21 -->|calls| T21
  S22["method:UIButton::initByStyle3<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T22["method:FMBannerAdsModel::byBackgroundImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1640"]
  S22 -->|calls| T22
  S23["method:UIButton::initByStyle3<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T23["method:FMBannerAdsModel::byTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1478"]
  S23 -->|calls| T23
  S24["method:UIButton::initByStyle3<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T24["method:JXCategoryTimelineView::byTitleFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:19"]
  S24 -->|calls| T24
  S25["method:UIButton::initByStyle3<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T25["method:UIViewModel::byTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/UIViewModel/UIViewModel+DSL/UIViewModel+DSL.m:1199"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
