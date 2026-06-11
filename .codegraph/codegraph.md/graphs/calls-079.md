# `calls 符号关系 - 079`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASButtonNode::titleNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:50"]
  T1["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S1 -->|calls| T1
  S2["method:ASButtonNode::imageNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:70"]
  T2["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S2 -->|calls| T2
  S3["method:ASButtonNode::backgroundImageNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:80"]
  T3["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S3 -->|calls| T3
  S4["method:ASButtonNode::setEnabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:97"]
  T4["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  S4 -->|calls| T4
  S5["method:ASButtonNode::setHighlighted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:106"]
  T5["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  S5 -->|calls| T5
  S6["method:ASButtonNode::setSelected:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:114"]
  T6["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  S6 -->|calls| T6
  S7["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  T7["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  S7 -->|calls| T7
  S8["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  T8["method:ASButtonNode::updateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  S8 -->|calls| T8
  S9["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  T9["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  S9 -->|calls| T9
  S10["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  T10["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  S10 -->|calls| T10
  S11["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  T11["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S11 -->|calls| T11
  S12["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  T12["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S12 -->|calls| T12
  S13["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  T13["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S13 -->|calls| T13
  S14["method:ASButtonNode::updateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T14["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S14 -->|calls| T14
  S15["method:ASButtonNode::updateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T15["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S15 -->|calls| T15
  S16["method:ASButtonNode::updateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T16["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S16 -->|calls| T16
  S17["method:ASButtonNode::updateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T17["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S17 -->|calls| T17
  S18["method:ASButtonNode::updateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  T18["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S18 -->|calls| T18
  S19["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T19["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S19 -->|calls| T19
  S20["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T20["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S20 -->|calls| T20
  S21["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T21["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S21 -->|calls| T21
  S22["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T22["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S22 -->|calls| T22
  S23["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  T23["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S23 -->|calls| T23
  S24["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T24["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S24 -->|calls| T24
  S25["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T25["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
