# `calls 符号关系 - 095`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T1["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S1 -->|calls| T1
  S2["method:UIView::addSubview<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  T2["method:UIView::addSubview<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::refresh<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:38"]
  T3["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:56"]
  S3 -->|calls| T3
  S4["method:JobsGestureLockConfiguration::copyWithZone:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:37"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:JobsGestureLockResource::resourceBundle<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:12"]
  T5["method:NSObject::mainBundle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:13"]
  S5 -->|calls| T5
  S6["method:JobsGestureLockResource::imageNamed:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:29"]
  T6["method:JobsGestureLockResource::resourceBundle<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:12"]
  S6 -->|calls| T6
  S7["method:JobsGestureLockStorage::saveGesturePassword:forKey:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockStorage/JobsGestureLockStorage.m:16"]
  T7["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsGestureLock::standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsGestureLock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  T11["method:JobsPodspecKitForJobsGetWindow::standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:266"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsGetWindow::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:273"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  S13 -->|calls| T13
  S14["method:JobsHotLabelByMultiLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:33"]
  T14["method:JobsHotLabelByMultiLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:33"]
  S14 -->|calls| T14
  S15["method:JobsHotLabelByMultiLine::viewSizeByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:62"]
  T15["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S15 -->|calls| T15
  S16["method:JobsHotLabelByMultiLine::collectionView:cellForItemAtIndexPath:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:89"]
  T16["method:BaseCollectionViewCell::jobsRichElementsCollectionViewCellBy<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:58"]
  S16 -->|calls| T16
  S17["method:JobsHotLabelByMultiLine::collectionView:layout:referenceSizeForHeaderInSection:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:169"]
  T17["method:BaiShaETProjVIPSubCVFooterView::collectionReusableViewSizeByModel<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@JXCategoryView下拉headerView变大/View/BaiShaETProjVIPSubCVFooterView/BaiShaETProjVIPSubCVFooterView.m:36"]
  S17 -->|calls| T17
  S18["method:JobsHotLabelByMultiLine::collectionView:layout:referenceSizeForFooterInSection:<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:178"]
  T18["method:BaiShaETProjVIPSubCVFooterView::collectionReusableViewSizeByModel<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@JXCategoryView下拉headerView变大/View/BaiShaETProjVIPSubCVFooterView/BaiShaETProjVIPSubCVFooterView.m:36"]
  S18 -->|calls| T18
  S19["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T19["method:UICollectionView::initByLayout<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:12"]
  S19 -->|calls| T19
  S20["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T20["method:UICollectionView::dataLink<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:48"]
  S20 -->|calls| T20
  S21["method:JobsHotLabelByMultiLine::collectionView<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelByMultiLine/JobsHotLabelByMultiLine.m:216"]
  T21["method:UICollectionView::registerCollectionViewCellClass<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:41"]
  S21 -->|calls| T21
  S22["method:JobsHotLabelBySingleLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:24"]
  T22["method:JobsHotLabelBySingleLine::init<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:24"]
  S22 -->|calls| T22
  S23["method:JobsHotLabelBySingleLine::jobsRichViewByModel<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:47"]
  T23["method:JobsHotLabelBySingleLine::createHotLabelByArr<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:59"]
  S23 -->|calls| T23
  S24["method:JobsHotLabelBySingleLine::createHotLabelByArr<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:59"]
  T24["method:JobsHotLabelBySingleLine::configBtnBy<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:107"]
  S24 -->|calls| T24
  S25["method:JobsHotLabelBySingleLine::createHotLabelByArr<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:59"]
  T25["method:JobsHotLabelBySingleLine::useHighestValue<br/>JobsByPods/JobsHotLabel@Pods/Core/JobsHotLabelBySingleLine/JobsHotLabelBySingleLine.m:134"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
