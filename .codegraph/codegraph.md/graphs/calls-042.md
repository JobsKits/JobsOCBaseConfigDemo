# `calls 符号关系 - 042`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  T1["method:MJRefreshAutoStateFooter::refreshStateNoMoreDataByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:105"]
  S1 -->|calls| T1
  S2["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  T2["method:MJRefreshAutoStateFooter::refreshStateWillRefreshByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:96"]
  S2 -->|calls| T2
  S3["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  T3["method:MJRefreshAutoStateFooter::refreshStateRefreshingByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:87"]
  S3 -->|calls| T3
  S4["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  T4["method:MJRefreshAutoStateFooter::refreshStatePullingByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:78"]
  S4 -->|calls| T4
  S5["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T5["method:MJRefreshAutoGifFooter::refreshStateNoMoreDataByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:48"]
  S5 -->|calls| T5
  S6["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T6["method:MJRefreshAutoGifFooter::refreshStateWillRefreshByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:39"]
  S6 -->|calls| T6
  S7["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T7["method:MJRefreshAutoGifFooter::refreshStatePullingByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra/MJRefreshAutoGifFooter+Extra.m:21"]
  S7 -->|calls| T7
  S8["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T8["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra/MJRefreshGifHeader+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T9["method:MJRefreshAutoStateFooter::refreshStateNoMoreDataByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:105"]
  S9 -->|calls| T9
  S10["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T10["method:MJRefreshAutoStateFooter::refreshStateWillRefreshByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:96"]
  S10 -->|calls| T10
  S11["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T11["method:MJRefreshAutoStateFooter::refreshStateRefreshingByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:87"]
  S11 -->|calls| T11
  S12["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T12["method:MJRefreshAutoStateFooter::refreshStatePullingByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra/MJRefreshAutoStateFooter+Extra.m:78"]
  S12 -->|calls| T12
  S13["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T13["method:MJRefreshGifHeader::refreshStateIdleByString<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra/MJRefreshGifHeader+Extra.m:57"]
  S13 -->|calls| T13
  S14["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T14["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S14 -->|calls| T14
  S15["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T15["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S15 -->|calls| T15
  S16["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T16["method:MJRefreshStateHeader::byAutomaticallyChangeAlpha<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra/MJRefreshStateHeader+Extra.m:35"]
  S16 -->|calls| T16
  S17["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  T17["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:UIView::MJRefreshNormalHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:74"]
  T18["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  S18 -->|calls| T18
  S19["method:UIView::MJRefreshNormalHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:74"]
  T19["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S19 -->|calls| T19
  S20["method:UIView::MJRefreshNormalHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:74"]
  T20["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S20 -->|calls| T20
  S21["method:UIView::MJRefreshNormalHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:74"]
  T21["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:UIView::MJRefreshStateHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:94"]
  T22["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  S22 -->|calls| T22
  S23["method:UIView::MJRefreshStateHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:94"]
  T23["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S23 -->|calls| T23
  S24["method:UIView::MJRefreshStateHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:94"]
  T24["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S24 -->|calls| T24
  S25["method:UIView::MJRefreshStateHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:94"]
  T25["method:MJRefreshStateHeader::byAutomaticallyChangeAlpha<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra/MJRefreshStateHeader+Extra.m:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
