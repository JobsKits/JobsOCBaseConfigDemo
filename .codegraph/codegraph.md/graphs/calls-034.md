# `calls 符号关系 - 034`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsResetTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:278"]
  T1["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsResetTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:278"]
  T2["method:UIButtonConfiguration::byTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:174"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsResetSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:288"]
  T3["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsResetSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:288"]
  T4["method:UIButtonConfiguration::bySubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:210"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsResetAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:298"]
  T5["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsResetAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:298"]
  T6["method:UIButtonConfiguration::byAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:183"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsResetTitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:308"]
  T7["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsResetTitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:308"]
  T8["method:UIButtonConfiguration::byTitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:192"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsResetTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:318"]
  T9["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsResetTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:318"]
  T10["method:UIButtonConfiguration::byTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:201"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsResetSubTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:328"]
  T11["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsResetSubTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:328"]
  T12["method:UIButtonConfiguration::bySubtitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:237"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetSubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:338"]
  T13["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S13 -->|calls| T13
  S14["method:UIButton::jobsResetSubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:338"]
  T14["method:UIButtonConfiguration::bySubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:210"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsResetAttributedSubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:348"]
  T15["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsResetAttributedSubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:348"]
  T16["method:UIButtonConfiguration::byAttributedSubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:219"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsResetSubtitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:358"]
  T17["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsResetSubtitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:358"]
  T18["method:UIButtonConfiguration::bySubtitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:228"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsResetSubtitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:368"]
  T19["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S19 -->|calls| T19
  S20["method:UIButton::jobsResetSubtitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:368"]
  T20["method:UIButtonConfiguration::bySubtitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:237"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsResetIndicator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:378"]
  T21["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S21 -->|calls| T21
  S22["method:UIButton::jobsResetIndicator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:378"]
  T22["method:UIButtonConfiguration::byIndicator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:246"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsResetIndicatorColorTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:388"]
  T23["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsResetIndicatorColorTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:388"]
  T24["method:UIButtonConfiguration::byIndicatorColorTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:255"]
  S24 -->|calls| T24
  S25["method:UIButton::jobsResetContentInsets<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:398"]
  T25["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
