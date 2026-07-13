# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLayout::layoutWithContainers:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1017"]
  T1["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  S1 -->|calls| T1
  S2["method:ASTextLayout::_insideComposedCharacterSequences:position:block:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1159"]
  T2["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S2 -->|calls| T2
  S3["method:ASTextLayout::_insideComposedCharacterSequences:position:block:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1159"]
  T3["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S3 -->|calls| T3
  S4["method:ASTextLayout::_insideComposedCharacterSequences:position:block:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1159"]
  T4["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S4 -->|calls| T4
  S5["method:ASTextLayout::_insideEmoji:position:block:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1196"]
  T5["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S5 -->|calls| T5
  S6["method:ASTextLayout::_insideEmoji:position:block:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1196"]
  T6["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S6 -->|calls| T6
  S7["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  T7["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S7 -->|calls| T7
  S8["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T8["method:ASTextLayout::textPositionForPoint:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1380"]
  S8 -->|calls| T8
  S9["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T9["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S9 -->|calls| T9
  S10["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T10["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S10 -->|calls| T10
  S11["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T11["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S11 -->|calls| T11
  S12["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T12["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S12 -->|calls| T12
  S13["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T13["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S13 -->|calls| T13
  S14["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T14["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S14 -->|calls| T14
  S15["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T15["function:ASTextIsLinebreakString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:58"]
  S15 -->|calls| T15
  S16["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T16["function:ASTextIsLinebreakChar<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:23"]
  S16 -->|calls| T16
  S17["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T17["function:ASTextIsLinebreakChar<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:23"]
  S17 -->|calls| T17
  S18["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T18["method:ASTextLayout::_insideComposedCharacterSequences:position:block:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1159"]
  S18 -->|calls| T18
  S19["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T19["method:ASTextLayout::_insideEmoji:position:block:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1196"]
  S19 -->|calls| T19
  S20["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T20["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S20 -->|calls| T20
  S21["method:ASTextLayout::closestPositionToPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1444"]
  T21["method:ASTextLayout::_isRightToLeftInLine:atPoint:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1241"]
  S21 -->|calls| T21
  S22["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T22["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S22 -->|calls| T22
  S23["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T23["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S23 -->|calls| T23
  S24["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T24["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S24 -->|calls| T24
  S25["method:ASTextLayout::positionForPoint:oldPosition:otherPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1634"]
  T25["method:ASTextLayout::textRangeByExtendingPosition:inDirection:offset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1801"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
