# `calls 符号关系 - 085`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T1["method:MJRefreshGifHeader::refreshStateIdleByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:57"]
  S1 -->|calls| T1
  S2["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T2["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T3["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T4["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIView::endRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T5["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S5 -->|calls| T5
  S6["method:UIView::endRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T6["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S6 -->|calls| T6
  S7["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T7["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S7 -->|calls| T7
  S8["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T8["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S8 -->|calls| T8
  S9["method:JobsNavigationTransitionMgr::attachToViewController:animationDirection:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m:49"]
  T9["method:UIViewController::clzPopGesture<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Extra/UIViewController+Extra.m:40"]
  S9 -->|calls| T9
  S10["method:JobsNavigationTransitionMgr::attachToViewController:animationDirection:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m:49"]
  T10["method:JobsAppTools::directionByPoint<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools.m:55"]
  S10 -->|calls| T10
  S11["method:JobsNavigationTransitionMgr::animateTransition:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m:129"]
  T11["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S11 -->|calls| T11
  S12["method:CALayer::curve<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:107"]
  T12["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S12 -->|calls| T12
  S13["method:CALayer::animaSubtype<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:122"]
  T13["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S13 -->|calls| T13
  S14["method:CALayer::animaTypeWithTransitionType<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:136"]
  T14["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S14 -->|calls| T14
  S15["method:NSArray::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T15["method:NSArray::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S15 -->|calls| T15
  S16["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T16["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T17["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T18["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S18 -->|calls| T18
  S19["method:NSArray::jobsVisible<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T20["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T21["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S21 -->|calls| T21
  S22["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T22["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S22 -->|calls| T22
  S23["method:NSDate::readableDayTime<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T23["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S23 -->|calls| T23
  S24["method:NSDate::readableTime<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T24["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S24 -->|calls| T24
  S25["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T25["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
