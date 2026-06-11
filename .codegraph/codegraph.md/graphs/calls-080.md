# `calls 符号关系 - 080`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T1["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S1 -->|calls| T1
  S2["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T2["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S2 -->|calls| T2
  S3["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  T3["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S3 -->|calls| T3
  S4["method:ASButtonNode::setContentSpacing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:247"]
  T4["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S4 -->|calls| T4
  S5["method:ASButtonNode::setContentSpacing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:247"]
  T5["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S5 -->|calls| T5
  S6["method:ASButtonNode::setLaysOutHorizontally:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:261"]
  T6["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S6 -->|calls| T6
  S7["method:ASButtonNode::setLaysOutHorizontally:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:261"]
  T7["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S7 -->|calls| T7
  S8["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  T8["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S8 -->|calls| T8
  S9["method:ASButtonNode::setTitle:withFont:withColor:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:319"]
  T9["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S9 -->|calls| T9
  S10["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  T10["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  S10 -->|calls| T10
  S11["method:ASButtonNode::setImage:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:414"]
  T11["method:ASButtonNode::updateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  S11 -->|calls| T11
  S12["method:ASButtonNode::setBackgroundImage:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:471"]
  T12["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  S12 -->|calls| T12
  S13["method:ASButtonNode::layoutSpecThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:520"]
  T13["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S13 -->|calls| T13
  S14["method:ASButtonNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  T14["method:ASButtonNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:566"]
  S14 -->|calls| T14
  S15["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h:1"]
  T15["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S15 -->|calls| T15
  S16["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h:1"]
  T16["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.h:1"]
  T17["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S17 -->|calls| T17
  S18["method:ASCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:48"]
  T18["method:ASCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S18 -->|calls| T18
  S19["method:ASCellNode::initWithViewControllerBlock:didLoadBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:61"]
  T19["method:ASCellNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:48"]
  S19 -->|calls| T19
  S20["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  T20["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  S20 -->|calls| T20
  S21["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:ASCellNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:73"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:ASCellNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:105"]
  T23["method:ASCellNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:105"]
  S23 -->|calls| T23
  S24["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:112"]
  T24["method:ASCellNode::_rootNodeDidInvalidateSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:112"]
  S24 -->|calls| T24
  S25["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:121"]
  T25["method:ASCellNode::_layoutTransitionMeasurementDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCellNode.mm:121"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
