# `calls 符号关系 - 176`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T1["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S1 -->|calls| T1
  S2["method:ASTipsController::windowDidBecomeVisibleWithNotification:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:89"]
  T2["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S2 -->|calls| T2
  S3["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  T3["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S3 -->|calls| T3
  S4["method:ASTipsController::createTipWindowIfNeededWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:151"]
  T4["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  S4 -->|calls| T4
  S5["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  T5["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  S5 -->|calls| T5
  S6["method:ASTipsWindow::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:24"]
  T6["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S6 -->|calls| T6
  S7["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  T7["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  S7 -->|calls| T7
  S8["method:ASTipsWindow::didTapTipNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:63"]
  T8["method:ASDisplayNode::tipDisplayBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:41"]
  S8 -->|calls| T8
  S9["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  T9["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T10["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T11["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S11 -->|calls| T11
  S12["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  T13["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S13 -->|calls| T13
  S14["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  T14["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S14 -->|calls| T14
  S15["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  T15["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  S15 -->|calls| T15
  S16["function:compareCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T16["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S16 -->|calls| T16
  S17["function:compareCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T17["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S17 -->|calls| T17
  S18["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T18["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S18 -->|calls| T18
  S19["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T19["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S19 -->|calls| T19
  S20["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T20["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S20 -->|calls| T20
  S21["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T21["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S21 -->|calls| T21
  S22["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T22["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S22 -->|calls| T22
  S23["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T23["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S23 -->|calls| T23
  S24["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T24["function:if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S24 -->|calls| T24
  S25["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T25["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
