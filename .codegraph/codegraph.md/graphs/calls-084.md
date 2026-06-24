# `calls 符号关系 - 084`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T1["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T2["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T3["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T4["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T5["method:ASCollectionView::_superPerformBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:897"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T6["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T7["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::_scheduleCheckForBatchFetchingForNumberOfChanges:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1850"]
  T8["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  T9["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T10["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T11["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  T12["method:ASBatchContext::beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:43"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  T13["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T14["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T15["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T16["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T17["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T18["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2047"]
  T21["method:ASCollectionLayoutState::layoutAttributesForSupplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:135"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2047"]
  T22["function:CGSizeEqualToSizeWithIn<br/>JobsByPods/ManualByOCPods@Pods/Texture/Tests/ASEditableTextNodeTests.mm:14"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T24["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T25["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
