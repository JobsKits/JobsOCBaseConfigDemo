# `calls 符号关系 - 014`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:BEMCheckBox::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:58"]
  T1["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  S1 -->|calls| T1
  S2["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  T2["method:BEMCheckBox::initPathManager<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:87"]
  S2 -->|calls| T2
  S3["method:BEMCheckBox::commonInit<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:64"]
  T3["method:BEMCheckBox::initAnimationManager<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:94"]
  S3 -->|calls| T3
  S4["method:BEMCheckBox::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:98"]
  T4["method:BEMCheckBox::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:98"]
  S4 -->|calls| T4
  S5["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  T6["method:ASDisplayNode::layoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:481"]
  S6 -->|calls| T6
  S7["method:BEMCheckBox::_setOn:animated:notifyGroup:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:123"]
  T7["method:BEMCheckBox::drawEntireCheckBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:250"]
  S7 -->|calls| T7
  S8["method:BEMCheckBox::_setOn:animated:notifyGroup:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:123"]
  T8["method:BEMCheckBox::addOnAnimation<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:314"]
  S8 -->|calls| T8
  S9["method:BEMCheckBox::_setOn:animated:notifyGroup:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:123"]
  T9["method:BEMCheckBox::addOffAnimation<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:401"]
  S9 -->|calls| T9
  S10["method:BEMCheckBox::setOn:animated:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:146"]
  T10["method:BEMCheckBox::_setOn:animated:notifyGroup:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:123"]
  S10 -->|calls| T10
  S11["method:BEMCheckBox::setOn:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:150"]
  T11["method:BEMCheckBox::setOn:animated:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:146"]
  S11 -->|calls| T11
  S12["method:BEMCheckBox::setBoxType:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:159"]
  T12["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S12 -->|calls| T12
  S13["method:BEMCheckBox::setLineWidth:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:165"]
  T13["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S13 -->|calls| T13
  S14["method:BEMCheckBox::setCornerRadius:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:171"]
  T14["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S14 -->|calls| T14
  S15["method:BEMCheckBox::setTintColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:181"]
  T15["method:BEMCheckBox::drawOffBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:266"]
  S15 -->|calls| T15
  S16["method:BEMCheckBox::setOnTintColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:186"]
  T16["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S16 -->|calls| T16
  S17["method:BEMCheckBox::setOnFillColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:191"]
  T17["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S17 -->|calls| T17
  S18["method:BEMCheckBox::setOffFillColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:196"]
  T18["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S18 -->|calls| T18
  S19["method:BEMCheckBox::setOnCheckColor:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:201"]
  T19["method:BEMCheckBox::reload<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:108"]
  S19 -->|calls| T19
  S20["method:BEMCheckBox::handleTapCheckBox:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:207"]
  T20["method:BEMCheckBox::setOn:animated:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:146"]
  S20 -->|calls| T20
  S21["method:BEMCheckBox::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:223"]
  T21["method:BEMCheckBox::pointInside:withEvent:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:223"]
  S21 -->|calls| T21
  S22["method:BEMCheckBox::drawRect:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:244"]
  T22["method:BEMCheckBox::setOn:animated:<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:146"]
  S22 -->|calls| T22
  S23["method:BEMCheckBox::drawEntireCheckBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:250"]
  T23["method:BEMCheckBox::drawOffBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:266"]
  S23 -->|calls| T23
  S24["method:BEMCheckBox::drawEntireCheckBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:250"]
  T24["method:BEMCheckBox::drawOnBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:282"]
  S24 -->|calls| T24
  S25["method:BEMCheckBox::drawEntireCheckBox<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:250"]
  T25["method:BEMCheckBox::drawCheckMark<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBox/BEMCheckBox.m:297"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
