# `calls 符号关系 - 190`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::layoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:481"]
  T1["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::layoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:481"]
  T2["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::setOpaque:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:517"]
  T3["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::setOpaque:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:517"]
  T4["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::setOpaque:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:517"]
  T5["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::contentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:712"]
  T6["function:ASDisplayNodeUIContentModeFromCAContentsGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:148"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::contentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:712"]
  T7["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::setContentMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:726"]
  T8["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::setContentMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:726"]
  T9["function:ASDisplayNodeCAContentsGravityFromUIContentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:133"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::setContentMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:726"]
  T10["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::backgroundColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:741"]
  T11["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::setBackgroundColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:758"]
  T12["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::setBackgroundColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:758"]
  T13["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::setBackgroundColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:758"]
  T14["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::setTintColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:810"]
  T15["method:ASDisplayNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:832"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::layoutMarginsDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:991"]
  T16["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::insetsLayoutMarginsFromSafeArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1011"]
  T17["method:ASDisplayNode::_locked_insetsLayoutMarginsFromSafeArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1090"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::setInsetsLayoutMarginsFromSafeArea:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1018"]
  T18["method:ASDisplayNode::layoutMarginsDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:991"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::safeAreaInsetsDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1051"]
  T19["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::setAccessibilityLabel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1140"]
  T20["function:ASInteractiveAccessibilityTraitsMask<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:312"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::asyncdisplaykit_asyncTransactionContainerState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1404"]
  T21["method:CALayer::asyncdisplaykit_asyncTransactionContainerState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionContainer.mm:29"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::asyncdisplaykit_cancelAsyncTransactions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1410"]
  T22["method:CALayer::asyncdisplaykit_cancelAsyncTransactions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionContainer.mm:34"]
  S22 -->|calls| T22
  S23["struct:ASDisplayNodeLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNodeLayout.h:18"]
  T23["method:ASButtonNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  S23 -->|calls| T23
  S24["method:ASDisplayNodeTipState::initWithNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNodeTipState.mm:17"]
  T24["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S24 -->|calls| T24
  S25["method:ASIGListAdapterBasedDataSource::initWithListAdapter:collectionDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:56"]
  T25["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
