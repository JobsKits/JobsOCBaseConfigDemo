# `calls 符号关系 - 062`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::ByWidth<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T1["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S1 -->|calls| T1
  S2["method:UIView::ByHeight<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T2["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S2 -->|calls| T2
  S3["method:UIView::ByCenter<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T3["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::resetContentSize<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:498"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIView::resetContentSizeWidth<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:509"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIView::resetContentSizeHeight<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:520"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIView::resetContentSizeOffsetWidth<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:531"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIView::resetContentSizeOffsetHeight<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:543"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIView::resetContentOffset<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:555"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIView::resetContentOffsetX<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:566"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UIView::resetContentOffsetY<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:577"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UIView::resetContentOffsetX_offset<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:588"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:UIView::resetContentOffsetY_offset<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:600"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIView::resetContentInset<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:612"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIView::resetContentInsetTop<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:623"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:UIView::resetContentInsetLeft<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:637"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:UIView::resetContentInsetBottom<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:651"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:UIView::resetContentInsetRight<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:665"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:UIView::resetContentInsetOffsetTop<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:679"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIView::resetContentInsetOffsetLeft<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:693"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::resetContentInsetOffsetBottom<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:707"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::resetContentInsetOffsetRight<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:721"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::setSizer:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:904"]
  T23["method:NSValue::bySize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:UIView::setOrigin:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:918"]
  T24["method:NSValue::byPoint<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:24"]
  S24 -->|calls| T24
  S25["method:UIView::refresh<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:28"]
  T25["method:BaseCollectionView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:47"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
