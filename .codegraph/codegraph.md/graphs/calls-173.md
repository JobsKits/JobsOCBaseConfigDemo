# `calls 符号关系 - 173`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::longPressGR<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:67"]
  T1["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S1 -->|calls| T1
  S2["method:UIView::tapGR<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:93"]
  T2["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S2 -->|calls| T2
  S3["method:UIView::doubleTapGR<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:117"]
  T3["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S3 -->|calls| T3
  S4["method:UIView::swipeGR<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:141"]
  T4["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S4 -->|calls| T4
  S5["method:UIView::panGR<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:165"]
  T5["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S5 -->|calls| T5
  S6["method:UIView::pinchGR<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:189"]
  T6["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S6 -->|calls| T6
  S7["method:UIView::rotationGR<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:212"]
  T7["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S7 -->|calls| T7
  S8["method:UIView::screenEdgePanGR<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Gesture/UIView+Gesture.m:235"]
  T8["method:UIGestureRecognizer::addAction<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:32"]
  S8 -->|calls| T8
  S9["method:UIView::uninstall<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:143"]
  T9["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S9 -->|calls| T9
  S10["method:UIView::uninstallAllLayoutAttribute<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:155"]
  T10["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S10 -->|calls| T10
  S11["method:UIView::jobsMasonryBeforeBlock:masonryAfterBlock:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:169"]
  T11["method:UIView::uninstallAllLayoutAttribute<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:155"]
  S11 -->|calls| T11
  S12["method:UIView::refresh<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:197"]
  T12["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S12 -->|calls| T12
  S13["method:UIView::jobsRefreshUI<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:68"]
  T13["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S13 -->|calls| T13
  S14["method:UIView::BySize<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:122"]
  T14["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S14 -->|calls| T14
  S15["method:UIView::ByFrame<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T15["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S15 -->|calls| T15
  S16["method:UIView::ByOrigin<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T16["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S16 -->|calls| T16
  S17["method:UIView::ByWidth<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T17["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S17 -->|calls| T17
  S18["method:UIView::ByHeight<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:166"]
  T18["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S18 -->|calls| T18
  S19["method:UIView::ByCenter<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:177"]
  T19["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S19 -->|calls| T19
  S20["method:UIView::resetContentSize<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:520"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::resetContentSizeWidth<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:531"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::resetContentSizeHeight<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:542"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::resetContentSizeOffsetWidth<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:553"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::resetContentSizeOffsetHeight<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:565"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::resetContentOffset<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:577"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
