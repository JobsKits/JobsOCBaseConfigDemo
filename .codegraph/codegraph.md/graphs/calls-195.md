# `calls 符号关系 - 195`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T1["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S1 -->|calls| T1
  S2["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T2["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S2 -->|calls| T2
  S3["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T3["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S3 -->|calls| T3
  S4["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T4["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S4 -->|calls| T4
  S5["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T5["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S5 -->|calls| T5
  S6["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T6["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S6 -->|calls| T6
  S7["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T7["function:if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S7 -->|calls| T7
  S8["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T8["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S8 -->|calls| T8
  S9["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T9["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S9 -->|calls| T9
  S10["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T10["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  S10 -->|calls| T10
  S11["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T11["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S11 -->|calls| T11
  S12["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T12["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S12 -->|calls| T12
  S13["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T13["function:crossOffsetAndSpacingForEachLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:39"]
  S13 -->|calls| T13
  S14["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T14["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S14 -->|calls| T14
  S15["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T15["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S15 -->|calls| T15
  S16["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T16["function:stackOffsetAndSpacingForEachItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:81"]
  S16 -->|calls| T16
  S17["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T17["function:setStackValueToPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:45"]
  S17 -->|calls| T17
  S18["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T18["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  S18 -->|calls| T18
  S19["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T19["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S19 -->|calls| T19
  S20["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T20["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S20 -->|calls| T20
  S21["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T21["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S21 -->|calls| T21
  S22["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T22["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S22 -->|calls| T22
  S23["function:resolveCrossDimensionMaxForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:21"]
  T23["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S23 -->|calls| T23
  S24["function:resolveCrossDimensionMaxForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:21"]
  T24["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S24 -->|calls| T24
  S25["function:resolveCrossDimensionMinForStretchChild<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:33"]
  T25["function:ASLayoutElementSizeResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimensionInternal.h:93"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
