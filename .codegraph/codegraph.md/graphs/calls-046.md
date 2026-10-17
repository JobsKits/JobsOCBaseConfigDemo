# `calls 符号关系 - 046`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::mjRefreshAutoStateFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:740"]
  T1["method:UIView::MJRefreshAutoStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:227"]
  S1 -->|calls| T1
  S2["method:UIView::mjRefreshAutoFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:754"]
  T2["method:UIView::MJRefreshAutoFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:246"]
  S2 -->|calls| T2
  S3["method:UIView::mjRefreshBackGifFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:768"]
  T3["method:UIView::MJRefreshBackGifFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:253"]
  S3 -->|calls| T3
  S4["method:UIView::mjRefreshBackStateFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:782"]
  T4["method:UIView::MJRefreshBackStateFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:282"]
  S4 -->|calls| T4
  S5["method:UIView::mjRefreshBackFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:796"]
  T5["method:UIView::MJRefreshBackFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:301"]
  S5 -->|calls| T5
  S6["method:UIView::mjRefreshFooter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:810"]
  T6["method:UIView::MJRefreshFooterBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:314"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:277"]
  T7["method:JobsPodspecKitForHTMLDocumentExtra::standard_user_target_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:266"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:273"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForHTMLDocumentExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HTMLDocumentExtra@Pods/JobsPodspecKit.rb:277"]
  S9 -->|calls| T9
  S10["method:HXPhotoManager::initByTypePhoto<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:17"]
  T10["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:11"]
  S10 -->|calls| T10
  S11["method:HXPhotoManager::initByTypeVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:21"]
  T11["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:11"]
  S11 -->|calls| T11
  S12["method:HXPhotoManager::initByTypePhotoAndVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:25"]
  T12["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:11"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:277"]
  T13["method:JobsPodspecKitForHXPhotoManagerExtra::standard_user_target_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:266"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:273"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:277"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:277"]
  T16["method:JobsPodspecKitForHXPhotoViewExtra::standard_user_target_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:266"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:273"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:277"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForIQKeyboardManagerExtra::standard_user_target_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["method:JXCategoryTimelineCell::jobsInitializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:17"]
  T22["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S22 -->|calls| T22
  S23["method:JXCategoryTimelineCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:27"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:JXCategoryTimelineCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:32"]
  T24["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S24 -->|calls| T24
  S25["method:JXCategoryTimelineCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:32"]
  T25["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
