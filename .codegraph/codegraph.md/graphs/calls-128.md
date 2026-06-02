# `calls 符号关系 - 128`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:273"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsLinkageMenuView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLinkageMenuView@Pods/JobsPodspecKit.rb:277"]
  S2 -->|calls| T2
  S3["method:NSArray::containsObject<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T3["method:NSArray::containsObject<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S3 -->|calls| T3
  S4["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T4["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T5["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T6["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S6 -->|calls| T6
  S7["method:NSArray::jobsVisible<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T8["method:NSData::initWithData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:NSData::stringByUTF8Encoding<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:134"]
  T9["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S9 -->|calls| T9
  S10["method:NSMutableDictionary::add<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T10["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S10 -->|calls| T10
  S11["method:NSMutableDictionary::add<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T11["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S11 -->|calls| T11
  S12["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T13["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S13 -->|calls| T13
  S14["method:NSMutableDictionary::jsonString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:39"]
  T14["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T15["function:KindOfNumberCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:95"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T16["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T17["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S17 -->|calls| T17
  S18["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T18["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S18 -->|calls| T18
  S19["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T19["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T20["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T21["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T22["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
