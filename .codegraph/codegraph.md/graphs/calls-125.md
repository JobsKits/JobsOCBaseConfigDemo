# `calls 符号关系 - 125`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsHotLabelByMultiLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:33"]
  T1["method:JobsHotLabelByMultiLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:33"]
  S1 -->|calls| T1
  S2["method:JobsHotLabelByMultiLine::viewSizeByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:62"]
  T2["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S2 -->|calls| T2
  S3["method:JobsHotLabelByMultiLine::viewSizeByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:62"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:JobsHotLabelByMultiLine::viewSizeByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:62"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:JobsHotLabelByMultiLine::collectionView:cellForItemAtIndexPath:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:89"]
  T5["method:BaseCollectionViewCell::jobsRichElementsCollectionViewCellBy<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:58"]
  S5 -->|calls| T5
  S6["method:JobsHotLabelByMultiLine::collectionView:cellForItemAtIndexPath:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:89"]
  T6["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S6 -->|calls| T6
  S7["method:JobsHotLabelByMultiLine::collectionView:layout:referenceSizeForHeaderInSection:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:169"]
  T7["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S7 -->|calls| T7
  S8["method:JobsHotLabelByMultiLine::collectionView:layout:referenceSizeForHeaderInSection:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:169"]
  T8["method:BaiShaETProjVIPSubCVFooterView::collectionReusableViewSizeByModel<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@JXCategoryView下拉headerView变大/View/BaiShaETProjVIPSubCVFooterView/BaiShaETProjVIPSubCVFooterView.m:36"]
  S8 -->|calls| T8
  S9["method:JobsHotLabelByMultiLine::collectionView:layout:referenceSizeForFooterInSection:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:178"]
  T9["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S9 -->|calls| T9
  S10["method:JobsHotLabelByMultiLine::collectionView:layout:referenceSizeForFooterInSection:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:178"]
  T10["method:BaiShaETProjVIPSubCVFooterView::collectionReusableViewSizeByModel<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@JXCategoryView下拉headerView变大/View/BaiShaETProjVIPSubCVFooterView/BaiShaETProjVIPSubCVFooterView.m:36"]
  S10 -->|calls| T10
  S11["method:JobsHotLabelByMultiLine::collectionView:layout:sizeForItemAtIndexPath:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:187"]
  T11["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S11 -->|calls| T11
  S12["method:JobsHotLabelByMultiLine::collectionView:layout:insetForSectionAtIndex:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:208"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T13["method:UICollectionView::initByLayout<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:12"]
  S13 -->|calls| T13
  S14["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T14["method:UICollectionView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:48"]
  S14 -->|calls| T14
  S15["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T15["method:UICollectionView::registerCollectionViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:41"]
  S15 -->|calls| T15
  S16["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S16 -->|calls| T16
  S17["method:JobsHotLabelBySingleLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:24"]
  T17["method:JobsHotLabelBySingleLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:24"]
  S17 -->|calls| T17
  S18["method:JobsHotLabelBySingleLine::viewSizeByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:41"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:JobsHotLabelBySingleLine::viewSizeByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:41"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JobsHotLabelBySingleLine::jobsRichViewByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:47"]
  T20["method:JobsHotLabelBySingleLine::createHotLabelByArr<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:59"]
  S20 -->|calls| T20
  S21["method:JobsHotLabelBySingleLine::createHotLabelByArr<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:59"]
  T21["method:JobsHotLabelBySingleLine::configBtnBy<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:107"]
  S21 -->|calls| T21
  S22["method:JobsHotLabelBySingleLine::createHotLabelByArr<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:59"]
  T22["method:JobsHotLabelBySingleLine::useHighestValue<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:134"]
  S22 -->|calls| T22
  S23["method:JobsHotLabelBySingleLine::configBtnBy<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:107"]
  T23["method:UIButton::jobsResetBtnTitle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:316"]
  S23 -->|calls| T23
  S24["method:JobsHotLabelBySingleLine::configBtnBy<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:107"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:JobsHotLabelBySingleLine::configBtnBy<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:107"]
  T25["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
