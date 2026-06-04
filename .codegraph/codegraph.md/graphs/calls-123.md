# `calls 符号关系 - 123`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T1["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:JobsNavigationTransitionMgr::attachToViewController:animationDirection:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m:49"]
  T2["method:UIViewController::clzPopGesture<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Extra/UIViewController+Extra.m:40"]
  S2 -->|calls| T2
  S3["method:JobsNavigationTransitionMgr::attachToViewController:animationDirection:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m:49"]
  T3["method:JobsAppTools::directionByPoint<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools.m:55"]
  S3 -->|calls| T3
  S4["method:JobsNavigationTransitionMgr::animateTransition:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m:129"]
  T4["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S4 -->|calls| T4
  S5["method:CALayer::curve<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:107"]
  T5["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S5 -->|calls| T5
  S6["method:CALayer::animaSubtype<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:122"]
  T6["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S6 -->|calls| T6
  S7["method:CALayer::animaTypeWithTransitionType<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:136"]
  T7["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S7 -->|calls| T7
  S8["method:NSArray::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T8["method:NSArray::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S8 -->|calls| T8
  S9["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T9["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T10["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T11["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S11 -->|calls| T11
  S12["method:NSArray::jobsVisible<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T13["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T14["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S14 -->|calls| T14
  S15["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSDate::readableDayTime<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T16["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S16 -->|calls| T16
  S17["method:NSDate::readableTime<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T17["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S17 -->|calls| T17
  S18["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T18["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S18 -->|calls| T18
  S19["method:NSDictionary::objectForKey<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T19["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S19 -->|calls| T19
  S20["method:NSDictionary::objectForKey<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T20["method:NSDictionary::objectForKey<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S20 -->|calls| T20
  S21["method:NSFormatter::date<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:NSFormatter::time<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:NSFormatter::time<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T23["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T24["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S24 -->|calls| T24
  S25["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T25["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
