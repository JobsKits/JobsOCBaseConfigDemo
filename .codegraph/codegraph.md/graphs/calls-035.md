# `calls 符号关系 - 035`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsResetContentInsets<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:398"]
  T1["method:UIButtonConfiguration::byContentInsets<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:264"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:408"]
  T2["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:408"]
  T3["method:UIButtonConfiguration::byBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:111"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:408"]
  T4["method:JobsAppDoorContentView::byConfiguration<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:114"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:408"]
  T5["method:UIButton::jobsResetTitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:308"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:408"]
  T6["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:408"]
  T7["method:UIButton::updateConfigBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:13"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsResetSubTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:433"]
  T8["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsResetSubTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:433"]
  T9["method:JobsAppDoorContentView::byConfiguration<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:114"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsResetSubTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:433"]
  T10["method:UIButton::jobsResetSubtitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:358"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsResetSubTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:433"]
  T11["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsResetSubTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:433"]
  T12["method:UIButton::updateConfigBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:13"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:457"]
  T13["method:UIButton::jobsResetTitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:308"]
  S13 -->|calls| T13
  S14["method:UIButton::jobsResetTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:457"]
  T14["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsResetSubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:465"]
  T15["method:UIButton::jobsResetSubtitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:358"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsResetSubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:465"]
  T16["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  S16 -->|calls| T16
  S17["method:UIButton::imageByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:20"]
  T17["method:UIButton::imageByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:12"]
  S17 -->|calls| T17
  S18["method:UIButton::imageByHighlightedState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:29"]
  T18["method:UIButton::imageByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:12"]
  S18 -->|calls| T18
  S19["method:UIButton::imageByDisabledState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:38"]
  T19["method:UIButton::imageByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:12"]
  S19 -->|calls| T19
  S20["method:UIButton::imageBySelectedState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:47"]
  T20["method:UIButton::imageByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:12"]
  S20 -->|calls| T20
  S21["method:UIButton::imageByFocusedState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:56"]
  T21["method:UIButton::imageByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:12"]
  S21 -->|calls| T21
  S22["method:UIButton::imageByApplicationState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:65"]
  T22["method:UIButton::imageByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:12"]
  S22 -->|calls| T22
  S23["method:UIButton::imageByReservedState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:74"]
  T23["method:UIButton::imageByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:12"]
  S23 -->|calls| T23
  S24["method:UIButton::backgroundImageByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:164"]
  T24["method:UIButton::backgroundImageByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:156"]
  S24 -->|calls| T24
  S25["method:UIButton::backgroundImageByHighlightedState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:173"]
  T25["method:UIButton::backgroundImageByState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:156"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
