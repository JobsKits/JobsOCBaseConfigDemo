# `calls 符号关系 - 181`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T1["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T2["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T3["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T4["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T5["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T6["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S6 -->|calls| T6
  S7["method:ASStackLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:24"]
  T7["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  S7 -->|calls| T7
  S8["method:ASStackLayoutSpec::stackLayoutSpecWithDirection:spacing:justifyContent:alignItems:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:29"]
  T8["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  S8 -->|calls| T8
  S9["method:ASStackLayoutSpec::stackLayoutSpecWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:34"]
  T9["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  S9 -->|calls| T9
  S10["method:ASStackLayoutSpec::stackLayoutSpecWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:39"]
  T10["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  S10 -->|calls| T10
  S11["method:ASStackLayoutSpec::verticalStackLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:44"]
  T11["method:ASStackLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:24"]
  S11 -->|calls| T11
  S12["method:ASStackLayoutSpec::horizontalStackLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:51"]
  T12["method:ASStackLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:24"]
  S12 -->|calls| T12
  S13["method:ASStackLayoutSpec::initWithDirection:spacing:justifyContent:alignItems:flexWrap:alignContent:lineSpacing:children:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:58"]
  T13["method:ASStackLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:24"]
  S13 -->|calls| T13
  S14["method:ASStackLayoutSpec::setDirection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:77"]
  T14["method:ASStackLayoutSpec::resolveHorizontalAlignment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:163"]
  S14 -->|calls| T14
  S15["method:ASStackLayoutSpec::setDirection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:77"]
  T15["method:ASStackLayoutSpec::resolveVerticalAlignment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:172"]
  S15 -->|calls| T15
  S16["method:ASStackLayoutSpec::setHorizontalAlignment:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:87"]
  T16["method:ASStackLayoutSpec::resolveHorizontalAlignment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:163"]
  S16 -->|calls| T16
  S17["method:ASStackLayoutSpec::setVerticalAlignment:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:96"]
  T17["method:ASStackLayoutSpec::resolveVerticalAlignment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:172"]
  S17 -->|calls| T17
  S18["method:ASStackLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:127"]
  T18["function:ASLayoutLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:33"]
  S18 -->|calls| T18
  S19["method:ASStackLayoutSpec::resolveHorizontalAlignment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:163"]
  T19["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S19 -->|calls| T19
  S20["method:ASStackLayoutSpec::resolveVerticalAlignment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:172"]
  T20["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S20 -->|calls| T20
  S21["method:ASStackLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:181"]
  T21["method:ASStackLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:181"]
  S21 -->|calls| T21
  S22["method:ASStackLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutSpec.mm:211"]
  T22["method:ASLayoutSpec::asciiArtName<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:248"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  T23["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::yogaSpacerNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:23"]
  T24["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::yogaVerticalStack<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:30"]
  T25["method:ASDisplayNode::yogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
