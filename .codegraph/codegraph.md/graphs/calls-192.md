# `calls 符号关系 - 192`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T1["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S1 -->|calls| T1
  S2["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T2["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S2 -->|calls| T2
  S3["function:resolveCrossDimensionMaxForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:21"]
  T3["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S3 -->|calls| T3
  S4["function:resolveCrossDimensionMaxForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:21"]
  T4["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S4 -->|calls| T4
  S5["function:resolveCrossDimensionMinForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:33"]
  T5["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S5 -->|calls| T5
  S6["function:resolveCrossDimensionMinForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:33"]
  T6["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S6 -->|calls| T6
  S7["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  T7["function:resolveCrossDimensionMinForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:33"]
  S7 -->|calls| T7
  S8["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  T8["function:resolveCrossDimensionMaxForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:21"]
  S8 -->|calls| T8
  S9["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  T9["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  S9 -->|calls| T9
  S10["function:dispatchApplyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:70"]
  T10["function:ASDispatchApply<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S10 -->|calls| T10
  S11["function:computeLinesCrossDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:108"]
  T11["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S11 -->|calls| T11
  S12["function:computeCrossViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:153"]
  T12["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S12 -->|calls| T12
  S13["function:computeCrossViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:153"]
  T13["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S13 -->|calls| T13
  S14["function:stretchItemsAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:199"]
  T14["function:dispatchApplyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:70"]
  S14 -->|calls| T14
  S15["function:stretchItemsAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:199"]
  T15["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S15 -->|calls| T15
  S16["function:stretchItemsAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:199"]
  T16["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S16 -->|calls| T16
  S17["function:stretchItemsAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:199"]
  T17["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  S17 -->|calls| T17
  S18["function:stretchLinesAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:226"]
  T18["function:computeCrossViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:153"]
  S18 -->|calls| T18
  S19["function:stretchLinesAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:226"]
  T19["function:computeLinesCrossDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:108"]
  S19 -->|calls| T19
  S20["function:stretchLinesAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:226"]
  T20["function:stretchItemsAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:199"]
  S20 -->|calls| T20
  S21["function:stretchLinesAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:226"]
  T21["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S21 -->|calls| T21
  S22["function:stretchLinesAlongCrossDimension::computeLinesCrossSizeAndBaseline<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:278"]
  T22["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S22 -->|calls| T22
  S23["function:stretchLinesAlongCrossDimension::computeLinesCrossSizeAndBaseline<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:278"]
  T23["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S23 -->|calls| T23
  S24["function:stretchLinesAlongCrossDimension::computeLinesCrossSizeAndBaseline<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:278"]
  T24["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S24 -->|calls| T24
  S25["function:stretchLinesAlongCrossDimension::computeLinesCrossSizeAndBaseline<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:278"]
  T25["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
