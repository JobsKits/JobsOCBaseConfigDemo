# `calls 符号关系 - 189`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T1["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T2["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T3["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T4["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T5["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  T7["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  T8["method:ASCollectionView::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:963"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:365"]
  T9["method:ASCollectionView::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:365"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::relayoutItems<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:372"]
  T10["method:ASCollectionView::invalidateFlowLayoutDelegateMetrics<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:800"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::isProcessingUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:380"]
  T11["method:ASDataController::isProcessingUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:499"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  T12["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::isSynchronized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:402"]
  T13["method:ASDataController::isSynchronized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:525"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T14["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T15["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T17["method:ASIGListAdapterBasedDataSource::dequeuesCellsForNodeBackedItems<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:312"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:438"]
  T19["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T20["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T21["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:509"]
  T22["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:586"]
  T23["method:ASDataController::clearData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::setCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:595"]
  T24["method:ASCollectionView::layoutInspector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:609"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::layoutInspector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:609"]
  T25["method:UICollectionViewLayout::asdk_layoutInspector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/UICollectionViewLayout+ASConvenience.mm:18"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
