# `calls 符号关系 - 178`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T1["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S1 -->|calls| T1
  S2["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  T2["function:ASCGFloatFromString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/CoreGraphics+ASConvenience.h:23"]
  S2 -->|calls| T2
  S3["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T3["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S3 -->|calls| T3
  S4["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T4["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S4 -->|calls| T4
  S5["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T5["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S5 -->|calls| T5
  S6["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  T6["function:ASDimensionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:18"]
  S6 -->|calls| T6
  S7["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T7["function:ASLayoutElementSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:39"]
  S7 -->|calls| T7
  S8["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T8["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S8 -->|calls| T8
  S9["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T9["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S9 -->|calls| T9
  S10["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T10["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S10 -->|calls| T10
  S11["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T11["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S11 -->|calls| T11
  S12["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T12["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S12 -->|calls| T12
  S13["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T13["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S13 -->|calls| T13
  S14["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T14["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S14 -->|calls| T14
  S15["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T15["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S15 -->|calls| T15
  S16["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  T16["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  S16 -->|calls| T16
  S17["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  T17["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S17 -->|calls| T17
  S18["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T18["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S18 -->|calls| T18
  S19["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T19["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S19 -->|calls| T19
  S20["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T20["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S20 -->|calls| T20
  S21["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T21["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S21 -->|calls| T21
  S22["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T22["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S22 -->|calls| T22
  S23["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T23["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S23 -->|calls| T23
  S24["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T24["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S24 -->|calls| T24
  S25["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T25["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
