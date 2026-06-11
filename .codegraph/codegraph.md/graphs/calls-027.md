# `calls 符号关系 - 027`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T1["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S1 -->|calls| T1
  S2["method:FSCalendarStickyHeader::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:56"]
  T2["method:FSCalendarStickyHeader::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:56"]
  S2 -->|calls| T2
  S3["method:FSCalendarStickyHeader::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:81"]
  T3["method:FSCalendarStickyHeader::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:92"]
  S3 -->|calls| T3
  S4["method:FSCalendarWeekdayView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:25"]
  T4["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  S4 -->|calls| T4
  S5["method:FSCalendarWeekdayView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:34"]
  T5["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  S5 -->|calls| T5
  S6["method:FSCalendarWeekdayView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:58"]
  T6["method:FSCalendarWeekdayView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:58"]
  S6 -->|calls| T6
  S7["method:FSCalendarWeekdayView::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:87"]
  T7["method:FSCalendarWeekdayView::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:98"]
  S7 -->|calls| T7
  S8["method:DefaultDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/Swift/DefaultDemoViewController.swift:26"]
  T8["method:DefaultDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/Swift/DefaultDemoViewController.swift:26"]
  S8 -->|calls| T8
  S9["method:ViewController::captchaSession<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:29"]
  T9["method:JobsGestureLockConfiguration::defaultConfiguration<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:13"]
  S9 -->|calls| T9
  S10["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T10["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  S10 -->|calls| T10
  S11["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T11["method:ViewController::randomChangeBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:62"]
  S11 -->|calls| T11
  S12["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T12["method:ViewController::captchaSession<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:29"]
  S12 -->|calls| T12
  S13["method:ViewController::randomChangeBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:62"]
  T13["method:ViewController::randomColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:67"]
  S13 -->|calls| T13
  S14["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T17["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S17 -->|calls| T17
  S18["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T18["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S18 -->|calls| T18
  S19["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T19["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S19 -->|calls| T19
  S20["method:ViewController::gtCaptchaSession:didReceiveError:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:143"]
  T20["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S20 -->|calls| T20
  S21["method:ViewController::gtCaptchaSession:didReceiveError:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:143"]
  T21["method:ViewController::showAlertController:message:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:86"]
  S21 -->|calls| T21
  S22["function:main<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/main.m:11"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  T23["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  S23 -->|calls| T23
  S24["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  T24["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  S24 -->|calls| T24
  S25["method:TABAnimatedCacheManager::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:92"]
  T25["method:TABAnimationMethod::appVersion<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
