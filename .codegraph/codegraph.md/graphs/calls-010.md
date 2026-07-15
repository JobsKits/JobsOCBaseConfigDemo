# `calls 符号关系 - 010`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FSCalendarCell::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:346"]
  T1["method:FSCalendarBlankCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:460"]
  S1 -->|calls| T1
  S2["method:FSCalendarCell::setSubtitle:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:355"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["method:FSCalendarEventIndicator::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:399"]
  T3["method:FSCalendarEventIndicator::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:399"]
  S3 -->|calls| T3
  S4["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["method:FSCalendarEventIndicator::setNumberOfEvents:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:448"]
  T8["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S8 -->|calls| T8
  S9["method:FSCalendarCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:22"]
  T9["method:FSCalendarCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:22"]
  S9 -->|calls| T9
  S10["method:FSCalendarCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:22"]
  T10["method:FSCalendarCollectionView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:40"]
  S10 -->|calls| T10
  S11["method:FSCalendarCollectionView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:31"]
  T11["method:FSCalendarCollectionView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:40"]
  S11 -->|calls| T11
  S12["method:FSCalendarCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:48"]
  T12["method:FSCalendarCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:48"]
  S12 -->|calls| T12
  S13["method:FSCalendarCollectionViewLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:51"]
  T13["method:FSCalendarCollectionViewLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:51"]
  S13 -->|calls| T13
  S14["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T14["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  S14 -->|calls| T14
  S15["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T15["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  S15 -->|calls| T15
  S16["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T16["method:FSCalendarCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:447"]
  S16 -->|calls| T16
  S17["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T17["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  S17 -->|calls| T17
  S18["method:FSCalendarCollectionViewLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:404"]
  T18["method:FSCalendarCollectionViewLayout::calculateRowOffset:totalRows:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:535"]
  S18 -->|calls| T18
  S19["method:FSCalendarCollectionViewLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:404"]
  T19["method:FSCalendarCollectionViewLayout::calculateRowOffset:totalRows:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:535"]
  S19 -->|calls| T19
  S20["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  T20["method:FSCalendarCollectionViewLayout::calculateRowOffset:totalRows:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:535"]
  S20 -->|calls| T20
  S21["method:FSCalendarCollectionViewLayout::didReceiveNotifications:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:511"]
  T21["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S21 -->|calls| T21
  S22["method:FSCalendarDelegationFactory::dataSourceProxy<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarDelegationFactory/FSCalendarDelegationFactory.m:12"]
  T22["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S22 -->|calls| T22
  S23["method:FSCalendarDelegationFactory::delegateProxy<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarDelegationFactory/FSCalendarDelegationFactory.m:19"]
  T23["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S23 -->|calls| T23
  S24["method:NSCalendar::fs_privateComponents<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:217"]
  T24["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S24 -->|calls| T24
  S25["method:NSMapTable::setObject:forKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:231"]
  T25["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
