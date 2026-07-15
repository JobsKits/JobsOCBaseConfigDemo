# `calls 符号关系 - 007`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  T1["method:JobsPodspecKitForJobsOCSnowflake::standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:266"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:273"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsOCSnowflake::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCSnowflake@Pods/JobsPodspecKit.rb:277"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForJobsOCTimer::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsOCTimer::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsOCTimer::apply_standard_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsOCTimer::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTimer@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  T7["method:JobsPodspecKitForJobsOCTools::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:266"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsOCTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:273"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsRandomUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:277"]
  T10["method:JobsPodspecKitForJobsRandomUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:266"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsRandomUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsRandomUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:273"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsRandomUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsRandomUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:277"]
  S12 -->|calls| T12
  S13["method:NSAttributedString::attributedStringParagraphStyle<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:34"]
  T13["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:277"]
  T14["method:JobsPodspecKitForJobsRichTextUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:266"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:273"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:277"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  T17["method:JobsPodspecKitForJobsStringUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:266"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsStringUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:273"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsStringUtils::apply_standard_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsStringUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsStringUtils@Pods/JobsPodspecKit.rb:277"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  T20["method:JobsPodspecKitForJobsTimeUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:266"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsTimeUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:273"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsTimeUtils::apply_standard_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsTimeUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsTimeUtils@Pods/JobsPodspecKit.rb:277"]
  S22 -->|calls| T22
  S23["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  T23["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  T24["method:JobsPodspecKitForJobsUploadingProgressView::standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:266"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T25["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:273"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
