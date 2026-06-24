# `calls 符号关系 - 036`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T1["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S1 -->|calls| T1
  S2["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T2["method:TABAnimatedProductImpl::_reuseWithCurrentClass:indexPath:origin:className:production:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:190"]
  S2 -->|calls| T2
  S3["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T3["method:TABAnimatedProductImpl::_createViewWithOrigin:controlView:indexPath:className:currentClass:isNeedProduct:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:201"]
  S3 -->|calls| T3
  S4["method:TABAnimatedProductImpl::productWithControlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:74"]
  T4["method:TABAnimatedProductImpl::_prepareProductWithView:currentClass:indexPath:origin:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:177"]
  S4 -->|calls| T4
  S5["method:TABAnimatedProductImpl::productWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:100"]
  T5["method:TABAnimatedCacheManager::getProductionWithKey:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:147"]
  S5 -->|calls| T5
  S6["method:TABAnimatedProductImpl::productWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:100"]
  T6["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S6 -->|calls| T6
  S7["method:TABAnimatedProductImpl::productWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:100"]
  T7["method:TABAnimatedProductImpl::_bindWithProduction:targetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:589"]
  S7 -->|calls| T7
  S8["method:TABAnimatedProductImpl::productWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:100"]
  T8["method:TABAnimatedProductImpl::_prepareProductWithView:currentClass:indexPath:origin:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:177"]
  S8 -->|calls| T8
  S9["method:TABAnimatedProductImpl::pullLoadingProductWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:128"]
  T9["method:TABAnimatedCacheManager::getProductionWithKey:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:147"]
  S9 -->|calls| T9
  S10["method:TABAnimatedProductImpl::pullLoadingProductWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:128"]
  T10["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S10 -->|calls| T10
  S11["method:TABAnimatedProductImpl::pullLoadingProductWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:128"]
  T11["method:TABAnimatedProductImpl::_bindWithProduction:targetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:589"]
  S11 -->|calls| T11
  S12["method:TABAnimatedProductImpl::pullLoadingProductWithView:controlView:currentClass:indexPath:origin:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:128"]
  T12["method:TABAnimatedProductImpl::_prepareProductWithView:currentClass:indexPath:origin:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:177"]
  S12 -->|calls| T12
  S13["method:TABAnimatedProductImpl::syncProductions<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:151"]
  T13["method:TABAnimatedProductImpl::_bindWithProduction:targetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:589"]
  S13 -->|calls| T13
  S14["method:TABAnimatedProductImpl::syncProductions<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:151"]
  T14["method:TABAnimatedProductImpl::_recoveryProductStatus<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:170"]
  S14 -->|calls| T14
  S15["method:TABAnimatedProductImpl::destory<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:163"]
  T15["method:TABAnimatedProductImpl::_recoveryProductStatus<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:170"]
  S15 -->|calls| T15
  S16["method:TABAnimatedProductImpl::_prepareProductWithView:currentClass:indexPath:origin:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:177"]
  T16["method:TABAnimatedProductImpl::_productBackgroundLayerWithView:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:265"]
  S16 -->|calls| T16
  S17["method:TABAnimatedProductImpl::_reuseWithCurrentClass:indexPath:origin:className:production:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:190"]
  T17["method:TABAnimatedProductImpl::_createViewWithOrigin:controlView:indexPath:className:currentClass:isNeedProduct:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:201"]
  S17 -->|calls| T17
  S18["method:TABAnimatedProductImpl::_reuseWithCurrentClass:indexPath:origin:className:production:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:190"]
  T18["method:TABAnimatedProductImpl::_reuseProduction:targetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:255"]
  S18 -->|calls| T18
  S19["method:TABAnimatedProductImpl::_reuseProduction:targetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:255"]
  T19["method:TABAnimatedProductImpl::_bindWithProduction:targetView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:589"]
  S19 -->|calls| T19
  S20["method:TABAnimatedProductImpl::_productBackgroundLayerWithView:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:265"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:TABAnimatedProductImpl::_productBackgroundLayerWithView:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:265"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:TABAnimatedProductImpl::_productBackgroundLayerWithView:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:265"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:TABAnimatedProductImpl::_productBackgroundLayerWithView:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:265"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["method:TABAnimatedProductImpl::_productBackgroundLayerWithView:needReset:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:265"]
  T24["method:TABAnimatedProductImpl::_productWithView:needReset:isCard:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:293"]
  S24 -->|calls| T24
  S25["method:TABAnimatedProductImpl::_productWithTargetView:isCard:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:322"]
  T25["method:TABAnimatedProductImpl::_recurseProductLayerWithView:array:dict:production:isCard:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Product/TABAnimatedProductImpl.m:350"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
