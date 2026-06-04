# `calls 符号关系 - 168`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:277"]
  T1["method:JobsPodspecKitForJobsRichTextUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:266"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:273"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:277"]
  S3 -->|calls| T3
  S4["method:NSString::cor<br/>JobsByPods/JobsRichTextUtils@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T4["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S4 -->|calls| T4
  S5["method:NSString::add<br/>JobsByPods/JobsRichTextUtils@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:16"]
  T5["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S5 -->|calls| T5
  S6["method:UIColor::jobsCor<br/>JobsByPods/JobsRichTextUtils@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:12"]
  T6["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S6 -->|calls| T6
  S7["method:UIColor::jobsCor<br/>JobsByPods/JobsRichTextUtils@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:12"]
  T7["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S7 -->|calls| T7
  S8["function:JobsUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:14"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["function:JobsFileUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:19"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["function:JobsFileUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:19"]
  T10["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S10 -->|calls| T10
  S11["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T13["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S13 -->|calls| T13
  S14["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T14["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S14 -->|calls| T14
  S15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T15["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S15 -->|calls| T15
  S16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T16["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S16 -->|calls| T16
  S17["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  T17["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S17 -->|calls| T17
  S18["function:JobsCanOpenUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:45"]
  T18["function:JobsUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:14"]
  S18 -->|calls| T18
  S19["function:Guard<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:51"]
  T19["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  T20["method:JobsPodspecKitForJobsStringUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:266"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsStringUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:273"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  S22 -->|calls| T22
  S23["method:JobsSuspendBtn::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendBtn/JobsSuspendBtn.m:18"]
  T23["method:JobsSuspendBtn::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendBtn/JobsSuspendBtn.m:18"]
  S23 -->|calls| T23
  S24["method:JobsSuspendLab::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendLab/JobsSuspendLab.m:21"]
  T24["method:JobsSuspendLab::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendLab/JobsSuspendLab.m:21"]
  S24 -->|calls| T24
  S25["method:JobsSuspendView::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendView/JobsSuspendView.m:19"]
  T25["method:JobsSuspendView::init<br/>JobsByPods/JobsSuspend@Pods/Core/JobsSuspendView/JobsSuspendView.m:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
