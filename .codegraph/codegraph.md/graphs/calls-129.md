# `calls 符号关系 - 129`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:447"]
  T1["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S1 -->|calls| T1
  S2["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:447"]
  T2["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S2 -->|calls| T2
  S3["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:447"]
  T3["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:513"]
  S3 -->|calls| T3
  S4["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:513"]
  T4["method:ASDataController::clearData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  S4 -->|calls| T4
  S5["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:531"]
  T5["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S5 -->|calls| T5
  S6["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:531"]
  T6["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S6 -->|calls| T6
  S7["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:531"]
  T7["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S7 -->|calls| T7
  S8["method:ASTableView::scrollToRowAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:557"]
  T8["method:ASTableView::scrollToRowAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:557"]
  S8 -->|calls| T8
  S9["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:599"]
  T9["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:739"]
  S9 -->|calls| T9
  S10["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:599"]
  T10["method:ASTableView::convertIndexPathFromTableNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:599"]
  S10 -->|calls| T10
  S11["method:ASTableView::indexPathForNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:635"]
  T11["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:665"]
  S11 -->|calls| T11
  S12["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:665"]
  T12["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:739"]
  S12 -->|calls| T12
  S13["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:665"]
  T13["method:ASTableView::indexPathForNode:waitingIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:665"]
  S13 -->|calls| T13
  S14["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  T14["method:ASDataController::itemCountsFromDataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:438"]
  S14 -->|calls| T14
  S15["method:ASTableView::endUpdatesWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:703"]
  T15["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:709"]
  S15 -->|calls| T15
  S16["method:ASTableView::isProcessingUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:729"]
  T16["method:ASDataController::isProcessingUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:499"]
  S16 -->|calls| T16
  S17["method:ASTableView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:739"]
  T17["method:ASDataController::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:492"]
  S17 -->|calls| T17
  S18["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T18["method:ASTableView::sectionIndexWidth<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:1958"]
  S18 -->|calls| T18
  S19["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T19["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S19 -->|calls| T19
  S20["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T20["method:ASTableView::beginUpdates<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:686"]
  S20 -->|calls| T20
  S21["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T21["method:ASTableView::endUpdatesAnimated:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:709"]
  S21 -->|calls| T21
  S22["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T22["function:ASDisplayNodeLayerHasAnimations<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:183"]
  S22 -->|calls| T22
  S23["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T23["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S23 -->|calls| T23
  S24["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T24["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S24 -->|calls| T24
  S25["method:ASTableView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:751"]
  T25["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
