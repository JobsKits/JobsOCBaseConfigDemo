# `calls 符号关系 - 015`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseCollectionView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:17"]
  T1["method:BaseCollectionView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:17"]
  S1 -->|calls| T1
  S2["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  T2["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  S2 -->|calls| T2
  S3["method:BaseCollectionView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:39"]
  T3["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S3 -->|calls| T3
  S4["method:BaseCollectionView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:47"]
  T4["method:BaseCollectionView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:47"]
  S4 -->|calls| T4
  S5["method:JobsBtnsStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:34"]
  T5["method:JobsBtnsStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:34"]
  S5 -->|calls| T5
  S6["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T6["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S6 -->|calls| T6
  S7["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T7["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S7 -->|calls| T7
  S8["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T8["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S8 -->|calls| T8
  S9["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T9["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S9 -->|calls| T9
  S10["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T10["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S10 -->|calls| T10
  S11["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T11["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T12["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S12 -->|calls| T12
  S13["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T13["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S13 -->|calls| T13
  S14["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T14["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S14 -->|calls| T14
  S15["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T15["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:372"]
  S15 -->|calls| T15
  S16["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T16["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S16 -->|calls| T16
  S17["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T17["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T18["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S18 -->|calls| T18
  S19["method:JobsTextFieldStyleCVCell::textField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextFieldStyleCVCell/JobsTextFieldStyleCVCell.m:81"]
  T19["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S19 -->|calls| T19
  S20["method:JobsTextViewStyleCVCell::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:104"]
  T20["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S20 -->|calls| T20
  S21["method:JobsTextViewStyleCVCell::jobsTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:130"]
  T21["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S21 -->|calls| T21
  S22["method:HQCollectionViewFlowLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:12"]
  T22["method:HQCollectionViewFlowLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:12"]
  S22 -->|calls| T22
  S23["method:HQCollectionViewFlowLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:22"]
  T23["method:TMSCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:65"]
  S23 -->|calls| T23
  S24["method:HQCollectionViewFlowLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:22"]
  T24["method:JobsTuple::new<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:27"]
  S24 -->|calls| T24
  S25["method:KFZShopCatoryFlowLayput::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/KFZShopCatoryFlowLayput/KFZShopCatoryFlowLayput.m:50"]
  T25["method:KFZShopCatoryFlowLayput::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/KFZShopCatoryFlowLayput/KFZShopCatoryFlowLayput.m:50"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
