# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABAnimatedProductHelper::canProduct:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:142"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:TABAnimatedProductHelper::canProduct:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:142"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:TABAnimatedProductHelper::canProduct:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:142"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:TABAnimatedProductHelper::canProduct:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:142"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:TABAnimatedProductHelper::canProduct:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:142"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:TABAnimatedProductHelper::bindView:production:animatedHeight:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:180"]
  T6["method:TABAnimatedProductHelper::penetrateTargetLayer:path:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:321"]
  S6 -->|calls| T6
  S7["method:TABAnimatedProductHelper::getBackgroundLayerWithView:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:221"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:TABAnimatedProductHelper::getBackgroundLayerWithView:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:221"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["method:TABAnimatedProductHelper::getBackgroundLayerWithView:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:221"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:TABAnimatedProductHelper::getBackgroundLayerWithView:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:221"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:TABAnimatedProductHelper::addTagWithComponentLayer:isLines:needFrame:superLayer:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:260"]
  T11["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S11 -->|calls| T11
  S12["method:TABAnimatedProductHelper::getKeyWithControllerName:targetClass:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:292"]
  T12["function:TABViewAnimated::tab_NSStringFromClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:18"]
  S12 -->|calls| T12
  S13["method:TABAnimatedProductHelper::penerateIndexArray:production:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:309"]
  T13["method:TABAnimatedProductHelper::penetrateTargetLayer:path:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductHelper.m:321"]
  S13 -->|calls| T13
  S14["method:TABAnimatedProductImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:61"]
  T14["method:TABAnimatedProductImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:61"]
  S14 -->|calls| T14
  S15["method:TABAnimatedProductImpl::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:61"]
  T15["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S15 -->|calls| T15
  S16["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T16["function:TABViewAnimated::tab_NSStringFromClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:18"]
  S16 -->|calls| T16
  S17["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T17["method:TABAnimatedCacheManager::getProductionWithKey:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:147"]
  S17 -->|calls| T17
  S18["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T18["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S18 -->|calls| T18
  S19["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T19["method:TABAnimatedProductImpl::_reuseWithCurrentClass:indexPath:origin:className:production:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:190"]
  S19 -->|calls| T19
  S20["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T20["method:TABAnimatedProductImpl::_createViewWithOrigin:controlView:indexPath:className:currentClass:isNeedProduct:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:201"]
  S20 -->|calls| T20
  S21["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T21["method:TABAnimatedProductImpl::_prepareProductWithView:currentClass:indexPath:origin:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:177"]
  S21 -->|calls| T21
  S22["method:TABAnimatedProductImpl::productWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:100"]
  T22["method:TABAnimatedCacheManager::getProductionWithKey:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:147"]
  S22 -->|calls| T22
  S23["method:TABAnimatedProductImpl::productWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:100"]
  T23["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S23 -->|calls| T23
  S24["method:TABAnimatedProductImpl::productWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:100"]
  T24["method:TABAnimatedProductImpl::_bindWithProduction:targetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:589"]
  S24 -->|calls| T24
  S25["method:TABAnimatedProductImpl::productWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:100"]
  T25["method:TABAnimatedProductImpl::_prepareProductWithView:currentClass:indexPath:origin:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:177"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
