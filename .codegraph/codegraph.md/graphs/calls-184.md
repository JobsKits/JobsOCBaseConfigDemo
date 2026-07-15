# `calls 符号关系 - 184`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T1["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T2["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTableView+Undeprecated.h:1"]
  T3["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["method:ASTip::initWithNode:kind:format:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTip.mm:18"]
  T4["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S4 -->|calls| T4
  S5["method:ASTipNode::initWithTip:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipNode.mm:16"]
  T5["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S5 -->|calls| T5
  S6["method:ASTipNode::initWithTip:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipNode.mm:16"]
  T6["method:ASControlNode::addTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:283"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipProvider.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipProvider.h:1"]
  T7["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipProvider.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipProvider.h:1"]
  T8["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["method:ASTipsController::shared<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:48"]
  T9["method:ASTipsController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  S9 -->|calls| T9
  S10["method:ASTipsController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  T10["method:ASTipsController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:60"]
  S10 -->|calls| T10
  S11["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T11["method:ASDisplayNode::enableTips<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:26"]
  S11 -->|calls| T11
  S12["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:ASTipsController::nodeDidAppear:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:72"]
  T13["function:ASFindWindowOfLayer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:256"]
  S13 -->|calls| T13
  S14["method:ASTipsController::windowDidBecomeVisibleWithNotification:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:89"]
  T14["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S14 -->|calls| T14
  S15["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  T15["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S15 -->|calls| T15
  S16["method:ASTipsController::createTipWindowIfNeededWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:151"]
  T16["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  S16 -->|calls| T16
  S17["method:ASTipsController::setupRunLoopObserver<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:167"]
  T17["method:ASTipsController::runLoopDidTick<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsController.mm:114"]
  S17 -->|calls| T17
  S18["method:ASTipsWindow::initWithFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:24"]
  T18["method:ASCollectionLayoutCache::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutCache.mm:35"]
  S18 -->|calls| T18
  S19["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  T19["method:ASTipsWindow::hitTest:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:45"]
  S19 -->|calls| T19
  S20["method:ASTipsWindow::didTapTipNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:63"]
  T20["method:ASDisplayNode::tipDisplayBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:41"]
  S20 -->|calls| T20
  S21["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  T21["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T22["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T23["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S23 -->|calls| T23
  S24["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
