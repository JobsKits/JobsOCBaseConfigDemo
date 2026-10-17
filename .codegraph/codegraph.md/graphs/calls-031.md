# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsResetImagePlacement_Padding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:584"]
  T1["method:UIButton::layoutButtonWithEdgeInsetsStyle:imagePadding:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+ImageTitleSpacing/UIButton+ImageTitleSpacing.m:11"]
  S1 -->|calls| T1
  S2["method:UIButton::imageForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:598"]
  T2["method:UIButton::imageByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:20"]
  S2 -->|calls| T2
  S3["method:UIButton::imageForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:598"]
  T3["method:UIButton::imageByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:20"]
  S3 -->|calls| T3
  S4["method:UIButton::backgroundImageForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:609"]
  T4["method:UIButton::backgroundImageByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:164"]
  S4 -->|calls| T4
  S5["method:UIButton::backgroundImageForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:609"]
  T5["method:UIButton::backgroundImageByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:164"]
  S5 -->|calls| T5
  S6["method:UIButton::titleForConfigurationAttributedText<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:620"]
  T6["method:UIButton::titleForConfigurationAttributed<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:629"]
  S6 -->|calls| T6
  S7["method:UIButton::attributedTitleForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:640"]
  T7["method:UIButton::attributedTitleByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:629"]
  S7 -->|calls| T7
  S8["method:UIButton::attributedTitleForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:640"]
  T8["method:UIButton::attributedTitleByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:629"]
  S8 -->|calls| T8
  S9["method:UIButton::titleForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:651"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsTitleForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:654"]
  T10["method:UIButton::titleByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:472"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsTitleForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:654"]
  T11["method:UIButton::titleByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:472"]
  S11 -->|calls| T11
  S12["method:UIButton::titleColorForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:665"]
  T12["method:UIButton::titleColorByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:308"]
  S12 -->|calls| T12
  S13["method:UIButton::titleColorForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:665"]
  T13["method:UIButton::titleColorByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:308"]
  S13 -->|calls| T13
  S14["method:UIButton::titleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:688"]
  T14["method:UIButton::getTitleFontByTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:217"]
  S14 -->|calls| T14
  S15["method:UIButton::subTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:698"]
  T15["method:UIButton::getTitleFontByTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:217"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsSetBtnTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:23"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsSetBtnTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:23"]
  T17["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsSetBtnSubTitleFont:btnSubTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:29"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsSetBtnSubTitleFont:btnSubTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:29"]
  T19["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  S19 -->|calls| T19
  S20["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  T20["function:jobsMakePlainBtnConfig<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:205"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  T21["method:JobsAppDoorContentView::byConfiguration<br/>JobsByPods/JobsAppDoor@Pods/Core/JobsAppDoorStyle1/View/JobsAppDoorContentView/JobsAppDoorContentView.m:114"]
  S21 -->|calls| T21
  S22["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  T22["method:UIButton::updateConfigBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:13"]
  S22 -->|calls| T22
  S23["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  T23["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S23 -->|calls| T23
  S24["method:UIButton::JobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:55"]
  T24["method:UIButton::updateConfigBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:13"]
  S24 -->|calls| T24
  S25["method:UIButton::jobsUpdateButtonConfigurationBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:66"]
  T25["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
