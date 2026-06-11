# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T1["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T3["method:ASIGListAdapterBasedDataSource::dequeuesCellsForNodeBackedItems<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:312"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T5["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T6["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T7["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T8["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  T9["method:ASDataController::clearData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::setCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:595"]
  T10["method:ASCollectionView::layoutInspector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:609"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::layoutInspector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:609"]
  T11["method:UICollectionViewLayout::asdk_layoutInspector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UICollectionViewLayout+ASConvenience.mm:18"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::sizeForElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:679"]
  T12["method:ASCollectionView::_sizeForUIKitCellWithKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:844"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::convertIndexPathFromCollectionNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:721"]
  T13["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::convertIndexPathFromCollectionNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:721"]
  T14["method:ASCollectionView::convertIndexPathFromCollectionNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:721"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::visibleNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:784"]
  T15["method:ASCollectionNode::indexPathsForVisibleItems<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:927"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::visibleNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:784"]
  T16["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  T17["method:ASCollectionView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  T18["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  T19["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:913"]
  T20["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:948"]
  T21["method:ASCollectionView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:913"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:948"]
  T22["method:ASCollectionView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:927"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  T23["method:ASCollectionView::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:948"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::registerSupplementaryNodeOfKind:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:969"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::insertSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:976"]
  T25["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
