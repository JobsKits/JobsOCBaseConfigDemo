# `calls 符号关系 - 031`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABDropAnimationImpl::dropAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:216"]
  T1["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S1 -->|calls| T1
  S2["method:TABShimmerAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimation.m:12"]
  T2["method:TABShimmerAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimation.m:12"]
  S2 -->|calls| T2
  S3["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T3["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S3 -->|calls| T3
  S4["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T4["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S4 -->|calls| T4
  S5["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T5["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S5 -->|calls| T5
  S6["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T6["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S6 -->|calls| T6
  S7["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T7["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S7 -->|calls| T7
  S8["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T8["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S8 -->|calls| T8
  S9["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T9["method:TABShimmerAnimationImpl::_brightenedColor:brightness:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:104"]
  S9 -->|calls| T9
  S10["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T10["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  S10 -->|calls| T10
  S11["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T11["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  S11 -->|calls| T11
  S12["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T12["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S12 -->|calls| T12
  S13["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T13["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S13 -->|calls| T13
  S14["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T14["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S14 -->|calls| T14
  S15["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T15["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S15 -->|calls| T15
  S16["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T16["method:TABShimmerAnimationImpl::_brightenedColor:brightness:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:104"]
  S16 -->|calls| T16
  S17["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  T17["method:TABShimmerAnimationImpl::_addShimmerAnimationToLayer:duration:direction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:110"]
  S17 -->|calls| T17
  S18["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  T18["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S18 -->|calls| T18
  S19["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  T19["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S19 -->|calls| T19
  S20["method:TABShimmerAnimationImpl::_addShimmerAnimationToLayer:duration:direction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:110"]
  T20["function:TABShimmerAnimationImpl::_transitionMaker<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:132"]
  S20 -->|calls| T20
  S21["method:TABShimmerAnimationImpl::_addShimmerAnimationToLayer:duration:direction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:110"]
  T21["function:TABShimmerAnimationImpl::_transitionMaker<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:132"]
  S21 -->|calls| T21
  S22["method:TABShimmerAnimationImpl::_addShimmerAnimationToLayer:duration:direction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:110"]
  T22["method:TABBinAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Bin/TABBinAnimation.m:12"]
  S22 -->|calls| T22
  S23["method:TABAnimationManagerImpl::setControlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:27"]
  T23["method:TABAnimationManagerImpl::_bindDecorater<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:32"]
  S23 -->|calls| T23
  S24["method:TABAnimationManagerImpl::_bindDecorater<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:32"]
  T24["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S24 -->|calls| T24
  S25["method:TABAnimationManagerImpl::_bindDecorater<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:32"]
  T25["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
