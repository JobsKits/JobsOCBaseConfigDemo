# `calls 符号关系 - 002`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:HXPhotoManager::initByTypePhotoAndVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:26"]
  T1["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  T2["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  S2 -->|calls| T2
  S3["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:37"]
  T3["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:37"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsAPIs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForJobsAPIs::standard_user_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsAPIs::apply_standard_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsAPIs::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsAPIs::apply_standard_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsAPIs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["method:NSData::initWithData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T7["method:NSData::initWithData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSString::substringFromIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T8["method:NSString::substringFromIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S8 -->|calls| T8
  S9["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T9["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S9 -->|calls| T9
  S10["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T10["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S10 -->|calls| T10
  S11["method:NSString::range<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T11["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S11 -->|calls| T11
  S12["method:NSString::characterAtIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T12["method:NSString::characterAtIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S12 -->|calls| T12
  S13["method:NSString::jobsUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:14"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:NSString::URLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:23"]
  T14["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSString::jobsFileUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:28"]
  T15["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:JobsAppTools::allocWithZone:<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools.m:33"]
  T16["method:JobsAppTools::sharedManager<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools.m:22"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  T17["method:JobsPodspecKitForJobsAppTools::standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:266"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsAppTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:273"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  S19 -->|calls| T19
  S20["method:NSString::add<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T20["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S20 -->|calls| T20
  S21["method:NSString::isContainsUrl<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:36"]
  T21["method:NSString::rangeOfString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S21 -->|calls| T21
  S22["method:NSData::initWithData<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T22["method:NSData::initWithData<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSString::substringFromIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T23["method:NSString::substringFromIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S23 -->|calls| T23
  S24["method:NSString::substringToIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T24["method:NSString::substringToIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S24 -->|calls| T24
  S25["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T25["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
