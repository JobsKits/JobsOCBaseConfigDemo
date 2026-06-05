# `calls 符号关系 - 043`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::resetContentInsetRight<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:687"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIView::resetContentInsetOffsetTop<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:701"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIView::resetContentInsetOffsetLeft<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:715"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIView::resetContentInsetOffsetBottom<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:729"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIView::resetContentInsetOffsetRight<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:743"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIView::setSizer:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:926"]
  T6["method:NSValue::bySize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIView::setOrigin:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:940"]
  T7["method:NSValue::byPoint<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:24"]
  S7 -->|calls| T7
  S8["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T8["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T9["method:MJRefreshGifHeader::refreshStateIdleByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:57"]
  S9 -->|calls| T9
  S10["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T10["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T11["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T12["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIView::endRefreshing<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T13["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S13 -->|calls| T13
  S14["method:UIView::endRefreshing<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T14["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S14 -->|calls| T14
  S15["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T15["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S15 -->|calls| T15
  S16["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T16["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S16 -->|calls| T16
  S17["method:UIView::currentController<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:UIViewController::path<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+GifImageView/UIViewController+GifImageView.m:36"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T19["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S19 -->|calls| T19
  S20["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T20["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S20 -->|calls| T20
  S21["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T21["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S21 -->|calls| T21
  S22["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T22["method:UIViewController::fixErrorBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:318"]
  S22 -->|calls| T22
  S23["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T23["method:UIViewController::fixStartBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:328"]
  S23 -->|calls| T23
  S24["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T24["method:UIViewController::fixProgressBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:338"]
  S24 -->|calls| T24
  S25["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T25["method:UIViewController::fixCompleteBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:348"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
