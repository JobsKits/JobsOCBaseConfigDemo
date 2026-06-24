# `calls 符号关系 - 181`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASLayoutElementStyle::preferredSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:332"]
  T1["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S1 -->|calls| T1
  S2["method:ASLayoutElementStyle::preferredSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:332"]
  T2["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S2 -->|calls| T2
  S3["method:ASLayoutElementStyle::setMinSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:348"]
  T3["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S3 -->|calls| T3
  S4["method:ASLayoutElementStyle::setMinSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:348"]
  T4["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S4 -->|calls| T4
  S5["method:ASLayoutElementStyle::setMaxSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:360"]
  T5["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S5 -->|calls| T5
  S6["method:ASLayoutElementStyle::setMaxSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:360"]
  T6["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S6 -->|calls| T6
  S7["method:ASLayoutElementStyle::preferredLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:372"]
  T7["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S7 -->|calls| T7
  S8["method:ASLayoutElementStyle::minLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:390"]
  T8["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S8 -->|calls| T8
  S9["method:ASLayoutElementStyle::maxLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:408"]
  T9["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S9 -->|calls| T9
  S10["method:ASLayoutElementStyle::setFlexBasis:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:476"]
  T10["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S10 -->|calls| T10
  S11["method:ASLayoutElementStyle::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:590"]
  T11["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S11 -->|calls| T11
  S12["method:ASLayoutElementStyle::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:590"]
  T12["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  S12 -->|calls| T12
  S13["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T13["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S13 -->|calls| T13
  S14["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T14["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S14 -->|calls| T14
  S15["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T15["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S15 -->|calls| T15
  S16["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T16["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S16 -->|calls| T16
  S17["method:ASLayoutElementStyle::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:595"]
  T17["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S17 -->|calls| T17
  S18["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T18["function:yogaAlignSelf<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:86"]
  S18 -->|calls| T18
  S19["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T19["function:yogaFlexDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:97"]
  S19 -->|calls| T19
  S20["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T20["function:yogaJustifyContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:75"]
  S20 -->|calls| T20
  S21["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T21["function:yogaAlignItems<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:61"]
  S21 -->|calls| T21
  S22["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T22["function:dimensionForEdgeWithEdgeInsets<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:140"]
  S22 -->|calls| T22
  S23["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T23["function:dimensionForEdgeWithEdgeInsets<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:140"]
  S23 -->|calls| T23
  S24["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T24["function:dimensionForEdgeWithEdgeInsets<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:140"]
  S24 -->|calls| T24
  S25["method:ASLayoutElementStyle::propertyDidChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:657"]
  T25["function:dimensionForEdgeWithEdgeInsets<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:140"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
