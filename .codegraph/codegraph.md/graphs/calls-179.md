# `calls 符号关系 - 179`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T1["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S1 -->|calls| T1
  S2["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T2["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S2 -->|calls| T2
  S3["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T3["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S3 -->|calls| T3
  S4["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T4["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S4 -->|calls| T4
  S5["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T5["function:ASLayoutElementSizeConstrain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:23"]
  S5 -->|calls| T5
  S6["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T6["function:ASLayoutElementSizeConstrain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:23"]
  S6 -->|calls| T6
  S7["function:finiteOrZero<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:29"]
  T7["function:finite<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S7 -->|calls| T7
  S8["function:centerInset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:35"]
  T8["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S8 -->|calls| T8
  S9["function:initWithInsets:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:42"]
  T9["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S9 -->|calls| T9
  S10["function:insetLayoutSpecWithInsets:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:53"]
  T10["function:initWithInsets:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:42"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:1"]
  T11["function:finite<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S11 -->|calls| T11
  S12["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:1"]
  T12["function:finite<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S12 -->|calls| T12
  S13["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T13["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S13 -->|calls| T13
  S14["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T14["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S14 -->|calls| T14
  S15["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T15["function:ASIsCGSizeValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:35"]
  S15 -->|calls| T15
  S16["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T16["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S16 -->|calls| T16
  S17["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T17["function:ASCeilPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:244"]
  S17 -->|calls| T17
  S18["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T18["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S18 -->|calls| T18
  S19["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T19["function:ASCeilPointValues<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:215"]
  S19 -->|calls| T19
  S20["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T20["method:ASLayout::shouldRetainSublayoutLayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:69"]
  S20 -->|calls| T20
  S21["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  T21["method:ASLayout::retainSublayoutElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:163"]
  S21 -->|calls| T21
  S22["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  T22["method:ASLayout::initWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:74"]
  S22 -->|calls| T22
  S23["method:ASLayout::layoutWithLayoutElement:size:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:131"]
  T23["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  S23 -->|calls| T23
  S24["method:ASLayout::layoutWithLayoutElement:size:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:141"]
  T24["method:ASLayout::layoutWithLayoutElement:size:position:sublayouts:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:120"]
  S24 -->|calls| T24
  S25["method:ASLayout::isFlattened<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:177"]
  T25["function:ASPointIsNull<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayout.mm:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
