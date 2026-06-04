# `calls 符号关系 - 037`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:39"]
  T1["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S1 -->|calls| T1
  S2["method:JobsMenuView::initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:46"]
  T2["method:JobsMenuView::init<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:23"]
  S2 -->|calls| T2
  S3["method:JobsMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:72"]
  T3["method:JobsLinkageMenuView::jobsRichViewByModel<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:62"]
  S3 -->|calls| T3
  S4["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T4["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S4 -->|calls| T4
  S5["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T5["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T6["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T7["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S7 -->|calls| T7
  S8["method:NSArray::jobsVisible<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:NSData::initWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T9["method:NSData::initWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T10["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S10 -->|calls| T10
  S11["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T11["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S11 -->|calls| T11
  S12["method:NSDate::readableDayTime<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T12["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S12 -->|calls| T12
  S13["method:NSDate::readableTime<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T13["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S13 -->|calls| T13
  S14["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T14["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S14 -->|calls| T14
  S15["method:NSFormatter::date<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:NSFormatter::time<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:NSFormatter::time<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T17["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSMutableDictionary::add<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:NSMutableDictionary::add<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T19["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S19 -->|calls| T19
  S20["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T21["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T22["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
