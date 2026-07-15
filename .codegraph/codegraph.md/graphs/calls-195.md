# `calls 符号关系 - 195`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T1["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S1 -->|calls| T1
  S2["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T2["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S2 -->|calls| T2
  S3["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T3["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S3 -->|calls| T3
  S4["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T4["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S4 -->|calls| T4
  S5["method:ASTextLayout::textRangeAtPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1682"]
  T5["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  S5 -->|calls| T5
  S6["method:ASTextLayout::textRangeAtPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1682"]
  T6["method:ASTextLayout::_isRightToLeftInLine:atPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1241"]
  S6 -->|calls| T6
  S7["method:ASTextLayout::textRangeAtPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1682"]
  T7["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S7 -->|calls| T7
  S8["method:ASTextLayout::textRangeAtPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1682"]
  T8["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S8 -->|calls| T8
  S9["method:ASTextLayout::closestTextRangeAtPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1704"]
  T9["method:ASTextLayout::_isRightToLeftInLine:atPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1241"]
  S9 -->|calls| T9
  S10["method:ASTextLayout::closestTextRangeAtPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1704"]
  T10["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S10 -->|calls| T10
  S11["method:ASTextLayout::textRangeByExtendingPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1739"]
  T11["method:ASTextLayout::_insideEmoji:position:block:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1196"]
  S11 -->|calls| T11
  S12["method:ASTextLayout::textRangeByExtendingPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1739"]
  T12["method:ASTextLayout::_insideComposedCharacterSequences:position:block:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1159"]
  S12 -->|calls| T12
  S13["method:ASTextLayout::textRangeByExtendingPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1739"]
  T13["function:ASTextIsLinebreakChar<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:23"]
  S13 -->|calls| T13
  S14["method:ASTextLayout::textRangeByExtendingPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1739"]
  T14["function:ASTextLinebreakTailLength<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:74"]
  S14 -->|calls| T14
  S15["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  T15["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S15 -->|calls| T15
  S16["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  T16["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  S16 -->|calls| T16
  S17["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  T17["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  S17 -->|calls| T17
  S18["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  T18["function:ASTextLinebreakTailLength<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:74"]
  S18 -->|calls| T18
  S19["method:ASTextLayout::linePositionForPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1977"]
  T19["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S19 -->|calls| T19
  S20["method:ASTextLayout::caretRectForPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1990"]
  T20["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S20 -->|calls| T20
  S21["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T21["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S21 -->|calls| T21
  S22["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T22["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S22 -->|calls| T22
  S23["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T23["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S23 -->|calls| T23
  S24["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T24["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S24 -->|calls| T24
  S25["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T25["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
