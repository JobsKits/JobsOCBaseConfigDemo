# `calls 符号关系 - 028`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T1["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S1 -->|calls| T1
  S2["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T2["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S2 -->|calls| T2
  S3["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T3["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S3 -->|calls| T3
  S4["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T4["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S4 -->|calls| T4
  S5["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T5["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S5 -->|calls| T5
  S6["method:JobsHeaderFooterView::subTitleBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionReusableView/JobsHeaderFooterView/JobsHeaderFooterView.m:111"]
  T6["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:BaseCollectionView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:17"]
  T7["method:BaseCollectionView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:17"]
  S7 -->|calls| T7
  S8["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  T8["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  S8 -->|calls| T8
  S9["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  T9["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S9 -->|calls| T9
  S10["method:BaseCollectionView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:47"]
  T10["method:BaseCollectionView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:47"]
  S10 -->|calls| T10
  S11["method:JobsBtnsStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:34"]
  T11["method:JobsBtnsStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:34"]
  S11 -->|calls| T11
  S12["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T12["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S12 -->|calls| T12
  S13["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T13["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S13 -->|calls| T13
  S14["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T14["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S14 -->|calls| T14
  S15["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T15["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S15 -->|calls| T15
  S16["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T16["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S16 -->|calls| T16
  S17["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T17["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T18["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S18 -->|calls| T18
  S19["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T19["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S19 -->|calls| T19
  S20["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T20["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S20 -->|calls| T20
  S21["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T21["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:372"]
  S21 -->|calls| T21
  S22["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T22["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S22 -->|calls| T22
  S23["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T23["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T24["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S24 -->|calls| T24
  S25["method:JobsTextFieldStyleCVCell::textField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextFieldStyleCVCell/JobsTextFieldStyleCVCell.m:81"]
  T25["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
