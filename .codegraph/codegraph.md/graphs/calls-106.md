# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T1["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S1 -->|calls| T1
  S2["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T2["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S2 -->|calls| T2
  S3["method:NSObject::byData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSObject/NSObject+Data/NSObject+Data.m:32"]
  T3["function:KindOfDicCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:67"]
  S3 -->|calls| T3
  S4["method:NSObject::byData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSObject/NSObject+Data/NSObject+Data.m:32"]
  T4["function:KindOfArrCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:59"]
  S4 -->|calls| T4
  S5["method:NSObject::makeNormaleWebViewByViewModel<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSObject/NSObject+HTML/NSObject+HTML.m:73"]
  T5["method:WKWebView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSObject::isSizeZero<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:36"]
  T6["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S6 -->|calls| T6
  S7["method:NSObject::isPointZero<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:42"]
  T7["function:JobsSafeWidth::jobsZeroPointValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:561"]
  S7 -->|calls| T7
  S8["method:NSObject::isRectZero<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:48"]
  T8["function:JobsSafeWidth::jobsEqualToZeroRect<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:573"]
  S8 -->|calls| T8
  S9["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T9["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S9 -->|calls| T9
  S10["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T10["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S10 -->|calls| T10
  S11["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T11["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S11 -->|calls| T11
  S12["method:NSString::isEqualToString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSString::isEqualToString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T13["method:NSString::isEqualToString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S13 -->|calls| T13
  S14["method:NSString::containsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:NSString::containsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T15["method:NSString::containsString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S15 -->|calls| T15
  S16["method:NSString::hasPrefix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:NSString::hasPrefix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T17["method:NSString::hasPrefix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S17 -->|calls| T17
  S18["method:NSString::hasSuffix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSString::hasSuffix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T19["method:NSString::hasSuffix<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S19 -->|calls| T19
  S20["method:NSString::isNotBlank<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:59"]
  T20["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S20 -->|calls| T20
  S21["method:NSString::isSpace<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:66"]
  T21["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S21 -->|calls| T21
  S22["method:NSString::isContainBlank<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:75"]
  T22["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S22 -->|calls| T22
  S23["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T23["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S23 -->|calls| T23
  S24["method:NSString::isAllSameCharWithStandardChar:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:80"]
  T24["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S24 -->|calls| T24
  S25["method:NSString::isAlnum<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:116"]
  T25["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
