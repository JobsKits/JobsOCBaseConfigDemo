# `calls 符号关系 - 187`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::contentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:712"]
  T1["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::setContentMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:726"]
  T2["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::setContentMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:726"]
  T3["function:ASDisplayNodeCAContentsGravityFromUIContentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:133"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::setContentMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:726"]
  T4["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::backgroundColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:741"]
  T5["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::setBackgroundColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:758"]
  T6["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::setBackgroundColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:758"]
  T7["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::setBackgroundColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:758"]
  T8["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::setTintColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:810"]
  T9["method:ASDisplayNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:832"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::layoutMarginsDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:991"]
  T10["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::insetsLayoutMarginsFromSafeArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1011"]
  T11["method:ASDisplayNode::_locked_insetsLayoutMarginsFromSafeArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1090"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::setInsetsLayoutMarginsFromSafeArea:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1018"]
  T12["method:ASDisplayNode::layoutMarginsDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:991"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::safeAreaInsetsDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1051"]
  T13["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::setAccessibilityLabel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1140"]
  T14["function:ASInteractiveAccessibilityTraitsMask<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:312"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::asyncdisplaykit_asyncTransactionContainerState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1404"]
  T15["method:CALayer::asyncdisplaykit_asyncTransactionContainerState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionContainer.mm:29"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::asyncdisplaykit_cancelAsyncTransactions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:1410"]
  T16["method:CALayer::asyncdisplaykit_cancelAsyncTransactions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionContainer.mm:34"]
  S16 -->|calls| T16
  S17["struct:ASDisplayNodeLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNodeLayout.h:18"]
  T17["method:ASButtonNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  S17 -->|calls| T17
  S18["method:ASDisplayNodeTipState::initWithNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNodeTipState.mm:17"]
  T18["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S18 -->|calls| T18
  S19["method:ASIGListAdapterBasedDataSource::initWithListAdapter:collectionDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:56"]
  T19["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S19 -->|calls| T19
  S20["method:ASIGListAdapterBasedDataSource::initWithListAdapter:collectionDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:56"]
  T20["method:ASIGListAdapterBasedDataSource::setASCollectionViewSuperclass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:337"]
  S20 -->|calls| T20
  S21["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForHeaderInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:210"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:ASIGListAdapterBasedDataSource::collectionNode:sizeRangeForFooterInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:220"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:ASIGListAdapterBasedDataSource::setASCollectionViewSuperclass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:337"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["method:ASIGListAdapterBasedDataSource::setASCollectionViewSuperclass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:337"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:ASIGListAdapterBasedDataSource::configureUpdater:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASIGListAdapterBasedDataSource.mm:350"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
