# `calls 符号关系 - 100`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T1["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T2["method:CALayer::addSublayer<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:48"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T3["method:ASImageNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASImageNode.mm:631"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T4["method:ASNodeController::didExitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:94"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T5["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T6["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T7["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T8["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T9["function:NSStringFromASHierarchyStateChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:93"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T10["function:ASCATransactionQueueGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T11["method:ASNodeController::didExitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:94"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T12["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T13["function:ASCATransactionQueueGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T14["function:ASHierarchyStateIncludesRangeManaged<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+FrameworkPrivate.h:51"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T15["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T16["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T17["function:ASDisplayNodePerformBlockOnEveryNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:85"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T18["function:ASCATransactionQueueGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T19["function:ASCATransactionQueueGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T20["function:ASCATransactionQueueGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T21["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T22["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T23["function:ASInterfaceStateIncludesDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:39"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T24["method:ASCollectionNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:376"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:1"]
  T25["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
