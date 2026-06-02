# `calls 符号关系 - 157`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T1["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S1 -->|calls| T1
  S2["method:UIView::makeTargetShadowview:superView:shadowDirection:shadowWithOffsetX:offsetY:cornerRadius:shadowOffset:shadowOpacity:layerShadowColor:layerShadowRadius:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:177"]
  T2["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S2 -->|calls| T2
  S3["method:UIView::labelAutoFontByWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:273"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIView::jobs_navBar<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+JobsNavBar/UIView+JobsNavBar.m:23"]
  T4["method:UIView::makeNavBarConfig<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+JobsNavBar/UIView+JobsNavBar.m:34"]
  S4 -->|calls| T4
  S5["method:UIView::jobs_addNavBarWithConfig:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+JobsNavBar/UIView+JobsNavBar.m:53"]
  T5["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S5 -->|calls| T5
  S6["method:UIView::jobs_addNavBarWithConfig:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+JobsNavBar/UIView+JobsNavBar.m:53"]
  T6["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S6 -->|calls| T6
  S7["method:UIView::jobs_addNavBarWithConfig:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+JobsNavBar/UIView+JobsNavBar.m:53"]
  T7["method:UIView::addSubview<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S7 -->|calls| T7
  S8["method:UIView::jobs_addNavBarWithConfig:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+JobsNavBar/UIView+JobsNavBar.m:53"]
  T8["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S8 -->|calls| T8
  S9["method:UIView::uninstall<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:143"]
  T9["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S9 -->|calls| T9
  S10["method:UIView::uninstallAllLayoutAttribute<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:155"]
  T10["method:MASCompositeConstraint::uninstall<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASCompositeConstraint.m:176"]
  S10 -->|calls| T10
  S11["method:UIView::jobsMasonryBeforeBlock:masonryAfterBlock:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:169"]
  T11["method:UIView::uninstallAllLayoutAttribute<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Masonry/UIView+Masonry.m:155"]
  S11 -->|calls| T11
  S12["method:UIView::jobsRefreshUI<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:68"]
  T12["method:BaseImageView::layoutIfNeeded<br/>JobsByPods/JobsNavBar@Pods/Support/BaseUI/BaseImageView/BaseImageView.m:55"]
  S12 -->|calls| T12
  S13["method:UIView::BySize<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:100"]
  T13["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S13 -->|calls| T13
  S14["method:UIView::ByFrame<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:111"]
  T14["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S14 -->|calls| T14
  S15["method:UIView::ByOrigin<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:122"]
  T15["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S15 -->|calls| T15
  S16["method:UIView::ByWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:133"]
  T16["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S16 -->|calls| T16
  S17["method:UIView::ByHeight<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:144"]
  T17["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S17 -->|calls| T17
  S18["method:UIView::ByCenter<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:155"]
  T18["method:UIView::build<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:12"]
  S18 -->|calls| T18
  S19["method:UIView::resetContentSize<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:498"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIView::resetContentSizeWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:509"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::resetContentSizeHeight<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:520"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::resetContentSizeOffsetWidth<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:531"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::resetContentSizeOffsetHeight<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:543"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::resetContentOffset<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:555"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIView::resetContentOffsetX<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:566"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
