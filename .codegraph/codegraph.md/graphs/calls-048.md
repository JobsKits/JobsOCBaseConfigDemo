# `calls 符号关系 - 048`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:HXPhotoManager::initByTypeVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:21"]
  T1["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:11"]
  S1 -->|calls| T1
  S2["method:HXPhotoManager::initByTypePhotoAndVideo<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:25"]
  T2["method:HXPhotoManager::initByType<br/>JobsByPods/HXPhotoManagerExtra@Pods/Core/HXPhotoManager+Extra/HXPhotoManager+Extra.m:11"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:277"]
  T3["method:JobsPodspecKitForHXPhotoManagerExtra::standard_user_target_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:266"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:273"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForHXPhotoManagerExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HXPhotoManagerExtra@Pods/JobsPodspecKit.rb:277"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:277"]
  T6["method:JobsPodspecKitForHXPhotoViewExtra::standard_user_target_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:266"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:273"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForHXPhotoViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/HXPhotoViewExtra@Pods/JobsPodspecKit.rb:277"]
  S8 -->|calls| T8
  S9["function:jobsMakeIQKeyboardManager<br/>JobsByPods/IQKeyboardManagerExtra@Pods/Core/IQKeyboardManager+Extra/IQKeyboardManager+Extra.h:46"]
  T9["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:277"]
  T10["method:JobsPodspecKitForIQKeyboardManagerExtra::standard_user_target_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:266"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:273"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForIQKeyboardManagerExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/IQKeyboardManagerExtra@Pods/JobsPodspecKit.rb:277"]
  S12 -->|calls| T12
  S13["method:JXCategoryTimelineCell::jobsInitializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:17"]
  T13["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S13 -->|calls| T13
  S14["method:JXCategoryTimelineCell::initializeViews<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:27"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:JXCategoryTimelineCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:32"]
  T15["method:JobsBitsMonitorSuspendLab::byText<br/>JobsByPods/JobsBitsMonitor@Pods/Core/JobsBitsMonitorSuspendLab/JobsBitsMonitorSuspendLab.m:160"]
  S15 -->|calls| T15
  S16["method:JXCategoryTimelineCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:32"]
  T16["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S16 -->|calls| T16
  S17["method:JXCategoryTimelineCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:32"]
  T17["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S17 -->|calls| T17
  S18["method:JXCategoryTimelineCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:32"]
  T18["method:JobsAnimationLabel::byTextCor<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/JobsAnimationLabel/JobsAnimationLabel.m:36"]
  S18 -->|calls| T18
  S19["method:JXCategoryTimelineCell::jobsReloadData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:32"]
  T19["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S19 -->|calls| T19
  S20["method:JXCategoryTimelineCell::reloadData:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:50"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T21["function:jobsMakeTextView::jobsMakeLabel<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:441"]
  S21 -->|calls| T21
  S22["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T22["method:UIView::byAdd<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Masonry+DSL/UIView/UIView+MasonryDSL/UIView+MasonryDSL.m:80"]
  S22 -->|calls| T22
  S23["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T23["method:UIView::addOn<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:807"]
  S23 -->|calls| T23
  S24["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T24["method:UILabel::byTextAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:397"]
  S24 -->|calls| T24
  S25["method:JXCategoryTimelineCell::timeLabel<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTimelineViews/JXCategoryTimelineCell/JXCategoryTimelineCell.m:55"]
  T25["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
