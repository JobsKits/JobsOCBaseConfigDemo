# `calls 符号关系 - 178`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T3["method:FSCalendarHeaderView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:148"]
  S3 -->|calls| T3
  S4["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T4["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S4 -->|calls| T4
  S5["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T5["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S5 -->|calls| T5
  S6["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T6["function:FSCalendarAssertDateInBounds<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:33"]
  S6 -->|calls| T6
  S7["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T10["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S10 -->|calls| T10
  S11["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T11["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S11 -->|calls| T11
  S12["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T12["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S12 -->|calls| T12
  S13["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T13["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S13 -->|calls| T13
  S14["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T14["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S14 -->|calls| T14
  S15["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T15["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S15 -->|calls| T15
  S16["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T16["method:FSCalendarCell::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:191"]
  S16 -->|calls| T16
  S17["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T17["function:FSCalendarAssertDateInBounds<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:33"]
  S17 -->|calls| T17
  S18["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T18["method:JXCategoryBaseView::collectionView:didSelectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:495"]
  S18 -->|calls| T18
  S19["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T19["method:JXCategoryBaseView::collectionView:didSelectItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Base/JXCategoryBaseView.m:495"]
  S19 -->|calls| T19
  S20["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T20["method:FSCalendarCell::performSelecting<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCell/FSCalendarCell.m:168"]
  S20 -->|calls| T20
  S21["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T21["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S21 -->|calls| T21
  S22["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T22["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S22 -->|calls| T22
  S23["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T23["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S23 -->|calls| T23
  S24["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T24["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S24 -->|calls| T24
  S25["function:NS_ENUM<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendar/FSCalendar.m:53"]
  T25["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
