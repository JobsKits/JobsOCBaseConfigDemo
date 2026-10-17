# `calls 符号关系 - 043`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::MJRefreshStateHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:94"]
  T1["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::MJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:114"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T3["method:MJRefreshAutoGifFooter::refreshStateNoMoreDataByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:48"]
  S3 -->|calls| T3
  S4["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T4["method:MJRefreshAutoGifFooter::refreshStateWillRefreshByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:39"]
  S4 -->|calls| T4
  S5["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T5["method:MJRefreshAutoGifFooter::refreshStatePullingByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:21"]
  S5 -->|calls| T5
  S6["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T6["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra/MJRefreshGifHeader+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T7["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  S7 -->|calls| T7
  S8["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T8["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S8 -->|calls| T8
  S9["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T9["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S9 -->|calls| T9
  S10["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T10["method:MJRefreshStateHeader::byAutomaticallyChangeAlpha<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra/MJRefreshStateHeader+Extra.m:35"]
  S10 -->|calls| T10
  S11["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T11["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T12["method:MJRefreshAutoGifFooter::refreshStateNoMoreDataByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:48"]
  S12 -->|calls| T12
  S13["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T13["method:MJRefreshAutoGifFooter::refreshStateWillRefreshByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:39"]
  S13 -->|calls| T13
  S14["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T14["method:MJRefreshAutoGifFooter::refreshStatePullingByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:21"]
  S14 -->|calls| T14
  S15["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T15["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T16["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  S16 -->|calls| T16
  S17["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T17["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S17 -->|calls| T17
  S18["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T18["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S18 -->|calls| T18
  S19["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T19["method:MJRefreshAutoStateFooter::byAutomaticallyChangeAlpha<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:49"]
  S19 -->|calls| T19
  S20["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T20["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:189"]
  T21["variable:loadBlock<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.h:120"]
  S21 -->|calls| T21
  S22["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:189"]
  T22["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  S22 -->|calls| T22
  S23["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:189"]
  T23["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S23 -->|calls| T23
  S24["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:189"]
  T24["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S24 -->|calls| T24
  S25["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:189"]
  T25["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
