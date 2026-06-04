# `calls 符号关系 - 179`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T1["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S1 -->|calls| T1
  S2["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T2["method:ASCollectionView::collectionView:shouldSelectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1399"]
  S2 -->|calls| T2
  S3["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T3["method:JXCategoryBaseView::collectionView:didSelectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:495"]
  S3 -->|calls| T3
  S4["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T4["method:ASCollectionView::collectionView:shouldDeselectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1432"]
  S4 -->|calls| T4
  S5["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T5["method:ASCollectionView::collectionView:didDeselectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1449"]
  S5 -->|calls| T5
  S6["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T6["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S6 -->|calls| T6
  S7["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T7["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S7 -->|calls| T7
  S8["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T8["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S8 -->|calls| T8
  S9["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T9["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S9 -->|calls| T9
  S10["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T10["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S10 -->|calls| T10
  S11["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T11["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S11 -->|calls| T11
  S12["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  T12["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S12 -->|calls| T12
  S13["method:FSCalendarCalculator::initWithCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:35"]
  T13["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S13 -->|calls| T13
  S14["method:FSCalendarCalculator::dateForIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:96"]
  T14["method:FSCalendarCalculator::dateForIndexPath:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:76"]
  S14 -->|calls| T14
  S15["method:FSCalendarCalculator::indexPathForDate:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:102"]
  T15["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:112"]
  S15 -->|calls| T15
  S16["method:FSCalendarCalculator::indexPathForDate:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:107"]
  T16["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:112"]
  S16 -->|calls| T16
  S17["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:142"]
  T17["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:112"]
  S17 -->|calls| T17
  S18["method:FSCalendarCalculator::reloadSections<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:270"]
  T18["method:FSCalendarCalculator::clearCaches<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:277"]
  S18 -->|calls| T18
  S19["method:FSCalendarCalculator::didReceiveNotifications:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:287"]
  T19["method:FSCalendarCalculator::clearCaches<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:277"]
  S19 -->|calls| T19
  S20["method:FSCalendarCell::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:29"]
  T20["method:FSCalendarCell::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:47"]
  S20 -->|calls| T20
  S21["method:FSCalendarCell::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:38"]
  T21["method:FSCalendarCell::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:47"]
  S21 -->|calls| T21
  S22["method:FSCalendarCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:90"]
  T22["method:FSCalendarCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:90"]
  S22 -->|calls| T22
  S23["method:FSCalendarCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:156"]
  T23["method:FSCalendarCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:156"]
  S23 -->|calls| T23
  S24["method:FSCalendarCell::performSelecting<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:168"]
  T24["method:UITabBarItem::animation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBarItem/UITabBarItem+Category/UITabBarItem+TLAnimation/UITabBarItem+TLAnimation.m:20"]
  S24 -->|calls| T24
  S25["method:FSCalendarCell::performSelecting<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:168"]
  T25["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
