# `calls 符号关系 - 176`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::endRefreshing<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T1["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S1 -->|calls| T1
  S2["method:UIView::endRefreshing<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T2["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S2 -->|calls| T2
  S3["method:UIView::endRefreshing<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T3["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S3 -->|calls| T3
  S4["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T4["function:KindOfTableViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:127"]
  S4 -->|calls| T4
  S5["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T5["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S5 -->|calls| T5
  S6["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T6["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S6 -->|calls| T6
  S7["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T7["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S7 -->|calls| T7
  S8["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T8["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S8 -->|calls| T8
  S9["method:UIView::endMJHeaderRefreshing<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:522"]
  T9["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S9 -->|calls| T9
  S10["method:UIView::endMJFooterRefreshingWithNoMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:533"]
  T10["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S10 -->|calls| T10
  S11["method:UIView::endMJFooterRefreshingWithMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:544"]
  T11["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S11 -->|calls| T11
  S12["method:UIView::endXZMHeaderRefreshing<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:560"]
  T12["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S12 -->|calls| T12
  S13["method:UIView::endXZMFooterRefreshing<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:571"]
  T13["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S13 -->|calls| T13
  S14["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T14["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T15["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:UIView::currentController<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:UIViewController::setGKNav<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:33"]
  T17["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S17 -->|calls| T17
  S18["method:UIViewController::setGKNav<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:33"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:UIViewController::setGKNavBackBtnBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:59"]
  T19["method:UIBarButtonItem::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBarButtonItem/UIBarButtonItem+Extra/UIBarButtonItem+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIViewController::comingFromVC:toVC:comingStyle:presentationStyle:requestParams:hidesBottomBarWhenPushed:animated:success:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:111"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIViewController::navBar<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:247"]
  T21["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S21 -->|calls| T21
  S22["method:UIViewController::navBar<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:247"]
  T22["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S22 -->|calls| T22
  S23["method:UIViewController::navBar<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:247"]
  T23["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S23 -->|calls| T23
  S24["method:UIViewController::navCtrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+Extra/UIViewController+Extra.m:32"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:35"]
  T25["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
