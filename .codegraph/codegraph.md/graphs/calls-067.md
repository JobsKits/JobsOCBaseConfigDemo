# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsGestureLockResource::imageNamed:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:29"]
  T1["method:JobsGestureLockResource::resourceBundle<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:12"]
  S1 -->|calls| T1
  S2["method:JobsGestureLockStorage::saveGesturePassword:forKey:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockStorage/JobsGestureLockStorage.m:16"]
  T2["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  T3["method:JobsPodspecKitForJobsGestureLock::standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:266"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsGestureLock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:273"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  T6["method:JobsPodspecKitForJobsGetWindow::standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:266"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsGetWindow::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:273"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  S8 -->|calls| T8
  S9["method:JobsHotLabelByMultiLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:33"]
  T9["method:JobsHotLabelByMultiLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:33"]
  S9 -->|calls| T9
  S10["method:JobsHotLabelByMultiLine::viewSizeByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:62"]
  T10["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S10 -->|calls| T10
  S11["method:JobsHotLabelByMultiLine::collectionView:cellForItemAtIndexPath:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:89"]
  T11["method:BaseCollectionViewCell::jobsRichElementsCollectionViewCellBy<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:58"]
  S11 -->|calls| T11
  S12["method:JobsHotLabelByMultiLine::collectionView:layout:referenceSizeForHeaderInSection:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:169"]
  T12["method:BaiShaETProjVIPSubCVFooterView::collectionReusableViewSizeByModel<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@JXCategoryView下拉headerView变大/View/BaiShaETProjVIPSubCVFooterView/BaiShaETProjVIPSubCVFooterView.m:36"]
  S12 -->|calls| T12
  S13["method:JobsHotLabelByMultiLine::collectionView:layout:referenceSizeForFooterInSection:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:178"]
  T13["method:BaiShaETProjVIPSubCVFooterView::collectionReusableViewSizeByModel<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@JXCategoryView下拉headerView变大/View/BaiShaETProjVIPSubCVFooterView/BaiShaETProjVIPSubCVFooterView.m:36"]
  S13 -->|calls| T13
  S14["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T14["method:UICollectionView::initByLayout<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:12"]
  S14 -->|calls| T14
  S15["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T15["method:UICollectionView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:48"]
  S15 -->|calls| T15
  S16["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T16["method:UICollectionView::registerCollectionViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:41"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  T17["method:JobsPodspecKitForJobsHotLabel::standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:266"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsHotLabel::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:273"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  S19 -->|calls| T19
  S20["method:JobsImageNumberView::init<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:18"]
  T20["method:JobsImageNumberView::init<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:18"]
  S20 -->|calls| T20
  S21["method:JobsImageNumberView::collectionView:cellForItemAtIndexPath:<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:41"]
  T21["method:BaseCollectionViewCell::jobsRichElementsCollectionViewCellBy<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:58"]
  S21 -->|calls| T21
  S22["method:JobsImageNumberView::collectionView:layout:sizeForItemAtIndexPath:<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:93"]
  T22["method:JobsImageNumberViewCVCell::cellSizeByModel<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberViewCVCell/JobsImageNumberViewCVCell.m:36"]
  S22 -->|calls| T22
  S23["method:JobsImageNumberView::collectionView<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:121"]
  T23["method:UICollectionView::initByLayout<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:12"]
  S23 -->|calls| T23
  S24["method:JobsImageNumberView::collectionView<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:121"]
  T24["method:UICollectionView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:48"]
  S24 -->|calls| T24
  S25["method:JobsImageNumberView::collectionView<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:121"]
  T25["method:UICollectionView::registerCollectionViewClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:20"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
