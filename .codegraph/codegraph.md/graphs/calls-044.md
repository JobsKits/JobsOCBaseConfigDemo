# `calls 符号关系 - 044`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::MJRefreshAutoNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:208"]
  T1["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  S1 -->|calls| T1
  S2["method:UIView::MJRefreshAutoNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:208"]
  T2["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S2 -->|calls| T2
  S3["method:UIView::MJRefreshAutoNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:208"]
  T3["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S3 -->|calls| T3
  S4["method:UIView::MJRefreshAutoNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:208"]
  T4["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:227"]
  T5["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  S5 -->|calls| T5
  S6["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:227"]
  T6["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S6 -->|calls| T6
  S7["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:227"]
  T7["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S7 -->|calls| T7
  S8["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:227"]
  T8["method:MJRefreshAutoStateFooter::byAutomaticallyChangeAlpha<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:49"]
  S8 -->|calls| T8
  S9["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:227"]
  T9["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T10["method:MJRefreshAutoGifFooter::refreshStateNoMoreDataByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:48"]
  S10 -->|calls| T10
  S11["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T11["method:MJRefreshAutoGifFooter::refreshStateWillRefreshByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:39"]
  S11 -->|calls| T11
  S12["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T12["method:MJRefreshAutoGifFooter::refreshStatePullingByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:21"]
  S12 -->|calls| T12
  S13["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T13["method:MJRefreshBackGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackGifFooter/MJRefreshBackGifFooter+Extra/MJRefreshBackGifFooter+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T14["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  S14 -->|calls| T14
  S15["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T15["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S15 -->|calls| T15
  S16["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T16["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S16 -->|calls| T16
  S17["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T17["method:MJRefreshAutoStateFooter::byAutomaticallyChangeAlpha<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:49"]
  S17 -->|calls| T17
  S18["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T18["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  T19["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  S19 -->|calls| T19
  S20["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  T20["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S20 -->|calls| T20
  S21["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  T21["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S21 -->|calls| T21
  S22["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  T22["method:MJRefreshBackStateFooter::byAutomaticallyChangeAlpha<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra/MJRefreshBackStateFooter+Extra.m:35"]
  S22 -->|calls| T22
  S23["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  T23["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:UIView::MJRefreshBackFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:301"]
  T24["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIView::MJRefreshFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:314"]
  T25["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
