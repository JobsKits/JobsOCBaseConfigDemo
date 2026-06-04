# `calls 符号关系 - 194`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FSCalendarTransitionCoordinator::boundingRectWillChange:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:316"]
  T1["method:JobsCalenderView::calendar:boundingRectWillChange:animated:<br/>JobsByPods/JobsOCTools@Pods/Core/弹出的日历选择页面/JobsCalenderView.m:157"]
  S1 -->|calls| T1
  S2["method:FSCalendarTransitionCoordinator::performTransition:fromProgress:toProgress:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:323"]
  T2["method:FSCalendarTransitionCoordinator::boundingRectWillChange:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:316"]
  S2 -->|calls| T2
  S3["method:FSCalendarTransitionCoordinator::performTransition:fromProgress:toProgress:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:323"]
  T3["method:FSCalendarTransitionCoordinator::boundingRectWillChange:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:316"]
  S3 -->|calls| T3
  S4["method:FSCalendarTransitionCoordinator::performPathAnimationWithProgress:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:364"]
  T4["method:FSCalendarTransitionCoordinator::boundingRectWillChange:animated:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:316"]
  S4 -->|calls| T4
  S5["method:FSCalendarTransitionCoordinator::prepareWeekToMonthTransition<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarTransitionCoordinator/FSCalendarTransitionCoordinator.m:386"]
  T5["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S5 -->|calls| T5
  S6["method:FSCalendarWeekdayView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:25"]
  T6["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  S6 -->|calls| T6
  S7["method:FSCalendarWeekdayView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:34"]
  T7["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  S7 -->|calls| T7
  S8["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  T8["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S8 -->|calls| T8
  S9["method:FSCalendarWeekdayView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:58"]
  T9["method:FSCalendarWeekdayView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:58"]
  S9 -->|calls| T9
  S10["method:FSCalendarWeekdayView::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:87"]
  T10["method:FSCalendarWeekdayView::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:98"]
  S10 -->|calls| T10
  S11["method:DefaultDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/Swift/DefaultDemoViewController.swift:26"]
  T11["method:DefaultDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/Swift/DefaultDemoViewController.swift:26"]
  S11 -->|calls| T11
  S12["method:ViewController::captchaSession<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:29"]
  T12["method:JobsGestureLockConfiguration::defaultConfiguration<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:13"]
  S12 -->|calls| T12
  S13["method:ViewController::captchaSession<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:29"]
  T13["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T14["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  S14 -->|calls| T14
  S15["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T15["method:ViewController::randomChangeBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:62"]
  S15 -->|calls| T15
  S16["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T16["method:ViewController::captchaSession<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:29"]
  S16 -->|calls| T16
  S17["method:ViewController::randomChangeBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:62"]
  T17["method:ViewController::randomColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:67"]
  S17 -->|calls| T17
  S18["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T22["method:JobsTimer::resume<br/>JobsByPods/JobsOCTimer@Pods/Core/JobsTimer/JobsTimer.m:450"]
  S22 -->|calls| T22
  S23["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T23["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S23 -->|calls| T23
  S24["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T24["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S24 -->|calls| T24
  S25["method:ViewController::gtCaptchaSession:didReceiveError:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:143"]
  T25["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
