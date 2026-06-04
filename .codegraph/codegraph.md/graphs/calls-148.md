# `calls 符号关系 - 148`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T1["method:JobsToggleBaseView::refreshScrollContentViews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:115"]
  S1 -->|calls| T1
  S2["method:JobsToggleBaseView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:64"]
  T2["method:JobsToggleBaseView::switchViewsBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:92"]
  S2 -->|calls| T2
  S3["method:JobsToggleBaseView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:82"]
  T3["method:JobsToggleBaseView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:76"]
  S3 -->|calls| T3
  S4["method:JobsToggleBaseView::makeTaggedNavViewBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:162"]
  T4["method:JobsToggleBaseView::makeTaggedNavViewSizeBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:102"]
  S4 -->|calls| T4
  S5["method:JobsToggleBaseView::makeTaggedNavViewBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:162"]
  T5["method:JobsToggleBaseView::makeTaggedNavViewSizeBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:102"]
  S5 -->|calls| T5
  S6["method:JobsToggleBaseView::taggedNavView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:211"]
  T6["method:JobsToggleBaseView::makeTaggedNavViewBy<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:162"]
  S6 -->|calls| T6
  S7["method:JobsToggleBaseView::tempLabs<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:250"]
  T7["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S7 -->|calls| T7
  S8["method:JobsToggleBaseView::taggedNavDatas<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:270"]
  T8["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S8 -->|calls| T8
  S9["method:JobsToggleBaseView::buttonModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleBaseView/JobsToggleBaseView.m:286"]
  T9["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  S9 -->|calls| T9
  S10["method:JobsUserHeaderDataViewForHeaderInSection::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:19"]
  T10["method:JobsUserHeaderDataViewForHeaderInSection::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:19"]
  S10 -->|calls| T10
  S11["method:JobsUserHeaderDataViewForHeaderInSection::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:35"]
  T11["method:JobsUserHeaderDataViewForHeaderInSection::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:35"]
  S11 -->|calls| T11
  S12["method:JobsUserHeaderDataViewForHeaderInSection::titleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:56"]
  T12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S12 -->|calls| T12
  S13["method:JobsUserHeaderDataViewTBVCell::cellStyleValue1WithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:29"]
  T13["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S13 -->|calls| T13
  S14["method:JobsUserHeaderDataViewTBVCell::cellStyleValue2WithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:38"]
  T14["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S14 -->|calls| T14
  S15["method:JobsUserHeaderDataViewTBVCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:47"]
  T15["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S15 -->|calls| T15
  S16["method:JobsUserHeaderDataViewTBVCell::titleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:76"]
  T16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S16 -->|calls| T16
  S17["method:JobsWelcomeVC::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:25"]
  T17["method:JobsWelcomeVC::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:25"]
  S17 -->|calls| T17
  S18["method:JobsWelcomeVC::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:25"]
  T18["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S18 -->|calls| T18
  S19["method:JobsWelcomeVC::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:47"]
  T19["method:JobsWelcomeVC::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:47"]
  S19 -->|calls| T19
  S20["method:JobsWelcomeVC::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:47"]
  T20["method:JobsWelcomeVC::loadPhoto<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:69"]
  S20 -->|calls| T20
  S21["method:LongPressToDeleteImageView::init<br/>JobsByPods/JobsOCTools@Pods/Core/LongPressToDeleteImageView/LongPressToDeleteImageView.m:14"]
  T21["method:LongPressToDeleteImageView::init<br/>JobsByPods/JobsOCTools@Pods/Core/LongPressToDeleteImageView/LongPressToDeleteImageView.m:14"]
  S21 -->|calls| T21
  S22["method:LongPressToDeleteImageView::init<br/>JobsByPods/JobsOCTools@Pods/Core/LongPressToDeleteImageView/LongPressToDeleteImageView.m:14"]
  T22["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S22 -->|calls| T22
  S23["method:LongPressToDeleteImageView::longPress:<br/>JobsByPods/JobsOCTools@Pods/Core/LongPressToDeleteImageView/LongPressToDeleteImageView.m:23"]
  T23["method:UITabBarItem::animation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBarItem/UITabBarItem+Category/UITabBarItem+TLAnimation/UITabBarItem+TLAnimation.m:20"]
  S23 -->|calls| T23
  S24["method:RYCuteView::init<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:37"]
  T24["method:RYCuteView::init<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:37"]
  S24 -->|calls| T24
  S25["method:RYCuteView::init<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:37"]
  T25["method:RYCuteView::commonInit<br/>JobsByPods/JobsOCTools@Pods/Core/RYCuteView/RYCuteView.m:56"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
