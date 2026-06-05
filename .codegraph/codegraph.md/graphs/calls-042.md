# `calls 符号关系 - 042`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::panGR<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:165"]
  T1["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S1 -->|calls| T1
  S2["method:UIView::pinchGR<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:189"]
  T2["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S2 -->|calls| T2
  S3["method:UIView::rotationGR<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:212"]
  T3["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S3 -->|calls| T3
  S4["method:UIView::screenEdgePanGR<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:235"]
  T4["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S4 -->|calls| T4
  S5["method:UIView::addGestureRecognizer:block:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+JHGestureBlock/UIView+JHGestureBlock.m:13"]
  T5["method:UIView::addGestureRecognizer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:722"]
  S5 -->|calls| T5
  S6["method:UIView::BySize<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:122"]
  T6["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S6 -->|calls| T6
  S7["method:UIView::ByFrame<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T7["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S7 -->|calls| T7
  S8["method:UIView::ByOrigin<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T8["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S8 -->|calls| T8
  S9["method:UIView::ByWidth<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T9["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S9 -->|calls| T9
  S10["method:UIView::ByHeight<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:166"]
  T10["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S10 -->|calls| T10
  S11["method:UIView::ByCenter<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:177"]
  T11["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S11 -->|calls| T11
  S12["method:UIView::resetContentSize<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:520"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:UIView::resetContentSizeWidth<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:531"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIView::resetContentSizeHeight<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:542"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIView::resetContentSizeOffsetWidth<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:553"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:UIView::resetContentSizeOffsetHeight<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:565"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:UIView::resetContentOffset<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:577"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:UIView::resetContentOffsetX<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:588"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:UIView::resetContentOffsetY<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:599"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIView::resetContentOffsetX_offset<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:610"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::resetContentOffsetY_offset<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:622"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::resetContentInset<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:634"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::resetContentInsetTop<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:645"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::resetContentInsetLeft<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:659"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::resetContentInsetBottom<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Measure/UIView+Measure.m:673"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
