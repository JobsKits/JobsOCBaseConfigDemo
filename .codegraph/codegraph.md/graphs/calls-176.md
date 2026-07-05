# `calls 符号关系 - 176`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:finiteOrZero<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:29"]
  T1["function:finite<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S1 -->|calls| T1
  S2["function:centerInset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:35"]
  T2["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S2 -->|calls| T2
  S3["function:initWithInsets:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:42"]
  T3["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S3 -->|calls| T3
  S4["function:insetLayoutSpecWithInsets:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:53"]
  T4["function:initWithInsets:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:42"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:1"]
  T5["function:finite<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:1"]
  T6["function:finite<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S6 -->|calls| T6
  S7["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T7["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S7 -->|calls| T7
  S8["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T8["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S8 -->|calls| T8
  S9["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T9["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S9 -->|calls| T9
  S10["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T10["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S10 -->|calls| T10
  S11["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T11["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S11 -->|calls| T11
  S12["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T12["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S12 -->|calls| T12
  S13["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T13["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  S13 -->|calls| T13
  S14["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T14["method:ASLayout::shouldRetainSublayoutLayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:69"]
  S14 -->|calls| T14
  S15["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T15["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S15 -->|calls| T15
  S16["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  T16["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  S16 -->|calls| T16
  S17["method:ASLayout::layoutWithLayoutElement:size:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:131"]
  T17["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  S17 -->|calls| T17
  S18["method:ASLayout::layoutWithLayoutElement:size:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:141"]
  T18["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  S18 -->|calls| T18
  S19["method:ASLayout::isFlattened<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  T19["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S19 -->|calls| T19
  S20["method:ASLayout::isFlattened<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  T20["function:ASLayoutIsDisplayNodeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:46"]
  S20 -->|calls| T20
  S21["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T21["method:ASLayout::isFlattened<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  S21 -->|calls| T21
  S22["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T22["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S22 -->|calls| T22
  S23["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T23["function:ASLayoutIsDisplayNodeType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:46"]
  S23 -->|calls| T23
  S24["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T24["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  S24 -->|calls| T24
  S25["method:ASLayout::filteredNodeLayoutTree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:193"]
  T25["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
