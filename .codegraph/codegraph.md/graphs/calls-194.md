# `calls 符号关系 - 194`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTipsWindow::didTapTipNode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:63"]
  T1["method:ASDisplayNode::tipDisplayBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Debug/AsyncDisplayKit+Tips.mm:41"]
  S1 -->|calls| T1
  S2["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  T2["method:ASTipsWindow::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTipsWindow.mm:68"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T3["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.h:1"]
  T4["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S4 -->|calls| T4
  S5["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["function:ASTwoDimensionalArrayDeepMutableCopy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:22"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  T7["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S7 -->|calls| T7
  S8["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  T8["method:ASWeakMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:51"]
  S8 -->|calls| T8
  S9["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  T9["method:ASWeakMapEntry::initWithKey:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:19"]
  S9 -->|calls| T9
  S10["function:compareCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T10["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S10 -->|calls| T10
  S11["function:compareCrossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:30"]
  T11["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S11 -->|calls| T11
  S12["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T12["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S12 -->|calls| T12
  S13["function:directionSizeRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:49"]
  T13["function:directionSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:40"]
  S13 -->|calls| T13
  S14["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T14["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S14 -->|calls| T14
  S15["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T15["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S15 -->|calls| T15
  S16["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  T16["function:crossDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:25"]
  S16 -->|calls| T16
  S17["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T17["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S17 -->|calls| T17
  S18["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T18["function:if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackUnpositionedLayout.mm:346"]
  S18 -->|calls| T18
  S19["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T19["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S19 -->|calls| T19
  S20["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T20["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S20 -->|calls| T20
  S21["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T21["function:crossOffsetForItem<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:19"]
  S21 -->|calls| T21
  S22["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T22["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S22 -->|calls| T22
  S23["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T23["function:stackDimension<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:20"]
  S23 -->|calls| T23
  S24["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T24["function:crossOffsetAndSpacingForEachLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:39"]
  S24 -->|calls| T24
  S25["function:positionItemsInLine<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackPositionedLayout.mm:122"]
  T25["function:directionPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/Layout/ASStackLayoutSpecUtilities.h:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
