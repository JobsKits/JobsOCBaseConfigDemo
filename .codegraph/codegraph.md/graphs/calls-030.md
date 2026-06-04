# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  T1["method:TMSCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:65"]
  S1 -->|calls| T1
  S2["method:TMSCollectionViewLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:52"]
  T2["method:UICollectionViewLayoutAttributes::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionViewLayoutAttributes/UICollectionViewLayoutAttributes+Extra/UICollectionViewLayoutAttributes+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:BaseNavigationBar::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:18"]
  T3["method:BaseNavigationBar::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:18"]
  S3 -->|calls| T3
  S4["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  T4["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  S4 -->|calls| T4
  S5["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:BaseNavigationVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:30"]
  T7["method:BaseNavigationVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:30"]
  S7 -->|calls| T7
  S8["method:BaseNavigationVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:35"]
  T8["method:BaseNavigationVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:35"]
  S8 -->|calls| T8
  S9["method:BaseNavigationVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:57"]
  T9["method:BaseNavigationVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:57"]
  S9 -->|calls| T9
  S10["method:BaseNavigationVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:61"]
  T10["method:BaseNavigationVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:61"]
  S10 -->|calls| T10
  S11["method:BaseNavigationVC::setViewControllers:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:75"]
  T11["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  S11 -->|calls| T11
  S12["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  T12["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  S12 -->|calls| T12
  S13["method:BaseNavigationVC::pushViewController:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:88"]
  T13["method:BaseNavigationVC::pushViewController:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:88"]
  S13 -->|calls| T13
  S14["method:JobsControlTarget::invoke:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:20"]
  T14["function:JobsControlTarget::_jobs_now<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:16"]
  S14 -->|calls| T14
  S15["method:JobsKeychainHelper::load<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:15"]
  T15["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:150"]
  S15 -->|calls| T15
  S16["method:JobsKeychainHelper::save:data:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:47"]
  T16["method:NSKeyedArchiver::initByObject<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T17["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S17 -->|calls| T17
  S18["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T18["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S18 -->|calls| T18
  S19["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T19["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S19 -->|calls| T19
  S20["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T20["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S20 -->|calls| T20
  S21["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T21["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S21 -->|calls| T21
  S22["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T22["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S22 -->|calls| T22
  S23["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T23["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S23 -->|calls| T23
  S24["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:90"]
  T24["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S24 -->|calls| T24
  S25["method:JobsKeychainHelper::deleteAccountInfoByService<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:101"]
  T25["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
