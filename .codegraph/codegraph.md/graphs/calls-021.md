# `calls 符号关系 - 021`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::add<br/>JobsByPods/JobsRichTextUtils@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:16"]
  T1["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S1 -->|calls| T1
  S2["method:UIColor::jobsCor<br/>JobsByPods/JobsRichTextUtils@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:12"]
  T2["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S2 -->|calls| T2
  S3["function:JobsUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:14"]
  T3["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S3 -->|calls| T3
  S4["function:JobsFileUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:19"]
  T4["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S4 -->|calls| T4
  S5["function:JobsFileUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:19"]
  T5["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S5 -->|calls| T5
  S6["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  T8["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S8 -->|calls| T8
  S9["function:JobsCanOpenUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:45"]
  T9["function:JobsUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:14"]
  S9 -->|calls| T9
  S10["function:Guard<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:51"]
  T10["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  T11["method:JobsPodspecKitForJobsStringUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:266"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsStringUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:273"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  S13 -->|calls| T13
  S14["method:JobsControlTarget::invoke:<br/>JobsByPods/JobsSuspend@Pods/Support/JobsControlTarget/JobsControlTarget.m:20"]
  T14["function:JobsControlTarget::_jobs_now<br/>JobsByPods/JobsSuspend@Pods/Support/JobsControlTarget/JobsControlTarget.m:16"]
  S14 -->|calls| T14
  S15["method:NSObject::img<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:NSObject::img<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T16["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S16 -->|calls| T16
  S17["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSString::substringFromIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T19["method:NSString::substringFromIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S19 -->|calls| T19
  S20["method:NSString::substringToIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T20["method:NSString::substringToIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S20 -->|calls| T20
  S21["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T21["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S21 -->|calls| T21
  S22["method:NSString::range<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T22["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S22 -->|calls| T22
  S23["method:NSString::characterAtIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T23["method:NSString::characterAtIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S23 -->|calls| T23
  S24["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T24["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S24 -->|calls| T24
  S25["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:18"]
  T25["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
