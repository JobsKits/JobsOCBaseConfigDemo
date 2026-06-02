# `calls 符号关系 - 093`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ZFCustomControlView::hideControlViewWithAnimated:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:283"]
  T1["method:ZFCustomControlView::hideControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:255"]
  S1 -->|calls| T1
  S2["method:ZFCustomControlView::showControlViewWithAnimated:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:293"]
  T2["method:ZFCustomControlView::autoFadeOutControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:265"]
  S2 -->|calls| T2
  S3["method:ZFCustomControlView::showControlViewWithAnimated:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:293"]
  T3["method:ZFCustomControlView::showControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:245"]
  S3 -->|calls| T3
  S4["method:ZFCustomControlView::showTitle:coverURLString:fullScreenMode:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:319"]
  T4["method:ZFCustomControlView::resetControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:234"]
  S4 -->|calls| T4
  S5["method:ZFCustomControlView::showTitle:coverURLString:fullScreenMode:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:319"]
  T5["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S5 -->|calls| T5
  S6["method:ZFCustomControlView::showTitle:coverURLString:fullScreenMode:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:319"]
  T6["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S6 -->|calls| T6
  S7["method:ZFCustomControlView::gestureTriggerCondition:gestureType:gestureRecognizer:touch:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:357"]
  T7["method:ZFCustomControlView::shouldResponseGestureWithPoint:withGestureType:touch:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:304"]
  S7 -->|calls| T7
  S8["method:ZFCustomControlView::gestureDoubleTapped:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:386"]
  T8["method:ZFCustomControlView::playOrPause<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:135"]
  S8 -->|calls| T8
  S9["method:ZFCustomControlView::videoPlayer:orientationWillChange:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:465"]
  T9["method:ZFCustomControlView::cancelAutoFadeOutControlView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:276"]
  S9 -->|calls| T9
  S10["method:ZFCustomControlView::videoPlayer:orientationDidChanged:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:480"]
  T10["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:63"]
  S10 -->|calls| T10
  S11["method:ZFCustomControlView::videoPlayer:orientationDidChanged:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:480"]
  T11["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S11 -->|calls| T11
  S12["method:ZFCustomControlView::topToolView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:500"]
  T12["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S12 -->|calls| T12
  S13["method:ZFCustomControlView::titleLabel<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:508"]
  T13["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S13 -->|calls| T13
  S14["method:ZFCustomControlView::titleLabel<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:508"]
  T14["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S14 -->|calls| T14
  S15["method:ZFCustomControlView::bottomToolView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:517"]
  T15["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S15 -->|calls| T15
  S16["method:ZFCustomControlView::currentTimeLabel<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:535"]
  T16["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S16 -->|calls| T16
  S17["method:ZFCustomControlView::currentTimeLabel<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:535"]
  T17["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S17 -->|calls| T17
  S18["method:ZFCustomControlView::slider<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:545"]
  T18["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S18 -->|calls| T18
  S19["method:ZFCustomControlView::totalTimeLabel<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:564"]
  T19["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S19 -->|calls| T19
  S20["method:ZFCustomControlView::totalTimeLabel<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:564"]
  T20["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S20 -->|calls| T20
  S21["method:ZFCustomControlView::coverImageView<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:581"]
  T21["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S21 -->|calls| T21
  S22["method:ZFCustomControlView::bottomPgrogress<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:589"]
  T22["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S22 -->|calls| T22
  S23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  T24["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsClass::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:277"]
  T25["method:JobsPodspecKitForJobsClass::standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:266"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
