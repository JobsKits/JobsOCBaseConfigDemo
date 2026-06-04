# `calls 符号关系 - 192`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FSCalendarDelegationFactory::dataSourceProxy<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarDelegationFactory/FSCalendarDelegationFactory.m:12"]
  T1["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S1 -->|calls| T1
  S2["method:FSCalendarDelegationFactory::delegateProxy<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarDelegationFactory/FSCalendarDelegationFactory.m:19"]
  T2["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S2 -->|calls| T2
  S3["method:NSCalendar::fs_privateComponents<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:217"]
  T3["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S3 -->|calls| T3
  S4["method:NSMapTable::setObject:forKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:231"]
  T4["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S4 -->|calls| T4
  S5["method:NSMapTable::objectForKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:242"]
  T5["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S5 -->|calls| T5
  S6["method:NSCache::setObject:forKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:251"]
  T6["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S6 -->|calls| T6
  S7["method:NSCache::objectForKeyedSubscript:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:262"]
  T7["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:1"]
  T8["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:1"]
  T9["method:NSString::hasSuffix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:1"]
  T10["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarExtensions/FSCalendarExtensions.m:1"]
  T11["method:NSString::hasSuffix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S11 -->|calls| T11
  S12["method:FSCalendarHeaderView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:25"]
  T12["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  S12 -->|calls| T12
  S13["method:FSCalendarHeaderView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:34"]
  T13["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  S13 -->|calls| T13
  S14["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T14["method:FSCalendarHeaderLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:260"]
  S14 -->|calls| T14
  S15["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T15["method:FSCalendarCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCollectionView/FSCalendarCollectionView.m:22"]
  S15 -->|calls| T15
  S16["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T16["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S16 -->|calls| T16
  S17["method:FSCalendarHeaderView::initialize<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:43"]
  T17["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S17 -->|calls| T17
  S18["method:FSCalendarHeaderView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:64"]
  T18["method:FSCalendarHeaderView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:64"]
  S18 -->|calls| T18
  S19["method:FSCalendarHeaderView::collectionView:cellForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:87"]
  T19["method:FSCalendarHeaderView::configureCell:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:153"]
  S19 -->|calls| T19
  S20["method:FSCalendarHeaderView::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:102"]
  T20["method:FSCalendarHeaderView::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:202"]
  S20 -->|calls| T20
  S21["method:FSCalendarHeaderView::setScrollOffset:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:108"]
  T21["method:FSCalendarHeaderView::setScrollOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:113"]
  S21 -->|calls| T21
  S22["method:FSCalendarHeaderView::setScrollOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:113"]
  T22["method:FSCalendarHeaderView::scrollToOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:118"]
  S22 -->|calls| T22
  S23["method:FSCalendarHeaderView::setScrollDirection:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:129"]
  T23["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S23 -->|calls| T23
  S24["method:FSCalendarHeaderView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:148"]
  T24["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S24 -->|calls| T24
  S25["method:FSCalendarHeaderView::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:202"]
  T25["method:FSCalendarHeaderView::configureCell:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:153"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
