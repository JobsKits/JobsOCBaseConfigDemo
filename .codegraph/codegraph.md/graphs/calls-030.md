# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABBaseComponent::preview_toLongAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABBaseComponent+TABClassicAnimation.m:22"]
  T1["method:TABBaseComponent::result_toLongAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABBaseComponent+TABClassicAnimation.m:26"]
  S1 -->|calls| T1
  S2["method:TABBaseComponent::toShortAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABBaseComponent+TABClassicAnimation.m:32"]
  T2["method:TABBaseComponent::result_toShortAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABBaseComponent+TABClassicAnimation.m:43"]
  S2 -->|calls| T2
  S3["method:TABBaseComponent::preview_toShortAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABBaseComponent+TABClassicAnimation.m:39"]
  T3["method:TABBaseComponent::result_toShortAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABBaseComponent+TABClassicAnimation.m:43"]
  S3 -->|calls| T3
  S4["method:TABClassicAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimation.m:12"]
  T4["method:TABClassicAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimation.m:12"]
  S4 -->|calls| T4
  S5["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T5["method:TABClassicAnimationImpl::scaleXAnimationDuration:toValue:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:30"]
  S5 -->|calls| T5
  S6["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T6["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S6 -->|calls| T6
  S7["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T7["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S7 -->|calls| T7
  S8["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T8["method:TABClassicAnimationImpl::scaleXAnimationDuration:toValue:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:30"]
  S8 -->|calls| T8
  S9["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T9["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S9 -->|calls| T9
  S10["method:TABClassicAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Classic/TABClassicAnimationImpl.m:16"]
  T10["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S10 -->|calls| T10
  S11["method:NSArray::dropIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/NSArray+TABDropAnimation.m:17"]
  T11["method:TABBaseComponent::dropIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:13"]
  S11 -->|calls| T11
  S12["method:NSArray::dropFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/NSArray+TABDropAnimation.m:26"]
  T12["method:TABBaseComponent::dropFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:30"]
  S12 -->|calls| T12
  S13["method:NSArray::dropStayTime<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/NSArray+TABDropAnimation.m:35"]
  T13["method:TABBaseComponent::dropStayTime<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:64"]
  S13 -->|calls| T13
  S14["method:NSArray::removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/NSArray+TABDropAnimation.m:44"]
  T14["method:TABBaseComponent::withoutAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:477"]
  S14 -->|calls| T14
  S15["method:TABBaseComponent::removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:47"]
  T15["method:TABBaseComponent::result_removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:58"]
  S15 -->|calls| T15
  S16["method:TABBaseComponent::preview_removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:54"]
  T16["method:TABBaseComponent::result_removeOnDrop<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABBaseComponent+TABDropAnimation.m:58"]
  S16 -->|calls| T16
  S17["method:TABDropAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimation.m:13"]
  T17["method:TABDropAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimation.m:13"]
  S17 -->|calls| T17
  S18["method:TABDropAnimationImpl::initWithAnimation:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:26"]
  T18["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  S18 -->|calls| T18
  S19["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  T19["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  S19 -->|calls| T19
  S20["method:TABDropAnimationImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:33"]
  T20["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S20 -->|calls| T20
  S21["method:TABDropAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:42"]
  T21["method:TABDropAnimationImpl::_addDropAnimation:index:duration:count:stayTime:deepColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:192"]
  S21 -->|calls| T21
  S22["method:TABDropAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:42"]
  T22["method:TABDropAnimationImpl::_addDropAnimation:index:duration:count:stayTime:deepColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:192"]
  S22 -->|calls| T22
  S23["method:TABDropAnimationImpl::dropAnimation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Drop/TABDropAnimationImpl.m:216"]
  T23["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S23 -->|calls| T23
  S24["method:TABShimmerAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimation.m:12"]
  T24["method:TABShimmerAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimation.m:12"]
  S24 -->|calls| T24
  S25["method:TABShimmerAnimationImpl::addAnimationWithTraitCollection:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:19"]
  T25["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
