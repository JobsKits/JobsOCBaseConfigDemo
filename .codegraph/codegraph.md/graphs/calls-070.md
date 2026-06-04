# `calls 符号关系 - 070`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:XLBubbleTransition::showBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:40"]
  T1["method:XLBubbleTransition::radiusOfBubbleInView:startPoint:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:158"]
  S1 -->|calls| T1
  S2["method:XLBubbleTransition::hideBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:100"]
  T2["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S2 -->|calls| T2
  S3["method:XLBubbleTransition::hideBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:100"]
  T3["method:UIView::addSubview<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIView/UIView+Extra/UIView+Extra.m:18"]
  S3 -->|calls| T3
  S4["method:XLBubbleTransition::hideBubbleMaskAnimationTo:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:100"]
  T4["method:XLBubbleTransition::radiusOfBubbleInView:startPoint:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+3rd/UIViewController+XLBubbleTransition/XLBubbleTransition.m:158"]
  S4 -->|calls| T4
  S5["method:UIViewController::navCtrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Extra/UIViewController+Extra.m:32"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIViewController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:12"]
  T6["method:UIViewController::exchangeMethod<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:34"]
  S6 -->|calls| T6
  S7["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T7["method:NSPointerArray::pointerByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T8["method:NSMutableSet::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:25"]
  S8 -->|calls| T8
  S9["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T9["method:NSMutableSet::add<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSMutableSet/NSMutableSet+Extra/NSMutableSet+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T11["method:NSPointerArray::removePointerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:29"]
  S11 -->|calls| T11
  S12["method:UIViewController::my_viewDidDisappear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:74"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  T13["method:NSPointerArray::pointerByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  T14["method:NSPointerArray::removePointerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:29"]
  S14 -->|calls| T14
  S15["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  T15["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  S15 -->|calls| T15
  S16["method:UIViewController::invokeWhenViewDidLoadUsingSysFunc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Shake/UIViewController+Shake.m:12"]
  T16["method:JobsMagicTextField::becomeFirstResponder<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextField/JobsMagicTextField/JobsMagicTextField.m:41"]
  S16 -->|calls| T16
  S17["function:UIViewController::^(NSNotification * _Nonnull notification)<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Shake/UIViewController+Shake.m:54"]
  T17["method:UIViewController::startAccelerometer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Shake/UIViewController+Shake.m:68"]
  S17 -->|calls| T17
  S18["method:UIViewController::stopAccelerometerWhenViewDidDisappear<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Shake/UIViewController+Shake.m:82"]
  T18["method:NSNotificationCenter::Remove<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNotificationCenter/NSNotificationCenter+JobsBlock/NSNotificationCenter+JobsBlock.m:18"]
  S18 -->|calls| T18
  S19["method:UIViewController::stopAccelerometerWhenViewDidDisappear<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Shake/UIViewController+Shake.m:82"]
  T19["method:NSNotificationCenter::Remove<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSNotificationCenter/NSNotificationCenter+JobsBlock/NSNotificationCenter+JobsBlock.m:18"]
  S19 -->|calls| T19
  S20["function:jobsMakeWKWebViewByConfig<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.h:47"]
  T20["method:WKWebView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:CustomZFPlayerControlView::gestureSingleTapped:<br/>JobsByPods/JobsByOCPods@Pods/Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.m:18"]
  T21["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S21 -->|calls| T21
  S22["method:CustomZFPlayerControlView::gestureDoubleTapped:<br/>JobsByPods/JobsByOCPods@Pods/Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.m:23"]
  T22["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S22 -->|calls| T22
  S23["method:ZFCustomControlView::initWithFrame:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:47"]
  T23["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S23 -->|calls| T23
  S24["method:ZFCustomControlView::initWithFrame:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:47"]
  T24["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S24 -->|calls| T24
  S25["method:ZFCustomControlView::initWithFrame:<br/>JobsByPods/JobsByOCPods@Pods/Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.m:47"]
  T25["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
