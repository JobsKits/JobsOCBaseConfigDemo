# `calls 符号关系 - 015`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::UTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:34"]
  T1["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S1 -->|calls| T1
  S2["method:NSString::ASCIIEncoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:47"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSString::readLocalFileWithName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:71"]
  T3["method:NSString::jobsPathForResourceWithFullName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:41"]
  S3 -->|calls| T3
  S4["method:NSString::readLocalFileWithName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:71"]
  T4["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S4 -->|calls| T4
  S5["method:NSString::readLocalFileWithName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:71"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S5 -->|calls| T5
  S6["method:NSString::readLocalFileWithName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:71"]
  T6["method:NSObject::JSONkNilOptions<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:154"]
  S6 -->|calls| T6
  S7["method:NSString::readLocalFileWithName<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:71"]
  T7["function:toastBy<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast/NSObject+WHToast.h:66"]
  S7 -->|calls| T7
  S8["method:NSString::dictionaryWithJsonString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:90"]
  T8["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S8 -->|calls| T8
  S9["method:NSString::dictionaryWithJsonString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:90"]
  T9["method:NSObject::JSONReadingMutableContainers<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:167"]
  S9 -->|calls| T9
  S10["method:NSString::dictionaryWithJsonString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:90"]
  T10["method:NSString::jobsUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:38"]
  S10 -->|calls| T10
  S11["method:NSString::convertToJsonData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:101"]
  T11["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  S11 -->|calls| T11
  S12["method:NSString::convertToJsonData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:101"]
  T12["method:NSObject::JSONWritingPrettyPrinted<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:180"]
  S12 -->|calls| T12
  S13["method:NSString::convertToJsonData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:101"]
  T13["method:NSString::Mutable<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:25"]
  S13 -->|calls| T13
  S14["method:NSString::convertDictionaryToString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:123"]
  T14["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  S14 -->|calls| T14
  S15["method:NSString::convertDictionaryToString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:123"]
  T15["method:NSObject::JSONWritingPrettyPrinted<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:180"]
  S15 -->|calls| T15
  S16["method:NSString::compress<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:131"]
  T16["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:17"]
  S16 -->|calls| T16
  S17["method:NSString::compress<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:131"]
  T17["method:NSString::jobsUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:38"]
  S17 -->|calls| T17
  S18["method:NSString::compressString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:140"]
  T18["method:NSKeyedArchiver::archivedDataByRootObject_NO<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:17"]
  S18 -->|calls| T18
  S19["method:NSString::compressString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:140"]
  T19["method:NSString::jobsUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:38"]
  S19 -->|calls| T19
  S20["method:NSString::decompressString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:146"]
  T20["method:NSData::decompressToStr<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:123"]
  S20 -->|calls| T20
  S21["method:NSString::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:152"]
  T21["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:78"]
  S21 -->|calls| T21
  S22["method:NSString::toStrByStringArr<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:166"]
  T22["method:NSString::removeSeparationMark<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:398"]
  S22 -->|calls| T22
  S23["method:NSString::toStrByStringArr<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:166"]
  T23["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S23 -->|calls| T23
  S24["method:NSString::bankCardStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:177"]
  T24["method:NSString::bankCardStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:186"]
  S24 -->|calls| T24
  S25["method:NSString::bankCardStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:186"]
  T25["method:NSString::isPureDigit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:317"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
