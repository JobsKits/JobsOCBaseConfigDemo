# `calls 符号关系 - 157`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsToggleNavView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:42"]
  T1["method:JobsToggleNavView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:42"]
  S1 -->|calls| T1
  S2["method:JobsToggleNavView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:49"]
  T2["method:JobsToggleNavView::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:26"]
  S2 -->|calls| T2
  S3["method:JobsToggleNavView::selectingOneTagByIndex<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:152"]
  T3["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S3 -->|calls| T3
  S4["method:JobsToggleNavView::selectingOneTagByIndex<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:152"]
  T4["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S4 -->|calls| T4
  S5["method:JobsToggleNavView::selectingOneTagByIndex<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:152"]
  T5["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S5 -->|calls| T5
  S6["method:JobsToggleNavView::selectingOneTagByIndex<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:152"]
  T6["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S6 -->|calls| T6
  S7["method:JobsToggleNavView::selectingOneTagByIndex<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:152"]
  T7["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S7 -->|calls| T7
  S8["method:JobsToggleNavView::selectingOneTagByIndex<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:152"]
  T8["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S8 -->|calls| T8
  S9["method:JobsToggleNavView::selectingOneTagByIndex<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:152"]
  T9["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S9 -->|calls| T9
  S10["method:JobsToggleNavView::selectingOneTagByIndex<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:152"]
  T10["method:UIButton::jobsResetBtnBgImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:414"]
  S10 -->|calls| T10
  S11["method:JobsToggleNavView::sliderView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:200"]
  T11["method:UIView::resetCenterX<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:335"]
  S11 -->|calls| T11
  S12["method:JobsToggleNavView::sliderView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:200"]
  T12["method:UIView::resetOriginY<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:246"]
  S12 -->|calls| T12
  S13["method:JobsToggleNavView::buttonModel<br/>JobsByPods/JobsOCTools@Pods/Core/JobsToggleView/JobsToggleNavView/JobsToggleNavView.m:238"]
  T13["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  S13 -->|calls| T13
  S14["method:JobsUserHeaderDataViewForHeaderInSection::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:19"]
  T14["method:JobsUserHeaderDataViewForHeaderInSection::init<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:19"]
  S14 -->|calls| T14
  S15["method:JobsUserHeaderDataViewForHeaderInSection::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:35"]
  T15["method:JobsUserHeaderDataViewForHeaderInSection::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:35"]
  S15 -->|calls| T15
  S16["method:JobsUserHeaderDataViewForHeaderInSection::titleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewForHeaderInSection/JobsUserHeaderDataViewForHeaderInSection.m:56"]
  T16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S16 -->|calls| T16
  S17["method:JobsUserHeaderDataViewTBVCell::cellStyleValue1WithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:29"]
  T17["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S17 -->|calls| T17
  S18["method:JobsUserHeaderDataViewTBVCell::cellStyleValue2WithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:38"]
  T18["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S18 -->|calls| T18
  S19["method:JobsUserHeaderDataViewTBVCell::cellStyleSubtitleWithTableView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:47"]
  T19["method:UITableView::tableViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UITableView/UITableView+RegisterClass/UITableView+RegisterClass.m:62"]
  S19 -->|calls| T19
  S20["method:JobsUserHeaderDataViewTBVCell::titleLab<br/>JobsByPods/JobsOCTools@Pods/Core/JobsUserHeaderDataChoice/JobsUserHeaderDataViewTBVCell/JobsUserHeaderDataViewTBVCell.m:76"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:JobsWelcomeVC::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:25"]
  T21["method:JobsWelcomeVC::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:25"]
  S21 -->|calls| T21
  S22["method:JobsWelcomeVC::loadView<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:25"]
  T22["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S22 -->|calls| T22
  S23["method:JobsWelcomeVC::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:47"]
  T23["method:JobsWelcomeVC::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:47"]
  S23 -->|calls| T23
  S24["method:JobsWelcomeVC::viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:47"]
  T24["method:JobsWelcomeVC::loadPhoto<br/>JobsByPods/JobsOCTools@Pods/Core/JobsWelcomeVC/JobsWelcomeVC.m:69"]
  S24 -->|calls| T24
  S25["method:LongPressToDeleteImageView::init<br/>JobsByPods/JobsOCTools@Pods/Core/LongPressToDeleteImageView/LongPressToDeleteImageView.m:14"]
  T25["method:LongPressToDeleteImageView::init<br/>JobsByPods/JobsOCTools@Pods/Core/LongPressToDeleteImageView/LongPressToDeleteImageView.m:14"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
