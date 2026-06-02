# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsImageViewStyleCVCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsImageViewStyleCVCell/JobsImageViewStyleCVCell.m:57"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:JobsImageViewStyleCVCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsImageViewStyleCVCell/JobsImageViewStyleCVCell.m:57"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:JobsTextFieldStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextFieldStyleCVCell/JobsTextFieldStyleCVCell.m:32"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:JobsTextFieldStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextFieldStyleCVCell/JobsTextFieldStyleCVCell.m:32"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:JobsTextFieldStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextFieldStyleCVCell/JobsTextFieldStyleCVCell.m:32"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S5 -->|calls| T5
  S6["method:JobsTextFieldStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextFieldStyleCVCell/JobsTextFieldStyleCVCell.m:32"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:JobsTextFieldStyleCVCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextFieldStyleCVCell/JobsTextFieldStyleCVCell.m:59"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["method:JobsTextFieldStyleCVCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextFieldStyleCVCell/JobsTextFieldStyleCVCell.m:59"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:JobsTextFieldStyleCVCell::textField<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextFieldStyleCVCell/JobsTextFieldStyleCVCell.m:81"]
  T9["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S9 -->|calls| T9
  S10["method:JobsTextLabStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextLabStyleCVCell/JobsTextLabStyleCVCell.m:23"]
  T10["method:JobsTextLabStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextLabStyleCVCell/JobsTextLabStyleCVCell.m:23"]
  S10 -->|calls| T10
  S11["method:JobsTextLabStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextLabStyleCVCell/JobsTextLabStyleCVCell.m:27"]
  T11["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S11 -->|calls| T11
  S12["method:JobsTextLabStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextLabStyleCVCell/JobsTextLabStyleCVCell.m:27"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:JobsTextLabStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextLabStyleCVCell/JobsTextLabStyleCVCell.m:27"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S13 -->|calls| T13
  S14["method:JobsTextLabStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextLabStyleCVCell/JobsTextLabStyleCVCell.m:27"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:JobsTextLabStyleCVCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextLabStyleCVCell/JobsTextLabStyleCVCell.m:54"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsTextViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:40"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S16 -->|calls| T16
  S17["method:JobsTextViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:40"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:JobsTextViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:40"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:JobsTextViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:40"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsTextViewStyleCVCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:67"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:JobsTextViewStyleCVCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:67"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:JobsTextViewStyleCVCell::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:104"]
  T22["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S22 -->|calls| T22
  S23["method:JobsTextViewStyleCVCell::jobsTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsTextViewStyleCVCell/JobsTextViewStyleCVCell.m:130"]
  T23["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S23 -->|calls| T23
  S24["method:TMSWalletCollectionViewCell::titleLabel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/TMSWalletCollectionViewCell/TMSWalletCollectionViewCell.m:45"]
  T24["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S24 -->|calls| T24
  S25["method:HQCollectionViewFlowLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:12"]
  T25["method:HQCollectionViewFlowLayout::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewFlowLayout/HQCollectionViewFlowLayout/HQCollectionViewFlowLayout.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
