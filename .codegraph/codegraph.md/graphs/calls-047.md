# `calls 符号关系 - 047`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::endXZMFooterRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:569"]
  T1["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK/MacroDef_SDK.h:92"]
  S1 -->|calls| T1
  S2["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:600"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:600"]
  T3["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::lotAnimMJRefreshHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:627"]
  T4["method:UIView::LOTAnimationMJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:38"]
  S4 -->|calls| T4
  S5["method:UIView::mjRefreshNormalHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:641"]
  T5["method:UIView::MJRefreshNormalHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:74"]
  S5 -->|calls| T5
  S6["method:UIView::mjRefreshStateHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:655"]
  T6["method:UIView::MJRefreshStateHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:94"]
  S6 -->|calls| T6
  S7["method:UIView::mjRefreshHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:669"]
  T7["method:UIView::MJRefreshHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:114"]
  S7 -->|calls| T7
  S8["method:UIView::mjRefreshGifHeader<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:683"]
  T8["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  S8 -->|calls| T8
  S9["method:UIView::mjRefreshAutoGifFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:698"]
  T9["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  S9 -->|calls| T9
  S10["method:UIView::mjRefreshBackNormalFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:712"]
  T10["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:189"]
  S10 -->|calls| T10
  S11["method:UIView::mjRefreshAutoNormalFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:726"]
  T11["method:UIView::MJRefreshAutoNormalFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:208"]
  S11 -->|calls| T11
  S12["method:UIView::mjRefreshAutoStateFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:740"]
  T12["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:227"]
  S12 -->|calls| T12
  S13["method:UIView::mjRefreshAutoFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:754"]
  T13["method:UIView::MJRefreshAutoFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:246"]
  S13 -->|calls| T13
  S14["method:UIView::mjRefreshBackGifFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:768"]
  T14["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  S14 -->|calls| T14
  S15["method:UIView::mjRefreshBackStateFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:782"]
  T15["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  S15 -->|calls| T15
  S16["method:UIView::mjRefreshBackFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:796"]
  T16["method:UIView::MJRefreshBackFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:301"]
  S16 -->|calls| T16
  S17["method:UIView::mjRefreshFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:810"]
  T17["method:UIView::MJRefreshFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:314"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:277"]
  T18["method:JobsPodspecKitForHTMLDocumentExtra::standard_user_target_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:266"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:273"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:277"]
  S20 -->|calls| T20
  S21["function:jobsMakeHXPhotoConfiguration<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.h:47"]
  T21["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S21 -->|calls| T21
  S22["function:jobsMakeHXPhotoManagerBySelectedTypePhoto<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.h:55"]
  T22["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S22 -->|calls| T22
  S23["function:jobsMakeHXPhotoManagerBySelectedTypeVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.h:61"]
  T23["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S23 -->|calls| T23
  S24["function:jobsMakeHXPhotoManagerBySelectedTypePhotoAndVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.h:67"]
  T24["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S24 -->|calls| T24
  S25["method:HXPhotoManager::initByTypePhoto<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:17"]
  T25["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:11"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
