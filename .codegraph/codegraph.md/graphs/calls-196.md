# `calls 符号关系 - 196`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLayout::firstRectForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2003"]
  T1["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S1 -->|calls| T1
  S2["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T2["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S2 -->|calls| T2
  S3["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T3["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S3 -->|calls| T3
  S4["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T4["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S4 -->|calls| T4
  S5["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T5["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S5 -->|calls| T5
  S6["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T6["method:ASTextLayout::_runForLine:position:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1129"]
  S6 -->|calls| T6
  S7["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T7["method:ASTextLayout::offsetForTextPosition:lineIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1370"]
  S7 -->|calls| T7
  S8["method:ASTextLayout::selectionRectsForRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2080"]
  T8["method:ASTextLayout::_runForLine:position:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1129"]
  S8 -->|calls| T8
  S9["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T9["function:ASTextGetCGColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:45"]
  S9 -->|calls| T9
  S10["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T10["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S10 -->|calls| T10
  S11["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T11["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S11 -->|calls| T11
  S12["function:ASTextLayout::ASTextDrawRun<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2315"]
  T12["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S12 -->|calls| T12
  S13["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T13["function:UIEdgeInsetRotateVertical<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:32"]
  S13 -->|calls| T13
  S14["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T14["function:ASTextCGRectPixelRound<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:268"]
  S14 -->|calls| T14
  S15["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T15["function:ASTextLayout::ASTextSetLinePatternInContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2461"]
  S15 -->|calls| T15
  S16["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T16["function:UIEdgeInsetRotateVertical<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:32"]
  S16 -->|calls| T16
  S17["function:ASTextLayout::ASTextDrawBorderRects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2491"]
  T17["function:ASTextLayout::ASTextSetLinePatternInContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2461"]
  S17 -->|calls| T17
  S18["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T18["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S18 -->|calls| T18
  S19["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T19["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S19 -->|calls| T19
  S20["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T20["function:ASTextCGFloatToPixel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:224"]
  S20 -->|calls| T20
  S21["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T21["function:ASTextCGFloatPixelHalf<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:234"]
  S21 -->|calls| T21
  S22["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T22["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S22 -->|calls| T22
  S23["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T23["function:ASTextLayout::ASTextSetLinePatternInContext<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2461"]
  S23 -->|calls| T23
  S24["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T24["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S24 -->|calls| T24
  S25["function:ASTextLayout::ASTextDrawLineStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2607"]
  T25["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
