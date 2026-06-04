# `calls 符号关系 - 157`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:MovieCountDown::getCuntDown:<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:35"]
  T1["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S1 -->|calls| T1
  S2["method:MovieCountDown::aphView<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:70"]
  T2["method:UIView::setLayerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:571"]
  S2 -->|calls| T2
  S3["method:MovieCountDown::timer<br/>JobsByPods/JobsOCTools@Pods/Core/电影倒计时特效/MovieCountDown.m:107"]
  T3["method:UIButton::byTimerType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Timer/UIButton+Timer.m:298"]
  S3 -->|calls| T3
  S4["method:GDFadeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/颜色渐变的View（GDFadeView）/GDFadeView.m:20"]
  T4["method:GDFadeView::init<br/>JobsByPods/JobsOCTools@Pods/Core/颜色渐变的View（GDFadeView）/GDFadeView.m:20"]
  S4 -->|calls| T4
  S5["method:GDFadeView::setFrame:<br/>JobsByPods/JobsOCTools@Pods/Core/颜色渐变的View（GDFadeView）/GDFadeView.m:36"]
  T5["method:GDFadeView::createMask<br/>JobsByPods/JobsOCTools@Pods/Core/颜色渐变的View（GDFadeView）/GDFadeView.m:43"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  T6["method:JobsPodspecKitForJobsOCTools::standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:266"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsOCTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:273"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsOCTools::apply_standard_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsOCTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsOCTools@Pods/JobsPodspecKit.rb:277"]
  S8 -->|calls| T8
  S9["method:UIViewController::addLottieImage:<br/>JobsByPods/JobsOCTools@Pods/Support/UIKit/UIViewController/UIViewController+Lottie/UIViewController+Lottie.m:13"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:UIViewController::lottieImagePlay<br/>JobsByPods/JobsOCTools@Pods/Support/UIKit/UIViewController/UIViewController+Lottie/UIViewController+Lottie.m:25"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  T11["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S11 -->|calls| T11
  S12["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  T12["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S12 -->|calls| T12
  S13["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  T13["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S13 -->|calls| T13
  S14["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  T14["function:JobsRandomUpperBoundFromAbsoluteInt<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:12"]
  S14 -->|calls| T14
  S15["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  T15["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S15 -->|calls| T15
  S16["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  T16["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S16 -->|calls| T16
  S17["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  T17["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S17 -->|calls| T17
  S18["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  T18["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S18 -->|calls| T18
  S19["function:JobsRandomNumber<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:52"]
  T19["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  S19 -->|calls| T19
  S20["function:JobsRandom0_100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:62"]
  T20["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S20 -->|calls| T20
  S21["function:JobsRandom0__100<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:66"]
  T21["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S21 -->|calls| T21
  S22["function:JobsRandom100_200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:70"]
  T22["function:JobsBaseRandomOffsetValueWithNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:40"]
  S22 -->|calls| T22
  S23["function:JobsRandom100__200<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:74"]
  T23["function:JobsBaseRandomOffsetValueWithContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:46"]
  S23 -->|calls| T23
  S24["function:baseRandomNOContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:78"]
  T24["function:JobsBaseRandomNoContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:20"]
  S24 -->|calls| T24
  S25["function:baseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:82"]
  T25["function:JobsBaseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:30"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
