# `calls 符号关系 - 126`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsHotLabelBySingleLine::configBtnBy<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:107"]
  T1["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  T2["method:JobsPodspecKitForJobsHotLabel::standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:266"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsHotLabel::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:273"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsHotLabel::apply_standard_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsHotLabel::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsHotLabel@Pods/JobsPodspecKit.rb:277"]
  S4 -->|calls| T4
  S5["method:JobsImageNumberView::init<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:18"]
  T5["method:JobsImageNumberView::init<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:18"]
  S5 -->|calls| T5
  S6["method:JobsImageNumberView::collectionView:cellForItemAtIndexPath:<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:41"]
  T6["method:BaseCollectionViewCell::jobsRichElementsCollectionViewCellBy<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:58"]
  S6 -->|calls| T6
  S7["method:JobsImageNumberView::collectionView:layout:sizeForItemAtIndexPath:<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:93"]
  T7["method:JobsImageNumberViewCVCell::cellSizeByModel<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberViewCVCell/JobsImageNumberViewCVCell.m:36"]
  S7 -->|calls| T7
  S8["method:JobsImageNumberView::collectionView:layout:insetForSectionAtIndex:<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:113"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:JobsImageNumberView::collectionView<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:121"]
  T9["method:UICollectionView::initByLayout<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:12"]
  S9 -->|calls| T9
  S10["method:JobsImageNumberView::collectionView<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:121"]
  T10["method:UICollectionView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:48"]
  S10 -->|calls| T10
  S11["method:JobsImageNumberView::collectionView<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberView/JobsImageNumberView.m:121"]
  T11["method:UICollectionView::registerCollectionViewClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:20"]
  S11 -->|calls| T11
  S12["method:JobsImageNumberViewCVCell::cellSizeByModel<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberViewCVCell/JobsImageNumberViewCVCell.m:36"]
  T12["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S12 -->|calls| T12
  S13["method:JobsImageNumberViewCVCell::cellSizeByModel<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberViewCVCell/JobsImageNumberViewCVCell.m:36"]
  T13["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S13 -->|calls| T13
  S14["method:JobsImageNumberViewCVCell::cellSizeByModel<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberViewCVCell/JobsImageNumberViewCVCell.m:36"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:JobsImageNumberViewCVCell::cellSizeByModel<br/>JobsByPods/JobsImageNumberView@Pods/Core/JobsImageNumberViewCVCell/JobsImageNumberViewCVCell.m:36"]
  T15["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsImageNumberView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:277"]
  T16["method:JobsPodspecKitForJobsImageNumberView::standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:266"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsImageNumberView::apply_standard_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsImageNumberView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:273"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsImageNumberView::apply_standard_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsImageNumberView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsImageNumberView@Pods/JobsPodspecKit.rb:277"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsLanMgr::standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsLanMgr::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsLanMgr::apply_standard_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsLanMgr::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLanMgr@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsLanMgr@Pods/Support/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  T22["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  S22 -->|calls| T22
  S23["method:NSString::add<br/>JobsByPods/JobsLanMgr@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T23["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S23 -->|calls| T23
  S24["method:JobsLinkageMenuView::initWithFrame:btnConfig:linkageMenuViewConfig:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:42"]
  T24["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S24 -->|calls| T24
  S25["method:JobsLinkageMenuView::initWithFrame:btnConfig:linkageMenuViewConfig:<br/>JobsByPods/JobsLinkageMenuView@Pods/Core/JobsLinkageMenuView/JobsLinkageMenuView.m:42"]
  T25["function:KindOfClsFromStr<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
