# `calls 符号关系 - 086`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T1["method:ASRangeController::updateRanges<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASRangeController.mm:151"]
  S1 -->|calls| T1
  S2["method:ASCollectionView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2423"]
  T2["method:ASCollectionView::_checkForBatchFetching<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:1864"]
  S2 -->|calls| T2
  S3["method:ASCollectionView::layer:didChangeBoundsWithOldValue:newValue:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2486"]
  T3["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S3 -->|calls| T3
  S4["method:ASCollectionView::layer:didChangeBoundsWithOldValue:newValue:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2486"]
  T4["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S4 -->|calls| T4
  S5["method:ASCollectionView::layer:didChangeBoundsWithOldValue:newValue:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2486"]
  T5["method:ASCollectionView::relayoutItems<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:372"]
  S5 -->|calls| T5
  S6["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  T6["method:ASCollectionView::waitUntilAllUpdatesAreCommitted<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:390"]
  S6 -->|calls| T6
  S7["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  T7["method:ASCollectionView::accessibilityElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionView.mm:2531"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T8["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T9["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T10["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T11["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T12["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T13["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T14["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T15["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T16["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T17["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T18["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T19["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T20["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T21["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionViewProtocols.h:1"]
  T22["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASConfiguration.h:1"]
  T25["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
