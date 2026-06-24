# `calls 符号关系 - 077`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T1["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T2["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T3["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T4["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T5["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T6["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T7["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  T8["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  S8 -->|calls| T8
  S9["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  T9["method:ASAbstractLayoutController::defaultTuningParameters<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:90"]
  S9 -->|calls| T9
  S10["method:_ASCollectionPendingState::tuningParametersForRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:208"]
  T10["method:_ASCollectionPendingState::tuningParametersForRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:218"]
  S10 -->|calls| T10
  S11["method:_ASCollectionPendingState::setTuningParameters:forRangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:213"]
  T11["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S11 -->|calls| T11
  S12["method:ASCollectionNode::collectionViewClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:248"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:ASCollectionNode::setCollectionViewClass:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:253"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:ASCollectionNode::initWithCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:262"]
  T14["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  S14 -->|calls| T14
  S15["method:ASCollectionNode::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:267"]
  T15["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  S15 -->|calls| T15
  S16["method:ASCollectionNode::initWithLayoutDelegate:layoutFacilitator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:272"]
  T16["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  S16 -->|calls| T16
  S17["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  T17["method:_ASCollectionPendingState::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:74"]
  S17 -->|calls| T17
  S18["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  T18["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  S18 -->|calls| T18
  S19["method:ASCollectionNode::initWithFrame:collectionViewLayout:layoutFacilitator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:277"]
  T19["method:ASCollectionNode::collectionViewClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:248"]
  S19 -->|calls| T19
  S20["method:ASCollectionNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:293"]
  T20["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S20 -->|calls| T20
  S21["method:ASCollectionNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:306"]
  T21["method:ASCollectionNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:306"]
  S21 -->|calls| T21
  S22["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  T22["method:ASCollectionNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:371"]
  S22 -->|calls| T22
  S23["method:ASCollectionNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:376"]
  T23["method:ASCollectionNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:376"]
  S23 -->|calls| T23
  S24["method:ASCollectionNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:382"]
  T24["method:ASCollectionNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:382"]
  S24 -->|calls| T24
  S25["method:ASCollectionNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:382"]
  T25["method:ASRangeController::layoutDebugOverlayIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:254"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
