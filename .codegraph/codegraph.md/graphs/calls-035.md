# `calls 符号关系 - 035`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsBtnsStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:34"]
  T1["method:JobsBtnsStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:34"]
  S1 -->|calls| T1
  S2["method:JobsBtnsStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:38"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:JobsBtnsStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:38"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:JobsBtnsStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:38"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:JobsBtnsStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:38"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S5 -->|calls| T5
  S6["method:JobsBtnsStyleCVCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:69"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T7["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S7 -->|calls| T7
  S8["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T8["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S8 -->|calls| T8
  S9["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T9["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S9 -->|calls| T9
  S10["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T10["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S10 -->|calls| T10
  S11["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T11["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S11 -->|calls| T11
  S12["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T13["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:JobsBtnsStyleCVCell::leftBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:80"]
  T14["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S14 -->|calls| T14
  S15["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T15["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S15 -->|calls| T15
  S16["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T16["method:UIButton::jobsResetBtnTitleCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:327"]
  S16 -->|calls| T16
  S17["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T17["method:UIButton::jobsResetBtnSubTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:372"]
  S17 -->|calls| T17
  S18["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T18["method:UIButton::jobsResetBtnImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:402"]
  S18 -->|calls| T18
  S19["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T20["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:JobsBtnsStyleCVCell::rightBtn<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnsStyleCVCell/JobsBtnsStyleCVCell.m:133"]
  T21["method:UIButton::jobsResetBtnBgCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:428"]
  S21 -->|calls| T21
  S22["method:JobsImageViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsImageViewStyleCVCell/JobsImageViewStyleCVCell.m:30"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:JobsImageViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsImageViewStyleCVCell/JobsImageViewStyleCVCell.m:30"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:JobsImageViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsImageViewStyleCVCell/JobsImageViewStyleCVCell.m:30"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsImageViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsImageViewStyleCVCell/JobsImageViewStyleCVCell.m:30"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
