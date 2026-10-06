# `calls 符号关系 - 013`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T1["method:FMBannerAdsModel::bySelectedTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1577"]
  S1 -->|calls| T1
  S2["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T2["method:FMBannerAdsModel::byTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1478"]
  S2 -->|calls| T2
  S3["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T3["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S3 -->|calls| T3
  S4["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T4["method:UIButtonConfiguration::byTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:174"]
  S4 -->|calls| T4
  S5["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T5["method:UIButtonConfiguration::byBaseBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:120"]
  S5 -->|calls| T5
  S6["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T6["method:FMBannerAdsModel::byNormalImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1649"]
  S6 -->|calls| T6
  S7["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T7["method:FMBannerAdsModel::byHighlightImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1667"]
  S7 -->|calls| T7
  S8["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T8["method:FMBannerAdsModel::byHighlightBackgroundImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1658"]
  S8 -->|calls| T8
  S9["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S9 -->|calls| T9
  S10["method:NSObject::initByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:148"]
  T10["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S10 -->|calls| T10
  S11["method:NSObject::mjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:193"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T12["function:jobsMakeRefreshConfigModel<br/>JobsByPods/JobsModel@Pods/Core/3rd/MJRefreshConfigModel/MJRefreshConfigModel.h:93"]
  S12 -->|calls| T12
  S13["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T13["method:MJRefreshConfigModel::byAutomaticallyChangeAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:182"]
  S13 -->|calls| T13
  S14["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T14["method:MJRefreshConfigModel::byNoMoreDataTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:110"]
  S14 -->|calls| T14
  S15["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T15["method:MJRefreshConfigModel::byWillRefreshTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:101"]
  S15 -->|calls| T15
  S16["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T16["method:MJRefreshConfigModel::byRefreshingTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:92"]
  S16 -->|calls| T16
  S17["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T17["method:MJRefreshConfigModel::byPullingTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:83"]
  S17 -->|calls| T17
  S18["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T18["method:MJRefreshConfigModel::byStateIdleTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:74"]
  S18 -->|calls| T18
  S19["method:NSObject::refreshHeaderDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:214"]
  T19["method:MJRefreshConfigModel::byLoadBlock<br/>JobsByPods/JobsModel@Pods/Core/3rd/MJRefreshConfigModel/MJRefreshConfigModel.m:15"]
  S19 -->|calls| T19
  S20["method:NSObject::refreshHeaderDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:214"]
  T20["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  S20 -->|calls| T20
  S21["method:NSObject::mjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:223"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T22["function:jobsMakeRefreshConfigModel<br/>JobsByPods/JobsModel@Pods/Core/3rd/MJRefreshConfigModel/MJRefreshConfigModel.h:93"]
  S22 -->|calls| T22
  S23["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T23["method:MJRefreshConfigModel::byAutomaticallyChangeAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:182"]
  S23 -->|calls| T23
  S24["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T24["method:MJRefreshConfigModel::byNoMoreDataTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:110"]
  S24 -->|calls| T24
  S25["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T25["method:MJRefreshConfigModel::byWillRefreshTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:101"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
