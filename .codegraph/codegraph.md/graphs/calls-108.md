# `calls 符号关系 - 108`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:random100__200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:114"]
  T1["function:JobsRandom100__200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:74"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsRandomUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:277"]
  T2["method:JobsPodspecKitForJobsRandomUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:266"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsRandomUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsRandomUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:273"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsRandomUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsRandomUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRandomUtils@Pods/JobsPodspecKit.rb:277"]
  S4 -->|calls| T4
  S5["method:NSAttributedString::attributedStringParagraphStyle<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:34"]
  T5["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S5 -->|calls| T5
  S6["method:NSAttributedString::changeTextColorBy<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:45"]
  T6["method:NSMutableAttributedString::initByAttributedString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSAttributedString::removeHyperlinks<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSAttributedString/NSAttributedString+Extra/NSAttributedString+Extra.m:62"]
  T7["method:NSMutableAttributedString::initByAttributedString<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSMutableAttributedString::addAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:34"]
  T8["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S8 -->|calls| T8
  S9["method:NSMutableAttributedString::addForegroundColorAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:52"]
  T9["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S9 -->|calls| T9
  S10["method:NSMutableAttributedString::addFontAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:68"]
  T10["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S10 -->|calls| T10
  S11["method:NSMutableAttributedString::addUnderlineStyleAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:84"]
  T11["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S11 -->|calls| T11
  S12["method:NSMutableAttributedString::addUnderlineColorAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:101"]
  T12["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S12 -->|calls| T12
  S13["method:NSMutableAttributedString::addLinkAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:118"]
  T13["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S13 -->|calls| T13
  S14["method:NSMutableAttributedString::addkCTKernAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:134"]
  T14["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:277"]
  T15["method:JobsPodspecKitForJobsRichTextUtils::standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:266"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:273"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsRichTextUtils::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsRichTextUtils@Pods/JobsPodspecKit.rb:277"]
  S17 -->|calls| T17
  S18["method:NSString::add<br/>JobsByPods/JobsRichTextUtils@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:16"]
  T18["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S18 -->|calls| T18
  S19["method:UIColor::jobsCor<br/>JobsByPods/JobsRichTextUtils@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:12"]
  T19["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S19 -->|calls| T19
  S20["method:UIColor::jobsCor<br/>JobsByPods/JobsRichTextUtils@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:12"]
  T20["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S20 -->|calls| T20
  S21["function:JobsUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:14"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S21 -->|calls| T21
  S22["function:JobsFileUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:19"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S22 -->|calls| T22
  S23["function:JobsFileUrl<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:19"]
  T23["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S23 -->|calls| T23
  S24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
