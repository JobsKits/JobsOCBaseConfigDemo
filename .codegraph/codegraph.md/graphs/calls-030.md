# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  T1["method:UIBackgroundConfiguration::byCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:20"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  T2["method:UIView::cornerCutToCircleWithCornerRadius<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:47"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsResetBtnLayerBorderCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:498"]
  T3["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsResetBtnLayerBorderCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:498"]
  T4["method:UIBackgroundConfiguration::byStrokeColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:47"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsResetBtnLayerBorderWidth<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:514"]
  T5["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsResetBtnLayerBorderWidth<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:514"]
  T6["method:UIBackgroundConfiguration::byStrokeWidth<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:56"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsResetBtnNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:528"]
  T7["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsResetBtnNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:528"]
  T8["method:UIButtonConfiguration::byAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:183"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsResetBtnNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:528"]
  T9["method:UIButton::normalStateAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:701"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsResetBtnNormalAttributedSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:542"]
  T10["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsResetBtnNormalAttributedSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:542"]
  T11["method:UIButtonConfiguration::byAttributedSubtitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:219"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:556"]
  T12["method:UIButton::jobsResetBtnNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:528"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:556"]
  T13["method:NSAttributedString::removeHyperlinks<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:65"]
  S13 -->|calls| T13
  S14["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:556"]
  T14["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:48"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:556"]
  T15["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:556"]
  T16["method:UITextView::byAttributedText<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:98"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsResetBtnTextViewNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:556"]
  T17["method:UIButton::jobsResetBtnNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:528"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:569"]
  T18["method:UIButton::jobsResetBtnNormalAttributedSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:542"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:569"]
  T19["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:48"]
  S19 -->|calls| T19
  S20["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:569"]
  T20["method:ASDisplayNode::byFrame<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:20"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:569"]
  T21["method:UITextView::byAttributedText<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:98"]
  S21 -->|calls| T21
  S22["method:UIButton::jobsResetBtnTextViewNormalAttributedSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:569"]
  T22["method:UIButton::jobsResetBtnNormalAttributedSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:542"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  T23["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  T24["method:UIButtonConfiguration::byImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:282"]
  S24 -->|calls| T24
  S25["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  T25["method:UIButtonConfiguration::byImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:273"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
