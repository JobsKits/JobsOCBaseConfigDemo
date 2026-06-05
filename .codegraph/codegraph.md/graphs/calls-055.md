# `calls 符号关系 - 055`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CALayer::animaTypeWithTransitionType<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:136"]
  T1["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S1 -->|calls| T1
  S2["method:NSArray::containsObject<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T2["method:NSArray::containsObject<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S2 -->|calls| T2
  S3["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T3["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T4["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T5["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S5 -->|calls| T5
  S6["method:NSArray::jobsVisible<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:NSData::initWithData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T7["method:NSData::initWithData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T8["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S8 -->|calls| T8
  S9["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T9["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S9 -->|calls| T9
  S10["method:NSDate::readableDayTime<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T10["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S10 -->|calls| T10
  S11["method:NSDate::readableTime<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T11["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S11 -->|calls| T11
  S12["method:NSMutableDictionary::add<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:NSMutableDictionary::add<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T13["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S13 -->|calls| T13
  S14["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S14 -->|calls| T14
  S15["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T15["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T16["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T17["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S17 -->|calls| T17
  S18["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T18["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S18 -->|calls| T18
  S19["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T19["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T20["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T21["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T22["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
