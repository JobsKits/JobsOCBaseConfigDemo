# `calls 符号关系 - 022`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T1["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S1 -->|calls| T1
  S2["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T2["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithClass:controllerName:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:246"]
  S2 -->|calls| T2
  S3["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T3["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithClass:controllerName:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:246"]
  S3 -->|calls| T3
  S4["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithFormAnimated:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:159"]
  T4["method:TABAnimatedCacheManager::updateCacheModelLoadCountWithClass:controllerName:frame:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:246"]
  S4 -->|calls| T4
  S5["method:TABAnimatedCacheManager::_loadDataToMemory:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:191"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:TABAnimatedCacheManager::_loadDataToMemory:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:191"]
  T6["method:TABAnimatedCacheManager::_getModelArrayMaxCount<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:343"]
  S6 -->|calls| T6
  S7["method:TABAnimatedCacheManager::_loadDataToMemory:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:191"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["method:TABAnimatedCacheManager::_judgeProdcutionIsNeedUpdate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:355"]
  T8["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S8 -->|calls| T8
  S9["method:TABAnimatedCacheManager::_judgeProdcutionIsNeedUpdate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:355"]
  T9["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S9 -->|calls| T9
  S10["method:TABAnimatedCacheManager::_judgeProdcutionIsNeedUpdate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:355"]
  T10["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S10 -->|calls| T10
  S11["method:TABAnimatedCacheManager::_getProductionInDiskWithKey:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:373"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["method:TABAnimatedCacheManager::_canCacheToMemoryWithProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:383"]
  T12["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S12 -->|calls| T12
  S13["method:TABAnimatedCacheManager::_canCacheToDiskWithProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:391"]
  T13["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S13 -->|calls| T13
  S14["method:TABAnimatedCacheModel::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheModel.m:12"]
  T14["method:TABAnimatedCacheModel::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheModel.m:12"]
  S14 -->|calls| T14
  S15["method:TABAnimatedCacheModel::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheModel.m:28"]
  T15["method:TABAnimatedCacheModel::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheModel.m:12"]
  S15 -->|calls| T15
  S16["method:TABAnimatedDocumentMethod::getPathByFilePacketName:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:19"]
  T16["method:TABAnimatedDocumentMethod::documentPath<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:15"]
  S16 -->|calls| T16
  S17["method:TABAnimatedDocumentMethod::getPathByCreateDocumentFile:documentName:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:54"]
  T17["method:TABAnimatedDocumentMethod::documentPath<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:15"]
  S17 -->|calls| T17
  S18["method:TABAnimatedDocumentMethod::getPathByCreateDocumentName:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:62"]
  T18["method:TABAnimatedDocumentMethod::documentPath<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:15"]
  S18 -->|calls| T18
  S19["method:TABCollectionAnimated::_animatedWithCellClass:cellSize:animatedCount:toIndex:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:103"]
  T19["method:TABCollectionAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:148"]
  S19 -->|calls| T19
  S20["method:TABCollectionAnimated::_animatedWithCellClassArray:cellSizeArray:animatedCountArray:indexArray:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:118"]
  T20["method:TABCollectionAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:148"]
  S20 -->|calls| T20
  S21["method:TABCollectionAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:148"]
  T21["method:TABCollectionAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:148"]
  S21 -->|calls| T21
  S22["method:TABCollectionAnimated::refreshWithIndex:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:156"]
  T22["method:FSCalendarCalculator::reloadSections<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:270"]
  S22 -->|calls| T22
  S23["method:TABCollectionAnimated::addHeaderViewClass:viewSize:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:172"]
  T23["method:TABCollectionAnimated::addHeaderViewClass:viewSize:toSection:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:181"]
  S23 -->|calls| T23
  S24["method:TABCollectionAnimated::addFooterViewClass:viewSize:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:189"]
  T24["method:TABCollectionAnimated::addFooterViewClass:viewSize:toSection:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:198"]
  S24 -->|calls| T24
  S25["method:TABCollectionAnimated::rebindDelegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:206"]
  T25["method:TABFormAnimated::updateScrollViewDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:154"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
