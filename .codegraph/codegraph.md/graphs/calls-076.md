# `calls 符号关系 - 076`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionNode::contentInset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:714"]
  T1["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S1 -->|calls| T1
  S2["method:ASCollectionNode::setContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:723"]
  T2["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S2 -->|calls| T2
  S3["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  T3["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S3 -->|calls| T3
  S4["method:ASCollectionNode::contentOffset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:739"]
  T4["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S4 -->|calls| T4
  S5["method:ASCollectionNode::layoutDelegate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:765"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:ASCollectionNode::layoutDelegate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:765"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:ASCollectionNode::cellLayoutMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:784"]
  T7["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S7 -->|calls| T7
  S8["method:ASCollectionNode::setCellLayoutMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:793"]
  T8["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S8 -->|calls| T8
  S9["method:ASCollectionNode::tuningParametersForRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:804"]
  T9["method:ASCollectionNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:814"]
  S9 -->|calls| T9
  S10["method:ASCollectionNode::setTuningParameters:forRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:809"]
  T10["method:ASCollectionNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:823"]
  S10 -->|calls| T10
  S11["method:ASCollectionNode::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:814"]
  T11["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S11 -->|calls| T11
  S12["method:ASCollectionNode::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:823"]
  T12["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S12 -->|calls| T12
  S13["method:ASCollectionNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:885"]
  T13["method:ASCollectionNode::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1063"]
  S13 -->|calls| T13
  S14["method:ASCollectionNode::numberOfItemsInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:892"]
  T14["method:ASCollectionNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:885"]
  S14 -->|calls| T14
  S15["method:ASCollectionNode::numberOfSections<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:898"]
  T15["method:ASCollectionNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:885"]
  S15 -->|calls| T15
  S16["method:ASCollectionNode::nodeForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:910"]
  T16["method:ASCollectionNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:885"]
  S16 -->|calls| T16
  S17["method:ASCollectionNode::nodeModelForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:916"]
  T17["method:ASCollectionNode::reloadDataInitiallyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:885"]
  S17 -->|calls| T17
  S18["method:ASCollectionNode::indexPathsForVisibleItems<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:927"]
  T18["method:ASCollectionNode::visibleNodes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:904"]
  S18 -->|calls| T18
  S19["method:ASCollectionNode::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:977"]
  T19["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S19 -->|calls| T19
  S20["method:ASCollectionNode::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:992"]
  T20["method:ASCollectionNode::performBatchAnimated:updates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:977"]
  S20 -->|calls| T20
  S21["method:ASCollectionNode::onDidFinishProcessingUpdates:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1002"]
  T21["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S21 -->|calls| T21
  S22["method:ASCollectionNode::onDidFinishSynchronizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1019"]
  T22["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S22 -->|calls| T22
  S23["method:ASCollectionNode::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1041"]
  T23["method:ASCollectionNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1031"]
  S23 -->|calls| T23
  S24["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  T24["method:ASCollectionNode::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:992"]
  S24 -->|calls| T24
  S25["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  T25["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
