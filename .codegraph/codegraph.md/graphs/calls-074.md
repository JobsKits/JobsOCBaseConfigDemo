# `calls 符号关系 - 074`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T1["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S1 -->|calls| T1
  S2["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T3["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S3 -->|calls| T3
  S4["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T4["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S4 -->|calls| T4
  S5["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T5["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S5 -->|calls| T5
  S6["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T6["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S6 -->|calls| T6
  S7["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T7["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S7 -->|calls| T7
  S8["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T8["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S8 -->|calls| T8
  S9["method:ASButtonNode::setContentSpacing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:247"]
  T9["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S9 -->|calls| T9
  S10["method:ASButtonNode::setContentSpacing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:247"]
  T10["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S10 -->|calls| T10
  S11["method:ASButtonNode::setLaysOutHorizontally:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:261"]
  T11["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S11 -->|calls| T11
  S12["method:ASButtonNode::setLaysOutHorizontally:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:261"]
  T12["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S12 -->|calls| T12
  S13["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  T13["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S13 -->|calls| T13
  S14["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  T14["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S14 -->|calls| T14
  S15["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  T15["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  S15 -->|calls| T15
  S16["method:ASButtonNode::setImage:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:414"]
  T16["method:ASButtonNode::updateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  S16 -->|calls| T16
  S17["method:ASButtonNode::setBackgroundImage:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:471"]
  T17["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  S17 -->|calls| T17
  S18["method:ASButtonNode::layoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:520"]
  T18["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S18 -->|calls| T18
  S19["method:ASButtonNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  T19["method:ASButtonNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h:1"]
  T20["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h:1"]
  T21["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["method:ASCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:48"]
  T23["method:ASCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S23 -->|calls| T23
  S24["method:ASCellNode::initWithViewControllerBlock:didLoadBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:61"]
  T24["method:ASCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S24 -->|calls| T24
  S25["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  T25["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
