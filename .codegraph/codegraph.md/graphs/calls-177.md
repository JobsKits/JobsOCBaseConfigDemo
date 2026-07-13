# `calls 符号关系 - 177`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASLayout::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:340"]
  T1["method:ASLayout::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:324"]
  S1 -->|calls| T1
  S2["method:ASLayout::recursiveDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:345"]
  T2["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  S2 -->|calls| T2
  S3["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T3["function:descriptionIndents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:34"]
  S3 -->|calls| T3
  S4["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T4["method:NSLayoutConstraint::description<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/NSLayoutConstraint+MASDebugAdditions.m:102"]
  S4 -->|calls| T4
  S5["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T5["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  S5 -->|calls| T5
  S6["function:ASCalculateRootLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:371"]
  T6["function:ASCalculateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:364"]
  S6 -->|calls| T6
  S7["method:ASLayoutElementContext::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:25"]
  T7["method:ASLayoutElementContext::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:25"]
  S7 -->|calls| T7
  S8["function:ASLayoutElementPushContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:76"]
  T8["function:ASLayoutElementContextKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:68"]
  S8 -->|calls| T8
  S9["function:ASLayoutElementPushContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:76"]
  T9["function:ASLayoutElementContextKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:68"]
  S9 -->|calls| T9
  S10["function:ASLayoutElementPopContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:92"]
  T10["function:ASLayoutElementContextKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:68"]
  S10 -->|calls| T10
  S11["method:ASLayoutElementStyle::initWithDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:195"]
  T11["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  S11 -->|calls| T11
  S12["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  T12["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  S12 -->|calls| T12
  S13["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  T13["function:ASLayoutElementSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:39"]
  S13 -->|calls| T13
  S14["method:ASLayoutElementStyle::setPreferredSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:320"]
  T14["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S14 -->|calls| T14
  S15["method:ASLayoutElementStyle::setPreferredSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:320"]
  T15["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S15 -->|calls| T15
  S16["method:ASLayoutElementStyle::preferredSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:332"]
  T16["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S16 -->|calls| T16
  S17["method:ASLayoutElementStyle::preferredSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:332"]
  T17["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S17 -->|calls| T17
  S18["method:ASLayoutElementStyle::setMinSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:348"]
  T18["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S18 -->|calls| T18
  S19["method:ASLayoutElementStyle::setMinSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:348"]
  T19["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S19 -->|calls| T19
  S20["method:ASLayoutElementStyle::setMaxSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:360"]
  T20["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S20 -->|calls| T20
  S21["method:ASLayoutElementStyle::setMaxSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:360"]
  T21["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S21 -->|calls| T21
  S22["method:ASLayoutElementStyle::preferredLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:372"]
  T22["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S22 -->|calls| T22
  S23["method:ASLayoutElementStyle::minLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:390"]
  T23["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S23 -->|calls| T23
  S24["method:ASLayoutElementStyle::maxLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:408"]
  T24["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S24 -->|calls| T24
  S25["method:ASLayoutElementStyle::setFlexBasis:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:476"]
  T25["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
