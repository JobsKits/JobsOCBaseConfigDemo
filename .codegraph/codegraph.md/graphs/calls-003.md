# `calls 符号关系 - 003`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::range<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T1["method:NSString::rangeOfString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S1 -->|calls| T1
  S2["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T2["method:NSString::characterAtIndex<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S2 -->|calls| T2
  S3["method:NSString::jobsUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T3["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S3 -->|calls| T3
  S4["method:NSString::URLRequest<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T4["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSString::jobsFileUrl<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T5["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T6["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T7["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T8["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:UIImpactFeedbackGenerator::initBySoftStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:63"]
  T9["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIImpactFeedbackGenerator::initByRigidStyle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:78"]
  T10["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:JobsControlTarget::invoke:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:20"]
  T11["function:JobsControlTarget::_jobs_now<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:16"]
  S11 -->|calls| T11
  S12["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  T12["method:BaseTableViewCell::awakeFromNib<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:12"]
  S12 -->|calls| T12
  S13["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  T13["method:BaseTableViewCell::setSelected:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTableViewCell/BaseTableViewCell/BaseTableViewCell.m:17"]
  S13 -->|calls| T13
  S14["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  T14["method:JobsMonitorVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:18"]
  S14 -->|calls| T14
  S15["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  T15["method:JobsMonitorVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:27"]
  S15 -->|calls| T15
  S16["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  T16["method:JobsMonitorVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:35"]
  S16 -->|calls| T16
  S17["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  T17["method:JobsMonitorVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:48"]
  S17 -->|calls| T17
  S18["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  T18["method:JobsMonitorVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:52"]
  S18 -->|calls| T18
  S19["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  T19["method:JobsMonitorVC::preferredInterfaceOrientationForPresentation<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsMonitorVC/JobsMonitorVC.m:78"]
  S19 -->|calls| T19
  S20["method:JobsTabBarSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:17"]
  T20["method:JobsTabBarSettingVC::didReceiveMemoryWarning<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:17"]
  S20 -->|calls| T20
  S21["method:JobsTabBarSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:25"]
  T21["method:JobsTabBarSettingVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:25"]
  S21 -->|calls| T21
  S22["method:JobsTabBarSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:29"]
  T22["method:JobsTabBarSettingVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:29"]
  S22 -->|calls| T22
  S23["method:JobsTabBarSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:37"]
  T23["method:JobsTabBarSettingVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:37"]
  S23 -->|calls| T23
  S24["method:JobsTabBarSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:41"]
  T24["method:JobsTabBarSettingVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseVC/JobsTabBarSettingVC/JobsTabBarSettingVC.m:41"]
  S24 -->|calls| T24
  S25["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T25["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
