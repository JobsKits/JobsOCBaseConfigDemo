# `calls 符号关系 - 159`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:189"]
  T1["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::MJRefreshAutoNormalFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:208"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:227"]
  T3["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T4["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  T5["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  T6["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIView::MJRefreshBackFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:301"]
  T7["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIView::MJRefreshFooterBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:314"]
  T8["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIView::XZM_beginRefreshingNormalHeader<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:327"]
  T9["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S9 -->|calls| T9
  S10["method:UIView::XZM_endRefreshingNormalHeader<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:338"]
  T10["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S10 -->|calls| T10
  S11["method:UIView::XZM_beginRefreshingGifHeader<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:349"]
  T11["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S11 -->|calls| T11
  S12["method:UIView::XZM_endRefreshingGifHeader<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:360"]
  T12["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S12 -->|calls| T12
  S13["method:UIView::XZM_beginRefreshingNormalFooter<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:371"]
  T13["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S13 -->|calls| T13
  S14["method:UIView::XZM_endRefreshingNormalFooter<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:382"]
  T14["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S14 -->|calls| T14
  S15["method:UIView::XZM_beginRefreshingGifFooter<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:393"]
  T15["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S15 -->|calls| T15
  S16["method:UIView::XZM_endRefreshingGifFooter<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:404"]
  T16["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S16 -->|calls| T16
  S17["method:UIView::mj_beginRefreshing_header<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:415"]
  T17["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S17 -->|calls| T17
  S18["method:UIView::mj_endRefreshing_header<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:426"]
  T18["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S18 -->|calls| T18
  S19["method:UIView::mj_beginRefreshing_footer<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:437"]
  T19["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S19 -->|calls| T19
  S20["method:UIView::mj_endRefreshing_footer<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:448"]
  T20["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S20 -->|calls| T20
  S21["method:UIView::mj_beginRefreshing_trailer<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:459"]
  T21["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S21 -->|calls| T21
  S22["method:UIView::mj_endRefreshing_trailer<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:470"]
  T22["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S22 -->|calls| T22
  S23["method:UIView::endRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T23["function:KindOfTableViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:127"]
  S23 -->|calls| T23
  S24["method:UIView::endRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T24["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S24 -->|calls| T24
  S25["method:UIView::endRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T25["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
