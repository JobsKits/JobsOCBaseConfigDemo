# `calls 符号关系 - 085`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::convertToJsonData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:96"]
  T1["method:NSString::Mutable<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:20"]
  S1 -->|calls| T1
  S2["method:NSString::convertDictionaryToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:118"]
  T2["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  S2 -->|calls| T2
  S3["method:NSString::convertDictionaryToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:118"]
  T3["method:NSObject::JSONWritingPrettyPrinted<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:54"]
  S3 -->|calls| T3
  S4["method:NSString::compress<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:126"]
  T4["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:17"]
  S4 -->|calls| T4
  S5["method:NSString::compress<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:126"]
  T5["method:NSString::jobsUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:33"]
  S5 -->|calls| T5
  S6["method:NSString::compressString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:135"]
  T6["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:17"]
  S6 -->|calls| T6
  S7["method:NSString::compressString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:135"]
  T7["method:NSString::jobsUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:33"]
  S7 -->|calls| T7
  S8["method:NSString::decompressString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:141"]
  T8["method:NSData::decompressToStr<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:123"]
  S8 -->|calls| T8
  S9["method:NSString::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:147"]
  T9["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:78"]
  S9 -->|calls| T9
  S10["method:NSString::toStrByStringArr<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:161"]
  T10["method:NSString::removeSeparationMark<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:398"]
  S10 -->|calls| T10
  S11["method:NSString::toStrByStringArr<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:161"]
  T11["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S11 -->|calls| T11
  S12["method:NSString::toStrByStringArr<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:161"]
  T12["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S12 -->|calls| T12
  S13["method:NSString::bankCardStyle<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:172"]
  T13["method:NSString::bankCardStyleBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:181"]
  S13 -->|calls| T13
  S14["method:NSString::bankCardStyleBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:181"]
  T14["method:NSString::isPureDigit<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:317"]
  S14 -->|calls| T14
  S15["method:NSString::bankCardStyleBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:181"]
  T15["method:NSString::Mutable<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:20"]
  S15 -->|calls| T15
  S16["method:NSString::bankCardStyleBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:181"]
  T16["method:NSString::jobsPureString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:312"]
  S16 -->|calls| T16
  S17["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:197"]
  T17["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S17 -->|calls| T17
  S18["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:197"]
  T18["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S18 -->|calls| T18
  S19["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:197"]
  T19["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S19 -->|calls| T19
  S20["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:197"]
  T20["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSString::GETRequestURLParaBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:197"]
  T21["method:NSString::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S21 -->|calls| T21
  S22["method:NSString::stringByContentsOfURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:217"]
  T22["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  S22 -->|calls| T22
  S23["method:NSString::getOnlyFileNameByFilePath<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:22"]
  T23["method:NSString::getFullFileNameByFilePath<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:13"]
  S23 -->|calls| T23
  S24["method:NSString::getSuffixFileName<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:31"]
  T24["method:NSString::getFullFileNameByFilePath<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:13"]
  S24 -->|calls| T24
  S25["method:NSString::pathForResourceWithFullName<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:37"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
