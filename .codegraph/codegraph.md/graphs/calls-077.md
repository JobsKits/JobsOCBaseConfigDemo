# `calls 符号关系 - 077`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionNode::onDidFinishSynchronizing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1019"]
  T1["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S1 -->|calls| T1
  S2["method:ASCollectionNode::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1041"]
  T2["method:ASCollectionNode::waitUntilAllUpdatesAreProcessed<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1031"]
  S2 -->|calls| T2
  S3["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  T3["method:ASCollectionNode::performBatchUpdates:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:992"]
  S3 -->|calls| T3
  S4["method:ASCollectionNode::reloadDataWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1047"]
  T4["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S4 -->|calls| T4
  S5["method:ASCollectionNode::endUpdatesAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1086"]
  T5["method:ASCollectionNode::endUpdatesAnimated:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1091"]
  S5 -->|calls| T5
  S6["method:ASCollectionNode::updateCurrentRangeWithMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1173"]
  T6["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S6 -->|calls| T6
  S7["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  T7["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  S7 -->|calls| T7
  S8["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  T8["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S8 -->|calls| T8
  S9["method:ASCollectionNode::propertiesForDebugDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1188"]
  T9["function:ASObjectDescriptionMakeTiny<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:87"]
  S9 -->|calls| T9
  S10["method:ASCollectionNode::_configureCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1230"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:ASCollectionNode::_configureCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:1230"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.h:1"]
  T12["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["method:ASCollectionView::layerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:259"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:ASCollectionView::initWithCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:267"]
  T14["method:ASCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:272"]
  S14 -->|calls| T14
  S15["method:ASCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:272"]
  T15["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  S15 -->|calls| T15
  S16["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T16["method:ASCollectionView::initWithFrame:collectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:272"]
  S16 -->|calls| T16
  S17["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T17["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S17 -->|calls| T17
  S18["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T18["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  S18 -->|calls| T18
  S19["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T20["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S20 -->|calls| T20
  S21["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T21["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S21 -->|calls| T21
  S22["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T22["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S22 -->|calls| T22
  S23["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASCollectionView::_initWithFrame:collectionViewLayout:layoutFacilitator:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:277"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:ASCollectionView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:351"]
  T25["method:ASCollectionView::_superReloadData:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:878"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
