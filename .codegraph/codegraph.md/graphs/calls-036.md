# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABBaseComponent::preview_toShortAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABBaseComponent+TABClassicAnimation.m:39"]
  T1["method:TABBaseComponent::result_toShortAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABBaseComponent+TABClassicAnimation.m:43"]
  S1 -->|calls| T1
  S2["method:TABClassicAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimation.m:12"]
  T2["method:TABClassicAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimation.m:12"]
  S2 -->|calls| T2
  S3["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T3["method:TABClassicAnimationImpl::scaleXAnimationDuration:toValue:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:30"]
  S3 -->|calls| T3
  S4["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T4["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S4 -->|calls| T4
  S5["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T5["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S5 -->|calls| T5
  S6["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T6["method:TABClassicAnimationImpl::scaleXAnimationDuration:toValue:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:30"]
  S6 -->|calls| T6
  S7["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T7["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S7 -->|calls| T7
  S8["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T8["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S8 -->|calls| T8
  S9["method:NSArray::dropIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/NSArray+TABDropAnimation.m:17"]
  T9["method:TABBaseComponent::dropIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:13"]
  S9 -->|calls| T9
  S10["method:NSArray::dropFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/NSArray+TABDropAnimation.m:26"]
  T10["method:TABBaseComponent::dropFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:30"]
  S10 -->|calls| T10
  S11["method:NSArray::dropStayTime<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/NSArray+TABDropAnimation.m:35"]
  T11["method:TABBaseComponent::dropStayTime<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:64"]
  S11 -->|calls| T11
  S12["method:NSArray::removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/NSArray+TABDropAnimation.m:44"]
  T12["method:TABBaseComponent::withoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:477"]
  S12 -->|calls| T12
  S13["method:TABBaseComponent::removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:47"]
  T13["method:TABBaseComponent::result_removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:58"]
  S13 -->|calls| T13
  S14["method:TABBaseComponent::preview_removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:54"]
  T14["method:TABBaseComponent::result_removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:58"]
  S14 -->|calls| T14
  S15["method:TABDropAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimation.m:13"]
  T15["method:TABDropAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimation.m:13"]
  S15 -->|calls| T15
  S16["method:TABDropAnimationImpl::initWithAnimation:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:26"]
  T16["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  S16 -->|calls| T16
  S17["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  T17["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  S17 -->|calls| T17
  S18["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  T18["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S18 -->|calls| T18
  S19["method:TABDropAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:42"]
  T19["method:TABDropAnimationImpl::_addDropAnimation:index:duration:count:stayTime:deepColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:192"]
  S19 -->|calls| T19
  S20["method:TABDropAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:42"]
  T20["method:TABDropAnimationImpl::_addDropAnimation:index:duration:count:stayTime:deepColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:192"]
  S20 -->|calls| T20
  S21["method:TABDropAnimationImpl::dropAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:216"]
  T21["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S21 -->|calls| T21
  S22["method:TABShimmerAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimation.m:12"]
  T22["method:TABShimmerAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimation.m:12"]
  S22 -->|calls| T22
  S23["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T23["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S23 -->|calls| T23
  S24["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T24["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S24 -->|calls| T24
  S25["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T25["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
