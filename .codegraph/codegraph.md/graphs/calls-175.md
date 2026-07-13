# `calls 符号关系 - 175`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T1["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S1 -->|calls| T1
  S2["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T2["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S2 -->|calls| T2
  S3["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T3["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S3 -->|calls| T3
  S4["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T4["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S4 -->|calls| T4
  S5["function:ASLayoutElementSizeEqualToLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:65"]
  T5["function:ASDimensionEqualToDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:149"]
  S5 -->|calls| T5
  S6["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  T6["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  S6 -->|calls| T6
  S7["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  T7["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S7 -->|calls| T7
  S8["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T8["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S8 -->|calls| T8
  S9["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T9["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S9 -->|calls| T9
  S10["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T10["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S10 -->|calls| T10
  S11["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T11["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S11 -->|calls| T11
  S12["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T12["function:NSStringFromASLayoutSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:209"]
  S12 -->|calls| T12
  S13["function:NSStringFromASLayoutElementSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:14"]
  T13["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S13 -->|calls| T13
  S14["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T14["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S14 -->|calls| T14
  S15["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T15["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S15 -->|calls| T15
  S16["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T16["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S16 -->|calls| T16
  S17["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T17["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S17 -->|calls| T17
  S18["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T18["function:ASLayoutSizeResolveSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:200"]
  S18 -->|calls| T18
  S19["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T19["function:ASLayoutSizeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:189"]
  S19 -->|calls| T19
  S20["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T20["function:ASLayoutElementSizeConstrain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:23"]
  S20 -->|calls| T20
  S21["function:ASLayoutElementSizeResolveAutoSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:55"]
  T21["function:ASLayoutElementSizeConstrain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.mm:23"]
  S21 -->|calls| T21
  S22["function:finiteOrZero<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:29"]
  T22["function:finite<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:23"]
  S22 -->|calls| T22
  S23["function:centerInset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:35"]
  T23["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S23 -->|calls| T23
  S24["function:initWithInsets:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:42"]
  T24["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S24 -->|calls| T24
  S25["function:insetLayoutSpecWithInsets:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:53"]
  T25["function:initWithInsets:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASInsetLayoutSpec.mm:42"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
