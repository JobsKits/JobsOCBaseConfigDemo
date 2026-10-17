# `calls 符号关系 - 023`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T1["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S1 -->|calls| T1
  S2["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T2["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  S2 -->|calls| T2
  S3["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T3["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S3 -->|calls| T3
  S4["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T4["method:UIButtonConfiguration::byImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:273"]
  S4 -->|calls| T4
  S5["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T5["method:FMBannerAdsModel::byBackgroundImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1640"]
  S5 -->|calls| T5
  S6["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T6["method:FMBannerAdsModel::byTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1478"]
  S6 -->|calls| T6
  S7["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T7["method:JXCategoryTimelineView::byTitleFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:19"]
  S7 -->|calls| T7
  S8["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T8["method:UIButtonConfiguration::byTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:174"]
  S8 -->|calls| T8
  S9["method:UIButton::initByStyle4<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T9["method:UIViewModel::byImage<br/>JobsByPods/JobsModelDSL@Pods/Core/UIViewModel/UIViewModel+DSL/UIViewModel+DSL.m:497"]
  S9 -->|calls| T9
  S10["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T10["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S10 -->|calls| T10
  S11["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T11["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  S11 -->|calls| T11
  S12["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T12["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S12 -->|calls| T12
  S13["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T13["method:UIButtonConfiguration::byImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:282"]
  S13 -->|calls| T13
  S14["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T14["method:UIButtonConfiguration::byImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:273"]
  S14 -->|calls| T14
  S15["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T15["method:FMBannerAdsModel::byTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1478"]
  S15 -->|calls| T15
  S16["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T16["method:JXCategoryTimelineView::byTitleFont<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:19"]
  S16 -->|calls| T16
  S17["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T17["method:UIButtonConfiguration::byTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:174"]
  S17 -->|calls| T17
  S18["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  T18["method:UIViewModel::byImage<br/>JobsByPods/JobsModelDSL@Pods/Core/UIViewModel/UIViewModel+DSL/UIViewModel+DSL.m:497"]
  S18 -->|calls| T18
  S19["method:UIButton::initByStyleTop<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:259"]
  T19["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  S19 -->|calls| T19
  S20["method:UIButton::initByStyleLeft<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:271"]
  T20["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  S20 -->|calls| T20
  S21["method:UIButton::initByStyleBottom<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:283"]
  T21["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  S21 -->|calls| T21
  S22["method:UIButton::initByStyleRight<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:295"]
  T22["method:UIButton::initByStyle5<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:239"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  T23["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  T24["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S24 -->|calls| T24
  S25["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  T25["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
