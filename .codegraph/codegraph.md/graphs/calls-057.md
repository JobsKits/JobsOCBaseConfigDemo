# `calls 符号关系 - 057`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UICollectionView::registerCollectionElementKindSectionFooterClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:82"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S1 -->|calls| T1
  S2["method:UICollectionView::swizzled_registerClass:forCellWithReuseIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:36"]
  T2["method:UICollectionView::swizzled_registerClass:forCellWithReuseIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:36"]
  S2 -->|calls| T2
  S3["method:UICollectionView::swizzled_registerClass:forSupplementaryViewOfKind:withReuseIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:43"]
  T3["method:UICollectionView::swizzled_registerClass:forSupplementaryViewOfKind:withReuseIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:43"]
  S3 -->|calls| T3
  S4["method:UICollectionView::swizzled_dequeueReusableCellWithReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:52"]
  T4["method:UICollectionView::swizzled_dequeueReusableCellWithReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:52"]
  S4 -->|calls| T4
  S5["method:UICollectionView::swizzled_dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:61"]
  T5["method:UICollectionView::swizzled_dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:61"]
  S5 -->|calls| T5
  S6["method:UICollectionView::swizzled_dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:61"]
  T6["method:UICollectionView::swizzled_dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:61"]
  S6 -->|calls| T6
  S7["method:UICollectionViewCell::cutFirstAndLastCollectionViewCellWithBackgroundCor:cellOutLineCor:bottomLineCor:borderWidth:cornerRadiusSize:dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:68"]
  T7["method:UICollectionViewCell::dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:291"]
  S7 -->|calls| T7
  S8["method:UICollectionViewCell::cutFirstAndLastCollectionViewCellWithBackgroundCor:cellOutLineCor:bottomLineCor:borderWidth:cornerRadiusSize:dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:68"]
  T8["method:UIBezierPath::initByRect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:75"]
  S8 -->|calls| T8
  S9["method:UICollectionViewCell::cutFirstAndLastCollectionViewCellWithBackgroundCor:cellOutLineCor:bottomLineCor:borderWidth:cornerRadiusSize:dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:68"]
  T9["method:UICollectionViewCell::makeBottomLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:136"]
  S9 -->|calls| T9
  S10["method:UICollectionViewCell::cutFirstAndLastCollectionViewCellWithBackgroundCor:cellOutLineCor:bottomLineCor:borderWidth:cornerRadiusSize:dx:dy:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:68"]
  T10["method:UICollectionViewCell::makeTopLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:166"]
  S10 -->|calls| T10
  S11["method:UICollectionViewCell::makeBottomLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:136"]
  T11["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S11 -->|calls| T11
  S12["method:UICollectionViewCell::makeBottomLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:136"]
  T12["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S12 -->|calls| T12
  S13["method:UICollectionViewCell::makeTopLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:166"]
  T13["method:UIBezierPath::moveTo<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:67"]
  S13 -->|calls| T13
  S14["method:UICollectionViewCell::makeTopLineWithIndexPath:bounds:numberOfItemsInSection:borderWidth:bottomLineCor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionViewCell/UICollectionViewCell+UICollectionViewCellProtocol/UICollectionViewCell+UICollectionViewCellProtocol.m:166"]
  T14["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S14 -->|calls| T14
  S15["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  T15["function:jobs_targetsMap<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  T16["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S16 -->|calls| T16
  S17["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  T17["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S17 -->|calls| T17
  S18["method:UIControl::jobs_on:throttle:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:66"]
  T18["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S18 -->|calls| T18
  S19["method:UIControl::jobs_on:throttle:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:66"]
  T19["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S19 -->|calls| T19
  S20["method:UIControl::jobs_on:debounce:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:74"]
  T20["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S20 -->|calls| T20
  S21["method:UIControl::jobs_on:debounce:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:74"]
  T21["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S21 -->|calls| T21
  S22["method:UIControl::jobs_once:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:82"]
  T22["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S22 -->|calls| T22
  S23["method:UIControl::jobs_once:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:82"]
  T23["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S23 -->|calls| T23
  S24["method:UIControl::jobs_onTap:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:89"]
  T24["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  S24 -->|calls| T24
  S25["method:UIControl::jobs_onChange:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:93"]
  T25["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
