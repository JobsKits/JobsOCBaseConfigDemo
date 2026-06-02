# `calls 符号关系 - 034`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseCollectionViewCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:34"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:BaseCollectionViewCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:34"]
  T2["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S2 -->|calls| T2
  S3["method:BaseCollectionViewCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:52"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:BaseCollectionViewCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:52"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:JobsBaseCollectionViewCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBaseCollectionViewCell/JobsBaseCollectionViewCell.m:40"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S5 -->|calls| T5
  S6["method:JobsBaseCollectionViewCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBaseCollectionViewCell/JobsBaseCollectionViewCell.m:40"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:JobsBaseCollectionViewCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBaseCollectionViewCell/JobsBaseCollectionViewCell.m:40"]
  T7["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S7 -->|calls| T7
  S8["method:JobsBaseCollectionViewCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBaseCollectionViewCell/JobsBaseCollectionViewCell.m:40"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:JobsBaseCollectionViewCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBaseCollectionViewCell/JobsBaseCollectionViewCell.m:58"]
  T9["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S9 -->|calls| T9
  S10["method:JobsBaseCollectionViewCell::cellSizeByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBaseCollectionViewCell/JobsBaseCollectionViewCell.m:58"]
  T10["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S10 -->|calls| T10
  S11["method:JobsBtnTextViewStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:31"]
  T11["method:JobsBtnTextViewStyleCVCell::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:31"]
  S11 -->|calls| T11
  S12["method:JobsBtnTextViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:35"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:JobsBtnTextViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:35"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S13 -->|calls| T13
  S14["method:JobsBtnTextViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:35"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:JobsBtnTextViewStyleCVCell::cellWithCollectionView:forIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:35"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsBtnTextViewStyleCVCell::jobsRichElementsCollectionViewCellBy<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:52"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:JobsBtnTextViewStyleCVCell::jobsRichElementsCollectionViewCellBy<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:52"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:JobsBtnTextViewStyleCVCell::cellHeightByModel<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:103"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:JobsBtnTextViewStyleCVCell::button<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:143"]
  T19["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S19 -->|calls| T19
  S20["method:JobsBtnTextViewStyleCVCell::button<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:143"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:JobsBtnTextViewStyleCVCell::button<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:143"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:JobsBtnTextViewStyleCVCell::button<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:143"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:JobsBtnTextViewStyleCVCell::szTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:185"]
  T23["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S23 -->|calls| T23
  S24["method:JobsBtnTextViewStyleCVCell::jobsTextView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:210"]
  T24["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S24 -->|calls| T24
  S25["method:JobsBtnTextViewStyleCVCell::masonryBlock<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/JobsBtnTextViewStyleCVCell/JobsBtnTextViewStyleCVCell.m:235"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
