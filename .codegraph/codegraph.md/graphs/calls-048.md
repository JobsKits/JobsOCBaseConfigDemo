# `calls 符号关系 - 048`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T1["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T3["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T4["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:189"]
  T5["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIView::MJRefreshAutoNormalFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:208"]
  T6["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:227"]
  T7["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T8["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T9["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  T10["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:UIView::MJRefreshBackFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:301"]
  T11["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIView::MJRefreshFooterBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:314"]
  T12["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIView::endRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T13["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S13 -->|calls| T13
  S14["method:UIView::endRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T14["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S14 -->|calls| T14
  S15["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T15["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S15 -->|calls| T15
  S16["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T16["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S16 -->|calls| T16
  S17["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T17["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T18["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:UIViewController::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIViewController/UIViewController+MJRefresh/UIViewController+MJRefresh.m:31"]
  T19["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIViewController::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIViewController/UIViewController+MJRefresh/UIViewController+MJRefresh.m:31"]
  T20["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:JobsBioKit::biometryName<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:46"]
  T21["method:JobsBioKit::biometryType<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:21"]
  S21 -->|calls| T21
  S22["method:JobsBioKit::authenticateWithReason:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:73"]
  T22["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  S22 -->|calls| T22
  S23["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T23["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S23 -->|calls| T23
  S24["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T24["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  T25["method:JobsPodspecKitForJobsBioKit::standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:266"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
