# `calls 符号关系 - 167`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JobsRandom100_200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:70"]
  T1["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  S1 -->|calls| T1
  S2["function:JobsRandom100__200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:74"]
  T2["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  S2 -->|calls| T2
  S3["function:baseRandomNOContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:78"]
  T3["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S3 -->|calls| T3
  S4["function:baseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:82"]
  T4["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S4 -->|calls| T4
  S5["function:baseRandomOffsetValueWithNoContainborderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:86"]
  T5["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  S5 -->|calls| T5
  S6["function:baseRandomOffsetValueWithContainborderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:90"]
  T6["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  S6 -->|calls| T6
  S7["function:getRandomNumber<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:94"]
  T7["function:JobsRandomNumber<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:52"]
  S7 -->|calls| T7
  S8["function:randomXY<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:98"]
  T8["function:JobsRandomXY<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:56"]
  S8 -->|calls| T8
  S9["function:random0_100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:102"]
  T9["function:JobsRandom0_100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:62"]
  S9 -->|calls| T9
  S10["function:random0__100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:106"]
  T10["function:JobsRandom0__100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:66"]
  S10 -->|calls| T10
  S11["function:random100_200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:110"]
  T11["function:JobsRandom100_200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:70"]
  S11 -->|calls| T11
  S12["function:random100__200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:114"]
  T12["function:JobsRandom100__200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:74"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsRandomUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:277"]
  T13["method:JobsPodspecKitForJobsRandomUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:266"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsRandomUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsRandomUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:273"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsRandomUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsRandomUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:277"]
  S15 -->|calls| T15
  S16["method:NSAttributedString::attributedStringParagraphStyle<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:34"]
  T16["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S16 -->|calls| T16
  S17["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  T17["method:NSMutableAttributedString::initByAttributedString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSAttributedString::removeHyperlinks<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:62"]
  T18["method:NSMutableAttributedString::initByAttributedString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:NSMutableAttributedString::addAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:34"]
  T19["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S19 -->|calls| T19
  S20["method:NSMutableAttributedString::addForegroundColorAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:52"]
  T20["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S20 -->|calls| T20
  S21["method:NSMutableAttributedString::addFontAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:68"]
  T21["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S21 -->|calls| T21
  S22["method:NSMutableAttributedString::addUnderlineStyleAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:84"]
  T22["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S22 -->|calls| T22
  S23["method:NSMutableAttributedString::addUnderlineColorAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:101"]
  T23["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S23 -->|calls| T23
  S24["method:NSMutableAttributedString::addLinkAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:118"]
  T24["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S24 -->|calls| T24
  S25["method:NSMutableAttributedString::addkCTKernAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:134"]
  T25["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
