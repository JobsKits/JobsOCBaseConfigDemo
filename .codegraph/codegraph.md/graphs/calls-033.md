# `calls 符号关系 - 033`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABAnimatedChainManagerImpl::chainAdjustWithBackgroundLayer:layers:adjustWithClassBlock:targetClass:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABAnimatedChainManagerImpl.m:24"]
  T1["property:TABViewAnimated::adjustWithClassBlock<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.h:47"]
  S1 -->|calls| T1
  S2["method:TABBaseComponent::componentWithLayer:manager:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:29"]
  T2["method:TABBaseComponent::initWithLayer:manager:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:33"]
  S2 -->|calls| T2
  S3["method:TABBaseComponent::initWithLayer:manager:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:33"]
  T3["method:TABBinAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Bin/TABBinAnimation.m:12"]
  S3 -->|calls| T3
  S4["method:TABBaseComponent::reducedWidth_vertical<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:227"]
  T4["method:TABBaseComponent::reducedWidth_vertical<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:227"]
  S4 -->|calls| T4
  S5["method:TABBaseComponent::remove<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:403"]
  T5["method:TABBaseComponent::result_remove<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:415"]
  S5 -->|calls| T5
  S6["method:TABBaseComponent::preview_remove<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:411"]
  T6["method:TABBaseComponent::result_remove<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:415"]
  S6 -->|calls| T6
  S7["method:TABBaseComponent::cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:440"]
  T7["method:TABBaseComponent::result_cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:452"]
  S7 -->|calls| T7
  S8["method:TABBaseComponent::preview_cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:448"]
  T8["method:TABBaseComponent::result_cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:452"]
  S8 -->|calls| T8
  S9["method:TABBaseComponent::_leftEqualWithIndex:offset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:796"]
  T9["method:TABBaseComponent::_updateWidth<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:886"]
  S9 -->|calls| T9
  S10["method:TABBaseComponent::_rightEqualWithIndex:offset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:813"]
  T10["method:TABBaseComponent::_updateWidth<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:886"]
  S10 -->|calls| T10
  S11["method:TABBaseComponent::_topEqualWithIndex:offset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:834"]
  T11["method:TABBaseComponent::_updateHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:896"]
  S11 -->|calls| T11
  S12["method:TABBaseComponent::_bottomEqualWithIndex:offset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:851"]
  T12["method:TABBaseComponent::_updateHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:896"]
  S12 -->|calls| T12
  S13["method:TABComponentManager::managerWithBackgroundLayer:layers:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:27"]
  T13["method:TABComponentManager::initWithBackgroundLayer:layers:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:34"]
  S13 -->|calls| T13
  S14["method:TABComponentManager::initWithBackgroundLayer:layers:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:34"]
  T14["method:TABBinAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Bin/TABBinAnimation.m:12"]
  S14 -->|calls| T14
  S15["method:TABComponentManager::initWithBackgroundLayer:layers:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:34"]
  T15["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S15 -->|calls| T15
  S16["method:TABComponentManager::animationN<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:56"]
  T16["method:TABComponentManager::animationWithName<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:60"]
  S16 -->|calls| T16
  S17["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  T17["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S17 -->|calls| T17
  S18["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  T18["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S18 -->|calls| T18
  S19["method:TABComponentManager::animationsWithIndexs<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:111"]
  T19["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S19 -->|calls| T19
  S20["method:TABComponentManager::create<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:144"]
  T20["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S20 -->|calls| T20
  S21["method:TABComponentMutableKey::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentMutableKey.m:12"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:TABComponentMutableKey::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentMutableKey.m:12"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:TABAnimatedDarkModeManagerImpl::addDarkModelSentryView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:39"]
  T23["method:TABAnimatedDarkModeManagerImpl::_traitCollectionDidChange<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:68"]
  S23 -->|calls| T23
  S24["method:TABAnimatedDarkModeManagerImpl::destroy<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:54"]
  T24["method:TABWeakDelegateManager::removeAllDelegates<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:49"]
  S24 -->|calls| T24
  S25["method:TABAnimatedDarkModeManagerImpl::_traitCollectionDidChangeWithTargetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:75"]
  T25["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
