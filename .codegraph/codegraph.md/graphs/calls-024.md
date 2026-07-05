# `calls 符号关系 - 024`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABViewAnimated::getCurrentAnimatedBackgroundColorWithCollection:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:79"]
  T1["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S1 -->|calls| T1
  S2["method:TABViewAnimated::_initSeriaSlizationImpl<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:96"]
  T2["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S2 -->|calls| T2
  S3["method:TABViewAnimated::setSuperAnimationType:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:117"]
  T3["method:TABViewAnimated::_initSeriaSlizationImpl<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:96"]
  S3 -->|calls| T3
  S4["method:TABViewAnimated::animatedHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:122"]
  T4["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S4 -->|calls| T4
  S5["method:TABViewAnimated::animatedColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:129"]
  T5["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S5 -->|calls| T5
  S6["method:TABViewAnimated::animatedBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:136"]
  T6["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S6 -->|calls| T6
  S7["method:TABViewAnimated::darkAnimatedColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:143"]
  T7["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S7 -->|calls| T7
  S8["method:TABViewAnimated::darkAnimatedBackgroundColor<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:150"]
  T8["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S8 -->|calls| T8
  S9["method:UICollectionView::tab_startAnimationWithConfigBlock:adjustBlock:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UICollectionView+TABControlAnimation.m:15"]
  T9["method:UIView::tab_startAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:36"]
  S9 -->|calls| T9
  S10["method:UITableView::tab_startAnimationWithConfigBlock:adjustBlock:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UITableView+TABControlAnimation.m:15"]
  T10["method:UIView::tab_startAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:36"]
  S10 -->|calls| T10
  S11["method:UIView::tab_startAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:36"]
  T11["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  S11 -->|calls| T11
  S12["method:UIView::tab_startAnimationWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:40"]
  T12["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  S12 -->|calls| T12
  S13["method:UIView::tab_startAnimationWithDelayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:44"]
  T13["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  S13 -->|calls| T13
  S14["method:UIView::tab_startAnimationWithIndex:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:49"]
  T14["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  S14 -->|calls| T14
  S15["method:UIView::tab_startAnimationWithIndex:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:53"]
  T15["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  S15 -->|calls| T15
  S16["method:UIView::tab_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:58"]
  T16["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  S16 -->|calls| T16
  S17["method:UIView::tab_startAnimationWithConfigBlock:adjustBlock:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:66"]
  T17["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  S17 -->|calls| T17
  S18["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  T18["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIView/UIView+TFPopup/UIView+TFPopup.h:170"]
  S18 -->|calls| T18
  S19["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:UIView::_startAnimationWithIndex:delayTime:completion:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/UIView+TABControlAnimation.m:83"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
