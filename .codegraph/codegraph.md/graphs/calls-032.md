# `calls 符号关系 - 032`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::_jobsResetTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:74"]
  T1["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S1 -->|calls| T1
  S2["method:UIButton::_jobsResetTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:74"]
  T2["function:JobsAttributedStringByAttributes<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:37"]
  S2 -->|calls| T2
  S3["method:UIButton::_jobsResetTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:74"]
  T3["function:jobsMakeTextView::jobsMakeMutDic<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:809"]
  S3 -->|calls| T3
  S4["method:UIButton::_jobsResetTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:74"]
  T4["method:NSMutableArray::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIButton::_jobsResetTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:74"]
  T5["method:NSMutableDictionary::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:11"]
  S5 -->|calls| T5
  S6["method:UIButton::_jobsResetTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:74"]
  T6["method:UIButton::getTitleColorByTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:228"]
  S6 -->|calls| T6
  S7["method:UIButton::_jobsResetTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:74"]
  T7["method:UIButton::getTitleFontByTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:217"]
  S7 -->|calls| T7
  S8["method:UIButton::_jobsResetTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:74"]
  T8["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsResetSubTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:93"]
  T9["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsResetSubTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:93"]
  T10["function:JobsAttributedStringByAttributes<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:37"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsResetSubTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:93"]
  T11["function:jobsMakeTextView::jobsMakeMutDic<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:809"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsResetSubTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:93"]
  T12["method:NSMutableArray::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetSubTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:93"]
  T13["method:NSMutableDictionary::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:11"]
  S13 -->|calls| T13
  S14["method:UIButton::jobsResetSubTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:93"]
  T14["method:UIButton::getTitleColorByTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:228"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsResetSubTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:93"]
  T15["method:UIButton::getTitleFontByTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:217"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsResetSubTitleTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:93"]
  T16["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsResetImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:110"]
  T17["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsResetImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:110"]
  T18["method:UIButtonConfiguration::byImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:273"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsResetImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:120"]
  T19["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S19 -->|calls| T19
  S20["method:UIButton::jobsResetImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:120"]
  T20["method:UIButtonConfiguration::byImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:282"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsResetTitlePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:130"]
  T21["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S21 -->|calls| T21
  S22["method:UIButton::jobsResetTitlePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:130"]
  T22["method:UIButtonConfiguration::byTitlePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:291"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsResetTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:145"]
  T23["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsResetTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:145"]
  T24["method:UIButtonConfiguration::byTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:300"]
  S24 -->|calls| T24
  S25["method:UIButton::jobsResetAutomaticallyUpdateForSelection<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:155"]
  T25["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
