# `calls 符号关系 - 162`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T1["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S1 -->|calls| T1
  S2["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T2["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S2 -->|calls| T2
  S3["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T3["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T4["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S4 -->|calls| T4
  S5["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T5["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S5 -->|calls| T5
  S6["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T6["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T7["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T8["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S8 -->|calls| T8
  S9["method:NSObject::tapImageWithIndexPath:imageDataMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:46"]
  T9["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S9 -->|calls| T9
  S10["method:NSObject::tapImageWithIndexPath:imageDataMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:46"]
  T10["function:NSObject::jobsMakeGKPhoto<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:12"]
  S10 -->|calls| T10
  S11["method:NSObject::tapImageWithIndexPath:imageUrlMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:64"]
  T11["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S11 -->|calls| T11
  S12["method:NSObject::tapImageWithIndexPath:imageUrlMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:64"]
  T12["function:NSObject::jobsMakeGKPhoto<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:12"]
  S12 -->|calls| T12
  S13["method:NSObject::tapImageWithIndexPath:imageUrlStrMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:82"]
  T13["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S13 -->|calls| T13
  S14["method:NSObject::tapImageWithIndexPath:imageUrlStrMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:82"]
  T14["function:NSObject::jobsMakeGKPhoto<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:12"]
  S14 -->|calls| T14
  S15["method:NSObject::isSizeZero<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:36"]
  T15["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:553"]
  S15 -->|calls| T15
  S16["method:NSObject::isPointZero<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:42"]
  T16["function:JobsSafeWidth::jobsZeroPointValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:561"]
  S16 -->|calls| T16
  S17["method:NSObject::isRectZero<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+Measure/NSObject+Measure.m:48"]
  T17["function:JobsSafeWidth::jobsEqualToZeroRect<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:573"]
  S17 -->|calls| T17
  S18["method:NSObject::gif_img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:NSObject::gif_img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T19["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  S19 -->|calls| T19
  S20["method:NSObject::gif_img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:NSObject::sys_img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:NSObject::sys_img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S22 -->|calls| T22
  S23["method:NSObject::sys_img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:22"]
  T23["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S23 -->|calls| T23
  S24["method:NSObject::img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:NSObject::img<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:37"]
  T25["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
