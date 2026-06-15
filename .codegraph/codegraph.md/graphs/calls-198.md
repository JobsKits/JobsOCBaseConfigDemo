# `calls 符号关系 - 198`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T1["function:dispatchApplyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:70"]
  S1 -->|calls| T1
  S2["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T2["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S2 -->|calls| T2
  S3["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T3["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  S3 -->|calls| T3
  S4["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T4["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S4 -->|calls| T4
  S5["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  T5["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S5 -->|calls| T5
  S6["function:collectChildrenIntoLines<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  T6["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S6 -->|calls| T6
  S7["function:collectChildrenIntoLines<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  T7["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S7 -->|calls| T7
  S8["function:collectChildrenIntoLines<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  T8["function:computeStackViolation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:520"]
  S8 -->|calls| T8
  S9["function:collectChildrenIntoLines<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  T9["method:ASTextDebugOption::clear<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextDebugOption.mm:103"]
  S9 -->|calls| T9
  S10["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T10["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S10 -->|calls| T10
  S11["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T11["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S11 -->|calls| T11
  S12["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T12["function:dispatchApplyIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:70"]
  S12 -->|calls| T12
  S13["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T13["function:crossChildLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:48"]
  S13 -->|calls| T13
  S14["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T14["function:ASDimensionResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S14 -->|calls| T14
  S15["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T15["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S15 -->|calls| T15
  S16["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T16["function:ASDimensionResolve<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:162"]
  S16 -->|calls| T16
  S17["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  T17["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S17 -->|calls| T17
  S18["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T18["function:useOptimizedFlexing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:538"]
  S18 -->|calls| T18
  S19["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T19["variable:map<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:74"]
  S19 -->|calls| T19
  S20["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T20["function:layoutItemsAlongUnconstrainedStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:674"]
  S20 -->|calls| T20
  S21["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T21["function:collectChildrenIntoLines<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:631"]
  S21 -->|calls| T21
  S22["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T22["function:flexLinesAlongStackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:561"]
  S22 -->|calls| T22
  S23["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T23["function:stretchLinesAlongCrossDimension::computeLinesCrossSizeAndBaseline<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:278"]
  S23 -->|calls| T23
  S24["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T24["function:stretchLinesAlongCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:226"]
  S24 -->|calls| T24
  S25["function:compute<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:700"]
  T25["function:computeItemsStackDimensionSum<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:468"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
