# `calls 符号关系 - 021`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::initByTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T1["method:UIButtonModel::byTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:1514"]
  S1 -->|calls| T1
  S2["method:UIButton::initByAttributedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T2["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S2 -->|calls| T2
  S3["method:UIButton::initByAttributedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T3["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S3 -->|calls| T3
  S4["method:UIButton::initByAttributedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T4["function:jobsMakeButtonModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.h:91"]
  S4 -->|calls| T4
  S5["method:UIButton::initByAttributedString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T5["method:UIButtonModel::byAttributedTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:1091"]
  S5 -->|calls| T5
  S6["method:UIButton::initByNormalImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T6["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S6 -->|calls| T6
  S7["method:UIButton::initByNormalImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T7["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  S7 -->|calls| T7
  S8["method:UIButton::initByNormalImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T8["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S8 -->|calls| T8
  S9["method:UIButton::initByNormalImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T9["method:UIViewModel::byImage<br/>JobsByPods/JobsModelDSL@Pods/Core/UIViewModel/UIViewModel+DSL/UIViewModel+DSL.m:497"]
  S9 -->|calls| T9
  S10["method:UIButton::initByBackgroundImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T10["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S10 -->|calls| T10
  S11["method:UIButton::initByBackgroundImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T11["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  S11 -->|calls| T11
  S12["method:UIButton::initByBackgroundImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T12["function:jobsMakeViewModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIViewModel/UIViewModel.h:57"]
  S12 -->|calls| T12
  S13["method:UIButton::initByBackgroundImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T13["method:UIViewModel::byBackgroundImage<br/>JobsByPods/JobsModelDSL@Pods/Core/UIViewModel/UIViewModel+DSL/UIViewModel+DSL.m:1397"]
  S13 -->|calls| T13
  S14["method:UIButton::initByTitles<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T14["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S14 -->|calls| T14
  S15["method:UIButton::initByTitles<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T15["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S15 -->|calls| T15
  S16["method:UIButton::initByTitles<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T16["function:jobsMakeButtonModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.h:91"]
  S16 -->|calls| T16
  S17["method:UIButton::initByTitles<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T17["method:JobsDecorationModel::bySubTitle<br/>JobsByPods/JobsModel@Pods/Core/DAO/JobsDecorationModel/JobsDecorationModel.m:44"]
  S17 -->|calls| T17
  S18["method:UIButton::initByTitles<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T18["method:UIButtonModel::byTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:1514"]
  S18 -->|calls| T18
  S19["method:UIButton::initByAttributedStrings<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T19["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S19 -->|calls| T19
  S20["method:UIButton::initByAttributedStrings<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T20["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S20 -->|calls| T20
  S21["method:UIButton::initByAttributedStrings<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T21["function:jobsMakeButtonModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.h:91"]
  S21 -->|calls| T21
  S22["method:UIButton::initByAttributedStrings<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T22["method:FMBannerAdsModel::byAttributedSubTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1037"]
  S22 -->|calls| T22
  S23["method:UIButton::initByAttributedStrings<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T23["method:UIButtonModel::byAttributedTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:1091"]
  S23 -->|calls| T23
  S24["method:UIButton::initByTitle_font<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T24["method:UIButton::bgColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:501"]
  S24 -->|calls| T24
  S25["method:UIButton::initByTitle_font<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T25["method:UIButton::initByViewModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:316"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
