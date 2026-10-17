# `calls 符号关系 - 045`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::MJRefreshFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:314"]
  T1["method:MJRefreshAutoStateFooter::byAutomaticallyChangeAlpha<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:49"]
  S1 -->|calls| T1
  S2["method:UIView::endRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T2["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S2 -->|calls| T2
  S3["method:UIView::endRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T3["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:93"]
  S3 -->|calls| T3
  S4["method:UIView::endRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T4["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S4 -->|calls| T4
  S5["method:UIView::endRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T5["method:UIView::endMJHeaderRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:520"]
  S5 -->|calls| T5
  S6["method:UIView::endRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T6["method:UIView::endMJFooterRefreshingWithMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:542"]
  S6 -->|calls| T6
  S7["method:UIView::endRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T7["method:UIView::endXZMHeaderRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:558"]
  S7 -->|calls| T7
  S8["method:UIView::endRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T8["method:UIView::endXZMFooterRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:569"]
  S8 -->|calls| T8
  S9["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T9["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S9 -->|calls| T9
  S10["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T10["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:93"]
  S10 -->|calls| T10
  S11["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T11["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S11 -->|calls| T11
  S12["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T12["method:UIView::endMJHeaderRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:520"]
  S12 -->|calls| T12
  S13["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T13["method:UIView::endMJFooterRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:531"]
  S13 -->|calls| T13
  S14["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T14["method:UIView::endXZMHeaderRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:558"]
  S14 -->|calls| T14
  S15["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T15["method:UIView::endXZMFooterRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:569"]
  S15 -->|calls| T15
  S16["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:600"]
  T16["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:600"]
  T17["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:UIView::lotAnimMJRefreshHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:627"]
  T18["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  S18 -->|calls| T18
  S19["method:UIView::mjRefreshNormalHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:641"]
  T19["method:UIView::MJRefreshNormalHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:74"]
  S19 -->|calls| T19
  S20["method:UIView::mjRefreshStateHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:655"]
  T20["method:UIView::MJRefreshStateHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:94"]
  S20 -->|calls| T20
  S21["method:UIView::mjRefreshHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:669"]
  T21["method:UIView::MJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:114"]
  S21 -->|calls| T21
  S22["method:UIView::mjRefreshGifHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:683"]
  T22["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  S22 -->|calls| T22
  S23["method:UIView::mjRefreshAutoGifFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:698"]
  T23["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  S23 -->|calls| T23
  S24["method:UIView::mjRefreshBackNormalFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:712"]
  T24["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:189"]
  S24 -->|calls| T24
  S25["method:UIView::mjRefreshAutoNormalFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:726"]
  T25["method:UIView::MJRefreshAutoNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:208"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
