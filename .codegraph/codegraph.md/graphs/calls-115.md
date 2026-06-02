# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::XZM_beginRefreshingNormalHeader<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:327"]
  T1["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S1 -->|calls| T1
  S2["method:UIView::XZM_endRefreshingNormalHeader<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:338"]
  T2["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S2 -->|calls| T2
  S3["method:UIView::XZM_beginRefreshingGifHeader<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:349"]
  T3["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S3 -->|calls| T3
  S4["method:UIView::XZM_endRefreshingGifHeader<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:360"]
  T4["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S4 -->|calls| T4
  S5["method:UIView::XZM_beginRefreshingNormalFooter<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:371"]
  T5["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S5 -->|calls| T5
  S6["method:UIView::XZM_endRefreshingNormalFooter<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:382"]
  T6["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S6 -->|calls| T6
  S7["method:UIView::XZM_beginRefreshingGifFooter<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:393"]
  T7["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S7 -->|calls| T7
  S8["method:UIView::XZM_endRefreshingGifFooter<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:404"]
  T8["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S8 -->|calls| T8
  S9["method:UIView::mj_beginRefreshing_header<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:415"]
  T9["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S9 -->|calls| T9
  S10["method:UIView::mj_endRefreshing_header<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:426"]
  T10["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S10 -->|calls| T10
  S11["method:UIView::mj_beginRefreshing_footer<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:437"]
  T11["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S11 -->|calls| T11
  S12["method:UIView::mj_endRefreshing_footer<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:448"]
  T12["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S12 -->|calls| T12
  S13["method:UIView::mj_beginRefreshing_trailer<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:459"]
  T13["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S13 -->|calls| T13
  S14["method:UIView::mj_endRefreshing_trailer<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:470"]
  T14["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S14 -->|calls| T14
  S15["method:UIView::endRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T15["function:KindOfTableViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:127"]
  S15 -->|calls| T15
  S16["method:UIView::endRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T16["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S16 -->|calls| T16
  S17["method:UIView::endRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T17["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S17 -->|calls| T17
  S18["method:UIView::endRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T18["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S18 -->|calls| T18
  S19["method:UIView::endRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T19["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S19 -->|calls| T19
  S20["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T20["function:KindOfTableViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:127"]
  S20 -->|calls| T20
  S21["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T21["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S21 -->|calls| T21
  S22["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T22["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S22 -->|calls| T22
  S23["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T23["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S23 -->|calls| T23
  S24["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T24["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S24 -->|calls| T24
  S25["method:UIView::endMJHeaderRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:522"]
  T25["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
