# `calls 符号关系 - 012`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["function:objc_setAssociatedObject_weak<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+Swizzling/NSObject+Swizzling.m:103"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:277"]
  T3["method:JobsPodspecKitForJobsOCRuntimeKits::standard_user_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:266"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:273"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsOCRuntimeKits::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCRuntimeKits@Pods/JobsPodspecKit.rb:277"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  T6["method:JobsPodspecKitForJobsOCSnowflake::standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:266"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:273"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  T9["method:JobsPodspecKitForJobsOCTimer::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:266"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsOCTimer::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:273"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  T12["method:JobsPodspecKitForJobsOCTools::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:266"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsOCTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:273"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsRandomUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:277"]
  T15["method:JobsPodspecKitForJobsRandomUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:266"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsRandomUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsRandomUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:273"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsRandomUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsRandomUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:277"]
  S17 -->|calls| T17
  S18["method:NSAttributedString::attributedStringParagraphStyle<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:34"]
  T18["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsRichTextUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  T22["method:JobsPodspecKitForJobsStringUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:266"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsStringUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:273"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  S24 -->|calls| T24
  S25["method:JobsControlTarget::invoke:<br/>JobsByPods/JobsSuspend@Pods/Support/JobsControlTarget/JobsControlTarget.m:20"]
  T25["function:JobsControlTarget::_jobs_now<br/>JobsByPods/JobsSuspend@Pods/Support/JobsControlTarget/JobsControlTarget.m:16"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
