# `calls 符号关系 - 142`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::MJRefreshBackFooterBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:301"]
  T1["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::MJRefreshFooterBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:314"]
  T2["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::endRefreshing<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T3["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S3 -->|calls| T3
  S4["method:UIView::endRefreshing<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T4["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S4 -->|calls| T4
  S5["method:UIView::endRefreshing<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T5["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S5 -->|calls| T5
  S6["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T6["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S6 -->|calls| T6
  S7["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T7["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S7 -->|calls| T7
  S8["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T8["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S8 -->|calls| T8
  S9["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T9["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T10["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:UIView::currentController<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UIViewController::setGKNav<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:33"]
  T12["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S12 -->|calls| T12
  S13["method:UIViewController::setGKNavBackBtnBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:59"]
  T13["method:UIBarButtonItem::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIBarButtonItem/UIBarButtonItem+Extra/UIBarButtonItem+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIViewController::comingFromVC:toVC:comingStyle:presentationStyle:requestParams:hidesBottomBarWhenPushed:animated:success:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+BaseVC/UIViewController+BaseVC.m:111"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIViewController::navCtrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+Extra/UIViewController+Extra.m:32"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:35"]
  T16["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S16 -->|calls| T16
  S17["method:JobsNetworkTrafficMonitor::destroyShared<br/>JobsByPods/JobsNetWorkTools@Pods/Core/JobsNetWorkTools.m:27"]
  T17["method:JobsNetworkTrafficMonitor::byStop<br/>JobsByPods/JobsNetWorkTools@Pods/Core/JobsNetWorkTools.m:54"]
  S17 -->|calls| T17
  S18["method:JobsNetworkTrafficMonitor::timer<br/>JobsByPods/JobsNetWorkTools@Pods/Core/JobsNetWorkTools.m:63"]
  T18["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsNetWorkTools::standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsNetWorkTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsNetWorkTools@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["function:bayonRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:141"]
  T22["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S22 -->|calls| T22
  S23["function:helveticaNeue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:145"]
  T23["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S23 -->|calls| T23
  S24["function:dinAlternate<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:149"]
  T24["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S24 -->|calls| T24
  S25["function:pingFangHKRegular<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:154"]
  T25["function:fontName<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:137"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
