# `calls 符号关系 - 186`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:descriptionIndents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:34"]
  T1["method:NSArray::string<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:37"]
  S1 -->|calls| T1
  S2["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S2 -->|calls| T2
  S3["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T3["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S3 -->|calls| T3
  S4["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T4["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S4 -->|calls| T4
  S5["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T5["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S5 -->|calls| T5
  S6["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T6["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S6 -->|calls| T6
  S7["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T7["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S7 -->|calls| T7
  S8["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T8["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  S8 -->|calls| T8
  S9["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T9["method:ASLayout::shouldRetainSublayoutLayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:69"]
  S9 -->|calls| T9
  S10["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T10["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S10 -->|calls| T10
  S11["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  T11["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  S11 -->|calls| T11
  S12["method:ASLayout::layoutWithLayoutElement:size:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:131"]
  T12["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  S12 -->|calls| T12
  S13["method:ASLayout::layoutWithLayoutElement:size:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:141"]
  T13["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  S13 -->|calls| T13
  S14["method:ASLayout::isFlattened<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  T14["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S14 -->|calls| T14
  S15["method:ASLayout::isFlattened<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  T15["function:ASLayoutIsDisplayNodeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:46"]
  S15 -->|calls| T15
  S16["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T16["method:ASLayout::isFlattened<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  S16 -->|calls| T16
  S17["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T17["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S17 -->|calls| T17
  S18["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T18["function:ASLayoutIsDisplayNodeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:46"]
  S18 -->|calls| T18
  S19["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T19["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  S19 -->|calls| T19
  S20["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T20["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S20 -->|calls| T20
  S21["method:ASLayout::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:255"]
  T21["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S21 -->|calls| T21
  S22["method:ASLayout::isEqual:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:255"]
  T22["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S22 -->|calls| T22
  S23["method:ASLayout::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:324"]
  T23["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S23 -->|calls| T23
  S24["method:ASLayout::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:340"]
  T24["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S24 -->|calls| T24
  S25["method:ASLayout::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:340"]
  T25["method:ASLayout::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:324"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
