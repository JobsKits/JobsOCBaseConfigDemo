# `calls 符号关系 - 003`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::makeDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:62"]
  T1["method:BRTextPickerView::byPickerStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:45"]
  S1 -->|calls| T1
  S2["method:NSObject::makeDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:62"]
  T2["method:BRDatePickerView::byAutoSelect<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:103"]
  S2 -->|calls| T2
  S3["method:NSObject::makeDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:62"]
  T3["method:BRDatePickerView::byMaxDate<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:112"]
  S3 -->|calls| T3
  S4["method:NSObject::changeBy<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:87"]
  T4["method:BRTextPickerView::byDataSourceArr<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:54"]
  S4 -->|calls| T4
  S5["method:NSObject::changeBy<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:87"]
  T5["method:BRTextPickerView::byTitle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:27"]
  S5 -->|calls| T5
  S6["method:NSObject::textPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:103"]
  T6["method:NSObject::makeTextPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:31"]
  S6 -->|calls| T6
  S7["method:NSObject::addressPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:128"]
  T7["method:NSObject::makeAddressPickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:41"]
  S7 -->|calls| T7
  S8["method:NSObject::datePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:143"]
  T8["method:NSObject::makeDatePickerView<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:62"]
  S8 -->|calls| T8
  S9["method:NSObject::customStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:158"]
  T9["method:NSObject::makeCustomStyle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/NSObject+BRPickerView/NSObject+BRPickerView.m:15"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:277"]
  T10["method:JobsPodspecKitForBRPickerViewExtra::standard_user_target_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:266"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:273"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:277"]
  S12 -->|calls| T12
  S13["method:_FDFullscreenPopGestureRecognizerDelegate::gestureRecognizerShouldBegin:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:68"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:_FDFullscreenPopGestureRecognizerDelegate::jobsGestureRecognizerShouldBegin<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:73"]
  T14["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S14 -->|calls| T14
  S15["method:UIViewController::fd_viewWillAppear:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:130"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:UIViewController::jobsFd_viewWillAppear<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:135"]
  T16["method:UIViewController::fd_viewWillAppear:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:130"]
  S16 -->|calls| T16
  S17["method:UIViewController::jobsFd_viewWillAppear<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:135"]
  T17["method:UIViewController::fd_willAppearInjectBlock<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:163"]
  S17 -->|calls| T17
  S18["method:UIViewController::fd_viewWillDisappear:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:146"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:UIViewController::jobsFd_viewWillDisappear<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:151"]
  T19["method:UIViewController::fd_viewWillDisappear:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:146"]
  S19 -->|calls| T19
  S20["method:UINavigationController::fd_pushViewController:animated:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:207"]
  T20["method:_ASDisplayView::addGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:280"]
  S20 -->|calls| T20
  S21["method:UINavigationController::fd_pushViewController:animated:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:207"]
  T21["method:UIGestureRecognizer::byDelegate<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:20"]
  S21 -->|calls| T21
  S22["method:UINavigationController::fd_pushViewController:animated:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:207"]
  T22["method:UINavigationController::fd_popGestureRecognizerDelegate<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:257"]
  S22 -->|calls| T22
  S23["method:UINavigationController::fd_pushViewController:animated:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:207"]
  T23["method:UIGestureRecognizer::byEnabled<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:30"]
  S23 -->|calls| T23
  S24["method:UINavigationController::fd_pushViewController:animated:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:207"]
  T24["method:UINavigationController::fd_setupViewControllerBasedNavigationBarAppearanceIfNeeded<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:233"]
  S24 -->|calls| T24
  S25["method:UINavigationController::fd_pushViewController:animated:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:207"]
  T25["method:UINavigationController::fd_pushViewController:animated:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:207"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
