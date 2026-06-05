# `calls 符号关系 - 135`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T1["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S1 -->|calls| T1
  S2["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T2["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S2 -->|calls| T2
  S3["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T3["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S3 -->|calls| T3
  S4["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T4["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S4 -->|calls| T4
  S5["method:TABShimmerAnimationImpl::traitCollectionDidChange:tabAnimated:backgroundLayer:layers:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:57"]
  T5["method:TABShimmerAnimationImpl::_brightenedColor:brightness:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:104"]
  S5 -->|calls| T5
  S6["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  T6["method:TABShimmerAnimationImpl::_addShimmerAnimationToLayer:duration:direction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:110"]
  S6 -->|calls| T6
  S7["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  T7["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S7 -->|calls| T7
  S8["method:TABShimmerAnimationImpl::_addShimmerAnimationWithLayer:colors:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:95"]
  T8["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S8 -->|calls| T8
  S9["method:TABShimmerAnimationImpl::_addShimmerAnimationToLayer:duration:direction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:110"]
  T9["function:TABShimmerAnimationImpl::_transitionMaker<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:132"]
  S9 -->|calls| T9
  S10["method:TABShimmerAnimationImpl::_addShimmerAnimationToLayer:duration:direction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:110"]
  T10["function:TABShimmerAnimationImpl::_transitionMaker<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:132"]
  S10 -->|calls| T10
  S11["method:TABShimmerAnimationImpl::_addShimmerAnimationToLayer:duration:direction:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Shimmer/TABShimmerAnimationImpl.m:110"]
  T11["method:TABBinAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Bin/TABBinAnimation.m:12"]
  S11 -->|calls| T11
  S12["method:TABAnimationManagerImpl::setControlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:27"]
  T12["method:TABAnimationManagerImpl::_bindDecorater<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:32"]
  S12 -->|calls| T12
  S13["method:TABAnimationManagerImpl::_bindDecorater<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:32"]
  T13["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S13 -->|calls| T13
  S14["method:TABAnimationManagerImpl::_bindDecorater<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:32"]
  T14["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S14 -->|calls| T14
  S15["method:TABAnimationManagerImpl::_bindDecorater<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:32"]
  T15["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S15 -->|calls| T15
  S16["method:TABAnimationManagerImpl::_bindDecorater<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/TABAnimationManagerImpl.m:32"]
  T16["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S16 -->|calls| T16
  S17["method:NSArray::up<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:13"]
  T17["method:TABBaseComponent::up<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:85"]
  S17 -->|calls| T17
  S18["method:NSArray::down<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:22"]
  T18["method:TABBaseComponent::down<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:103"]
  S18 -->|calls| T18
  S19["method:NSArray::left<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:31"]
  T19["method:TABBaseComponent::left<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:49"]
  S19 -->|calls| T19
  S20["method:NSArray::right<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:40"]
  T20["method:TABBaseComponent::right<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:67"]
  S20 -->|calls| T20
  S21["method:NSArray::width<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:49"]
  T21["method:TABBaseComponent::width<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:121"]
  S21 -->|calls| T21
  S22["method:NSArray::height<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:58"]
  T22["method:TABBaseComponent::height<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:142"]
  S22 -->|calls| T22
  S23["method:NSArray::reducedWidth<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:67"]
  T23["method:TABBaseComponent::reducedWidth<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:184"]
  S23 -->|calls| T23
  S24["method:NSArray::reducedHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:76"]
  T24["method:TABBaseComponent::reducedHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:202"]
  S24 -->|calls| T24
  S25["method:NSArray::reducedRadius<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/NSArray+TABAnimatedChain.m:85"]
  T25["method:TABBaseComponent::reducedRadius<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:265"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
