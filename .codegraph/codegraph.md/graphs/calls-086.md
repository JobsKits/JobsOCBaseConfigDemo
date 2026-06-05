# `calls 符号关系 - 086`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSDictionary::objectForKey<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S1 -->|calls| T1
  S2["method:NSDictionary::objectForKey<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T2["method:NSDictionary::objectForKey<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S2 -->|calls| T2
  S3["method:NSFormatter::date<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:NSFormatter::time<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:NSFormatter::time<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:25"]
  T5["method:NSFormatter::date<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSFormatter/NSFormatter+Extra/NSFormatter+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T6["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S6 -->|calls| T6
  S7["method:NSMutableDictionary::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T7["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S7 -->|calls| T7
  S8["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T9["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S9 -->|calls| T9
  S10["method:NSMutableSet::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  T10["method:NSMutableSet::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  S10 -->|calls| T10
  S11["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T11["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S11 -->|calls| T11
  S12["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T12["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S12 -->|calls| T12
  S13["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T13["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S13 -->|calls| T13
  S14["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T14["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T15["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T16["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T17["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S17 -->|calls| T17
  S18["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T18["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S18 -->|calls| T18
  S19["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T19["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T20["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T21["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T22["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S24 -->|calls| T24
  S25["method:NSObject::tapImageWithIndexPath:imageDataMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:46"]
  T25["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
