# `calls 符号关系 - 011`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSCache::setObject:forKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:251"]
  T1["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S1 -->|calls| T1
  S2["method:FSCalendarHeaderView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:25"]
  T2["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  S2 -->|calls| T2
  S3["method:FSCalendarHeaderView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:34"]
  T3["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  S3 -->|calls| T3
  S4["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T4["method:FSCalendarHeaderLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:260"]
  S4 -->|calls| T4
  S5["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T5["method:FSCalendarCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:22"]
  S5 -->|calls| T5
  S6["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:FSCalendarHeaderView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:64"]
  T7["method:FSCalendarHeaderView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:64"]
  S7 -->|calls| T7
  S8["method:FSCalendarHeaderView::collectionView:cellForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:87"]
  T8["method:FSCalendarHeaderView::configureCell:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:153"]
  S8 -->|calls| T8
  S9["method:FSCalendarHeaderView::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:102"]
  T9["method:FSCalendarHeaderView::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:202"]
  S9 -->|calls| T9
  S10["method:FSCalendarHeaderView::setScrollOffset:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:108"]
  T10["method:FSCalendarHeaderView::setScrollOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:113"]
  S10 -->|calls| T10
  S11["method:FSCalendarHeaderView::setScrollOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:113"]
  T11["method:FSCalendarHeaderView::scrollToOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:118"]
  S11 -->|calls| T11
  S12["method:FSCalendarHeaderView::setScrollDirection:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:129"]
  T12["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S12 -->|calls| T12
  S13["method:FSCalendarHeaderView::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:202"]
  T13["method:FSCalendarHeaderView::configureCell:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:153"]
  S13 -->|calls| T13
  S14["method:FSCalendarHeaderCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:232"]
  T14["method:FSCalendarHeaderCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:232"]
  S14 -->|calls| T14
  S15["method:FSCalendarHeaderLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:260"]
  T15["method:FSCalendarHeaderLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:260"]
  S15 -->|calls| T15
  S16["method:FSCalendarHeaderLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:279"]
  T16["method:FSCalendarHeaderLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:279"]
  S16 -->|calls| T16
  S17["method:FSCalendarHeaderLayout::didReceiveOrientationChangeNotification:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:290"]
  T17["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S17 -->|calls| T17
  S18["method:FSCalendarHeaderTouchDeliver::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:304"]
  T18["method:FSCalendarHeaderTouchDeliver::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:304"]
  S18 -->|calls| T18
  S19["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T19["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S19 -->|calls| T19
  S20["method:FSCalendarStickyHeader::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:56"]
  T20["method:FSCalendarStickyHeader::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:56"]
  S20 -->|calls| T20
  S21["method:FSCalendarStickyHeader::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:81"]
  T21["method:FSCalendarStickyHeader::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:92"]
  S21 -->|calls| T21
  S22["method:FSCalendarWeekdayView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:25"]
  T22["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  S22 -->|calls| T22
  S23["method:FSCalendarWeekdayView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:34"]
  T23["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  S23 -->|calls| T23
  S24["method:FSCalendarWeekdayView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:58"]
  T24["method:FSCalendarWeekdayView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:58"]
  S24 -->|calls| T24
  S25["method:FSCalendarWeekdayView::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:87"]
  T25["method:FSCalendarWeekdayView::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:98"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
