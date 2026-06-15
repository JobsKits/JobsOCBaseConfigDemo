# `calls 符号关系 - 002`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T1["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S1 -->|calls| T1
  S2["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T2["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S2 -->|calls| T2
  S3["method:NSString::range<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T3["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S3 -->|calls| T3
  S4["method:NSString::characterAtIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T4["method:NSString::characterAtIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S4 -->|calls| T4
  S5["method:NSString::jobsUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:14"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S5 -->|calls| T5
  S6["method:NSString::URLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:23"]
  T6["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSString::jobsFileUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:28"]
  T7["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:JobsAppTools::allocWithZone:<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools.m:33"]
  T8["method:JobsAppTools::sharedManager<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools.m:22"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  T9["method:JobsPodspecKitForJobsAppTools::standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:266"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsAppTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:273"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  S11 -->|calls| T11
  S12["method:NSString::add<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T12["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S12 -->|calls| T12
  S13["method:NSString::isContainsUrl<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:36"]
  T13["method:NSString::rangeOfString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S13 -->|calls| T13
  S14["method:NSData::initWithData<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T14["method:NSData::initWithData<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSString::substringFromIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T15["method:NSString::substringFromIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S15 -->|calls| T15
  S16["method:NSString::substringToIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T16["method:NSString::substringToIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S16 -->|calls| T16
  S17["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T17["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S17 -->|calls| T17
  S18["method:NSString::range<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T18["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S18 -->|calls| T18
  S19["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T19["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S19 -->|calls| T19
  S20["method:NSString::jobsUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:NSString::URLRequest<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T21["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSString::jobsFileUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T22["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:JobsControlTarget::invoke:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:20"]
  T23["function:JobsControlTarget::_jobs_now<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:16"]
  S23 -->|calls| T23
  S24["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  T24["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  S24 -->|calls| T24
  S25["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  T25["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
