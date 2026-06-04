# `calls 符号关系 - 101`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsImageNumberView::apply_standard_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsImageNumberView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:277"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  T2["method:JobsPodspecKitForJobsLanMgr::standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:266"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsLanMgr::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:273"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  S4 -->|calls| T4
  S5["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsLanMgr@Pods/Support/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  T5["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  S5 -->|calls| T5
  S6["method:NSString::add<br/>JobsByPods/JobsLanMgr@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T6["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S6 -->|calls| T6
  S7["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T7["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S7 -->|calls| T7
  S8["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T8["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S8 -->|calls| T8
  S9["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T9["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S9 -->|calls| T9
  S10["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T10["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S10 -->|calls| T10
  S11["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T11["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S11 -->|calls| T11
  S12["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T12["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S12 -->|calls| T12
  S13["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T13["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S13 -->|calls| T13
  S14["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:91"]
  T14["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S14 -->|calls| T14
  S15["method:JobsLinkageMenuView::setTextColor:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:149"]
  T15["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S15 -->|calls| T15
  S16["method:JobsLinkageMenuView::setTextColor:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:149"]
  T16["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S16 -->|calls| T16
  S17["method:JobsLinkageMenuView::setTextSize:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:157"]
  T17["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S17 -->|calls| T17
  S18["method:JobsLinkageMenuView::lineView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:165"]
  T18["method:UIView::addSubview<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S18 -->|calls| T18
  S19["method:JobsLinkageMenuView::rightview<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:177"]
  T19["method:UIView::addSubview<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S19 -->|calls| T19
  S20["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:218"]
  T20["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S20 -->|calls| T20
  S21["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:218"]
  T21["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S21 -->|calls| T21
  S22["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:218"]
  T22["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S22 -->|calls| T22
  S23["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:218"]
  T23["method:UIView::addSubview<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  T24["method:JobsPodspecKitForJobsLinkageMenuView::standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:266"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T25["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:273"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
