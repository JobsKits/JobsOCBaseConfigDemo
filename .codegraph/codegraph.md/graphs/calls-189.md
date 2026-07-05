# `calls 符号关系 - 189`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASLayoutTransition::findNodesInLayoutAtIndexesWithFilteredNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:265"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  T2["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S2 -->|calls| T2
  S3["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  T3["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S3 -->|calls| T3
  S4["method:ASMutableElementMap::copyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:36"]
  T4["method:ASMutableElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:26"]
  S4 -->|calls| T4
  S5["method:ASMutableElementMap::removeAllSections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:41"]
  T5["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S5 -->|calls| T5
  S6["method:ASMutableElementMap::removeItemsAtIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:51"]
  T6["function:ASDeleteElementsInTwoDimensionalArrayAtIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:33"]
  S6 -->|calls| T6
  S7["method:ASMutableElementMap::removeAllElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:66"]
  T7["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S7 -->|calls| T7
  S8["method:ASMutableElementMap::removeAllElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:66"]
  T8["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S8 -->|calls| T8
  S9["method:ASMutableElementMap::insertEmptySectionsOfItemsAtIndexes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:77"]
  T9["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S9 -->|calls| T9
  S10["method:ASMutableElementMap::insertElement:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:84"]
  T10["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S10 -->|calls| T10
  S11["method:ASMutableElementMap::migrateSupplementaryElementsWithSectionMapping:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:99"]
  T11["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S11 -->|calls| T11
  S12["method:ASPendingStateController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  T12["method:ASPendingStateController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S12 -->|calls| T12
  S13["method:ASPendingStateController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  T13["method:ASPendingStateController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S13 -->|calls| T13
  S14["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  T14["method:ASPendingStateController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S14 -->|calls| T14
  S15["method:ASPendingStateController::registerNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:52"]
  T15["method:ASPendingStateController::scheduleFlushIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:81"]
  S15 -->|calls| T15
  S16["method:ASPendingStateController::flush<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  T16["method:ASPendingStateController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:31"]
  S16 -->|calls| T16
  S17["method:ASPendingStateController::scheduleFlushIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:81"]
  T17["method:ASPendingStateController::flush<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:61"]
  S17 -->|calls| T17
  S18["method:ASResponderChainEnumerator::initWithResponder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:17"]
  T18["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S18 -->|calls| T18
  S19["method:ASSection::initWithSectionID:context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASSection.mm:15"]
  T19["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T20["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T21["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
