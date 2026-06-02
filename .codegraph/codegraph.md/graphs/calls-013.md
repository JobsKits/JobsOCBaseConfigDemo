# `calls 符号关系 - 013`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::endRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:500"]
  T1["method:UIView::tab_endAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:152"]
  S1 -->|calls| T1
  S2["method:UIView::endMJHeaderRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:522"]
  T2["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S2 -->|calls| T2
  S3["method:UIView::endMJFooterRefreshingWithNoMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:533"]
  T3["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S3 -->|calls| T3
  S4["method:UIView::endMJFooterRefreshingWithMoreData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:544"]
  T4["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S4 -->|calls| T4
  S5["method:UIView::endXZMHeaderRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:560"]
  T5["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S5 -->|calls| T5
  S6["method:UIView::endXZMFooterRefreshing<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:571"]
  T6["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S6 -->|calls| T6
  S7["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T7["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T8["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:HXPhotoManager::initByTypePhoto<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:18"]
  T9["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:HXPhotoManager::initByTypeVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:22"]
  T10["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:HXPhotoManager::initByTypePhotoAndVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:26"]
  T11["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:HXPhotoView::initBy<br/>JobsByPods/HXPhotoViewExtra@Pods/Core/HXPhotoView+Extra.m:12"]
  T12["method:NSObject::photoManager<br/>JobsOCBaseConfigDemo/业务逻辑/Common/App工具类/UIKits+3rd/NSObject/NSObject+HXPhotoPicker/NSObject+HXPhotoPicker.m:128"]
  S12 -->|calls| T12
  S13["method:JXCategoryTimelineCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:18"]
  T13["method:JXCategoryTimelineCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:18"]
  S13 -->|calls| T13
  S14["method:JXCategoryTimelineCell::reloadData:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:23"]
  T14["method:GXCardView::reloadData<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:259"]
  S14 -->|calls| T14
  S15["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  T15["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  S15 -->|calls| T15
  S16["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  T16["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S16 -->|calls| T16
  S17["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  T18["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S18 -->|calls| T18
  S19["method:JXCategoryTimelineView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:12"]
  T19["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S19 -->|calls| T19
  S20["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:37"]
  T20["method:JXCategoryTimelineView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineView/JXCategoryTimelineView.m:37"]
  S20 -->|calls| T20
  S21["method:JXCategoryTitleBackgroundCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:17"]
  T21["method:JXCategoryTitleBackgroundCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:17"]
  S21 -->|calls| T21
  S22["method:JXCategoryTitleBackgroundCell::layoutSubviews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:24"]
  T22["method:JXCategoryTitleBackgroundCell::layoutSubviews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:24"]
  S22 -->|calls| T22
  S23["method:JXCategoryTitleBackgroundCell::layoutSubviews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:24"]
  T23["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S23 -->|calls| T23
  S24["method:JXCategoryTitleBackgroundCell::reloadData:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:43"]
  T24["method:GXCardView::reloadData<br/>JobsByPods/JobsOCTools@Pods/Core/GXCardView/GXCardView.m:259"]
  S24 -->|calls| T24
  S25["method:JXCategoryTitleBackgroundCell::reloadData:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCell/JXCategoryTitleBackgroundCell.m:43"]
  T25["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
