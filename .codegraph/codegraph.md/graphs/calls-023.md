# `calls 符号关系 - 023`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TABAnimatedCacheManager::_judgeProdcutionIsNeedUpdate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:355"]
  T1["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S1 -->|calls| T1
  S2["method:TABAnimatedCacheManager::_judgeProdcutionIsNeedUpdate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:355"]
  T2["method:TABAnimatedCacheManager::shareManager<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:51"]
  S2 -->|calls| T2
  S3["method:TABAnimatedCacheManager::_getProductionInDiskWithKey:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:373"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:TABAnimatedCacheManager::_canCacheToMemoryWithProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:383"]
  T4["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S4 -->|calls| T4
  S5["method:TABAnimatedCacheManager::_canCacheToDiskWithProduction:tabAnimated:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheManager.m:391"]
  T5["method:TABAnimated::sharedAnimated<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/TABAnimated.m:17"]
  S5 -->|calls| T5
  S6["method:TABAnimatedCacheModel::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheModel.m:12"]
  T6["method:TABAnimatedCacheModel::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheModel.m:12"]
  S6 -->|calls| T6
  S7["method:TABAnimatedCacheModel::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheModel.m:28"]
  T7["method:TABAnimatedCacheModel::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedCacheModel.m:12"]
  S7 -->|calls| T7
  S8["method:TABAnimatedDocumentMethod::getPathByFilePacketName:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:19"]
  T8["method:TABAnimatedDocumentMethod::documentPath<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:15"]
  S8 -->|calls| T8
  S9["method:TABAnimatedDocumentMethod::getPathByCreateDocumentFile:documentName:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:54"]
  T9["method:TABAnimatedDocumentMethod::documentPath<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:15"]
  S9 -->|calls| T9
  S10["method:TABAnimatedDocumentMethod::getPathByCreateDocumentName:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:62"]
  T10["method:TABAnimatedDocumentMethod::documentPath<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Cache/TABAnimatedDocumentMethod.m:15"]
  S10 -->|calls| T10
  S11["method:TABCollectionAnimated::_animatedWithCellClass:cellSize:animatedCount:toIndex:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:103"]
  T11["method:TABCollectionAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:148"]
  S11 -->|calls| T11
  S12["method:TABCollectionAnimated::_animatedWithCellClassArray:cellSizeArray:animatedCountArray:indexArray:runMode:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:118"]
  T12["method:TABCollectionAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:148"]
  S12 -->|calls| T12
  S13["method:TABCollectionAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:148"]
  T13["method:TABCollectionAnimated::init<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:148"]
  S13 -->|calls| T13
  S14["method:TABCollectionAnimated::refreshWithIndex:controlView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:156"]
  T14["method:FSCalendarCalculator::reloadSections<br/>JobsByPods/ManualByOCPods@Pods/FSCalendar/Core/FSCalendarCalculator/FSCalendarCalculator.m:270"]
  S14 -->|calls| T14
  S15["method:TABCollectionAnimated::addHeaderViewClass:viewSize:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:172"]
  T15["method:TABCollectionAnimated::addHeaderViewClass:viewSize:toSection:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:181"]
  S15 -->|calls| T15
  S16["method:TABCollectionAnimated::addFooterViewClass:viewSize:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:189"]
  T16["method:TABCollectionAnimated::addFooterViewClass:viewSize:toSection:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:198"]
  S16 -->|calls| T16
  S17["method:TABCollectionAnimated::rebindDelegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:206"]
  T17["method:TABFormAnimated::updateScrollViewDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:154"]
  S17 -->|calls| T17
  S18["method:TABCollectionAnimated::rebindDelegate:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:206"]
  T18["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  S18 -->|calls| T18
  S19["method:TABCollectionAnimated::rebindDataSource:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:216"]
  T19["method:TABCollectionAnimated::updateDataSourceMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:493"]
  S19 -->|calls| T19
  S20["method:TABCollectionAnimated::registerViewToReuse:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:225"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:TABCollectionAnimated::registerViewToReuse:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:225"]
  T21["function:TABViewAnimated::tab_NSStringFromClass<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABViewAnimated.m:18"]
  S21 -->|calls| T21
  S22["method:TABCollectionAnimated::registerViewToReuse:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:225"]
  T22["method:TABCollectionAnimated::_registerCollectionHeaderOrFooter:collectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:560"]
  S22 -->|calls| T22
  S23["method:TABCollectionAnimated::registerViewToReuse:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:225"]
  T23["method:TABCollectionAnimated::_registerCollectionHeaderOrFooter:collectionView:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:560"]
  S23 -->|calls| T23
  S24["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T24["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S24 -->|calls| T24
  S25["method:TABCollectionAnimated::updateDelegateMethods:target:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABCollectionAnimated.m:258"]
  T25["method:TABFormAnimated::addNewMethodWithSel:newSel:<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Control/TABFormAnimated.m:105"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
