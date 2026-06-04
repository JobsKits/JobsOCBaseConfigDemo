# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T1["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  T3["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::MJRefreshBackFooterBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:301"]
  T4["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIView::MJRefreshFooterBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:314"]
  T5["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIView::endRefreshing<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T6["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S6 -->|calls| T6
  S7["method:UIView::endRefreshing<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T7["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S7 -->|calls| T7
  S8["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T8["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S8 -->|calls| T8
  S9["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T9["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S9 -->|calls| T9
  S10["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T10["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T11["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIView::currentController<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:UIViewController::path<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+GifImageView/UIViewController+GifImageView.m:36"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T14["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S14 -->|calls| T14
  S15["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T15["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S15 -->|calls| T15
  S16["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T16["method:UIViewController::makeBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:308"]
  S16 -->|calls| T16
  S17["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T17["method:UIViewController::fixErrorBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:318"]
  S17 -->|calls| T17
  S18["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T18["method:UIViewController::fixStartBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:328"]
  S18 -->|calls| T18
  S19["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T19["method:UIViewController::fixProgressBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:338"]
  S19 -->|calls| T19
  S20["method:UIViewController::configure<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:24"]
  T20["method:UIViewController::fixCompleteBlock<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+JPImageresizerView/UIViewController+JPImageresizerView.m:348"]
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
