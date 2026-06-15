# `calls 符号关系 - 128`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:_ASTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:86"]
  T1["method:_ASTableViewCell::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:86"]
  S1 -->|calls| T1
  S2["method:_ASTableViewCell::didTransitionToState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:92"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["method:_ASTableViewCell::didTransitionToState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:92"]
  T3["method:ASDisplayNode::layoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:481"]
  S3 -->|calls| T3
  S4["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:134"]
  T4["function:ASSubclassOverridesSelector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:98"]
  S4 -->|calls| T4
  S5["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:134"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:_ASTableViewCell::consumesCellNodeVisibilityEvents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:134"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:_ASTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:143"]
  T7["method:_ASTableViewCell::setSelected:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:143"]
  S7 -->|calls| T7
  S8["method:_ASTableViewCell::setHighlighted:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:149"]
  T8["method:_ASTableViewCell::setHighlighted:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:149"]
  S8 -->|calls| T8
  S9["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:155"]
  T9["method:_ASTableViewCell::prepareForReuse<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:155"]
  S9 -->|calls| T9
  S10["method:ASTableView::layerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:295"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:ASTableView::dataControllerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:300"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:308"]
  T12["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  S12 -->|calls| T12
  S13["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T13["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:308"]
  S13 -->|calls| T13
  S14["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T14["method:ASTableView::dataControllerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:300"]
  S14 -->|calls| T14
  S15["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T16["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S16 -->|calls| T16
  S17["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T17["method:ASDataController::initWithDataSource:node:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDataController.mm:83"]
  S17 -->|calls| T17
  S18["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T19["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S19 -->|calls| T19
  S20["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T20["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S20 -->|calls| T20
  S21["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  T21["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S21 -->|calls| T21
  S22["method:ASTableView::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:358"]
  T22["method:ASTableView::initWithFrame:style:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:308"]
  S22 -->|calls| T22
  S23["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:397"]
  T23["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S23 -->|calls| T23
  S24["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:397"]
  T24["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  S24 -->|calls| T24
  S25["method:ASTableView::setAsyncDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:397"]
  T25["method:ASTableView::_asyncDelegateOrDataSourceDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:513"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
