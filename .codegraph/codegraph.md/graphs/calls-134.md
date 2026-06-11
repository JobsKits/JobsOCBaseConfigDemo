# `calls 符号关系 - 134`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:134"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:_ASTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:143"]
  T2["method:_ASTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:143"]
  S2 -->|calls| T2
  S3["method:_ASTableViewCell::setHighlighted:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:149"]
  T3["method:_ASTableViewCell::setHighlighted:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:149"]
  S3 -->|calls| T3
  S4["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:155"]
  T4["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:155"]
  S4 -->|calls| T4
  S5["method:ASTableView::layerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:295"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:ASTableView::dataControllerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:300"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:308"]
  T7["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  S7 -->|calls| T7
  S8["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T8["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:308"]
  S8 -->|calls| T8
  S9["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T9["method:ASTableView::dataControllerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:300"]
  S9 -->|calls| T9
  S10["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T11["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S11 -->|calls| T11
  S12["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T12["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  S12 -->|calls| T12
  S13["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T13["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S13 -->|calls| T13
  S14["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T14["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S14 -->|calls| T14
  S15["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T15["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S15 -->|calls| T15
  S16["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T16["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S16 -->|calls| T16
  S17["method:ASTableView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:358"]
  T17["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:308"]
  S17 -->|calls| T17
  S18["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:397"]
  T18["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S18 -->|calls| T18
  S19["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:397"]
  T19["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S19 -->|calls| T19
  S20["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:397"]
  T20["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:513"]
  S20 -->|calls| T20
  S21["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:447"]
  T21["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S21 -->|calls| T21
  S22["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:447"]
  T22["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S22 -->|calls| T22
  S23["method:ASTableView::setAsyncDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:447"]
  T23["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:513"]
  S23 -->|calls| T23
  S24["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:513"]
  T24["method:ASDataController::clearData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:955"]
  S24 -->|calls| T24
  S25["method:ASTableView::reloadDataWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:531"]
  T25["method:ASTableView::reloadData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:552"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
