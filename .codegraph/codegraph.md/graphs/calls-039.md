# `calls 符号关系 - 039`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T4["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S4 -->|calls| T4
  S5["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:179"]
  T5["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S5 -->|calls| T5
  S6["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T6["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S6 -->|calls| T6
  S7["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T7["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S7 -->|calls| T7
  S8["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T8["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S8 -->|calls| T8
  S9["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T9["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S9 -->|calls| T9
  S10["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  T10["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S10 -->|calls| T10
  S11["method:NSString::getAnonymousString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T11["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S11 -->|calls| T11
  S12["method:NSString::getAnonymousString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T12["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S12 -->|calls| T12
  S13["method:NSString::encryptedChineseTele<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:252"]
  T13["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  S13 -->|calls| T13
  S14["method:NSString::removeLastChars<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:259"]
  T14["method:NSString::substringToIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S14 -->|calls| T14
  S15["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  T15["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S15 -->|calls| T15
  S16["method:NSString::addNewlines<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:309"]
  T16["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S16 -->|calls| T16
  S17["method:NSString::jobsTextHeightWithFont:lineHeight:controlWidth:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:54"]
  T17["method:NSMutableAttributedString::addFontAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:68"]
  S17 -->|calls| T17
  S18["method:NSString::jobsTextHeightWithFont:lineHeight:controlWidth:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:54"]
  T18["method:NSMutableAttributedString::addAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:34"]
  S18 -->|calls| T18
  S19["method:NSString::jobsTextHeightWithFont:lineHeight:controlWidth:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:54"]
  T19["function:jobsMakeTextModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UITextModel/UITextModel.h:60"]
  S19 -->|calls| T19
  S20["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T20["method:NSMutableAttributedString::addFontAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:68"]
  S20 -->|calls| T20
  S21["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T21["method:NSMutableAttributedString::addAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:34"]
  S21 -->|calls| T21
  S22["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T22["function:jobsMakeTextModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UITextModel/UITextModel.h:60"]
  S22 -->|calls| T22
  S23["method:NSString::lenthByFont<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:149"]
  T23["function:UIFontSystemFontOfSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:14"]
  S23 -->|calls| T23
  S24["method:NSString::textLength<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:165"]
  T24["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S24 -->|calls| T24
  S25["method:NSString::cor<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T25["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
