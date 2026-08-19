# `calls 符号关系 - 139`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDataController::onDidFinishProcessingUpdates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:505"]
  T1["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S1 -->|calls| T1
  S2["method:ASDataController::onDidFinishSynchronizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:529"]
  T2["method:ASDataController::isSynchronized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:525"]
  S2 -->|calls| T2
  S3["method:ASDataController::onDidFinishSynchronizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:529"]
  T3["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S3 -->|calls| T3
  S4["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T4["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S4 -->|calls| T4
  S5["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T5["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S5 -->|calls| T5
  S6["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T6["function:ASViewToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S6 -->|calls| T6
  S7["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T7["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S7 -->|calls| T7
  S8["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T8["function:ASViewToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S8 -->|calls| T8
  S9["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T9["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S9 -->|calls| T9
  S10["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T10["function:ASViewToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S10 -->|calls| T10
  S11["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T11["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S11 -->|calls| T11
  S12["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T12["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S12 -->|calls| T12
  S13["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T13["method:ASDataController::invalidateDataSourceItemCounts<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:432"]
  S13 -->|calls| T13
  S14["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T14["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S14 -->|calls| T14
  S15["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T16["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  S16 -->|calls| T16
  S17["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T17["method:ASDataController::_updateElementsInMap:changeSet:traitCollection:shouldFetchSizeRanges:previousMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:760"]
  S17 -->|calls| T17
  S18["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T18["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S18 -->|calls| T18
  S19["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T19["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S19 -->|calls| T19
  S20["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T20["method:ASDataController::_allocateNodesFromElements:strictlyOnCurrentThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:140"]
  S20 -->|calls| T20
  S21["method:ASDataController::updateWithChangeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:542"]
  T21["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S21 -->|calls| T21
  S22["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T22["method:ASMutableElementMap::removeAllSections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASMutableElementMap.mm:41"]
  S22 -->|calls| T22
  S23["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T23["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S23 -->|calls| T23
  S24["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T24["method:ASDataController::_insertSectionsIntoMap:indexes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:742"]
  S24 -->|calls| T24
  S25["method:ASDataController::_updateSectionsInMap:changeSet:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:719"]
  T25["method:ASDataController::_insertSectionsIntoMap:indexes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:742"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
