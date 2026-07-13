# `calls 符号关系 - 190`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTipNode::initWithTip:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipNode.mm:16"]
  T1["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S1 -->|calls| T1
  S2["method:ASTipNode::initWithTip:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipNode.mm:16"]
  T2["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipProvider.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipProvider.h:1"]
  T3["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipProvider.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipProvider.h:1"]
  T4["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S4 -->|calls| T4
  S5["method:ASTipsController::shared<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:48"]
  T5["method:ASTipsController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  S5 -->|calls| T5
  S6["method:ASTipsController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  T6["method:ASTipsController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  S6 -->|calls| T6
  S7["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T7["method:ASDisplayNode::enableTips<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:26"]
  S7 -->|calls| T7
  S8["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T9["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S9 -->|calls| T9
  S10["method:ASTipsController::windowDidBecomeVisibleWithNotification:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:89"]
  T10["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S10 -->|calls| T10
  S11["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  T11["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S11 -->|calls| T11
  S12["method:ASTipsController::createTipWindowIfNeededWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:151"]
  T12["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  S12 -->|calls| T12
  S13["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  T13["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  S13 -->|calls| T13
  S14["method:ASTipsWindow::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:24"]
  T14["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S14 -->|calls| T14
  S15["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  T15["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  S15 -->|calls| T15
  S16["method:ASTipsWindow::didTapTipNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:63"]
  T16["method:ASDisplayNode::tipDisplayBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:41"]
  S16 -->|calls| T16
  S17["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  T17["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T18["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T19["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S19 -->|calls| T19
  S20["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  T22["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S22 -->|calls| T22
  S23["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  T23["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S23 -->|calls| T23
  S24["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  T24["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  S24 -->|calls| T24
  S25["function:compareCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T25["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
