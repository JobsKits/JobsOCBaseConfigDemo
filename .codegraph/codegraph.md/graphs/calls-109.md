# `calls 符号关系 - 109`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T1["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S1 -->|calls| T1
  S2["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T2["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S2 -->|calls| T2
  S3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T3["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S3 -->|calls| T3
  S4["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T4["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S4 -->|calls| T4
  S5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  T5["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S5 -->|calls| T5
  S6["function:JobsCanOpenUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:45"]
  T6["function:JobsUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:14"]
  S6 -->|calls| T6
  S7["function:Guard<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:51"]
  T7["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsStringUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsStringUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:JobsSuspendBtn::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendBtn/JobsSuspendBtn.m:18"]
  T11["method:JobsSuspendBtn::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendBtn/JobsSuspendBtn.m:18"]
  S11 -->|calls| T11
  S12["method:JobsSuspendLab::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendLab/JobsSuspendLab.m:21"]
  T12["method:JobsSuspendLab::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendLab/JobsSuspendLab.m:21"]
  S12 -->|calls| T12
  S13["method:JobsSuspendView::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendView/JobsSuspendView.m:19"]
  T13["method:JobsSuspendView::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendView/JobsSuspendView.m:19"]
  S13 -->|calls| T13
  S14["method:JobsControlTarget::invoke:<br/>JobsByPods/JobsSuspend@Pods/Support/JobsControlTarget/JobsControlTarget.m:20"]
  T14["function:JobsControlTarget::_jobs_now<br/>JobsByPods/JobsSuspend@Pods/Support/JobsControlTarget/JobsControlTarget.m:16"]
  S14 -->|calls| T14
  S15["method:NSMutableDictionary::add<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T15["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S15 -->|calls| T15
  S16["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T16["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S16 -->|calls| T16
  S17["method:NSObject::img<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSObject::img<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T18["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S18 -->|calls| T18
  S19["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:NSString::substringFromIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T21["method:NSString::substringFromIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S21 -->|calls| T21
  S22["method:NSString::substringToIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T22["method:NSString::substringToIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S22 -->|calls| T22
  S23["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T23["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S23 -->|calls| T23
  S24["method:NSString::range<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T24["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S24 -->|calls| T24
  S25["method:NSString::characterAtIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T25["method:NSString::characterAtIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
