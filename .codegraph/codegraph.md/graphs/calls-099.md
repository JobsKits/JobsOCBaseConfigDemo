# `calls 符号关系 - 099`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::resetContentInsetOffsetBottom<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:707"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UIView::resetContentInsetOffsetRight<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:721"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:UIView::setSizer:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:904"]
  T3["method:NSValue::bySize<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:UIView::setOrigin:<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/UIView/UIView+Measure/UIView+Measure.m:918"]
  T4["method:NSValue::byPoint<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSValue/NSValue+Extra/NSValue+Extra.m:24"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsFiltrationView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:277"]
  T5["method:JobsPodspecKitForJobsFiltrationView::standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:266"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsFiltrationView::apply_standard_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsFiltrationView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:273"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsFiltrationView::apply_standard_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsFiltrationView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:277"]
  S7 -->|calls| T7
  S8["method:BaseView::init<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:32"]
  T8["method:BaseView::init<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:32"]
  S8 -->|calls| T8
  S9["method:BaseView::layoutSubviews<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:48"]
  T9["method:BaseView::layoutSubviews<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:48"]
  S9 -->|calls| T9
  S10["method:BaseView::layoutSubviews<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:48"]
  T10["method:UIView::appointCornerCutToCircleByRoundingCorners:cornerRadii:<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:25"]
  S10 -->|calls| T10
  S11["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:56"]
  T11["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:56"]
  S11 -->|calls| T11
  S12["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T12["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S12 -->|calls| T12
  S13["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T13["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S13 -->|calls| T13
  S14["method:UIView::addSubview<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  T14["method:UIView::addSubview<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:UIView::refresh<br/>JobsByPods/JobsFiltrationView@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:38"]
  T15["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsFiltrationView@Pods/Support/BaseUI/BaseView/BaseView.m:56"]
  S15 -->|calls| T15
  S16["method:JobsGestureLockConfiguration::copyWithZone:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:37"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:JobsGestureLockResource::resourceBundle<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:12"]
  T17["method:NSObject::mainBundle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:13"]
  S17 -->|calls| T17
  S18["method:JobsGestureLockResource::imageNamed:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:29"]
  T18["method:JobsGestureLockResource::resourceBundle<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:12"]
  S18 -->|calls| T18
  S19["method:JobsGestureLockStorage::saveGesturePassword:forKey:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockStorage/JobsGestureLockStorage.m:16"]
  T19["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  T20["method:JobsPodspecKitForJobsGestureLock::standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:266"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsGestureLock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:273"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  T23["method:JobsPodspecKitForJobsGetWindow::standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:266"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsGetWindow::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:273"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T25["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
