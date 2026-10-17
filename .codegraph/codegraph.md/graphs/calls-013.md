# `calls 符号关系 - 013`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T1["method:FMBannerAdsModel::byNormalImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1649"]
  S1 -->|calls| T1
  S2["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T2["method:FMBannerAdsModel::byHighlightImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1667"]
  S2 -->|calls| T2
  S3["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T3["method:FMBannerAdsModel::byHighlightBackgroundImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1658"]
  S3 -->|calls| T3
  S4["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S4 -->|calls| T4
  S5["method:NSObject::initByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:148"]
  T5["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S5 -->|calls| T5
  S6["method:NSObject::mjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:193"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T7["function:jobsMakeRefreshConfigModel<br/>JobsByPods/JobsModel@Pods/Core/3rd/MJRefreshConfigModel/MJRefreshConfigModel.h:93"]
  S7 -->|calls| T7
  S8["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T8["method:MJRefreshConfigModel::byAutomaticallyChangeAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:182"]
  S8 -->|calls| T8
  S9["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T9["method:MJRefreshConfigModel::byNoMoreDataTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:110"]
  S9 -->|calls| T9
  S10["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T10["method:MJRefreshConfigModel::byWillRefreshTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:101"]
  S10 -->|calls| T10
  S11["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T11["method:MJRefreshConfigModel::byRefreshingTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:92"]
  S11 -->|calls| T11
  S12["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T12["method:MJRefreshConfigModel::byPullingTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:83"]
  S12 -->|calls| T12
  S13["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  T13["method:MJRefreshConfigModel::byStateIdleTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:74"]
  S13 -->|calls| T13
  S14["method:NSObject::refreshHeaderDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:214"]
  T14["method:MJRefreshConfigModel::byLoadBlock<br/>JobsByPods/JobsModel@Pods/Core/3rd/MJRefreshConfigModel/MJRefreshConfigModel.m:15"]
  S14 -->|calls| T14
  S15["method:NSObject::refreshHeaderDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:214"]
  T15["method:NSObject::jobsMjHeaderDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:198"]
  S15 -->|calls| T15
  S16["method:NSObject::mjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:223"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T17["function:jobsMakeRefreshConfigModel<br/>JobsByPods/JobsModel@Pods/Core/3rd/MJRefreshConfigModel/MJRefreshConfigModel.h:93"]
  S17 -->|calls| T17
  S18["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T18["method:MJRefreshConfigModel::byAutomaticallyChangeAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:182"]
  S18 -->|calls| T18
  S19["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T19["method:MJRefreshConfigModel::byNoMoreDataTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:110"]
  S19 -->|calls| T19
  S20["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T20["method:MJRefreshConfigModel::byWillRefreshTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:101"]
  S20 -->|calls| T20
  S21["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T21["method:MJRefreshConfigModel::byRefreshingTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:92"]
  S21 -->|calls| T21
  S22["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T22["method:MJRefreshConfigModel::byPullingTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:83"]
  S22 -->|calls| T22
  S23["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T23["method:MJRefreshConfigModel::byStateIdleTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:74"]
  S23 -->|calls| T23
  S24["method:NSObject::refreshFooterDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:244"]
  T24["method:MJRefreshConfigModel::byLoadBlock<br/>JobsByPods/JobsModel@Pods/Core/3rd/MJRefreshConfigModel/MJRefreshConfigModel.m:15"]
  S24 -->|calls| T24
  S25["method:NSObject::refreshFooterDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:244"]
  T25["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
