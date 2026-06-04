# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::ByFrame<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:111"]
  T1["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::ByOrigin<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:122"]
  T2["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::ByWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T3["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::ByHeight<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T4["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S4 -->|calls| T4
  S5["method:UIView::ByCenter<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T5["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S5 -->|calls| T5
  S6["method:UIView::resetContentSize<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:498"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIView::resetContentSizeWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:509"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIView::resetContentSizeHeight<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:520"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIView::resetContentSizeOffsetWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:531"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIView::resetContentSizeOffsetHeight<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:543"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UIView::resetContentOffset<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:555"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UIView::resetContentOffsetX<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:566"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:UIView::resetContentOffsetY<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:577"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIView::resetContentOffsetX_offset<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:588"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIView::resetContentOffsetY_offset<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:600"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:UIView::resetContentInset<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:612"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:UIView::resetContentInsetTop<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:623"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:UIView::resetContentInsetLeft<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:637"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:UIView::resetContentInsetBottom<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:651"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIView::resetContentInsetRight<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:665"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::resetContentInsetOffsetTop<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:679"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::resetContentInsetOffsetLeft<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:693"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::resetContentInsetOffsetBottom<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:707"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::resetContentInsetOffsetRight<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:721"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::setSizer:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:904"]
  T25["method:NSValue::bySize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
