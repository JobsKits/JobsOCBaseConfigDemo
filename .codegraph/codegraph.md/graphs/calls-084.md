# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::tipsByApi<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:78"]
  T1["method:JobsBaseApi::byAnimatingView<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:131"]
  S1 -->|calls| T1
  S2["method:NSObject::tipsByApi<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:78"]
  T2["method:JobsBaseApi::byAnimatingView<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:131"]
  S2 -->|calls| T2
  S3["class:NSObject<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:14"]
  T3["method:NSURLRequest::print<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:17"]
  S3 -->|calls| T3
  S4["class:NSObject<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:14"]
  T4["method:NSURLRequest::print<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:17"]
  S4 -->|calls| T4
  S5["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T5["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S5 -->|calls| T5
  S6["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T6["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S6 -->|calls| T6
  S7["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T7["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S7 -->|calls| T7
  S8["method:NSString::isAllSameCharWithStandardChar<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:95"]
  T8["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S8 -->|calls| T8
  S9["method:NSString::isAllSameCharWithStandardChar<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:95"]
  T9["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:66"]
  S9 -->|calls| T9
  S10["method:NSString::isAllSameCharWithStandardChar<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:95"]
  T10["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSString::isPhilippinesPhoneNum<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:292"]
  T11["method:NSString::isPureDigit<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:317"]
  S11 -->|calls| T11
  S12["method:NSString::isPureDigit<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:317"]
  T12["method:NSString::jobsPureString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:312"]
  S12 -->|calls| T12
  S13["method:NSString::isContainBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:328"]
  T13["method:NSString::isNotContainBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:336"]
  S13 -->|calls| T13
  S14["method:NSString::UTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:29"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSString::ASCIIEncoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:42"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:66"]
  T16["method:NSString::jobsPathForResourceWithFullName<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:41"]
  S16 -->|calls| T16
  S17["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:66"]
  T17["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S17 -->|calls| T17
  S18["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:66"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S18 -->|calls| T18
  S19["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:66"]
  T19["method:NSObject::JSONkNilOptions<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:28"]
  S19 -->|calls| T19
  S20["method:NSString::readLocalFileWithName<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:66"]
  T20["function:toastBy<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast/NSObject+WHToast.h:66"]
  S20 -->|calls| T20
  S21["method:NSString::dictionaryWithJsonString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:85"]
  T21["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S21 -->|calls| T21
  S22["method:NSString::dictionaryWithJsonString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:85"]
  T22["method:NSObject::JSONReadingMutableContainers<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:41"]
  S22 -->|calls| T22
  S23["method:NSString::dictionaryWithJsonString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:85"]
  T23["method:NSString::jobsUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:33"]
  S23 -->|calls| T23
  S24["method:NSString::convertToJsonData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:96"]
  T24["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  S24 -->|calls| T24
  S25["method:NSString::convertToJsonData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:96"]
  T25["method:NSObject::JSONWritingPrettyPrinted<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:54"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
