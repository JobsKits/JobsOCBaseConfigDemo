# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABBaseComponent::removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:47"]
  T1["method:TABBaseComponent::result_removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:58"]
  S1 -->|calls| T1
  S2["method:TABBaseComponent::preview_removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:54"]
  T2["method:TABBaseComponent::result_removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:58"]
  S2 -->|calls| T2
  S3["method:TABDropAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimation.m:13"]
  T3["method:TABDropAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimation.m:13"]
  S3 -->|calls| T3
  S4["method:TABDropAnimationImpl::initWithAnimation:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:26"]
  T4["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  S4 -->|calls| T4
  S5["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  T5["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  S5 -->|calls| T5
  S6["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  T6["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S6 -->|calls| T6
  S7["method:TABDropAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:42"]
  T7["method:TABDropAnimationImpl::_addDropAnimation:index:duration:count:stayTime:deepColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:192"]
  S7 -->|calls| T7
  S8["method:TABDropAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:42"]
  T8["method:TABDropAnimationImpl::_addDropAnimation:index:duration:count:stayTime:deepColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:192"]
  S8 -->|calls| T8
  S9["method:TABDropAnimationImpl::dropAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:216"]
  T9["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S9 -->|calls| T9
  S10["method:TABShimmerAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimation.m:12"]
  T10["method:TABShimmerAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimation.m:12"]
  S10 -->|calls| T10
  S11["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T11["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S11 -->|calls| T11
  S12["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T12["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S12 -->|calls| T12
  S13["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T13["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S13 -->|calls| T13
  S14["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T14["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S14 -->|calls| T14
  S15["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T15["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S15 -->|calls| T15
  S16["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T16["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S16 -->|calls| T16
  S17["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T17["method:TABShimmerAnimationImpl::_brightenedColor:brightness:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:104"]
  S17 -->|calls| T17
  S18["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T18["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  S18 -->|calls| T18
  S19["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T19["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  S19 -->|calls| T19
  S20["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T20["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S20 -->|calls| T20
  S21["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T21["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S21 -->|calls| T21
  S22["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T22["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S22 -->|calls| T22
  S23["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T23["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S23 -->|calls| T23
  S24["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T24["method:TABShimmerAnimationImpl::_brightenedColor:brightness:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:104"]
  S24 -->|calls| T24
  S25["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  T25["method:TABShimmerAnimationImpl::_addShimmerAnimationToLayer:duration:direction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:110"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
