# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T1["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S1 -->|calls| T1
  S2["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T2["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S2 -->|calls| T2
  S3["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T3["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S3 -->|calls| T3
  S4["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T4["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S4 -->|calls| T4
  S5["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T5["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S5 -->|calls| T5
  S6["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T6["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S6 -->|calls| T6
  S7["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T7["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
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
  S13["method:JobsCalenderView::minimumDateForCalendar:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:114"]
  T13["method:NSDate::dateSince<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:23"]
  S13 -->|calls| T13
  S14["method:JobsCalenderView::maximumDateForCalendar:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:118"]
  T14["method:NSDate::dateSince<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:23"]
  S14 -->|calls| T14
  S15["method:JobsCalenderView::calendar:boundingRectWillChange:animated:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:157"]
  T15["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S15 -->|calls| T15
  S16["method:JobsCalenderView::calendar<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:177"]
  T16["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S16 -->|calls| T16
  S17["method:JobsCalenderView::calendar<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:177"]
  T17["function:pingFangHKBold<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:166"]
  S17 -->|calls| T17
  S18["method:WGradientProgress::init<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:24"]
  T18["method:WGradientProgress::init<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:24"]
  S18 -->|calls| T18
  S19["method:WGradientProgress::start<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:45"]
  T19["method:WGradientProgress::makeTimer_color<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:31"]
  S19 -->|calls| T19
  S20["method:WGradientProgress::start<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:45"]
  T20["method:WGradientProgress::makeTimer_length<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:35"]
  S20 -->|calls| T20
  S21["method:WGradientProgress::hide<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:66"]
  T21["function:removeFromSuperview<br/>JobsOCBaseConfigDemo/业务逻辑/Common/App工具类/3rd/JhtBanner（卡片式滑动效果）/JhtBannerScrollView/JhtBannerScrollView.m:48"]
  S21 -->|calls| T21
  S22["method:WGradientProgress::timer_color<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:117"]
  T22["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S22 -->|calls| T22
  S23["method:WGradientProgress::timer_color<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:117"]
  T23["method:WGradientProgress::start<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:45"]
  S23 -->|calls| T23
  S24["method:WGradientProgress::timer_length<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:153"]
  T24["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S24 -->|calls| T24
  S25["method:WGradientProgress::timer_length<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:153"]
  T25["method:WGradientProgress::start<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgress/WGradientProgress.m:45"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
