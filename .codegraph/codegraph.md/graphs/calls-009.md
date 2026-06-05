# `calls 符号关系 - 009`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::img<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:12"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S1 -->|calls| T1
  S2["method:NSObject::imageByDataURL<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+Image.m:46"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:NSString::add<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:26"]
  T3["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S3 -->|calls| T3
  S4["method:NSString::isContainsUrl<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:36"]
  T4["method:NSString::rangeOfString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S4 -->|calls| T4
  S5["method:NSData::initWithData<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T5["method:NSData::initWithData<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T6["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S6 -->|calls| T6
  S7["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T7["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S7 -->|calls| T7
  S8["method:NSDate::readableDayTime<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T8["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S8 -->|calls| T8
  S9["method:NSDate::readableTime<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T9["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S9 -->|calls| T9
  S10["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T10["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S10 -->|calls| T10
  S11["method:NSDictionary::objectForKey<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:12"]
  T11["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S11 -->|calls| T11
  S12["method:NSDictionary::objectForKey<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:12"]
  T12["method:NSDictionary::objectForKey<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:NSFormatter::time<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:NSFormatter::time<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T15["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSMutableDictionary::add<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S16 -->|calls| T16
  S17["method:NSMutableDictionary::add<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T17["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S17 -->|calls| T17
  S18["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T19["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T20["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T21["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T22["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
