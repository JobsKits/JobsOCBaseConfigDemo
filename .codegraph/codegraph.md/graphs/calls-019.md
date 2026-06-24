# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FSCalendarEventIndicator::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:399"]
  T1["method:FSCalendarEventIndicator::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:399"]
  S1 -->|calls| T1
  S2["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:FSCalendarEventIndicator::setColor:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:427"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:FSCalendarEventIndicator::setNumberOfEvents:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:448"]
  T6["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S6 -->|calls| T6
  S7["method:FSCalendarCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:22"]
  T7["method:FSCalendarCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:22"]
  S7 -->|calls| T7
  S8["method:FSCalendarCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:22"]
  T8["method:FSCalendarCollectionView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:40"]
  S8 -->|calls| T8
  S9["method:FSCalendarCollectionView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:31"]
  T9["method:FSCalendarCollectionView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:40"]
  S9 -->|calls| T9
  S10["method:FSCalendarCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:48"]
  T10["method:FSCalendarCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:48"]
  S10 -->|calls| T10
  S11["method:FSCalendarCollectionViewLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:51"]
  T11["method:FSCalendarCollectionViewLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:51"]
  S11 -->|calls| T11
  S12["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T12["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  S12 -->|calls| T12
  S13["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T13["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  S13 -->|calls| T13
  S14["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T14["method:FSCalendarCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:447"]
  S14 -->|calls| T14
  S15["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T15["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  S15 -->|calls| T15
  S16["method:FSCalendarCollectionViewLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:404"]
  T16["method:FSCalendarCollectionViewLayout::calculateRowOffset:totalRows:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:535"]
  S16 -->|calls| T16
  S17["method:FSCalendarCollectionViewLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:404"]
  T17["method:FSCalendarCollectionViewLayout::calculateRowOffset:totalRows:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:535"]
  S17 -->|calls| T17
  S18["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  T18["method:FSCalendarCollectionViewLayout::calculateRowOffset:totalRows:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:535"]
  S18 -->|calls| T18
  S19["method:FSCalendarCollectionViewLayout::didReceiveNotifications:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:511"]
  T19["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S19 -->|calls| T19
  S20["method:FSCalendarDelegationFactory::dataSourceProxy<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarDelegationFactory/FSCalendarDelegationFactory.m:12"]
  T20["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S20 -->|calls| T20
  S21["method:FSCalendarDelegationFactory::delegateProxy<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarDelegationFactory/FSCalendarDelegationFactory.m:19"]
  T21["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S21 -->|calls| T21
  S22["method:NSCalendar::fs_privateComponents<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:217"]
  T22["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S22 -->|calls| T22
  S23["method:NSMapTable::setObject:forKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:231"]
  T23["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S23 -->|calls| T23
  S24["method:NSCache::setObject:forKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:251"]
  T24["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S24 -->|calls| T24
  S25["method:FSCalendarHeaderView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:25"]
  T25["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
