# `calls 符号关系 - 054`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::isGraph<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:132"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::isPrint<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:140"]
  T2["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S2 -->|calls| T2
  S3["method:NSString::isLower<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:148"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::isUpper<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:156"]
  T4["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S4 -->|calls| T4
  S5["method:NSString::isXdigit<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:164"]
  T5["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S5 -->|calls| T5
  S6["method:NSString::isPunct<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:172"]
  T6["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S6 -->|calls| T6
  S7["method:NSString::isContainsUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:186"]
  T7["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S7 -->|calls| T7
  S8["method:NSString::emojiEncode<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:13"]
  T8["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S8 -->|calls| T8
  S9["method:NSString::isContainsSpecialSymbolsString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+FilteringSpecialCharacters/NSString+FilteringSpecialCharacters.m:38"]
  T9["method:NSString::containsString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S9 -->|calls| T9
  S10["method:NSString::jobsTextHeightWithFont:lineHeight:controlWidth:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:54"]
  T10["method:NSMutableAttributedString::addFontAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:68"]
  S10 -->|calls| T10
  S11["method:NSString::jobsTextHeightWithFont:lineHeight:controlWidth:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:54"]
  T11["method:NSMutableAttributedString::addAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:34"]
  S11 -->|calls| T11
  S12["method:NSString::jobsTextHeightWithFont:lineHeight:controlWidth:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:54"]
  T12["function:jobsMakeTextModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UITextModel/UITextModel.h:60"]
  S12 -->|calls| T12
  S13["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T13["method:NSMutableAttributedString::addFontAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:68"]
  S13 -->|calls| T13
  S14["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T14["method:NSMutableAttributedString::addAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:34"]
  S14 -->|calls| T14
  S15["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T15["function:jobsMakeTextModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UITextModel/UITextModel.h:60"]
  S15 -->|calls| T15
  S16["method:NSString::lenthByFont<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:149"]
  T16["function:UIFontSystemFontOfSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:14"]
  S16 -->|calls| T16
  S17["method:NSString::textLength<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:164"]
  T17["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S17 -->|calls| T17
  S18["method:NSString::cor<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T18["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S18 -->|calls| T18
  S19["method:NSString::substringFromIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T19["method:NSString::substringFromIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S19 -->|calls| T19
  S20["method:NSString::substringToIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T20["method:NSString::substringToIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S20 -->|calls| T20
  S21["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T21["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S21 -->|calls| T21
  S22["method:NSString::range<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T22["method:NSString::rangeOfString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S22 -->|calls| T22
  S23["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T23["method:NSString::characterAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S23 -->|calls| T23
  S24["method:NSString::chinaTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:12"]
  T24["method:NSString::timeStampByTimeFormatter:timeZoneType:intervalStyle:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:46"]
  S24 -->|calls| T24
  S25["method:NSString::readableTimeByFormatter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Time/NSString+Time.m:22"]
  T25["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
