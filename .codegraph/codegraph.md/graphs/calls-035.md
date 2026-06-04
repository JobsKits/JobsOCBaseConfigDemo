# `calls 符号关系 - 035`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T1["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S1 -->|calls| T1
  S2["method:JobsLinkageMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:219"]
  T2["method:UIView::addSubview<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S2 -->|calls| T2
  S3["method:JobsMenuView::init<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:23"]
  T3["method:JobsMenuView::init<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:23"]
  S3 -->|calls| T3
  S4["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:39"]
  T4["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:39"]
  S4 -->|calls| T4
  S5["method:JobsMenuView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:39"]
  T5["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S5 -->|calls| T5
  S6["method:JobsMenuView::initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:46"]
  T6["method:JobsMenuView::init<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:23"]
  S6 -->|calls| T6
  S7["method:JobsMenuView::menuView<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsMenuView/JobsMenuView.m:72"]
  T7["method:JobsLinkageMenuView::jobsRichViewByModel<br/>JobsByPods/JobsBaseUI@Pods/Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m:62"]
  S7 -->|calls| T7
  S8["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T8["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S8 -->|calls| T8
  S9["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T9["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T10["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T11["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S11 -->|calls| T11
  S12["method:NSArray::jobsVisible<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSData::initWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T13["method:NSData::initWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T14["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S14 -->|calls| T14
  S15["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSDate::readableDayTime<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T16["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S16 -->|calls| T16
  S17["method:NSDate::readableTime<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T17["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S17 -->|calls| T17
  S18["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T18["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S18 -->|calls| T18
  S19["method:NSFormatter::date<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSFormatter::time<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:NSFormatter::time<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T21["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSMutableDictionary::add<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S22 -->|calls| T22
  S23["method:NSMutableDictionary::add<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T23["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S23 -->|calls| T23
  S24["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T24["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S24 -->|calls| T24
  S25["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T25["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
