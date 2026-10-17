# `calls 符号关系 - 012`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T1["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:114"]
  S1 -->|calls| T1
  S2["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.h:1"]
  T2["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S2 -->|calls| T2
  S3["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.h:1"]
  T3["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S3 -->|calls| T3
  S4["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T4["method:UIImpactFeedbackGenerator::initMediumStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:37"]
  S4 -->|calls| T4
  S5["method:NSObject::playSoundEffect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:38"]
  T5["method:NSString::byFileFullName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:54"]
  S5 -->|calls| T5
  S6["method:NSObject::playSoundEffect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:38"]
  T6["method:NSString::jobsPathForResourceWithFullName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:41"]
  S6 -->|calls| T6
  S7["method:NSObject::playSoundEffect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:38"]
  T7["method:NSMutableArray::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSObject::playSoundEffect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:38"]
  T8["method:NSString::jobsURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  S8 -->|calls| T8
  S9["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T9["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S9 -->|calls| T9
  S10["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T10["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S10 -->|calls| T10
  S11["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T11["method:NSString::isContainsUrl<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:266"]
  S11 -->|calls| T11
  S12["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T12["method:NSObject::imageByDataURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:88"]
  S12 -->|calls| T12
  S13["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S13 -->|calls| T13
  S14["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S14 -->|calls| T14
  S15["method:NSObject::cor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:103"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSObject::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:107"]
  T16["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S16 -->|calls| T16
  S17["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T17["function:jobsMakeButtonModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.h:91"]
  S17 -->|calls| T17
  S18["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T18["method:UIButtonConfiguration::byImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:282"]
  S18 -->|calls| T18
  S19["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T19["method:UIButtonConfiguration::byImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:273"]
  S19 -->|calls| T19
  S20["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T20["method:FMBannerAdsModel::byRoundingCorners<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:272"]
  S20 -->|calls| T20
  S21["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T21["method:FMBannerAdsModel::bySelectedTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1577"]
  S21 -->|calls| T21
  S22["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T22["method:FMBannerAdsModel::byTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1478"]
  S22 -->|calls| T22
  S23["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T23["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S23 -->|calls| T23
  S24["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T24["method:UIButtonConfiguration::byTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:174"]
  S24 -->|calls| T24
  S25["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:116"]
  T25["method:UIButtonConfiguration::byBaseBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:120"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
