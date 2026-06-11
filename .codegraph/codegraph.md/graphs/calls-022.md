# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  T1["method:JobsPodspecKitForJobsTimeUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:266"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsTimeUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:273"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  S3 -->|calls| T3
  S4["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  T4["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSString::add<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T5["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  T6["method:JobsPodspecKitForJobsUploadingProgressView::standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:266"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:273"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  T9["method:JobsPodspecKitForJobsViewNavigator::standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:266"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsViewNavigator::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:273"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  S11 -->|calls| T11
  S12["method:MJRefreshAutoStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:37"]
  T12["function:MJRefreshExtraApplyStateTitles<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:10"]
  S12 -->|calls| T12
  S13["method:MJRefreshAutoStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:37"]
  T13["function:MJRefreshExtraApplyStateLabelStyle<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:19"]
  S13 -->|calls| T13
  S14["method:MJRefreshAutoStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:37"]
  T14["function:MJRefreshExtraFeedbackIfNeeded<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:25"]
  S14 -->|calls| T14
  S15["method:MJRefreshBackStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:37"]
  T15["function:MJRefreshExtraApplyStateTitles<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:10"]
  S15 -->|calls| T15
  S16["method:MJRefreshBackStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:37"]
  T16["function:MJRefreshExtraApplyStateLabelStyle<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:19"]
  S16 -->|calls| T16
  S17["method:MJRefreshBackStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:37"]
  T17["function:MJRefreshExtraFeedbackIfNeeded<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:25"]
  S17 -->|calls| T17
  S18["method:MJRefreshStateHeader::byMJRefreshHeaderConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:36"]
  T18["function:MJRefreshExtraApplyStateTitles<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:10"]
  S18 -->|calls| T18
  S19["method:MJRefreshStateHeader::byMJRefreshHeaderConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:36"]
  T19["function:MJRefreshExtraApplyStateLabelStyle<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:19"]
  S19 -->|calls| T19
  S20["method:MJRefreshStateHeader::byMJRefreshHeaderConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:36"]
  T20["function:MJRefreshExtraFeedbackIfNeeded<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:25"]
  S20 -->|calls| T20
  S21["method:NSData::initWithData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T21["method:NSData::initWithData<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSString::substringFromIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T22["method:NSString::substringFromIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S22 -->|calls| T22
  S23["method:NSString::substringToIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T23["method:NSString::substringToIndex<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S23 -->|calls| T23
  S24["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T24["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S24 -->|calls| T24
  S25["method:NSString::range<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T25["method:NSString::rangeOfString<br/>JobsByPods/MJRefreshExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
