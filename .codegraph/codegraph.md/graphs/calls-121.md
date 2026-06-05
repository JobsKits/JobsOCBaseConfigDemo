# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T1["method:JXCategoryBaseView::collectionView:didSelectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:495"]
  S1 -->|calls| T1
  S2["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T2["method:FSCalendarCell::performSelecting<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:168"]
  S2 -->|calls| T2
  S3["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T3["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S3 -->|calls| T3
  S4["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T4["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S4 -->|calls| T4
  S5["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T5["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S5 -->|calls| T5
  S6["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T6["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S6 -->|calls| T6
  S7["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T7["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S7 -->|calls| T7
  S8["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T8["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S8 -->|calls| T8
  S9["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T9["method:ASCollectionView::collectionView:shouldSelectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1399"]
  S9 -->|calls| T9
  S10["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T10["method:JXCategoryBaseView::collectionView:didSelectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:495"]
  S10 -->|calls| T10
  S11["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T11["method:ASCollectionView::collectionView:shouldDeselectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1432"]
  S11 -->|calls| T11
  S12["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T12["method:ASCollectionView::collectionView:didDeselectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1449"]
  S12 -->|calls| T12
  S13["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T13["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S13 -->|calls| T13
  S14["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T14["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S14 -->|calls| T14
  S15["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T15["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S15 -->|calls| T15
  S16["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T16["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S16 -->|calls| T16
  S17["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T17["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S17 -->|calls| T17
  S18["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T18["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S18 -->|calls| T18
  S19["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  T19["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S19 -->|calls| T19
  S20["method:FSCalendarCalculator::initWithCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:35"]
  T20["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S20 -->|calls| T20
  S21["method:FSCalendarCalculator::dateForIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:96"]
  T21["method:FSCalendarCalculator::dateForIndexPath:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:76"]
  S21 -->|calls| T21
  S22["method:FSCalendarCalculator::indexPathForDate:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:102"]
  T22["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:112"]
  S22 -->|calls| T22
  S23["method:FSCalendarCalculator::indexPathForDate:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:107"]
  T23["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:112"]
  S23 -->|calls| T23
  S24["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:142"]
  T24["method:FSCalendarCalculator::indexPathForDate:atMonthPosition:scope:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:112"]
  S24 -->|calls| T24
  S25["method:FSCalendarCalculator::reloadSections<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:270"]
  T25["method:FSCalendarCalculator::clearCaches<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:277"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
