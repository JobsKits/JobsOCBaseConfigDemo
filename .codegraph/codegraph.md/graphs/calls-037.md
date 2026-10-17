# `calls 符号关系 - 037`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::attributedTitleByReservedState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:683"]
  T1["method:UIButton::attributedTitleByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:621"]
  S1 -->|calls| T1
  S2["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T2["method:UIButtonConfiguration::byAutomaticallyUpdateForSelection<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:309"]
  S2 -->|calls| T2
  S3["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T3["method:UIButtonConfiguration::byTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:300"]
  S3 -->|calls| T3
  S4["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T4["method:UIButtonConfiguration::byTitlePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:291"]
  S4 -->|calls| T4
  S5["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T5["method:UIButtonConfiguration::byImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:282"]
  S5 -->|calls| T5
  S6["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T6["method:UIButtonConfiguration::byImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:273"]
  S6 -->|calls| T6
  S7["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T7["method:UIButtonConfiguration::byContentInsets<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:264"]
  S7 -->|calls| T7
  S8["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T8["method:UIButtonConfiguration::bySubtitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:237"]
  S8 -->|calls| T8
  S9["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T9["method:UIButtonConfiguration::bySubtitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:228"]
  S9 -->|calls| T9
  S10["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T10["method:UIButtonConfiguration::byAttributedSubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:219"]
  S10 -->|calls| T10
  S11["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T11["method:UIButtonConfiguration::bySubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:210"]
  S11 -->|calls| T11
  S12["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T12["method:UIButtonConfiguration::byTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:201"]
  S12 -->|calls| T12
  S13["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T13["method:UIButtonConfiguration::byTitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:192"]
  S13 -->|calls| T13
  S14["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T14["method:UIButtonConfiguration::byAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:183"]
  S14 -->|calls| T14
  S15["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T15["method:UIButtonConfiguration::byTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:174"]
  S15 -->|calls| T15
  S16["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T16["method:UIButtonConfiguration::byActivityIndicatorColorTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:165"]
  S16 -->|calls| T16
  S17["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T17["method:UIButtonConfiguration::byShowsActivityIndicator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:156"]
  S17 -->|calls| T17
  S18["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T18["method:UIButtonConfiguration::byPreferredSymbolConfigurationForImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:147"]
  S18 -->|calls| T18
  S19["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T19["method:UIButtonConfiguration::byImageColorTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:138"]
  S19 -->|calls| T19
  S20["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T20["method:UIButtonConfiguration::byImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:129"]
  S20 -->|calls| T20
  S21["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T21["method:UIButtonConfiguration::byBaseBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:120"]
  S21 -->|calls| T21
  S22["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T22["method:UIButtonConfiguration::byBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:111"]
  S22 -->|calls| T22
  S23["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T23["method:UIButtonConfiguration::byMacIdiomStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:102"]
  S23 -->|calls| T23
  S24["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T24["method:UIButtonConfiguration::byButtonSize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:93"]
  S24 -->|calls| T24
  S25["method:UIButtonConfiguration::byButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:11"]
  T25["method:UIButtonConfiguration::byCornerStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:84"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
