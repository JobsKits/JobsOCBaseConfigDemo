# `calls 符号关系 - 038`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:PointLabBaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:39"]
  T1["method:PointLabBaseView::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:39"]
  S1 -->|calls| T1
  S2["method:PointLabBaseView::initWithSize:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:43"]
  T2["method:PointLabBaseView::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:23"]
  S2 -->|calls| T2
  S3["method:PointLabBaseView::pointView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:78"]
  T3["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S3 -->|calls| T3
  S4["method:PointLabBaseView::pointView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLabel/PointLabView/PointLabBaseView/PointLabBaseView.m:78"]
  T4["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S4 -->|calls| T4
  S5["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  T5["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  S5 -->|calls| T5
  S6["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  T6["method:TMSCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:65"]
  S6 -->|calls| T6
  S7["method:TMSCollectionViewLayout::prepareLayout<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:27"]
  T7["method:TMSCollectionViewLayout::layoutAttributesForSupplementaryViewOfKind:atIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:65"]
  S7 -->|calls| T7
  S8["method:TMSCollectionViewLayout::layoutAttributesForItemAtIndexPath:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseLayout/TMSCollectionViewLayout/TMSCollectionViewLayout.m:52"]
  T8["method:UICollectionViewLayoutAttributes::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionViewLayoutAttributes/UICollectionViewLayoutAttributes+Extra/UICollectionViewLayoutAttributes+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:BaseNavigationBar::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:18"]
  T9["method:BaseNavigationBar::init<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:18"]
  S9 -->|calls| T9
  S10["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  T10["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  S10 -->|calls| T10
  S11["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:BaseNavigationBar::layoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationBar/BaseNavigationBar/BaseNavigationBar.m:24"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:BaseNavigationVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:30"]
  T13["method:BaseNavigationVC::loadView<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:30"]
  S13 -->|calls| T13
  S14["method:BaseNavigationVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:35"]
  T14["method:BaseNavigationVC::viewDidLoad<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:35"]
  S14 -->|calls| T14
  S15["method:BaseNavigationVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:57"]
  T15["method:BaseNavigationVC::viewWillLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:57"]
  S15 -->|calls| T15
  S16["method:BaseNavigationVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:61"]
  T16["method:BaseNavigationVC::viewDidLayoutSubviews<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:61"]
  S16 -->|calls| T16
  S17["method:BaseNavigationVC::setViewControllers:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:75"]
  T17["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  S17 -->|calls| T17
  S18["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  T18["method:BaseNavigationVC::setViewControllers:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:80"]
  S18 -->|calls| T18
  S19["method:BaseNavigationVC::pushViewController:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:88"]
  T19["method:BaseNavigationVC::pushViewController:animated:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseNavigationVC/BaseNavigationVC/BaseNavigationVC.m:88"]
  S19 -->|calls| T19
  S20["method:JobsControlTarget::invoke:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:20"]
  T20["function:JobsControlTarget::_jobs_now<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsControlTarget/JobsControlTarget.m:16"]
  S20 -->|calls| T20
  S21["method:JobsKeychainHelper::load<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:15"]
  T21["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:150"]
  S21 -->|calls| T21
  S22["method:JobsKeychainHelper::save:data:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:47"]
  T22["method:NSKeyedArchiver::initByObject<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T23["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S23 -->|calls| T23
  S24["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S24 -->|calls| T24
  S25["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseObject/JobsKeychainHelper/JobsKeychainHelper.m:77"]
  T25["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
