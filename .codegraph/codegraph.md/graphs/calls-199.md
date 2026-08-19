# `calls 符号关系 - 199`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSMutableAttributedString::as_setStrikethroughStyle:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:892"]
  T1["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S1 -->|calls| T1
  S2["method:NSMutableAttributedString::as_setStrikethroughColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:897"]
  T2["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S2 -->|calls| T2
  S3["method:NSMutableAttributedString::as_setUnderlineStyle:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:901"]
  T3["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S3 -->|calls| T3
  S4["method:NSMutableAttributedString::as_setUnderlineColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:906"]
  T4["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S4 -->|calls| T4
  S5["method:NSMutableAttributedString::as_setUnderlineColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:906"]
  T5["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S5 -->|calls| T5
  S6["method:NSMutableAttributedString::as_setLigature:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:911"]
  T6["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S6 -->|calls| T6
  S7["method:NSMutableAttributedString::as_setTextEffect:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:915"]
  T7["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S7 -->|calls| T7
  S8["method:NSMutableAttributedString::as_setObliqueness:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:919"]
  T8["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S8 -->|calls| T8
  S9["method:NSMutableAttributedString::as_setExpansion:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:923"]
  T9["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S9 -->|calls| T9
  S10["method:NSMutableAttributedString::as_setBaselineOffset:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:927"]
  T10["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S10 -->|calls| T10
  S11["method:NSMutableAttributedString::as_setVerticalGlyphForm:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:931"]
  T11["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S11 -->|calls| T11
  S12["method:NSMutableAttributedString::as_setLanguage:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:936"]
  T12["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S12 -->|calls| T12
  S13["method:NSMutableAttributedString::as_setWritingDirection:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:940"]
  T13["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S13 -->|calls| T13
  S14["method:NSMutableAttributedString::as_setParagraphStyle:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:944"]
  T14["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S14 -->|calls| T14
  S15["method:NSMutableAttributedString::as_setSuperscript:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1042"]
  T15["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S15 -->|calls| T15
  S16["method:NSMutableAttributedString::as_setGlyphInfo:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1049"]
  T16["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S16 -->|calls| T16
  S17["method:NSMutableAttributedString::as_setCharacterShape:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1053"]
  T17["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S17 -->|calls| T17
  S18["method:NSMutableAttributedString::as_setRunDelegate:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1060"]
  T18["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S18 -->|calls| T18
  S19["method:NSMutableAttributedString::as_setBaselineClass:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1064"]
  T19["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S19 -->|calls| T19
  S20["method:NSMutableAttributedString::as_setBaselineInfo:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1068"]
  T20["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S20 -->|calls| T20
  S21["method:NSMutableAttributedString::as_setBaselineReferenceInfo:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1072"]
  T21["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S21 -->|calls| T21
  S22["method:NSMutableAttributedString::as_setRubyAnnotation:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1076"]
  T22["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S22 -->|calls| T22
  S23["method:NSMutableAttributedString::as_setAttachment:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1080"]
  T23["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S23 -->|calls| T23
  S24["method:NSMutableAttributedString::as_setLink:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1084"]
  T24["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S24 -->|calls| T24
  S25["method:NSMutableAttributedString::as_setTextBackedString:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1088"]
  T25["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
