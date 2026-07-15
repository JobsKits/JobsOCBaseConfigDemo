# `calls 符号关系 - 112`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASPagerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  T1["method:ASPagerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  S1 -->|calls| T1
  S2["method:ASPagerNode::initWithCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:54"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:ASPagerNode::initWithCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:54"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASPagerNode::initUsingAsyncCollectionLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:62"]
  T4["method:ASCollectionNode::initWithLayoutDelegate:layoutFacilitator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:272"]
  S4 -->|calls| T4
  S5["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T5["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  S5 -->|calls| T5
  S6["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T6["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S6 -->|calls| T6
  S7["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T7["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S7 -->|calls| T7
  S8["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T8["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S8 -->|calls| T8
  S9["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T9["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S9 -->|calls| T9
  S10["method:ASPagerNode::currentPageIndex<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:102"]
  T10["method:ASPagerNode::pageSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S10 -->|calls| T10
  S11["method:ASPagerNode::scrollToPageAtIndex:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:117"]
  T11["method:ASCollectionNode::scrollToItemAtIndexPath:atScrollPosition:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:869"]
  S11 -->|calls| T11
  S12["method:ASPagerNode::galleryLayoutDelegate:sizeForElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:139"]
  T12["method:ASPagerNode::pageSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S12 -->|calls| T12
  S13["method:ASPagerNode::collectionNode:nodeBlockForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:147"]
  T13["method:ASPagerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  S13 -->|calls| T13
  S14["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  T14["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S14 -->|calls| T14
  S15["method:ASPagerNode::collectionNode:constrainedSizeForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:170"]
  T15["method:ASPagerNode::pageSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:107"]
  S15 -->|calls| T15
  S16["method:ASPagerNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:182"]
  T16["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S16 -->|calls| T16
  S17["method:ASPagerNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:200"]
  T17["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S17 -->|calls| T17
  S18["method:ASPagerNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:215"]
  T18["method:ASPagerNode::didEnterHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:215"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T19["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T20["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T21["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["function:ASCATransactionQueueGet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.h:71"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  T24["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  S24 -->|calls| T24
  S25["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
