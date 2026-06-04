# `calls 符号关系 - 011`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T1["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S1 -->|calls| T1
  S2["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T3["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:HXPhotoManager::initByTypePhoto<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:18"]
  T4["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:HXPhotoManager::initByTypeVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:22"]
  T5["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:HXPhotoManager::initByTypePhotoAndVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:26"]
  T6["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:HXPhotoView::initBy<br/>JobsByPods/HXPhotoViewExtra@Pods/Core/HXPhotoView+Extra.m:12"]
  T7["method:NSObject::photoManager<br/>JobsOCBaseConfigDemo/业务逻辑/Common/App工具类/UIKits+3rd/NSObject/NSObject+HXPhotoPicker/NSObject+HXPhotoPicker.m:128"]
  S7 -->|calls| T7
  S8["method:JXCategoryTimelineCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:18"]
  T8["method:JXCategoryTimelineCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:18"]
  S8 -->|calls| T8
  S9["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  T9["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  S9 -->|calls| T9
  S10["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:37"]
  T10["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:37"]
  S10 -->|calls| T10
  S11["method:JXCategoryTitleBackgroundView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:18"]
  T11["method:JXCategoryTitleBackgroundView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:18"]
  S11 -->|calls| T11
  S12["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:46"]
  T12["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:46"]
  S12 -->|calls| T12
  S13["method:JobsBaseApi::buildCustomUrlRequest<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:13"]
  T13["method:NSObject::printRequestMessage<br/>JobsByPods/YTKNetworkExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:30"]
  S13 -->|calls| T13
  S14["function:getIPaddress<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:13"]
  T14["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S14 -->|calls| T14
  S15["function:isValidatIP<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:61"]
  T15["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsAPIs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:277"]
  T16["method:JobsPodspecKitForJobsAPIs::standard_user_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:266"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsAPIs::apply_standard_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsAPIs::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:273"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsAPIs::apply_standard_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsAPIs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:277"]
  S18 -->|calls| T18
  S19["method:NSData::initWithData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T19["method:NSData::initWithData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T21["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S21 -->|calls| T21
  S22["method:NSMutableDictionary::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S22 -->|calls| T22
  S23["method:NSMutableDictionary::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T23["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S23 -->|calls| T23
  S24["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T24["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S24 -->|calls| T24
  S25["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T25["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
