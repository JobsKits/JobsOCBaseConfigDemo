# `calls 符号关系 - 060`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:412"]
  T1["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S1 -->|calls| T1
  S2["method:ASTextCellNode::initWithAttributes:insets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:412"]
  T2["method:ASTextCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:407"]
  S2 -->|calls| T2
  S3["method:ASTextCellNode::setTextAttributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:444"]
  T3["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:478"]
  S3 -->|calls| T3
  S4["method:ASTextCellNode::setTextInsets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:458"]
  T4["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S4 -->|calls| T4
  S5["method:ASTextCellNode::setText:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:470"]
  T5["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:478"]
  S5 -->|calls| T5
  S6["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:478"]
  T6["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S6 -->|calls| T6
  S7["method:ASTextCellNode::locked_updateAttributedText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:478"]
  T7["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:1"]
  T8["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T9["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T10["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T11["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T12["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S12 -->|calls| T12
  S13["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T13["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T14["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T15["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T16["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T17["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T18["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S18 -->|calls| T18
  S19["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T19["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T20["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T21["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
