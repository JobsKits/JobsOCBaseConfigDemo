# `calls 符号关系 - 174`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  T1["method:NSArray::containsObject<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSArray/NSArray+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T2["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S2 -->|calls| T2
  S3["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:NSDate::readableDayTime<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T4["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S4 -->|calls| T4
  S5["method:NSDate::readableTime<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T5["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S5 -->|calls| T5
  S6["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T6["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S6 -->|calls| T6
  S7["method:NSFormatter::date<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:NSFormatter::time<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:NSFormatter::time<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T9["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSString::add<br/>JobsByPods/JobsTimeUtils@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T10["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S10 -->|calls| T10
  S11["method:JobsUploadingProgressView::initWithFrame:<br/>JobsByPods/JobsUploadingProgressView@Pods/Core/JobsUploadingProgressView.m:36"]
  T11["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S11 -->|calls| T11
  S12["method:JobsUploadingProgressView::updateProgressText:<br/>JobsByPods/JobsUploadingProgressView@Pods/Core/JobsUploadingProgressView.m:54"]
  T12["method:JobsUploadingProgressView::starAnimation<br/>JobsByPods/JobsUploadingProgressView@Pods/Core/JobsUploadingProgressView.m:62"]
  S12 -->|calls| T12
  S13["method:JobsUploadingProgressView::timer<br/>JobsByPods/JobsUploadingProgressView@Pods/Core/JobsUploadingProgressView.m:77"]
  T13["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S13 -->|calls| T13
  S14["method:JobsUploadingProgressView::subrefreshLabel<br/>JobsByPods/JobsUploadingProgressView@Pods/Core/JobsUploadingProgressView.m:201"]
  T14["function:UIFontWeightBoldSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:42"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  T15["method:JobsPodspecKitForJobsUploadingProgressView::standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:266"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:273"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsUploadingProgressView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsUploadingProgressView@Pods/JobsPodspecKit.rb:277"]
  S17 -->|calls| T17
  S18["method:JobsViewNavigator::popViewAnimated<br/>JobsByPods/JobsViewNavigator@Pods/Core/JobsViewNavigator.m:56"]
  T18["function:removeFromSuperview<br/>JobsOCBaseConfigDemo/业务逻辑/Common/App工具类/3rd/JhtBanner（卡片式滑动效果）/JhtBannerScrollView/JhtBannerScrollView.m:48"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsViewNavigator::standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsViewNavigator::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsViewNavigator::apply_standard_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsViewNavigator::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsViewNavigator@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["method:UIView::refresh<br/>JobsByPods/JobsViewNavigator@Pods/Support/UIKit/UIView/UIView+Extra.m:12"]
  T22["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S22 -->|calls| T22
  S23["method:UIView::addSubview<br/>JobsByPods/JobsViewNavigator@Pods/Support/UIKit/UIView/UIView+Extra.m:21"]
  T23["method:UIView::addSubview<br/>JobsByPods/JobsViewNavigator@Pods/Support/UIKit/UIView/UIView+Extra.m:21"]
  S23 -->|calls| T23
  S24["method:MJRefreshAutoStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:37"]
  T24["function:MJRefreshExtraApplyStateTitles<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:10"]
  S24 -->|calls| T24
  S25["method:MJRefreshAutoStateFooter::byMJRefreshFooterConfigModel<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:37"]
  T25["function:MJRefreshExtraApplyStateLabelStyle<br/>JobsByPods/MJRefreshExtra@Pods/Core/MJRefreshAutoStateFooter/MJRefreshAutoStateFooter+Extra.m:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
