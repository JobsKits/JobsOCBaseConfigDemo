# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T1["method:ASDisplayNode::_locked_isLayoutTransitionInvalid<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:570"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T2["function:ASHierarchyStateIncludesLayoutPending<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:46"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T3["variable:invalidateCalculatedLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Subclasses.h:170"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T4["method:ASDisplayNode::_startNewTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:583"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T5["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T6["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T7["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T8["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T9["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T10["function:ASLayoutElementPushContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:45"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T11["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T12["function:ASLayoutElementPopContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:59"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T13["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T14["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T15["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T16["method:ASLayoutTransition::initWithNode:pendingLayout:previousLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:66"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T17["method:_ASTransitionContext::initWithAnimation:layoutDelegate:completionDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/_ASTransitionContext.mm:27"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T18["function:ASDisplayNodePerformBlockOnEverySubnode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:132"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T19["method:ASDisplayNode::_completePendingLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:925"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T20["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:121"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T21["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T22["method:ASLayoutTransition::applySubnodeInsertionsAndMoves<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASLayoutTransition.mm:93"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T23["method:DemoCellNode::animateLayoutTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples_extra/BackgroundPropertySetting/Sample/DemoCellNode.swift:39"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T24["method:ASDisplayNode::_finishOrCancelTransition<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:592"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::transitionLayoutWithSizeRange:animated:shouldMeasureAsync:measurementCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:611"]
  T25["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
