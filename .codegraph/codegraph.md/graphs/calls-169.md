# `calls 符号关系 - 169`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T1["function:ASLayoutElementSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:39"]
  S1 -->|calls| T1
  S2["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T2["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S2 -->|calls| T2
  S3["function:ASLayoutElementSizeMakeFromCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:54"]
  T3["function:ASDimensionMakeWithPoints<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:131"]
  S3 -->|calls| T3
  S4["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T4["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S4 -->|calls| T4
  S5["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T5["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S5 -->|calls| T5
  S6["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T6["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S6 -->|calls| T6
  S7["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T7["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S7 -->|calls| T7
  S8["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T8["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S8 -->|calls| T8
  S9["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T9["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S9 -->|calls| T9
  S10["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  T10["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  S10 -->|calls| T10
  S11["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  T11["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S11 -->|calls| T11
  S12["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T12["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S12 -->|calls| T12
  S13["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T13["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S13 -->|calls| T13
  S14["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T14["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S14 -->|calls| T14
  S15["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T15["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S15 -->|calls| T15
  S16["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T16["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S16 -->|calls| T16
  S17["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T17["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S17 -->|calls| T17
  S18["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T18["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S18 -->|calls| T18
  S19["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T19["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S19 -->|calls| T19
  S20["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T20["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S20 -->|calls| T20
  S21["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T21["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S21 -->|calls| T21
  S22["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T22["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S22 -->|calls| T22
  S23["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T23["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S23 -->|calls| T23
  S24["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T24["function:ASLayoutElementSizeConstrain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:23"]
  S24 -->|calls| T24
  S25["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T25["function:ASLayoutElementSizeConstrain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
