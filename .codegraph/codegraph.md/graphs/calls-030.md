# `calls 符号关系 - 030`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABBaseComponent::cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:440"]
  T1["method:TABBaseComponent::result_cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:452"]
  S1 -->|calls| T1
  S2["method:TABBaseComponent::preview_cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:448"]
  T2["method:TABBaseComponent::result_cancelAlignCenter<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:452"]
  S2 -->|calls| T2
  S3["method:TABBaseComponent::_leftEqualWithIndex:offset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:796"]
  T3["method:TABBaseComponent::_updateWidth<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:886"]
  S3 -->|calls| T3
  S4["method:TABBaseComponent::_rightEqualWithIndex:offset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:813"]
  T4["method:TABBaseComponent::_updateWidth<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:886"]
  S4 -->|calls| T4
  S5["method:TABBaseComponent::_topEqualWithIndex:offset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:834"]
  T5["method:TABBaseComponent::_updateHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:896"]
  S5 -->|calls| T5
  S6["method:TABBaseComponent::_bottomEqualWithIndex:offset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:851"]
  T6["method:TABBaseComponent::_updateHeight<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:896"]
  S6 -->|calls| T6
  S7["method:TABComponentManager::managerWithBackgroundLayer:layers:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:27"]
  T7["method:TABComponentManager::initWithBackgroundLayer:layers:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:34"]
  S7 -->|calls| T7
  S8["method:TABComponentManager::initWithBackgroundLayer:layers:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:34"]
  T8["method:TABBinAnimation::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Animation/Bin/TABBinAnimation.m:12"]
  S8 -->|calls| T8
  S9["method:TABComponentManager::initWithBackgroundLayer:layers:animatedColor:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:34"]
  T9["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S9 -->|calls| T9
  S10["method:TABComponentManager::animationN<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:56"]
  T10["method:TABComponentManager::animationWithName<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:60"]
  S10 -->|calls| T10
  S11["method:TABComponentManager::animation<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:74"]
  T11["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S11 -->|calls| T11
  S12["method:TABComponentManager::animations<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:88"]
  T12["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S12 -->|calls| T12
  S13["method:TABComponentManager::animationsWithIndexs<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:111"]
  T13["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S13 -->|calls| T13
  S14["method:TABComponentManager::create<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentManager.m:144"]
  T14["function:TABAnimationMethod::tab_NSStringFromIndex<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABAnimationMethod.m:12"]
  S14 -->|calls| T14
  S15["method:TABComponentMutableKey::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentMutableKey.m:12"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:TABComponentMutableKey::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABComponentMutableKey.m:12"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:TABAnimatedDarkModeManagerImpl::addDarkModelSentryView<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:39"]
  T17["method:TABAnimatedDarkModeManagerImpl::_traitCollectionDidChange<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:68"]
  S17 -->|calls| T17
  S18["method:TABAnimatedDarkModeManagerImpl::destroy<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:54"]
  T18["method:TABWeakDelegateManager::removeAllDelegates<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Util/TABWeakDelegateManager.m:49"]
  S18 -->|calls| T18
  S19["method:TABAnimatedDarkModeManagerImpl::_traitCollectionDidChangeWithTargetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:75"]
  T19["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S19 -->|calls| T19
  S20["method:TABAnimatedDarkModeManagerImpl::_traitCollectionDidChangeWithTargetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:75"]
  T20["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S20 -->|calls| T20
  S21["method:TABAnimatedDarkModeManagerImpl::_traitCollectionDidChangeWithTargetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABAnimatedDarkModeManagerImpl.m:75"]
  T21["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S21 -->|calls| T21
  S22["method:TABSentryView::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABSentryView.m:12"]
  T22["method:TABSentryView::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/DarkMode/TABSentryView.m:12"]
  S22 -->|calls| T22
  S23["method:TABAnimatedProductHelper::fullDataAndStartNestAnimation:isHidden:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:59"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:TABAnimatedProductHelper::fullDataAndStartNestAnimation:isHidden:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:59"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:TABAnimatedProductHelper::fullDataAndStartNestAnimation:isHidden:superView:rootView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:59"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
