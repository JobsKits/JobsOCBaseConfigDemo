# `calls 符号关系 - 033`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T1["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S1 -->|calls| T1
  S2["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T2["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:JobsHeaderFooterView::titleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:62"]
  T3["method:UIButton::jobsResetAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:280"]
  S3 -->|calls| T3
  S4["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T4["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S4 -->|calls| T4
  S5["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T5["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S5 -->|calls| T5
  S6["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T6["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S6 -->|calls| T6
  S7["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T7["method:UIButton::jobsResetTitlePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:112"]
  S7 -->|calls| T7
  S8["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T8["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S8 -->|calls| T8
  S9["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T9["method:UIButton::jobsResetTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:300"]
  S9 -->|calls| T9
  S10["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T10["method:UIButton::jobsResetSubTitleLineBreakMode<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:310"]
  S10 -->|calls| T10
  S11["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T11["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:390"]
  S11 -->|calls| T11
  S12["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T12["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S12 -->|calls| T12
  S13["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T13["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T14["method:UIButton::jobsResetAttributedTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:280"]
  S14 -->|calls| T14
  S15["method:TMSWalletCollectionReusableView::label<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/TMSWalletCollectionReusableView/TMSWalletCollectionReusableView.m:37"]
  T15["method:UILabel::byFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:21"]
  S15 -->|calls| T15
  S16["method:TMSWalletCollectionReusableView::label<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/TMSWalletCollectionReusableView/TMSWalletCollectionReusableView.m:37"]
  T16["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S16 -->|calls| T16
  S17["method:TMSWalletCollectionReusableView::label<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/TMSWalletCollectionReusableView/TMSWalletCollectionReusableView.m:37"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:TMSWalletCollectionReusableView::label<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/TMSWalletCollectionReusableView/TMSWalletCollectionReusableView.m:37"]
  T18["method:UILabel::byText<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UILabel/UILabel+DSL/UILabel+DSL.m:39"]
  S18 -->|calls| T18
  S19["method:BaseCollectionView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:17"]
  T19["method:BaseCollectionView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:17"]
  S19 -->|calls| T19
  S20["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  T20["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  S20 -->|calls| T20
  S21["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  T21["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S21 -->|calls| T21
  S22["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  T22["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S22 -->|calls| T22
  S23["method:BaseCollectionView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:47"]
  T23["method:BaseCollectionView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:47"]
  S23 -->|calls| T23
  S24["method:BaseCollectionViewCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:34"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:BaseCollectionViewCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:34"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
