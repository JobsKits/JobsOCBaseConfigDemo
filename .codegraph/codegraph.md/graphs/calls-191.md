# `calls 符号关系 - 191`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  T1["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S1 -->|calls| T1
  S2["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  T2["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S2 -->|calls| T2
  S3["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  T3["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  S3 -->|calls| T3
  S4["function:compareCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T4["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S4 -->|calls| T4
  S5["function:compareCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T5["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S5 -->|calls| T5
  S6["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T6["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S6 -->|calls| T6
  S7["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T7["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S7 -->|calls| T7
  S8["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T8["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S8 -->|calls| T8
  S9["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T9["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S9 -->|calls| T9
  S10["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T10["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S10 -->|calls| T10
  S11["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T11["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S11 -->|calls| T11
  S12["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T12["function:if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S12 -->|calls| T12
  S13["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T13["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S13 -->|calls| T13
  S14["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T14["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S14 -->|calls| T14
  S15["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T15["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  S15 -->|calls| T15
  S16["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T16["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S16 -->|calls| T16
  S17["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T17["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S17 -->|calls| T17
  S18["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T18["function:crossOffsetAndSpacingForEachLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:39"]
  S18 -->|calls| T18
  S19["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T19["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S19 -->|calls| T19
  S20["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T20["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S20 -->|calls| T20
  S21["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T21["function:stackOffsetAndSpacingForEachItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:81"]
  S21 -->|calls| T21
  S22["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T22["function:setStackValueToPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:45"]
  S22 -->|calls| T22
  S23["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T23["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  S23 -->|calls| T23
  S24["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T24["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S24 -->|calls| T24
  S25["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T25["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
