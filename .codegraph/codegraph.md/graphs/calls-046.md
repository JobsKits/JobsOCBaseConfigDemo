# `calls 符号关系 - 046`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  T1["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  S1 -->|calls| T1
  S2["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  T2["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S2 -->|calls| T2
  S3["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:55"]
  T3["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S3 -->|calls| T3
  S4["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:65"]
  T4["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseView/BaseView/BaseView.m:65"]
  S4 -->|calls| T4
  S5["method:BaseTableViewHeaderFooterView::initWithReuseIdentifier:<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:20"]
  T5["method:UIView::initByFrame<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  T6["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  S6 -->|calls| T6
  S7["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:BaseTableViewHeaderFooterView::heightForHeaderInSection<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:85"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:BaseTableViewHeaderFooterView::heightForFooterInSectionByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:91"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:JobsTBVHeaderFooterView::heightForHeaderInSection<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:43"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T11["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S11 -->|calls| T11
  S12["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T12["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S12 -->|calls| T12
  S13["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T13["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S13 -->|calls| T13
  S14["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T14["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S14 -->|calls| T14
  S15["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T15["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S15 -->|calls| T15
  S16["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T16["method:UIButton::jobsResetBtnNormalAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:493"]
  S16 -->|calls| T16
  S17["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T17["method:UIButton::selectedStateTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:374"]
  S17 -->|calls| T17
  S18["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T18["method:UIButton::selectedStateTitleColorBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:273"]
  S18 -->|calls| T18
  S19["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T19["method:UIButton::selectedAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:454"]
  S19 -->|calls| T19
  S20["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T20["method:UIButton::jobsResetBtnTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:338"]
  S20 -->|calls| T20
  S21["method:JobsTBVHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/JobsTBVHeaderFooterView/JobsTBVHeaderFooterView.m:80"]
  T21["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:JobsLinkageMenuView::initWithFrame:btnConfig:linkageMenuViewConfig:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:43"]
  T22["method:JobsMenuView::init<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:23"]
  S22 -->|calls| T22
  S23["method:JobsLinkageMenuView::initWithFrame:btnConfig:linkageMenuViewConfig:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:43"]
  T23["function:KindOfClsFromStr<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:27"]
  S23 -->|calls| T23
  S24["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T24["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S24 -->|calls| T24
  S25["method:JobsLinkageMenuView::choseMenu:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:92"]
  T25["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
