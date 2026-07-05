# `calls 符号关系 - 075`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionNode::setInverted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:437"]
  T1["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S1 -->|calls| T1
  S2["method:ASCollectionNode::inverted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:448"]
  T2["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S2 -->|calls| T2
  S3["method:ASCollectionNode::setLayoutInspector:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:457"]
  T3["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S3 -->|calls| T3
  S4["method:ASCollectionNode::layoutInspector<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:467"]
  T4["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S4 -->|calls| T4
  S5["method:ASCollectionNode::setLeadingScreensForBatching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:476"]
  T5["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S5 -->|calls| T5
  S6["method:ASCollectionNode::leadingScreensForBatching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:486"]
  T6["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S6 -->|calls| T6
  S7["method:ASCollectionNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:495"]
  T7["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S7 -->|calls| T7
  S8["method:ASCollectionNode::setDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:495"]
  T8["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S8 -->|calls| T8
  S9["method:ASCollectionNode::delegate<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:513"]
  T9["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S9 -->|calls| T9
  S10["method:ASCollectionNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:522"]
  T10["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S10 -->|calls| T10
  S11["method:ASCollectionNode::setDataSource:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:522"]
  T11["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S11 -->|calls| T11
  S12["method:ASCollectionNode::dataSource<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:539"]
  T12["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S12 -->|calls| T12
  S13["method:ASCollectionNode::setAllowsSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:548"]
  T13["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S13 -->|calls| T13
  S14["method:ASCollectionNode::allowsSelection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:558"]
  T14["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S14 -->|calls| T14
  S15["method:ASCollectionNode::setAllowsMultipleSelection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:567"]
  T15["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S15 -->|calls| T15
  S16["method:ASCollectionNode::allowsMultipleSelection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:577"]
  T16["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S16 -->|calls| T16
  S17["method:ASCollectionNode::setAlwaysBounceVertical:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:586"]
  T17["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S17 -->|calls| T17
  S18["method:ASCollectionNode::alwaysBounceVertical<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:596"]
  T18["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S18 -->|calls| T18
  S19["method:ASCollectionNode::setAlwaysBounceHorizontal:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:605"]
  T19["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S19 -->|calls| T19
  S20["method:ASCollectionNode::alwaysBounceHorizontal<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:615"]
  T20["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S20 -->|calls| T20
  S21["method:ASCollectionNode::setShowsVerticalScrollIndicator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:624"]
  T21["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S21 -->|calls| T21
  S22["method:ASCollectionNode::showsVerticalScrollIndicator<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:634"]
  T22["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S22 -->|calls| T22
  S23["method:ASCollectionNode::setShowsHorizontalScrollIndicator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:643"]
  T23["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S23 -->|calls| T23
  S24["method:ASCollectionNode::showsHorizontalScrollIndicator<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:653"]
  T24["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S24 -->|calls| T24
  S25["method:ASCollectionNode::setPagingEnabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:663"]
  T25["method:ASCollectionNode::pendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:428"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
