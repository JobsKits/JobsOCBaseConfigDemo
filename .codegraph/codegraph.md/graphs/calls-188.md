# `calls 符号关系 - 188`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T1["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T2["method:ASDisplayNode::_recursivelyRasterizeSelfAndSublayersWithIsCancelledBlock:displayBlocks:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:49"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T3["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T4["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T5["method:ASDisplayNode::__willDisplayNodeContentWithRenderingContext:drawParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:275"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T6["method:ASDisplayNode::__didDisplayNodeContentWithRenderingContext:image:drawParameters:backgroundColor:borderWidth:borderColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:299"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T7["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  T8["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::__willDisplayNodeContentWithRenderingContext:drawParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:275"]
  T9["method:ASDisplayNode::willDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:470"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::__didDisplayNodeContentWithRenderingContext:image:drawParameters:backgroundColor:borderWidth:borderColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:299"]
  T10["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T11["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T12["function:ASDisplayNodeSetResizableContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:18"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T13["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T14["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T15["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T16["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S16 -->|calls| T16
  S17["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T17["function:ASHierarchyStateIncludesRangeManaged<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:51"]
  S17 -->|calls| T17
  S18["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T18["function:ASHierarchyStateIncludesLayoutPending<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:46"]
  S18 -->|calls| T18
  S19["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T19["function:ASHierarchyStateIncludesRasterized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:56"]
  S19 -->|calls| T19
  S20["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T20["function:ASHierarchyStateIncludesTransitioningSupernodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:61"]
  S20 -->|calls| T20
  S21["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  T21["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S21 -->|calls| T21
  S22["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  T22["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S22 -->|calls| T22
  S23["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  T23["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::setNeedsFocusUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:95"]
  T24["method:_ASDisplayView::setNeedsFocusUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:508"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::updateFocusIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:101"]
  T25["method:_ASDisplayView::updateFocusIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:514"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
