# `calls 符号关系 - 171`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASLayout::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:255"]
  T1["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S1 -->|calls| T1
  S2["method:ASLayout::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:255"]
  T2["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S2 -->|calls| T2
  S3["method:ASLayout::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:324"]
  T3["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S3 -->|calls| T3
  S4["method:ASLayout::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:340"]
  T4["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S4 -->|calls| T4
  S5["method:ASLayout::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:340"]
  T5["method:ASLayout::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:324"]
  S5 -->|calls| T5
  S6["method:ASLayout::recursiveDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:345"]
  T6["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  S6 -->|calls| T6
  S7["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T7["function:descriptionIndents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:34"]
  S7 -->|calls| T7
  S8["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T8["method:NSLayoutConstraint::description<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/NSLayoutConstraint+MASDebugAdditions.m:102"]
  S8 -->|calls| T8
  S9["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  T9["method:ASLayout::_recursiveDescriptionForLayout:level:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:350"]
  S9 -->|calls| T9
  S10["function:ASCalculateRootLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:371"]
  T10["function:ASCalculateLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:364"]
  S10 -->|calls| T10
  S11["method:ASLayoutElementContext::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:25"]
  T11["method:ASLayoutElementContext::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:25"]
  S11 -->|calls| T11
  S12["function:ASLayoutElementPushContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:76"]
  T12["function:ASLayoutElementContextKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:68"]
  S12 -->|calls| T12
  S13["function:ASLayoutElementPushContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:76"]
  T13["function:ASLayoutElementContextKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:68"]
  S13 -->|calls| T13
  S14["function:ASLayoutElementPopContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:92"]
  T14["function:ASLayoutElementContextKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:68"]
  S14 -->|calls| T14
  S15["method:ASLayoutElementStyle::initWithDelegate:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:195"]
  T15["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  S15 -->|calls| T15
  S16["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  T16["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  S16 -->|calls| T16
  S17["method:ASLayoutElementStyle::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:204"]
  T17["function:ASLayoutElementSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:39"]
  S17 -->|calls| T17
  S18["method:ASLayoutElementStyle::setPreferredSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:320"]
  T18["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S18 -->|calls| T18
  S19["method:ASLayoutElementStyle::setPreferredSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:320"]
  T19["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S19 -->|calls| T19
  S20["method:ASLayoutElementStyle::preferredSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:332"]
  T20["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S20 -->|calls| T20
  S21["method:ASLayoutElementStyle::preferredSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:332"]
  T21["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S21 -->|calls| T21
  S22["method:ASLayoutElementStyle::setMinSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:348"]
  T22["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S22 -->|calls| T22
  S23["method:ASLayoutElementStyle::setMinSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:348"]
  T23["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S23 -->|calls| T23
  S24["method:ASLayoutElementStyle::setMaxSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:360"]
  T24["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S24 -->|calls| T24
  S25["method:ASLayoutElementStyle::setMaxSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:360"]
  T25["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
