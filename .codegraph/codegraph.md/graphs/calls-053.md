# `calls 符号关系 - 053`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::removeLastChars<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:259"]
  T1["method:NSString::substringToIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S1 -->|calls| T1
  S2["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  T2["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S2 -->|calls| T2
  S3["method:NSString::addNewlines<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:309"]
  T3["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S3 -->|calls| T3
  S4["method:NSString::jobsTextHeightWithFont:lineHeight:controlWidth:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:54"]
  T4["method:NSMutableAttributedString::addFontAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:68"]
  S4 -->|calls| T4
  S5["method:NSString::jobsTextHeightWithFont:lineHeight:controlWidth:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:54"]
  T5["method:NSMutableAttributedString::addAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:34"]
  S5 -->|calls| T5
  S6["method:NSString::jobsTextHeightWithFont:lineHeight:controlWidth:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:54"]
  T6["function:jobsMakeTextModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UITextModel/UITextModel.h:60"]
  S6 -->|calls| T6
  S7["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T7["method:NSMutableAttributedString::addFontAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:68"]
  S7 -->|calls| T7
  S8["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T8["method:NSMutableAttributedString::addAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:34"]
  S8 -->|calls| T8
  S9["method:NSString::jobsTextWidthWithFont:lineHeight:controlHeight:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:97"]
  T9["function:jobsMakeTextModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UITextModel/UITextModel.h:60"]
  S9 -->|calls| T9
  S10["method:NSString::lenthByFont<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:149"]
  T10["function:UIFontSystemFontOfSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:14"]
  S10 -->|calls| T10
  S11["method:NSString::textLength<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Statistics/NSString+Statistics.m:165"]
  T11["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S11 -->|calls| T11
  S12["method:NSString::cor<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T12["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S12 -->|calls| T12
  S13["method:NSString::substringFromIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T13["method:NSString::substringFromIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S13 -->|calls| T13
  S14["method:NSString::substringToIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T14["method:NSString::substringToIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S14 -->|calls| T14
  S15["method:NSString::substringByRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:44"]
  T15["method:NSString::substringWithRange<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S15 -->|calls| T15
  S16["method:NSString::rangeOfString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T16["method:NSString::rangeOfString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S16 -->|calls| T16
  S17["method:NSString::range<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T17["method:NSString::rangeOfString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S17 -->|calls| T17
  S18["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T18["method:NSString::characterAtIndex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S18 -->|calls| T18
  S19["method:NSString::toast<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T19["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S19 -->|calls| T19
  S20["method:NSString::jobsUrl<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:NSString::URLRequest<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T21["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSString::jobsFileUrl<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T22["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSString::urlProtect<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T23["method:NSString::containsString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S23 -->|calls| T23
  S24["method:NSURL::URLRequest<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T24["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIButton::makeBtnTitleByShowingType<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+Extra/UIButton+Extra.m:12"]
  T25["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
