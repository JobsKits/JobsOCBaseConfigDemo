# `calls 符号关系 - 124`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T1["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S1 -->|calls| T1
  S2["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T2["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S2 -->|calls| T2
  S3["method:NSMutableSet::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  T3["method:NSMutableSet::containsObject<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T4["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S4 -->|calls| T4
  S5["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T5["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S5 -->|calls| T5
  S6["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T6["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T7["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T8["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S8 -->|calls| T8
  S9["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T9["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S9 -->|calls| T9
  S10["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T10["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S10 -->|calls| T10
  S11["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T11["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S11 -->|calls| T11
  S12["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T12["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S12 -->|calls| T12
  S13["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T13["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S13 -->|calls| T13
  S14["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T14["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T15["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T16["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T17["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S17 -->|calls| T17
  S18["method:NSObject::tapImageWithIndexPath:imageDataMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:46"]
  T18["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S18 -->|calls| T18
  S19["method:NSObject::tapImageWithIndexPath:imageDataMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:46"]
  T19["function:NSObject::jobsMakeGKPhoto<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:12"]
  S19 -->|calls| T19
  S20["method:NSObject::tapImageWithIndexPath:imageUrlMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:64"]
  T20["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S20 -->|calls| T20
  S21["method:NSObject::tapImageWithIndexPath:imageUrlMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:64"]
  T21["function:NSObject::jobsMakeGKPhoto<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:12"]
  S21 -->|calls| T21
  S22["method:NSObject::tapImageWithIndexPath:imageUrlStrMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:82"]
  T22["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S22 -->|calls| T22
  S23["method:NSObject::tapImageWithIndexPath:imageUrlStrMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:82"]
  T23["function:NSObject::jobsMakeGKPhoto<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:12"]
  S23 -->|calls| T23
  S24["method:NSObject::gif_img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:NSObject::gif_img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T25["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
