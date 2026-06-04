# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:XXTools::addMarkLabelWithText:maxWidth:superView:cornerRadius:<br/>JobsByPods/JobsOCTools@Pods/Core/XXTools/XXTools.m:24"]
  T1["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S1 -->|calls| T1
  S2["method:ImageCodeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:23"]
  T2["method:ImageCodeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:23"]
  S2 -->|calls| T2
  S3["method:ImageCodeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:23"]
  T3["method:ImageCodeView::setupUI<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:34"]
  S3 -->|calls| T3
  S4["method:ImageCodeView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:29"]
  T4["method:ImageCodeView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:29"]
  S4 -->|calls| T4
  S5["method:ImageCodeView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:29"]
  T5["method:ImageCodeView::setupUI<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:34"]
  S5 -->|calls| T5
  S6["method:ImageCodeView::setCodeStr:<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:93"]
  T6["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S6 -->|calls| T6
  S7["method:ImageCodeView::font<br/>JobsByPods/JobsOCTools@Pods/Core/图形验证码/ImageCodeView.m:135"]
  T7["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S7 -->|calls| T7
  S8["method:CountdownView::setFont:<br/>JobsByPods/JobsOCTools@Pods/Core/圆形倒计时进度条（中间有字，可点击回调）/CountdownView.m:56"]
  T8["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S8 -->|calls| T8
  S9["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollViewVC/JobsScrollViewVC.m:19"]
  T9["function:viewDidLoad<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollViewVC/JobsScrollViewVC.m:19"]
  S9 -->|calls| T9
  S10["function:scrollYView<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollViewVC/JobsScrollViewVC.m:38"]
  T10["method:JobsScrollYView::viewSizeByModel<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:80"]
  S10 -->|calls| T10
  S11["function:scrollYView<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollViewVC/JobsScrollViewVC.m:38"]
  T11["method:JobsScrollYView::jobsRichViewByModel<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:72"]
  S11 -->|calls| T11
  S12["method:JobsScrollYView::init<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:32"]
  T12["method:JobsScrollYView::init<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:32"]
  S12 -->|calls| T12
  S13["method:JobsScrollYView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:54"]
  T13["method:JobsScrollYView::awakeFromNib<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:54"]
  S13 -->|calls| T13
  S14["method:JobsScrollYView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:62"]
  T14["method:JobsScrollYView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:62"]
  S14 -->|calls| T14
  S15["method:JobsScrollYView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:66"]
  T15["method:JobsScrollYView::init<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:32"]
  S15 -->|calls| T15
  S16["method:JobsNoticePopupView::init<br/>JobsByPods/JobsOCTools@Pods/Core/广告或者公示弹出框/JobsNoticePopupView.m:16"]
  T16["method:JobsNoticePopupView::init<br/>JobsByPods/JobsOCTools@Pods/Core/广告或者公示弹出框/JobsNoticePopupView.m:16"]
  S16 -->|calls| T16
  S17["method:JobsCalenderView::init<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:20"]
  T17["method:JobsCalenderView::init<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:20"]
  S17 -->|calls| T17
  S18["method:JobsCalenderView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:36"]
  T18["method:JobsCalenderView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:36"]
  S18 -->|calls| T18
  S19["method:JobsCalenderView::layoutSubviews<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:36"]
  T19["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:120"]
  S19 -->|calls| T19
  S20["method:JobsCalenderView::initWithSize:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:43"]
  T20["method:JobsCalenderView::init<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:20"]
  S20 -->|calls| T20
  S21["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T21["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S21 -->|calls| T21
  S22["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T22["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S22 -->|calls| T22
  S23["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T23["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S23 -->|calls| T23
  S24["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T24["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S24 -->|calls| T24
  S25["method:JobsCalenderView::calendar:subtitleForDate:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:75"]
  T25["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
