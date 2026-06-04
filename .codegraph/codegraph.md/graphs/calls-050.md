# `calls 符号关系 - 050`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T1["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T2["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S2 -->|calls| T2
  S3["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSDate::readableDayTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T4["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S4 -->|calls| T4
  S5["method:NSDate::readableTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T5["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S5 -->|calls| T5
  S6["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T6["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S6 -->|calls| T6
  S7["method:NSDictionary::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T7["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S7 -->|calls| T7
  S8["method:NSDictionary::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T8["method:NSDictionary::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S8 -->|calls| T8
  S9["method:NSFormatter::date<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:NSFormatter::time<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:NSFormatter::time<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T11["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:NSLocale::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSLocale/NSLocale+Extra/NSLocale+Extra.m:18"]
  T12["method:NSLocale::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSLocale/NSLocale+Extra/NSLocale+Extra.m:18"]
  S12 -->|calls| T12
  S13["method:NSMutableDictionary::add<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:NSMutableDictionary::add<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T14["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S14 -->|calls| T14
  S15["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T15["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S15 -->|calls| T15
  S16["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T16["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S16 -->|calls| T16
  S17["function:swizzled_setObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:45"]
  T17["function:swizzled_setObject:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:45"]
  S17 -->|calls| T17
  S18["function:swizzled_removeAllObjects<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:69"]
  T18["function:swizzled_removeAllObjects<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:69"]
  S18 -->|calls| T18
  S19["function:objectAtIndex:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:80"]
  T19["method:NSDictionary::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S19 -->|calls| T19
  S20["function:insertObject:forKey:atIndex:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:86"]
  T20["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S20 -->|calls| T20
  S21["function:replaceObjectAtIndex:withObject:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:115"]
  T21["function:insertObject:forKey:atIndex:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableDictionary/NSMutableDictionary+Ordered/NSMutableDictionary+Ordered.m:86"]
  S21 -->|calls| T21
  S22["method:NSMutableSet::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  T22["method:NSMutableSet::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
