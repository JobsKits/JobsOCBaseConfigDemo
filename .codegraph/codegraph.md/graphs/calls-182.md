# `calls 符号关系 - 182`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FSCalendarHeaderLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:260"]
  T1["method:FSCalendarHeaderLayout::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:260"]
  S1 -->|calls| T1
  S2["method:FSCalendarHeaderLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:279"]
  T2["method:FSCalendarHeaderLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:279"]
  S2 -->|calls| T2
  S3["method:FSCalendarHeaderLayout::didReceiveOrientationChangeNotification:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:290"]
  T3["method:ASCollectionLayout::invalidateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayout.mm:143"]
  S3 -->|calls| T3
  S4["method:FSCalendarHeaderTouchDeliver::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:304"]
  T4["method:FSCalendarHeaderTouchDeliver::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarHeaderView/FSCalendarHeaderView.m:304"]
  S4 -->|calls| T4
  S5["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T5["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S5 -->|calls| T5
  S6["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T6["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S6 -->|calls| T6
  S7["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T7["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S7 -->|calls| T7
  S8["method:FSCalendarStickyHeader::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:25"]
  T8["method:FSCalendarAppearance::init<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarAppearance/FSCalendarAppearance.m:25"]
  S8 -->|calls| T8
  S9["method:FSCalendarStickyHeader::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:56"]
  T9["method:FSCalendarStickyHeader::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:56"]
  S9 -->|calls| T9
  S10["method:FSCalendarStickyHeader::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:81"]
  T10["method:FSCalendarStickyHeader::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarStickyHeader/FSCalendarStickyHeader.m:92"]
  S10 -->|calls| T10
  S11["method:FSCalendarWeekdayView::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:25"]
  T11["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  S11 -->|calls| T11
  S12["method:FSCalendarWeekdayView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:34"]
  T12["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  S12 -->|calls| T12
  S13["method:FSCalendarWeekdayView::commonInit<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:43"]
  T13["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S13 -->|calls| T13
  S14["method:FSCalendarWeekdayView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:58"]
  T14["method:FSCalendarWeekdayView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:58"]
  S14 -->|calls| T14
  S15["method:FSCalendarWeekdayView::setCalendar:<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:87"]
  T15["method:FSCalendarWeekdayView::configureAppearance<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarWeekdayView/FSCalendarWeekdayView.m:98"]
  S15 -->|calls| T15
  S16["method:DefaultDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/Swift/DefaultDemoViewController.swift:26"]
  T16["method:DefaultDemoViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/Swift/DefaultDemoViewController.swift:26"]
  S16 -->|calls| T16
  S17["method:ViewController::captchaSession<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:29"]
  T17["method:JobsGestureLockConfiguration::defaultConfiguration<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:13"]
  S17 -->|calls| T17
  S18["method:ViewController::captchaSession<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:29"]
  T18["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T19["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  S19 -->|calls| T19
  S20["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T20["method:ViewController::randomChangeBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:62"]
  S20 -->|calls| T20
  S21["method:ViewController::viewDidLoad<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:46"]
  T21["method:ViewController::captchaSession<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:29"]
  S21 -->|calls| T21
  S22["method:ViewController::randomChangeBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:62"]
  T22["method:ViewController::randomColor<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:67"]
  S22 -->|calls| T22
  S23["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:ViewController::gtCaptchaSession:didReceive:result:<br/>JobsByPods/ManualByOCPods@Pods/GTCaptcha4/gt4-ios-1.8.8-sec/Example/HelloGTCaptcha4/ViewController.m:98"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
