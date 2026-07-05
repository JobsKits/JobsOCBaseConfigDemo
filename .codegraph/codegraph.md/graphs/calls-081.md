# `calls 符号关系 - 081`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1774"]
  T1["method:ASRangeController::updateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:144"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::_scheduleCheckForBatchFetchingForNumberOfChanges:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1850"]
  T2["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  T3["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T4["function:ASDisplayShouldFetchBatchForScrollView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASBatchFetching.mm:14"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::_beginBatchFetchingIfNeededWithContentOffset:velocity:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1874"]
  T5["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  T6["method:ASBatchContext::beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:43"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::_beginBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1885"]
  T7["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S7 -->|calls| T7
  S8["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T8["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S8 -->|calls| T8
  S9["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T10["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S10 -->|calls| T10
  S11["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T11["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S11 -->|calls| T11
  S12["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T12["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::dataController:nodeBlockAtIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1955"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2047"]
  T15["method:ASCollectionLayoutState::layoutAttributesForSupplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:135"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::dataController:presentedSizeForElement:matchesSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2047"]
  T16["function:CGSizeEqualToSizeWithIn<br/>JobsByPods/ManualByOCPods@Pods/Texture/Tests/ASEditableTextNodeTests.mm:14"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T17["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T20["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T21["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::dataController:supplementaryNodeBlockOfKind:atIndexPath:shouldAsyncLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2066"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::dataController:supplementaryNodeKindsInSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2136"]
  T24["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::dataController:supplementaryNodeKindsInSections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2136"]
  T25["method:ASWeakSet::allObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:42"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
