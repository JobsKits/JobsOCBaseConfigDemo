# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::resetContentOffset<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:555"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIView::resetContentOffsetX<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:566"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIView::resetContentOffsetY<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:577"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIView::resetContentOffsetX_offset<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:588"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIView::resetContentOffsetY_offset<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:600"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIView::resetContentInset<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:612"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIView::resetContentInsetTop<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:623"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIView::resetContentInsetLeft<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:637"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIView::resetContentInsetBottom<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:651"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIView::resetContentInsetRight<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:665"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UIView::resetContentInsetOffsetTop<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:679"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UIView::resetContentInsetOffsetLeft<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:693"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:UIView::resetContentInsetOffsetBottom<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:707"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIView::resetContentInsetOffsetRight<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:721"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIView::setSizer:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:904"]
  T15["method:NSValue::bySize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:UIView::setOrigin:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:918"]
  T16["method:NSValue::byPoint<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:24"]
  S16 -->|calls| T16
  S17["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T17["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T18["method:MJRefreshGifHeader::refreshStateIdleByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:57"]
  S18 -->|calls| T18
  S19["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T19["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T20["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:252"]
  T21["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:UIView::endRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:480"]
  T22["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S22 -->|calls| T22
  S23["method:UIView::endRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:480"]
  T23["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S23 -->|calls| T23
  S24["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:499"]
  T24["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S24 -->|calls| T24
  S25["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:499"]
  T25["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
