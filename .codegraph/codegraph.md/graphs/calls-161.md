# `calls 符号关系 - 161`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T1["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:NSData::stringByUTF8Encoding<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:134"]
  T2["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S2 -->|calls| T2
  S3["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T3["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S3 -->|calls| T3
  S4["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T4["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S4 -->|calls| T4
  S5["method:NSDate::readableDayTime<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T5["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S5 -->|calls| T5
  S6["method:NSDate::readableTime<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T6["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S6 -->|calls| T6
  S7["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T7["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S7 -->|calls| T7
  S8["method:NSDictionary::objectForKey<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["method:NSDictionary::objectForKey<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T9["method:NSDictionary::objectForKey<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S9 -->|calls| T9
  S10["method:NSFormatter::date<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:NSFormatter::time<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSFormatter::time<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T12["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T14["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S14 -->|calls| T14
  S15["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T15["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S15 -->|calls| T15
  S16["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T16["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S16 -->|calls| T16
  S17["method:NSMutableDictionary::jsonString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:39"]
  T17["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S17 -->|calls| T17
  S18["method:NSMutableSet::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  T18["method:NSMutableSet::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  S18 -->|calls| T18
  S19["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T19["function:KindOfNumberCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:95"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T20["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T21["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T22["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
