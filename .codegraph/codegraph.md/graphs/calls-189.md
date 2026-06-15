# `calls 符号关系 - 189`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::__willDisplayNodeContentWithRenderingContext:drawParameters:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:275"]
  T1["method:ASDisplayNode::willDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:470"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::__didDisplayNodeContentWithRenderingContext:image:drawParameters:backgroundColor:borderWidth:borderColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:299"]
  T2["method:ASDisplayNode::didDisplayNodeContentWithRenderingContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:476"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T3["method:ASDisplayNode::_displayBlockWithAsynchronous:isCancelledBlock:rasterizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:153"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T4["function:ASDisplayNodeSetResizableContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:18"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T5["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T6["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T7["method:_ASDisplayLayer::displayQueue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:130"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::displayAsyncLayer:asynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+AsyncDisplay.mm:368"]
  T8["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S8 -->|calls| T8
  S9["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T9["function:ASHierarchyStateIncludesRangeManaged<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:51"]
  S9 -->|calls| T9
  S10["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T10["function:ASHierarchyStateIncludesLayoutPending<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:46"]
  S10 -->|calls| T10
  S11["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T11["function:ASHierarchyStateIncludesRasterized<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:56"]
  S11 -->|calls| T11
  S12["function:NSStringFromASHierarchyState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:66"]
  T12["function:ASHierarchyStateIncludesTransitioningSupernodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:61"]
  S12 -->|calls| T12
  S13["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  T13["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S13 -->|calls| T13
  S14["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  T14["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S14 -->|calls| T14
  S15["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  T15["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::setNeedsFocusUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:95"]
  T16["method:_ASDisplayView::setNeedsFocusUpdate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:508"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::updateFocusIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:101"]
  T17["method:_ASDisplayView::updateFocusIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:514"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::becomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:137"]
  T18["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::becomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:137"]
  T19["method:ASDisplayNode::canBecomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:128"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::becomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:137"]
  T20["method:_ASDisplayView::becomeFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:410"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::canResignFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:150"]
  T21["method:_ASDisplayView::canResignFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:423"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::resignFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:161"]
  T22["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::resignFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:161"]
  T23["method:ASDisplayNode::canResignFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:150"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::resignFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:161"]
  T24["method:_ASDisplayView::resignFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:436"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::isFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:174"]
  T25["method:_ASDisplayView::isFirstResponder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayView.mm:449"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
