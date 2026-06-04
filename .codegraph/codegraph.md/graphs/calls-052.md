# `calls 符号关系 - 052`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:CALayer::animaSubtype<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:122"]
  T1["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S1 -->|calls| T1
  S2["method:CALayer::animaTypeWithTransitionType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:136"]
  T2["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S2 -->|calls| T2
  S3["method:NSArray::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T3["method:NSArray::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S3 -->|calls| T3
  S4["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T4["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T5["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T6["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S6 -->|calls| T6
  S7["method:NSArray::jobsVisible<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  T8["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  S8 -->|calls| T8
  S9["method:NSCache::calcFolderSizeAtPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSCache/NSCache+Extra/NSCache+Extra.m:12"]
  T9["method:NSString::addPathComponent<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  S9 -->|calls| T9
  S10["method:NSCache::cleanCacheByPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSCache/NSCache+Extra/NSCache+Extra.m:35"]
  T10["method:NSString::addPathComponent<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  S10 -->|calls| T10
  S11["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T11["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T12["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S12 -->|calls| T12
  S13["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T13["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S13 -->|calls| T13
  S14["method:NSDate::readableDayTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T14["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S14 -->|calls| T14
  S15["method:NSDate::readableTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T15["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S15 -->|calls| T15
  S16["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T16["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S16 -->|calls| T16
  S17["method:NSDictionary::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T17["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S17 -->|calls| T17
  S18["method:NSDictionary::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T18["method:NSDictionary::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S18 -->|calls| T18
  S19["method:NSFormatter::date<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSFormatter::time<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:NSFormatter::time<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T21["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSLocale::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSLocale/NSLocale+Extra/NSLocale+Extra.m:18"]
  T22["method:NSLocale::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSLocale/NSLocale+Extra/NSLocale+Extra.m:18"]
  S22 -->|calls| T22
  S23["method:NSMutableDictionary::add<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T23["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S23 -->|calls| T23
  S24["method:NSMutableDictionary::add<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T24["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S24 -->|calls| T24
  S25["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T25["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
