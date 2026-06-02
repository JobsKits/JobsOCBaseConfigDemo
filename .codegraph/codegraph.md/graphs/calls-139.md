# `calls 符号关系 - 139`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::mj_endRefreshing_footer<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:447"]
  T1["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S1 -->|calls| T1
  S2["method:UIView::mj_beginRefreshing_trailer<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:458"]
  T2["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S2 -->|calls| T2
  S3["method:UIView::mj_endRefreshing_trailer<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:469"]
  T3["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S3 -->|calls| T3
  S4["method:UIView::endRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:480"]
  T4["function:KindOfTableViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:127"]
  S4 -->|calls| T4
  S5["method:UIView::endRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:480"]
  T5["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S5 -->|calls| T5
  S6["method:UIView::endRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:480"]
  T6["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S6 -->|calls| T6
  S7["method:UIView::endRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:480"]
  T7["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S7 -->|calls| T7
  S8["method:UIView::endRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:480"]
  T8["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S8 -->|calls| T8
  S9["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:499"]
  T9["function:KindOfTableViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:127"]
  S9 -->|calls| T9
  S10["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:499"]
  T10["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S10 -->|calls| T10
  S11["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:499"]
  T11["function:KindOfCollectionViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:131"]
  S11 -->|calls| T11
  S12["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:499"]
  T12["method:JXCategoryListCollectionContainerView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/JXCategoryView/Sources/Common/JXCategoryListCollectionContainerView.m:92"]
  S12 -->|calls| T12
  S13["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:499"]
  T13["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S13 -->|calls| T13
  S14["method:UIView::endMJHeaderRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:521"]
  T14["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S14 -->|calls| T14
  S15["method:UIView::endMJFooterRefreshingWithNoMoreData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:532"]
  T15["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S15 -->|calls| T15
  S16["method:UIView::endMJFooterRefreshingWithMoreData<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:543"]
  T16["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S16 -->|calls| T16
  S17["method:UIView::endXZMHeaderRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:559"]
  T17["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S17 -->|calls| T17
  S18["method:UIView::endXZMFooterRefreshing<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:570"]
  T18["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S18 -->|calls| T18
  S19["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:601"]
  T19["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:601"]
  T20["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:UIView::currentController<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsLoadingImage::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:277"]
  T22["method:JobsPodspecKitForJobsLoadingImage::standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:266"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsLoadingImage::apply_standard_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsLoadingImage::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:273"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsLoadingImage::apply_standard_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsLoadingImage::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsLoadingImage@Pods/JobsPodspecKit.rb:277"]
  S24 -->|calls| T24
  S25["method:_JobsOnceState::init<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:25"]
  T25["method:_JobsOnceState::init<br/>JobsByPods/JobsLocker@Pods/Core/JobsLocker+Once/JobsLocker+Once.m:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
