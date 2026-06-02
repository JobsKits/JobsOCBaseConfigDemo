# `calls 符号关系 - 064`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::XZM_endRefreshingGifFooter<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:404"]
  T1["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S1 -->|calls| T1
  S2["method:UIView::mj_beginRefreshing_header<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:415"]
  T2["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S2 -->|calls| T2
  S3["method:UIView::mj_endRefreshing_header<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:426"]
  T3["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S3 -->|calls| T3
  S4["method:UIView::mj_beginRefreshing_footer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:437"]
  T4["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S4 -->|calls| T4
  S5["method:UIView::mj_endRefreshing_footer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:448"]
  T5["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S5 -->|calls| T5
  S6["method:UIView::mj_beginRefreshing_trailer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:459"]
  T6["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S6 -->|calls| T6
  S7["method:UIView::mj_endRefreshing_trailer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:470"]
  T7["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S7 -->|calls| T7
  S8["method:UIView::endRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T8["function:KindOfTableViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:127"]
  S8 -->|calls| T8
  S9["method:UIView::endRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T9["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S9 -->|calls| T9
  S10["method:UIView::endRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T10["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S10 -->|calls| T10
  S11["method:UIView::endRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T11["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S11 -->|calls| T11
  S12["method:UIView::endRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T12["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S12 -->|calls| T12
  S13["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T13["function:KindOfTableViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:127"]
  S13 -->|calls| T13
  S14["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T14["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S14 -->|calls| T14
  S15["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T15["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S15 -->|calls| T15
  S16["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T16["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S16 -->|calls| T16
  S17["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T17["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S17 -->|calls| T17
  S18["method:UIView::endMJHeaderRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:522"]
  T18["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S18 -->|calls| T18
  S19["method:UIView::endMJFooterRefreshingWithNoMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:533"]
  T19["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S19 -->|calls| T19
  S20["method:UIView::endMJFooterRefreshingWithMoreData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:544"]
  T20["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S20 -->|calls| T20
  S21["method:UIView::endXZMHeaderRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:560"]
  T21["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S21 -->|calls| T21
  S22["method:UIView::endXZMFooterRefreshing<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:571"]
  T22["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S22 -->|calls| T22
  S23["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T23["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T24["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIViewController::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIViewController/UIViewController+MJRefresh/UIViewController+MJRefresh.m:31"]
  T25["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
