# `calls 符号关系 - 123`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T1["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  S1 -->|calls| T1
  S2["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T2["method:FSCalendarCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:447"]
  S2 -->|calls| T2
  S3["method:FSCalendarCollectionViewLayout::layoutAttributesForElementsInRect:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:255"]
  T3["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  S3 -->|calls| T3
  S4["method:FSCalendarCollectionViewLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:404"]
  T4["method:FSCalendarCollectionViewLayout::calculateRowOffset:totalRows:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:535"]
  S4 -->|calls| T4
  S5["method:FSCalendarCollectionViewLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:404"]
  T5["method:FSCalendarCollectionViewLayout::calculateRowOffset:totalRows:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:535"]
  S5 -->|calls| T5
  S6["method:FSCalendarCollectionViewLayout::layoutAttributesForDecorationViewOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:462"]
  T6["method:FSCalendarCollectionViewLayout::calculateRowOffset:totalRows:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:535"]
  S6 -->|calls| T6
  S7["method:FSCalendarCollectionViewLayout::didReceiveNotifications:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionViewLayout/FSCalendarCollectionViewLayout.m:511"]
  T7["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S7 -->|calls| T7
  S8["method:FSCalendarDelegationFactory::dataSourceProxy<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarDelegationFactory/FSCalendarDelegationFactory.m:12"]
  T8["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S8 -->|calls| T8
  S9["method:FSCalendarDelegationFactory::delegateProxy<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarDelegationFactory/FSCalendarDelegationFactory.m:19"]
  T9["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S9 -->|calls| T9
  S10["method:NSCalendar::fs_privateComponents<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:217"]
  T10["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S10 -->|calls| T10
  S11["method:NSMapTable::setObject:forKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:231"]
  T11["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S11 -->|calls| T11
  S12["method:NSMapTable::objectForKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:242"]
  T12["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S12 -->|calls| T12
  S13["method:NSCache::setObject:forKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:251"]
  T13["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S13 -->|calls| T13
  S14["method:NSCache::objectForKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:262"]
  T14["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:1"]
  T15["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:1"]
  T16["method:NSString::hasSuffix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:1"]
  T17["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:1"]
  T18["method:NSString::hasSuffix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S18 -->|calls| T18
  S19["method:FSCalendarHeaderView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:25"]
  T19["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  S19 -->|calls| T19
  S20["method:FSCalendarHeaderView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:34"]
  T20["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  S20 -->|calls| T20
  S21["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T21["method:FSCalendarHeaderLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:260"]
  S21 -->|calls| T21
  S22["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T22["method:FSCalendarCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:22"]
  S22 -->|calls| T22
  S23["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T23["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S23 -->|calls| T23
  S24["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:FSCalendarHeaderView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:64"]
  T25["method:FSCalendarHeaderView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:64"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
