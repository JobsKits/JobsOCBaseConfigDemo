# `calls 符号关系 - 047`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ZFCustomControlView::playPauseButtonClickAction:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:127"]
  T1["method:ZFCustomControlView::playOrPause<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:135"]
  S1 -->|calls| T1
  S2["method:ZFCustomControlView::layoutSubviews<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:144"]
  T2["method:ZFCustomControlView::layoutSubviews<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:144"]
  S2 -->|calls| T2
  S3["method:ZFCustomControlView::autoFadeOutControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:265"]
  T3["method:ZFCustomControlView::cancelAutoFadeOutControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:276"]
  S3 -->|calls| T3
  S4["method:ZFCustomControlView::hideControlViewWithAnimated:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:283"]
  T4["method:ZFCustomControlView::hideControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:255"]
  S4 -->|calls| T4
  S5["method:ZFCustomControlView::showControlViewWithAnimated:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:293"]
  T5["method:ZFCustomControlView::autoFadeOutControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:265"]
  S5 -->|calls| T5
  S6["method:ZFCustomControlView::showControlViewWithAnimated:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:293"]
  T6["method:ZFCustomControlView::showControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:245"]
  S6 -->|calls| T6
  S7["method:ZFCustomControlView::showTitle:coverURLString:fullScreenMode:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:319"]
  T7["method:ZFCustomControlView::resetControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:234"]
  S7 -->|calls| T7
  S8["method:ZFCustomControlView::showTitle:coverURLString:fullScreenMode:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:319"]
  T8["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S8 -->|calls| T8
  S9["method:ZFCustomControlView::gestureTriggerCondition:gestureType:gestureRecognizer:touch:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:357"]
  T9["method:ZFCustomControlView::shouldResponseGestureWithPoint:withGestureType:touch:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:304"]
  S9 -->|calls| T9
  S10["method:ZFCustomControlView::gestureDoubleTapped:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:386"]
  T10["method:ZFCustomControlView::playOrPause<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:135"]
  S10 -->|calls| T10
  S11["method:ZFCustomControlView::videoPlayer:orientationWillChange:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:465"]
  T11["method:ZFCustomControlView::cancelAutoFadeOutControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:276"]
  S11 -->|calls| T11
  S12["method:ZFCustomControlView::videoPlayer:orientationDidChanged:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:480"]
  T12["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S12 -->|calls| T12
  S13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  T14["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsClass::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:277"]
  T15["method:JobsPodspecKitForJobsClass::standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:266"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsClass::apply_standard_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsClass::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:273"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsClass::apply_standard_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsClass::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:277"]
  S17 -->|calls| T17
  S18["method:JobsClockView::dealloc<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:30"]
  T18["method:JobsClockView::stop<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:256"]
  S18 -->|calls| T18
  S19["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  T19["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  S19 -->|calls| T19
  S20["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  T20["method:JobsClockView::setupDialLayers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:45"]
  S20 -->|calls| T20
  S21["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  T21["method:JobsClockView::setupNumberLabels<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:76"]
  S21 -->|calls| T21
  S22["method:JobsClockView::init<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:34"]
  T22["method:JobsClockView::setupHandLayers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:94"]
  S22 -->|calls| T22
  S23["method:JobsClockView::setupNumberLabels<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:76"]
  T23["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S23 -->|calls| T23
  S24["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  T24["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  S24 -->|calls| T24
  S25["method:JobsClockView::layoutSubviews<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:115"]
  T25["method:JobsClockView::layoutDialAndNumbers<br/>JobsByPods/JobsClockView@Pods/Core/JobsClockView.m:123"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
