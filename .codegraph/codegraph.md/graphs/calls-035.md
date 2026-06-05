# `calls 符号关系 - 035`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  T1["method:NSUserDefaults::swizzleSetBool:forKey:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSUserDefaults/NSUserDefaults+Swizzle/NSUserDefaults+Swizzle.m:85"]
  S1 -->|calls| T1
  S2["method:UIButton::revolution<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:12"]
  T2["method:CABasicAnimation::animationByKeyPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CABasicAnimation/CABasicAnimation+Extra/CABasicAnimation+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIButton::startRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:29"]
  T3["method:UIButton::stopRevolutionBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+Animation/UIButton+Animation.m:21"]
  S3 -->|calls| T3
  S4["method:UIButton::by_setBackgroundColor:forState:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIButton/UIButton+FillColor/UIButton+FillColor.m:25"]
  T4["method:ASButtonNode::setBackgroundImage:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:471"]
  S4 -->|calls| T4
  S5["method:UICollectionView::didSelectItemAtIndexPath:collectionViewCellClass:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+Func/UICollectionView+Func.m:113"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UICollectionView::registerCollectionElementKindSectionHeaderClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:62"]
  T6["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S6 -->|calls| T6
  S7["method:UICollectionView::registerCollectionElementKindSectionFooterClass_<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:82"]
  T7["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S7 -->|calls| T7
  S8["method:UICollectionView::swizzled_registerClass:forCellWithReuseIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:36"]
  T8["method:UICollectionView::swizzled_registerClass:forCellWithReuseIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:36"]
  S8 -->|calls| T8
  S9["method:UICollectionView::swizzled_registerClass:forSupplementaryViewOfKind:withReuseIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:43"]
  T9["method:UICollectionView::swizzled_registerClass:forSupplementaryViewOfKind:withReuseIdentifier:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:43"]
  S9 -->|calls| T9
  S10["method:UICollectionView::swizzled_dequeueReusableCellWithReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:52"]
  T10["method:UICollectionView::swizzled_dequeueReusableCellWithReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:52"]
  S10 -->|calls| T10
  S11["method:UICollectionView::swizzled_dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:61"]
  T11["method:UICollectionView::swizzled_dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:61"]
  S11 -->|calls| T11
  S12["method:UICollectionView::swizzled_dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:61"]
  T12["method:UICollectionView::swizzled_dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UICollectionView/UICollectionView+RegistrationTracking/UICollectionView+RegistrationTracking.m:61"]
  S12 -->|calls| T12
  S13["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  T13["function:jobs_targetsMap<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  T14["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S14 -->|calls| T14
  S15["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  T15["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S15 -->|calls| T15
  S16["method:UIControl::jobs_on:throttle:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:66"]
  T16["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S16 -->|calls| T16
  S17["method:UIControl::jobs_on:throttle:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:66"]
  T17["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S17 -->|calls| T17
  S18["method:UIControl::jobs_on:debounce:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:74"]
  T18["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S18 -->|calls| T18
  S19["method:UIControl::jobs_on:debounce:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:74"]
  T19["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S19 -->|calls| T19
  S20["method:UIControl::jobs_once:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:82"]
  T20["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S20 -->|calls| T20
  S21["method:UIControl::jobs_once:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:82"]
  T21["function:_jobs_bind<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:32"]
  S21 -->|calls| T21
  S22["method:UIControl::jobs_onTap:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:89"]
  T22["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  S22 -->|calls| T22
  S23["method:UIControl::jobs_onChange:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:93"]
  T23["method:UIControl::jobs_on:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:59"]
  S23 -->|calls| T23
  S24["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T24["function:jobs_targetsMap<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T25["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:384"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
