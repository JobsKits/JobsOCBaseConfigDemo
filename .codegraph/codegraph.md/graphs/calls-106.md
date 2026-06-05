# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsScrollYView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:62"]
  T1["method:JobsScrollYView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:62"]
  S1 -->|calls| T1
  S2["method:JobsScrollYView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:66"]
  T2["method:JobsScrollYView::init<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:32"]
  S2 -->|calls| T2
  S3["method:JobsNoticePopupView::init<br/>JobsByPods/JobsOCTools@Pods/Core/广告或者公示弹出框/JobsNoticePopupView.m:16"]
  T3["method:JobsNoticePopupView::init<br/>JobsByPods/JobsOCTools@Pods/Core/广告或者公示弹出框/JobsNoticePopupView.m:16"]
  S3 -->|calls| T3
  S4["method:JobsCalenderView::init<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:20"]
  T4["method:JobsCalenderView::init<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:20"]
  S4 -->|calls| T4
  S5["method:JobsCalenderView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:36"]
  T5["method:JobsCalenderView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:36"]
  S5 -->|calls| T5
  S6["method:JobsCalenderView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:36"]
  T6["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S6 -->|calls| T6
  S7["method:JobsCalenderView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:43"]
  T7["method:JobsCalenderView::init<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:20"]
  S7 -->|calls| T7
  S8["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T8["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S8 -->|calls| T8
  S9["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T9["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S9 -->|calls| T9
  S10["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T10["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S10 -->|calls| T10
  S11["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T11["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S11 -->|calls| T11
  S12["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T12["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S12 -->|calls| T12
  S13["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T13["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S13 -->|calls| T13
  S14["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T14["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S14 -->|calls| T14
  S15["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T15["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S15 -->|calls| T15
  S16["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T16["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S16 -->|calls| T16
  S17["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T17["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S17 -->|calls| T17
  S18["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T18["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S18 -->|calls| T18
  S19["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T19["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S19 -->|calls| T19
  S20["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T20["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S20 -->|calls| T20
  S21["method:JobsCalenderView::minimumDateForCalendar:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:114"]
  T21["method:NSDate::dateSince<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:23"]
  S21 -->|calls| T21
  S22["method:JobsCalenderView::maximumDateForCalendar:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:118"]
  T22["method:NSDate::dateSince<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:23"]
  S22 -->|calls| T22
  S23["method:JobsCalenderView::calendar<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:177"]
  T23["function:pingFangHKBold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:166"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  T24["method:JobsPodspecKitForJobsOCTools::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:266"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T25["method:JobsPodspecKitForJobsOCTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:273"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
