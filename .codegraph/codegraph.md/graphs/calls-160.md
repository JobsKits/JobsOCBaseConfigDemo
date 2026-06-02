# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::endRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T1["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S1 -->|calls| T1
  S2["method:UIView::endRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:481"]
  T2["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S2 -->|calls| T2
  S3["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T3["function:KindOfTableViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:127"]
  S3 -->|calls| T3
  S4["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T4["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S4 -->|calls| T4
  S5["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T5["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S5 -->|calls| T5
  S6["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T6["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S6 -->|calls| T6
  S7["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T7["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S7 -->|calls| T7
  S8["method:UIView::endMJHeaderRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:522"]
  T8["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S8 -->|calls| T8
  S9["method:UIView::endMJFooterRefreshingWithNoMoreData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:533"]
  T9["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S9 -->|calls| T9
  S10["method:UIView::endMJFooterRefreshingWithMoreData<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:544"]
  T10["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S10 -->|calls| T10
  S11["method:UIView::endXZMHeaderRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:560"]
  T11["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S11 -->|calls| T11
  S12["method:UIView::endXZMFooterRefreshing<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:571"]
  T12["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S12 -->|calls| T12
  S13["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T13["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T14["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:JobsNavigationTransitionMgr::attachToViewController:animationDirection:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m:49"]
  T15["method:UIViewController::clzPopGesture<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Extra/UIViewController+Extra.m:40"]
  S15 -->|calls| T15
  S16["method:JobsNavigationTransitionMgr::attachToViewController:animationDirection:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m:49"]
  T16["method:JobsAppTools::directionByPoint<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools.m:55"]
  S16 -->|calls| T16
  S17["method:JobsNavigationTransitionMgr::animateTransition:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Core/JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.m:129"]
  T17["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S17 -->|calls| T17
  S18["method:CALayer::curve<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:107"]
  T18["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S18 -->|calls| T18
  S19["method:CALayer::animaSubtype<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:122"]
  T19["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S19 -->|calls| T19
  S20["method:CALayer::animaTypeWithTransitionType<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:136"]
  T20["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S20 -->|calls| T20
  S21["method:NSArray::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T21["method:NSArray::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S21 -->|calls| T21
  S22["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T22["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T23["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T24["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S24 -->|calls| T24
  S25["method:NSArray::jobsVisible<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
