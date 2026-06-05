# `calls 符号关系 - 020`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  T1["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  S1 -->|calls| T1
  S2["method:JobsTabBarSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:17"]
  T2["method:JobsTabBarSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:17"]
  S2 -->|calls| T2
  S3["method:JobsTabBarSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:25"]
  T3["method:JobsTabBarSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:25"]
  S3 -->|calls| T3
  S4["method:JobsTabBarSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:29"]
  T4["method:JobsTabBarSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:29"]
  S4 -->|calls| T4
  S5["method:JobsTabBarSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:37"]
  T5["method:JobsTabBarSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:37"]
  S5 -->|calls| T5
  S6["method:JobsTabBarSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:41"]
  T6["method:JobsTabBarSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:41"]
  S6 -->|calls| T6
  S7["method:JobsWebViewController::dealloc<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:30"]
  T7["method:NSNotificationCenter::remove<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNotificationCenter/NSNotificationCenter+JobsBlock/NSNotificationCenter+JobsBlock.m:12"]
  S7 -->|calls| T7
  S8["method:JobsWebViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:35"]
  T8["method:JobsWebViewController::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:35"]
  S8 -->|calls| T8
  S9["method:JobsWebViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:46"]
  T9["method:JobsWebViewController::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:46"]
  S9 -->|calls| T9
  S10["method:JobsWebViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:54"]
  T10["method:JobsWebViewController::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:54"]
  S10 -->|calls| T10
  S11["method:JobsWebViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:59"]
  T11["method:JobsWebViewController::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsWebViewController/JobsWebViewController.m:59"]
  S11 -->|calls| T11
  S12["method:BaseTableViewHeaderFooterView::initWithReuseIdentifier:<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:20"]
  T12["method:UIView::initByFrame<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  T13["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  S13 -->|calls| T13
  S14["method:BaseTableViewHeaderFooterView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UITableViewBaseHeaderFooterView/BaseTableViewHeaderFooterView/BaseTableViewHeaderFooterView.m:44"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T15["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S15 -->|calls| T15
  S16["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T16["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T17["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T18["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S18 -->|calls| T18
  S19["method:NSArray::jobsVisible<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSData::initWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T20["method:NSData::initWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T21["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S21 -->|calls| T21
  S22["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T22["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S22 -->|calls| T22
  S23["method:NSDate::readableDayTime<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T23["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S23 -->|calls| T23
  S24["method:NSDate::readableTime<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T24["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S24 -->|calls| T24
  S25["method:NSDateFormatter::dateByString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSDateFormatter/NSDateFormatter+Extra/NSDateFormatter+Extra.m:20"]
  T25["function:ZMJGanttListVC::dateFromString<br/>JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@Excel/Excel-SpreadsheetView/ViewController/ZMJGanttListVC/ZMJGanttListVC.m:279"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
