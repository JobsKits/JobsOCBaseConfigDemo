# `calls 符号关系 - 193`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:scaledFlexShrinkFactor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:353"]
  T1["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S1 -->|calls| T1
  S2["function:flexShrinkAdjustment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:368"]
  T2["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S2 -->|calls| T2
  S3["function:flexShrinkAdjustment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:368"]
  T3["function:scaledFlexShrinkFactor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:353"]
  S3 -->|calls| T3
  S4["function:flexShrinkAdjustment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:368"]
  T4["function:scaledFlexShrinkFactor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:353"]
  S4 -->|calls| T4
  S5["function:flexAdjustmentInViolationDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:413"]
  T5["function:flexGrowAdjustment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:395"]
  S5 -->|calls| T5
  S6["function:flexAdjustmentInViolationDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:413"]
  T6["function:flexShrinkAdjustment<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:368"]
  S6 -->|calls| T6
  S7["function:layoutFlexibleChildrenAtZeroSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:434"]
  T7["function:dispatchApplyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:70"]
  S7 -->|calls| T7
  S8["function:layoutFlexibleChildrenAtZeroSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:434"]
  T8["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  S8 -->|calls| T8
  S9["function:layoutFlexibleChildrenAtZeroSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:434"]
  T9["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S9 -->|calls| T9
  S10["function:layoutFlexibleChildrenAtZeroSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:434"]
  T10["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S10 -->|calls| T10
  S11["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  T11["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S11 -->|calls| T11
  S12["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  T12["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S12 -->|calls| T12
  S13["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  T13["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S13 -->|calls| T13
  S14["function:computeStackViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:520"]
  T14["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S14 -->|calls| T14
  S15["function:computeStackViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:520"]
  T15["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S15 -->|calls| T15
  S16["function:useOptimizedFlexing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:538"]
  T16["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S16 -->|calls| T16
  S17["function:useOptimizedFlexing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:538"]
  T17["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S17 -->|calls| T17
  S18["function:useOptimizedFlexing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:538"]
  T18["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S18 -->|calls| T18
  S19["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T19["function:computeStackViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:520"]
  S19 -->|calls| T19
  S20["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T20["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  S20 -->|calls| T20
  S21["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T21["variable:CGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:39"]
  S21 -->|calls| T21
  S22["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T22["function:flexFactorInViolationDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:342"]
  S22 -->|calls| T22
  S23["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T23["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S23 -->|calls| T23
  S24["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T24["function:layoutFlexibleChildrenAtZeroSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:434"]
  S24 -->|calls| T24
  S25["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T25["variable:CGFloat<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:39"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
