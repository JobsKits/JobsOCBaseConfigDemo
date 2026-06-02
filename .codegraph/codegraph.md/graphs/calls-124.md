# `calls 符号关系 - 124`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsGestureLockConfiguration::copyWithZone:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:37"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:JobsGestureLockIndicator::initWithConfiguration:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockIndicator/JobsGestureLockIndicator.m:27"]
  T2["method:JobsGestureLockConfiguration::defaultConfiguration<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:13"]
  S2 -->|calls| T2
  S3["method:JobsGestureLockIndicator::initWithConfiguration:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockIndicator/JobsGestureLockIndicator.m:27"]
  T3["method:JobsGestureLockIndicator::buildSubviews<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockIndicator/JobsGestureLockIndicator.m:37"]
  S3 -->|calls| T3
  S4["method:JobsGestureLockIndicator::buildSubviews<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockIndicator/JobsGestureLockIndicator.m:37"]
  T4["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S4 -->|calls| T4
  S5["method:JobsGestureLockIndicator::layoutSubviews<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockIndicator/JobsGestureLockIndicator.m:48"]
  T5["method:JobsGestureLockIndicator::layoutSubviews<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockIndicator/JobsGestureLockIndicator.m:48"]
  S5 -->|calls| T5
  S6["method:JobsGestureLockResource::resourceBundle<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:12"]
  T6["method:NSObject::mainBundle<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:13"]
  S6 -->|calls| T6
  S7["method:JobsGestureLockResource::imageNamed:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:29"]
  T7["method:JobsGestureLockResource::resourceBundle<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockResource/JobsGestureLockResource.m:12"]
  S7 -->|calls| T7
  S8["method:JobsGestureLockStorage::saveGesturePassword:forKey:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockStorage/JobsGestureLockStorage.m:16"]
  T8["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S8 -->|calls| T8
  S9["method:JobsGestureLockView::initWithConfiguration:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:30"]
  T9["method:JobsGestureLockConfiguration::defaultConfiguration<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:13"]
  S9 -->|calls| T9
  S10["method:JobsGestureLockView::initWithConfiguration:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:30"]
  T10["method:JobsGestureLockView::buildSubviews<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:42"]
  S10 -->|calls| T10
  S11["method:JobsGestureLockView::buildSubviews<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:42"]
  T11["method:UIView::addGestureRecognizer<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:149"]
  S11 -->|calls| T11
  S12["method:JobsGestureLockView::buildSubviews<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:42"]
  T12["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S12 -->|calls| T12
  S13["method:JobsGestureLockView::layoutSubviews<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:56"]
  T13["method:JobsGestureLockView::layoutSubviews<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:56"]
  S13 -->|calls| T13
  S14["method:JobsGestureLockView::handlePan:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:111"]
  T14["method:JobsGestureLockView::restoreErrorButtonsIfNeeded<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:144"]
  S14 -->|calls| T14
  S15["method:JobsGestureLockView::handlePan:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:111"]
  T15["method:JobsGestureLockView::currentPattern<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:136"]
  S15 -->|calls| T15
  S16["method:JobsGestureLockView::handlePan:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:111"]
  T16["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S16 -->|calls| T16
  S17["method:JobsGestureLockView::currentPattern<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:136"]
  T17["method:NSArray::string<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:37"]
  S17 -->|calls| T17
  S18["method:JobsGestureLockView::reset<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:153"]
  T18["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S18 -->|calls| T18
  S19["method:JobsGestureLockView::showValidationResult:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockView/JobsGestureLockView.m:164"]
  T19["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
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
