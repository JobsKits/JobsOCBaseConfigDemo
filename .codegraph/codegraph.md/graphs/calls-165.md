# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsUploadingProgressView::timer<br/>JobsByPods/JobsUploadingProgressView@Pods/Core/JobsUploadingProgressView.m:77"]
  T1["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S1 -->|calls| T1
  S2["method:JobsUploadingProgressView::subrefreshLabel<br/>JobsByPods/JobsUploadingProgressView@Pods/Core/JobsUploadingProgressView.m:201"]
  T2["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  T3["method:JobsPodspecKitForJobsUploadingProgressView::standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:266"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:273"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  S5 -->|calls| T5
  S6["method:JobsViewNavigator::popViewAnimated<br/>JobsByPods/JobsViewNavigator@Pods/Core/JobsViewNavigator.m:56"]
  T6["function:removeFromSuperview<br/>JobsOCBaseConfigDemo/业务逻辑/Common/App工具类/3rd/JhtBanner（卡片式滑动效果）/JhtBannerScrollView/JhtBannerScrollView.m:48"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  T7["method:JobsPodspecKitForJobsViewNavigator::standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:266"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsViewNavigator::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:273"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  S9 -->|calls| T9
  S10["method:UIView::refresh<br/>JobsByPods/JobsViewNavigator@Pods/Support/UIKit/UIView/UIView+Extra.m:12"]
  T10["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S10 -->|calls| T10
  S11["method:UIView::addSubview<br/>JobsByPods/JobsViewNavigator@Pods/Support/UIKit/UIView/UIView+Extra.m:21"]
  T11["method:UIView::addSubview<br/>JobsByPods/JobsViewNavigator@Pods/Support/UIKit/UIView/UIView+Extra.m:21"]
  S11 -->|calls| T11
  S12["method:MJRefreshAutoStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:37"]
  T12["function:MJRefreshExtraApplyStateTitles<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:10"]
  S12 -->|calls| T12
  S13["method:MJRefreshAutoStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:37"]
  T13["function:MJRefreshExtraApplyStateLabelStyle<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:19"]
  S13 -->|calls| T13
  S14["method:MJRefreshAutoStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:37"]
  T14["function:MJRefreshExtraFeedbackIfNeeded<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:25"]
  S14 -->|calls| T14
  S15["method:MJRefreshBackStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:37"]
  T15["function:MJRefreshExtraApplyStateTitles<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:10"]
  S15 -->|calls| T15
  S16["method:MJRefreshBackStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:37"]
  T16["function:MJRefreshExtraApplyStateLabelStyle<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:19"]
  S16 -->|calls| T16
  S17["method:MJRefreshBackStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:37"]
  T17["function:MJRefreshExtraFeedbackIfNeeded<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshBackStateFooter/MJRefreshBackStateFooter+Extra.m:25"]
  S17 -->|calls| T17
  S18["method:MJRefreshStateHeader::byMJRefreshHeaderConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:36"]
  T18["function:MJRefreshExtraApplyStateTitles<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:10"]
  S18 -->|calls| T18
  S19["method:MJRefreshStateHeader::byMJRefreshHeaderConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:36"]
  T19["function:MJRefreshExtraApplyStateLabelStyle<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:19"]
  S19 -->|calls| T19
  S20["method:MJRefreshStateHeader::byMJRefreshHeaderConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:36"]
  T20["function:MJRefreshExtraFeedbackIfNeeded<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshStateHeader/MJRefreshStateHeader+Extra.m:25"]
  S20 -->|calls| T20
  S21["method:BaseTextView::init<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:26"]
  T21["method:BaseTextView::init<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:26"]
  S21 -->|calls| T21
  S22["method:BaseTextView::init<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:26"]
  T22["method:BaseTextView::setupDefaults<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:122"]
  S22 -->|calls| T22
  S23["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:58"]
  T23["method:BaseTextView::initWithFrame:textContainer:<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:58"]
  S23 -->|calls| T23
  S24["method:BaseTextView::layoutSubviews<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:71"]
  T24["method:BaseTextView::layoutSubviews<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:71"]
  S24 -->|calls| T24
  S25["method:BaseTextView::layoutSubviews<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:71"]
  T25["method:BaseTextView::adjustContentOffset<br/>JobsByPods/MJRefreshExtra@Pods/Support/BaseUI/BaseTextView/BaseTextView.m:118"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
