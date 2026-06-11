# `calls 符号关系 - 184`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  T1["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S1 -->|calls| T1
  S2["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  T2["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S2 -->|calls| T2
  S3["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  T3["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:1"]
  T4["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S4 -->|calls| T4
  S5["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  T5["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S5 -->|calls| T5
  S6["function:ASDimensionMakeWithFraction<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:140"]
  T6["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:116"]
  S6 -->|calls| T6
  S7["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  T7["function:ASDimensionResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S7 -->|calls| T7
  S8["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  T8["function:ASDimensionResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S8 -->|calls| T8
  S9["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  T9["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S9 -->|calls| T9
  S10["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  T10["function:NSStringFromASDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:41"]
  S10 -->|calls| T10
  S11["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:267"]
  T11["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:267"]
  S11 -->|calls| T11
  S12["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T12["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S12 -->|calls| T12
  S13["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T13["function:ASCGFloatFromString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/CoreGraphics+ASConvenience.h:23"]
  S13 -->|calls| T13
  S14["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T14["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S14 -->|calls| T14
  S15["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T15["function:ASCGFloatFromString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/CoreGraphics+ASConvenience.h:23"]
  S15 -->|calls| T15
  S16["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T16["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S16 -->|calls| T16
  S17["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T17["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S17 -->|calls| T17
  S18["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T18["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S18 -->|calls| T18
  S19["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T19["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S19 -->|calls| T19
  S20["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T20["function:ASLayoutElementSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:39"]
  S20 -->|calls| T20
  S21["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T21["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S21 -->|calls| T21
  S22["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T22["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S22 -->|calls| T22
  S23["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T23["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S23 -->|calls| T23
  S24["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T24["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S24 -->|calls| T24
  S25["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T25["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
