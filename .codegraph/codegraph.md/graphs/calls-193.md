# `calls 符号关系 - 193`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FSCalendarHeaderCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:232"]
  T1["method:FSCalendarHeaderCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:232"]
  S1 -->|calls| T1
  S2["method:FSCalendarHeaderLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:260"]
  T2["method:FSCalendarHeaderLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:260"]
  S2 -->|calls| T2
  S3["method:FSCalendarHeaderLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:279"]
  T3["method:FSCalendarHeaderLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:279"]
  S3 -->|calls| T3
  S4["method:FSCalendarHeaderLayout::didReceiveOrientationChangeNotification:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:290"]
  T4["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S4 -->|calls| T4
  S5["method:FSCalendarHeaderTouchDeliver::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:304"]
  T5["method:FSCalendarHeaderTouchDeliver::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:304"]
  S5 -->|calls| T5
  S6["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T6["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S6 -->|calls| T6
  S7["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T7["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S7 -->|calls| T7
  S8["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T8["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S8 -->|calls| T8
  S9["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T9["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S9 -->|calls| T9
  S10["method:FSCalendarStickyHeader::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:56"]
  T10["method:FSCalendarStickyHeader::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:56"]
  S10 -->|calls| T10
  S11["method:FSCalendarStickyHeader::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:81"]
  T11["method:FSCalendarStickyHeader::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:92"]
  S11 -->|calls| T11
  S12["method:FSCalendarTransitionCoordinator::initWithCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:37"]
  T12["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S12 -->|calls| T12
  S13["method:FSCalendarTransitionCoordinator::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:75"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:FSCalendarTransitionCoordinator::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:75"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["method:FSCalendarTransitionCoordinator::gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:75"]
  T15["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S15 -->|calls| T15
  S16["method:FSCalendarTransitionCoordinator::scopeTransitionDidBegin:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:109"]
  T16["method:FSCalendarTransitionCoordinator::prepareWeekToMonthTransition<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:386"]
  S16 -->|calls| T16
  S17["method:FSCalendarTransitionCoordinator::scopeTransitionDidEnd:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:145"]
  T17["method:FSCalendarTransitionCoordinator::performTransition:fromProgress:toProgress:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:323"]
  S17 -->|calls| T17
  S18["method:FSCalendarTransitionCoordinator::performScopeTransitionFromScope:toScope:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:169"]
  T18["method:FSCalendarTransitionCoordinator::prepareWeekToMonthTransition<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:386"]
  S18 -->|calls| T18
  S19["method:FSCalendarTransitionCoordinator::performScopeTransitionFromScope:toScope:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:169"]
  T19["method:FSCalendarTransitionCoordinator::performTransition:fromProgress:toProgress:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:323"]
  S19 -->|calls| T19
  S20["method:FSCalendarTransitionCoordinator::performBoundingRectTransitionFromMonth:toMonth:duration:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:187"]
  T20["method:FSCalendarTransitionCoordinator::boundingRectForScope:page:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:300"]
  S20 -->|calls| T20
  S21["method:FSCalendarTransitionCoordinator::performBoundingRectTransitionFromMonth:toMonth:duration:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:187"]
  T21["method:FSCalendarTransitionCoordinator::boundingRectWillChange:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:316"]
  S21 -->|calls| T21
  S22["method:FSCalendarTransitionCoordinator::performBoundingRectTransitionFromMonth:toMonth:duration:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:187"]
  T22["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIView/UIView+TFPopup/UIView+TFPopup.h:170"]
  S22 -->|calls| T22
  S23["method:FSCalendarTransitionCoordinator::performBoundingRectTransitionFromMonth:toMonth:duration:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:187"]
  T23["method:FSCalendarTransitionCoordinator::boundingRectWillChange:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:316"]
  S23 -->|calls| T23
  S24["method:FSCalendarTransitionCoordinator::createTransitionAttributesTargetingScope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:243"]
  T24["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S24 -->|calls| T24
  S25["method:FSCalendarTransitionCoordinator::createTransitionAttributesTargetingScope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:243"]
  T25["method:FSCalendarTransitionCoordinator::boundingRectForScope:page:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:300"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
