# `calls 符号关系 - 166`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:WGradientProgressView::init<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgressView/WGradientProgressView.m:20"]
  T1["method:WGradientProgressView::init<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgressView/WGradientProgressView.m:20"]
  S1 -->|calls| T1
  S2["method:WGradientProgressView::titleFont<br/>JobsByPods/JobsOCTools@Pods/Core/水平进度条/WGradientProgressView/WGradientProgressView.m:69"]
  T2["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S2 -->|calls| T2
  S3["method:MovieCountDown::init<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:19"]
  T3["method:MovieCountDown::init<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:19"]
  S3 -->|calls| T3
  S4["method:MovieCountDown::倒计时放大特效<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:24"]
  T4["method:MovieCountDown::secountDown<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:29"]
  S4 -->|calls| T4
  S5["method:MovieCountDown::getCuntDown:<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:35"]
  T5["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S5 -->|calls| T5
  S6["method:MovieCountDown::aphView<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:70"]
  T6["method:UIView::setLayerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:571"]
  S6 -->|calls| T6
  S7["method:MovieCountDown::timer<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:107"]
  T7["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S7 -->|calls| T7
  S8["method:GDFadeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/颜色渐变的View（GDFadeView）/GDFadeView.m:20"]
  T8["method:GDFadeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/颜色渐变的View（GDFadeView）/GDFadeView.m:20"]
  S8 -->|calls| T8
  S9["method:GDFadeView::setFrame:<br/>JobsByPods/JobsOCTools@Pods/Core/颜色渐变的View（GDFadeView）/GDFadeView.m:36"]
  T9["method:GDFadeView::createMask<br/>JobsByPods/JobsOCTools@Pods/Core/颜色渐变的View（GDFadeView）/GDFadeView.m:43"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  T10["method:JobsPodspecKitForJobsOCTools::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:266"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsOCTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:273"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  S12 -->|calls| T12
  S13["method:UIViewController::addLottieImage:<br/>JobsByPods/JobsOCTools@Pods/Support/UIKit/UIViewController/UIViewController+Lottie/UIViewController+Lottie.m:13"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:UIViewController::lottieImagePlay<br/>JobsByPods/JobsOCTools@Pods/Support/UIKit/UIViewController/UIViewController+Lottie/UIViewController+Lottie.m:25"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  T15["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S15 -->|calls| T15
  S16["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  T16["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S16 -->|calls| T16
  S17["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  T17["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S17 -->|calls| T17
  S18["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  T18["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S18 -->|calls| T18
  S19["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  T19["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S19 -->|calls| T19
  S20["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  T20["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S20 -->|calls| T20
  S21["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  T21["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S21 -->|calls| T21
  S22["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  T22["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S22 -->|calls| T22
  S23["function:JobsRandomNumber<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:52"]
  T23["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  S23 -->|calls| T23
  S24["function:JobsRandom0_100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:62"]
  T24["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S24 -->|calls| T24
  S25["function:JobsRandom0__100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:66"]
  T25["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
