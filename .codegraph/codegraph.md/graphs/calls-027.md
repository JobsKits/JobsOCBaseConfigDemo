# `calls 符号关系 - 027`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::Dealloc<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:34"]
  T1["method:UIView::gesture:action:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:13"]
  S1 -->|calls| T1
  S2["method:UIView::Dealloc<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:34"]
  T2["method:UIView::gesture:action:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:13"]
  S2 -->|calls| T2
  S3["method:UIView::Dealloc<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:34"]
  T3["method:UIView::gesture:action:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:13"]
  S3 -->|calls| T3
  S4["method:UIView::Dealloc<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:34"]
  T4["method:UIView::gesture:action:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:13"]
  S4 -->|calls| T4
  S5["method:UIView::Dealloc<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:34"]
  T5["method:UIView::gesture:action:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:13"]
  S5 -->|calls| T5
  S6["method:UIView::Dealloc<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:34"]
  T6["method:UIView::gesture:action:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:13"]
  S6 -->|calls| T6
  S7["method:UIView::Dealloc<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:34"]
  T7["method:UIView::gesture:action:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:13"]
  S7 -->|calls| T7
  S8["method:UIView::Dealloc<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:34"]
  T8["method:UIView::gesture:action:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:13"]
  S8 -->|calls| T8
  S9["method:UIView::longPressGR<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:67"]
  T9["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S9 -->|calls| T9
  S10["method:UIView::tapGR<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:93"]
  T10["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S10 -->|calls| T10
  S11["method:UIView::doubleTapGR<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:117"]
  T11["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S11 -->|calls| T11
  S12["method:UIView::swipeGR<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:141"]
  T12["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S12 -->|calls| T12
  S13["method:UIView::panGR<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:165"]
  T13["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S13 -->|calls| T13
  S14["method:UIView::pinchGR<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:189"]
  T14["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S14 -->|calls| T14
  S15["method:UIView::rotationGR<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:212"]
  T15["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S15 -->|calls| T15
  S16["method:UIView::screenEdgePanGR<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:235"]
  T16["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S16 -->|calls| T16
  S17["method:UIView::jobsRefreshUI<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:68"]
  T17["method:BaseCollectionView::layoutIfNeeded<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionView/BaseCollectionView/BaseCollectionView.m:47"]
  S17 -->|calls| T17
  S18["method:UIView::BySize<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:100"]
  T18["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S18 -->|calls| T18
  S19["method:UIView::ByFrame<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:111"]
  T19["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S19 -->|calls| T19
  S20["method:UIView::ByOrigin<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:122"]
  T20["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S20 -->|calls| T20
  S21["method:UIView::ByWidth<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T21["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S21 -->|calls| T21
  S22["method:UIView::ByHeight<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T22["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S22 -->|calls| T22
  S23["method:UIView::ByCenter<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T23["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S23 -->|calls| T23
  S24["method:UIView::resetContentSize<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:498"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::resetContentSizeWidth<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:509"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
