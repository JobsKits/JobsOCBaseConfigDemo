# `calls 符号关系 - 029`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T1["method:UIButtonConfiguration::byAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:183"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T2["function:JobsAttributedStringByAttributes<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:37"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T3["method:UIButton::jobsTitleForNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:654"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T4["function:jobsMakeTextView::jobsMakeMutDic<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:809"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T5["method:NSMutableArray::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T6["method:UIButton::titleColorByNormalState<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:308"]
  S6 -->|calls| T6
  S7["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T7["method:NSMutableDictionary::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:11"]
  S7 -->|calls| T7
  S8["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T8["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  S8 -->|calls| T8
  S9["method:UIButton::jobsResetBtnTitleAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:387"]
  T9["method:UITextView::byTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:33"]
  S9 -->|calls| T9
  S10["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:407"]
  T10["method:UIButton::jobsResetSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:288"]
  S10 -->|calls| T10
  S11["method:UIButton::jobsResetBtnSubTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:416"]
  T11["method:UIButton::jobsResetSubTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:433"]
  S11 -->|calls| T11
  S12["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:425"]
  T12["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S12 -->|calls| T12
  S13["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:425"]
  T13["method:UIButtonConfiguration::bySubtitleTextAttributesTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:228"]
  S13 -->|calls| T13
  S14["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:425"]
  T14["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:204"]
  S14 -->|calls| T14
  S15["method:UIButton::jobsResetBtnSubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:425"]
  T15["method:UIButton::getTitleColorByTransformer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:228"]
  S15 -->|calls| T15
  S16["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:437"]
  T16["method:UIButton::jobsResetImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:228"]
  S16 -->|calls| T16
  S17["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:437"]
  T17["method:UIButton::normalStateImageBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:83"]
  S17 -->|calls| T17
  S18["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:449"]
  T18["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S18 -->|calls| T18
  S19["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:449"]
  T19["method:UIBackgroundConfiguration::byImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:65"]
  S19 -->|calls| T19
  S20["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:449"]
  T20["method:UIButton::normalStateBackgroundImageBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:227"]
  S20 -->|calls| T20
  S21["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:463"]
  T21["method:UIButton::jobsResetBaseBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:215"]
  S21 -->|calls| T21
  S22["method:UIButton::jobsResetBtnLayerBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:475"]
  T22["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  S22 -->|calls| T22
  S23["method:UIButton::jobsResetBtnLayerBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:475"]
  T23["method:UIButton::jobsResetBtnLayerBorderWidth<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:514"]
  S23 -->|calls| T23
  S24["method:UIButton::jobsResetBtnLayerBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:475"]
  T24["method:UIButton::jobsResetBtnLayerBorderCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:498"]
  S24 -->|calls| T24
  S25["method:UIButton::jobsResetBtnCornerRadiusValue<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:485"]
  T25["method:UIButton::jobsUpdateButtonConfiguration<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
