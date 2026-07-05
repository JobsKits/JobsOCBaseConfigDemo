# `calls 符号关系 - 118`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T1["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  S1 -->|calls| T1
  S2["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T2["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S2 -->|calls| T2
  S3["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T3["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S3 -->|calls| T3
  S4["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T4["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S4 -->|calls| T4
  S5["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T5["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S5 -->|calls| T5
  S6["method:ASPagerNode::currentPageIndex<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:102"]
  T6["method:ASPagerNode::pageSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S6 -->|calls| T6
  S7["method:ASPagerNode::scrollToPageAtIndex:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:117"]
  T7["method:ASCollectionNode::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:869"]
  S7 -->|calls| T7
  S8["method:ASPagerNode::galleryLayoutDelegate:sizeForElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:139"]
  T8["method:ASPagerNode::pageSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S8 -->|calls| T8
  S9["method:ASPagerNode::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:147"]
  T9["method:ASPagerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  S9 -->|calls| T9
  S10["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  T10["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S10 -->|calls| T10
  S11["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  T11["method:ASPagerNode::pageSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S11 -->|calls| T11
  S12["method:ASPagerNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:182"]
  T12["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S12 -->|calls| T12
  S13["method:ASPagerNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:200"]
  T13["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S13 -->|calls| T13
  S14["method:ASPagerNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:215"]
  T14["method:ASPagerNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:215"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T15["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T16["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T17["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T18["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["function:ASCATransactionQueueGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  T20["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  S20 -->|calls| T20
  S21["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T22["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T23["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T24["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T25["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
