# `calls 符号关系 - 094`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::resetContentSizeOffsetHeight<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:543"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIView::resetContentOffset<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:555"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIView::resetContentOffsetX<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:566"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:UIView::resetContentOffsetY<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:577"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIView::resetContentOffsetX_offset<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:588"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIView::resetContentOffsetY_offset<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:600"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:UIView::resetContentInset<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:612"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:UIView::resetContentInsetTop<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:623"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:UIView::resetContentInsetLeft<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:637"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:UIView::resetContentInsetBottom<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:651"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:UIView::resetContentInsetRight<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:665"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UIView::resetContentInsetOffsetTop<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:679"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:UIView::resetContentInsetOffsetLeft<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:693"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIView::resetContentInsetOffsetBottom<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:707"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIView::resetContentInsetOffsetRight<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:721"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:UIView::setSizer:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:904"]
  T16["method:NSValue::bySize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:UIView::setOrigin:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:918"]
  T17["method:NSValue::byPoint<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:24"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsFiltrationView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:277"]
  T18["method:JobsPodspecKitForJobsFiltrationView::standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:266"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsFiltrationView::apply_standard_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsFiltrationView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:273"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsFiltrationView::apply_standard_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsFiltrationView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:277"]
  S20 -->|calls| T20
  S21["method:BaseView::init<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:32"]
  T21["method:BaseView::init<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:32"]
  S21 -->|calls| T21
  S22["method:BaseView::layoutSubviews<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:48"]
  T22["method:BaseView::layoutSubviews<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:48"]
  S22 -->|calls| T22
  S23["method:BaseView::layoutSubviews<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:48"]
  T23["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:25"]
  S23 -->|calls| T23
  S24["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:56"]
  T24["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:56"]
  S24 -->|calls| T24
  S25["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T25["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
