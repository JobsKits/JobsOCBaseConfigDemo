# `calls 符号关系 - 195`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T1["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S1 -->|calls| T1
  S2["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T2["function:stackOffsetAndSpacingForEachItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:81"]
  S2 -->|calls| T2
  S3["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T3["function:setStackValueToPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:45"]
  S3 -->|calls| T3
  S4["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T4["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  S4 -->|calls| T4
  S5["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T5["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S5 -->|calls| T5
  S6["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T6["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S6 -->|calls| T6
  S7["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T7["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S7 -->|calls| T7
  S8["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T8["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S8 -->|calls| T8
  S9["function:resolveCrossDimensionMaxForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:21"]
  T9["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S9 -->|calls| T9
  S10["function:resolveCrossDimensionMaxForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:21"]
  T10["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S10 -->|calls| T10
  S11["function:resolveCrossDimensionMinForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:33"]
  T11["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S11 -->|calls| T11
  S12["function:resolveCrossDimensionMinForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:33"]
  T12["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S12 -->|calls| T12
  S13["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  T13["function:resolveCrossDimensionMinForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:33"]
  S13 -->|calls| T13
  S14["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  T14["function:resolveCrossDimensionMaxForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:21"]
  S14 -->|calls| T14
  S15["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  T15["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  S15 -->|calls| T15
  S16["function:dispatchApplyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:70"]
  T16["function:ASDispatchApply<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDispatch.mm:15"]
  S16 -->|calls| T16
  S17["function:computeLinesCrossDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:108"]
  T17["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S17 -->|calls| T17
  S18["function:computeCrossViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:153"]
  T18["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S18 -->|calls| T18
  S19["function:computeCrossViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:153"]
  T19["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S19 -->|calls| T19
  S20["function:stretchItemsAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:199"]
  T20["function:dispatchApplyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:70"]
  S20 -->|calls| T20
  S21["function:stretchItemsAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:199"]
  T21["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S21 -->|calls| T21
  S22["function:stretchItemsAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:199"]
  T22["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S22 -->|calls| T22
  S23["function:stretchItemsAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:199"]
  T23["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  S23 -->|calls| T23
  S24["function:stretchLinesAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:226"]
  T24["function:computeCrossViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:153"]
  S24 -->|calls| T24
  S25["function:stretchLinesAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:226"]
  T25["function:computeLinesCrossDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:108"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
