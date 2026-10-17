# `calls 符号关系 - 041`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T1["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S1 -->|calls| T1
  S2["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T2["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S2 -->|calls| T2
  S3["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T3["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S3 -->|calls| T3
  S4["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T4["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S4 -->|calls| T4
  S5["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T5["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S5 -->|calls| T5
  S6["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T6["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S6 -->|calls| T6
  S7["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T7["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S7 -->|calls| T7
  S8["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T8["method:MASConstraint::offset<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:116"]
  S8 -->|calls| T8
  S9["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T9["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S9 -->|calls| T9
  S10["method:UIView::setupGridWithRows:columns:itemViews:margin:spacing:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:31"]
  T10["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S10 -->|calls| T10
  S11["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T11["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S11 -->|calls| T11
  S12["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T12["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S12 -->|calls| T12
  S13["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T13["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S13 -->|calls| T13
  S14["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T14["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S14 -->|calls| T14
  S15["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T15["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S15 -->|calls| T15
  S16["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T16["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S16 -->|calls| T16
  S17["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T17["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S17 -->|calls| T17
  S18["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T18["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S18 -->|calls| T18
  S19["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T19["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S19 -->|calls| T19
  S20["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T20["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S20 -->|calls| T20
  S21["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T21["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S21 -->|calls| T21
  S22["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T22["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S22 -->|calls| T22
  S23["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T23["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S23 -->|calls| T23
  S24["file:JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.h:1"]
  T24["function:Prop_strong<br/>JobsByPods/JobsMenuView@Pods/Core/JobsMenuView/JobsMenuView.h:50"]
  S24 -->|calls| T24
  S25["method:UIView::handleWord<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:13"]
  T25["method:NSObject::protocol<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+DynamicInvoke/NSObject+DynamicInvoke.m:479"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
