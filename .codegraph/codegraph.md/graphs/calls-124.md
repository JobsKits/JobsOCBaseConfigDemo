# `calls 符号关系 - 124`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTableNode::initWithStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:114"]
  T1["method:ASTableView::_initWithFrame:style:dataControllerClass:owningNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableView.mm:313"]
  S1 -->|calls| T1
  S2["method:ASTableNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:133"]
  T2["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S2 -->|calls| T2
  S3["method:ASTableNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:146"]
  T3["method:ASTableNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:146"]
  S3 -->|calls| T3
  S4["method:ASTableNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:200"]
  T4["method:ASTableNode::view<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:200"]
  S4 -->|calls| T4
  S5["method:ASTableNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:205"]
  T5["method:ASTableNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:205"]
  S5 -->|calls| T5
  S6["method:ASTableNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:211"]
  T6["method:ASTableNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:211"]
  S6 -->|calls| T6
  S7["method:ASTableNode::interfaceStateDidChange:fromState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:211"]
  T7["method:ASRangeController::layoutDebugOverlayIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Debug.mm:254"]
  S7 -->|calls| T7
  S8["method:ASTableNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:217"]
  T8["method:ASTableNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:217"]
  S8 -->|calls| T8
  S9["method:ASTableNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:226"]
  T9["method:ASTableNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:226"]
  S9 -->|calls| T9
  S10["method:ASTableNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:232"]
  T10["method:ASTableNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:232"]
  S10 -->|calls| T10
  S11["method:ASTableNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:239"]
  T11["method:ASTableNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:239"]
  S11 -->|calls| T11
  S12["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  T12["method:ASTableNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:127"]
  S12 -->|calls| T12
  S13["method:ASTableNode::setInverted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:262"]
  T13["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S13 -->|calls| T13
  S14["method:ASTableNode::inverted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:273"]
  T14["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S14 -->|calls| T14
  S15["method:ASTableNode::setContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:324"]
  T15["method:ASTableNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:329"]
  S15 -->|calls| T15
  S16["method:ASTableNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:396"]
  T16["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S16 -->|calls| T16
  S17["method:ASTableNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:396"]
  T17["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S17 -->|calls| T17
  S18["method:ASTableNode::delegate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:414"]
  T18["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S18 -->|calls| T18
  S19["method:ASTableNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:423"]
  T19["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S19 -->|calls| T19
  S20["method:ASTableNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:423"]
  T20["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S20 -->|calls| T20
  S21["method:ASTableNode::dataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:441"]
  T21["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S21 -->|calls| T21
  S22["method:ASTableNode::setAllowsSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:451"]
  T22["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S22 -->|calls| T22
  S23["method:ASTableNode::allowsSelection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:461"]
  T23["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S23 -->|calls| T23
  S24["method:ASTableNode::setAllowsSelectionDuringEditing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:470"]
  T24["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S24 -->|calls| T24
  S25["method:ASTableNode::allowsSelectionDuringEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:480"]
  T25["method:ASTableNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTableNode.mm:253"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
