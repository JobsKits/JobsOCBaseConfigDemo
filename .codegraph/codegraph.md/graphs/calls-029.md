# `calls 符号关系 - 029`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:BaseNavigationVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:30"]
  T2["method:BaseNavigationVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:30"]
  S2 -->|calls| T2
  S3["method:BaseNavigationVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:35"]
  T3["method:BaseNavigationVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:35"]
  S3 -->|calls| T3
  S4["method:BaseNavigationVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:57"]
  T4["method:BaseNavigationVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:57"]
  S4 -->|calls| T4
  S5["method:BaseNavigationVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:61"]
  T5["method:BaseNavigationVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:61"]
  S5 -->|calls| T5
  S6["method:BaseNavigationVC::setViewControllers:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:75"]
  T6["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  S6 -->|calls| T6
  S7["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  T7["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  S7 -->|calls| T7
  S8["method:BaseNavigationVC::pushViewController:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:88"]
  T8["method:BaseNavigationVC::pushViewController:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:88"]
  S8 -->|calls| T8
  S9["method:JobsControlTarget::invoke:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:20"]
  T9["function:JobsControlTarget::_jobs_now<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:16"]
  S9 -->|calls| T9
  S10["method:JobsKeychainHelper::load<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:15"]
  T10["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:150"]
  S10 -->|calls| T10
  S11["method:JobsKeychainHelper::save:data:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:47"]
  T11["method:NSKeyedArchiver::initByObject<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S12 -->|calls| T12
  S13["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T13["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S13 -->|calls| T13
  S14["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T14["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S14 -->|calls| T14
  S15["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T15["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S15 -->|calls| T15
  S16["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S16 -->|calls| T16
  S17["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T17["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S17 -->|calls| T17
  S18["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T18["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S18 -->|calls| T18
  S19["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T19["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S19 -->|calls| T19
  S20["method:JobsKeychainHelper::deleteAccountInfoByService<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:101"]
  T20["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S20 -->|calls| T20
  S21["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:134"]
  T21["method:JobsKeychainHelper::getKeychainBaseQuery1<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:114"]
  S21 -->|calls| T21
  S22["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:143"]
  T22["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S22 -->|calls| T22
  S23["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:152"]
  T23["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:141"]
  S23 -->|calls| T23
  S24["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:152"]
  T24["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S24 -->|calls| T24
  S25["method:JobsTuple::initWithValues:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:33"]
  T25["method:JobsTuple::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsTuple/JobsTuple.m:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
