# `calls 符号关系 - 138`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::MJRefreshStateHeaderBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:94"]
  T1["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::MJRefreshHeaderBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:114"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T3["method:MJRefreshGifHeader::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshGifHeader/MJRefreshGifHeader+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::MJRefreshGifHeaderBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:128"]
  T4["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T5["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIView::MJRefreshAutoGifFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:159"]
  T6["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIView::MJRefreshBackNormalFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:188"]
  T7["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIView::MJRefreshAutoNormalFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:207"]
  T8["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:226"]
  T9["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:252"]
  T10["method:MJRefreshAutoGifFooter::refreshStateIdleByImages<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoGifFooter/MJRefreshAutoGifFooter+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:252"]
  T11["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:281"]
  T12["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIView::MJRefreshBackFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:300"]
  T13["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIView::MJRefreshFooterBy<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:313"]
  T14["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:UIView::XZM_beginRefreshingNormalHeader<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:326"]
  T15["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S15 -->|calls| T15
  S16["method:UIView::XZM_endRefreshingNormalHeader<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:337"]
  T16["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S16 -->|calls| T16
  S17["method:UIView::XZM_beginRefreshingGifHeader<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:348"]
  T17["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S17 -->|calls| T17
  S18["method:UIView::XZM_endRefreshingGifHeader<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:359"]
  T18["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S18 -->|calls| T18
  S19["method:UIView::XZM_beginRefreshingNormalFooter<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:370"]
  T19["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S19 -->|calls| T19
  S20["method:UIView::XZM_endRefreshingNormalFooter<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:381"]
  T20["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S20 -->|calls| T20
  S21["method:UIView::XZM_beginRefreshingGifFooter<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:392"]
  T21["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S21 -->|calls| T21
  S22["method:UIView::XZM_endRefreshingGifFooter<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:403"]
  T22["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S22 -->|calls| T22
  S23["method:UIView::mj_beginRefreshing_header<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:414"]
  T23["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S23 -->|calls| T23
  S24["method:UIView::mj_endRefreshing_header<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:425"]
  T24["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S24 -->|calls| T24
  S25["method:UIView::mj_beginRefreshing_footer<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:436"]
  T25["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
