# `calls 符号关系 - 197`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSMutableAttributedString::setAs_kern:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:688"]
  T1["method:NSMutableAttributedString::as_setKern:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:866"]
  S1 -->|calls| T1
  S2["method:NSMutableAttributedString::setAs_color:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:692"]
  T2["method:NSMutableAttributedString::as_setColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:870"]
  S2 -->|calls| T2
  S3["method:NSMutableAttributedString::setAs_backgroundColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:696"]
  T3["method:NSMutableAttributedString::as_setBackgroundColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:875"]
  S3 -->|calls| T3
  S4["method:NSMutableAttributedString::setAs_strokeWidth:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:700"]
  T4["method:NSMutableAttributedString::as_setStrokeWidth:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:879"]
  S4 -->|calls| T4
  S5["method:NSMutableAttributedString::setAs_strokeColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:704"]
  T5["method:NSMutableAttributedString::as_setStrokeColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:883"]
  S5 -->|calls| T5
  S6["method:NSMutableAttributedString::setAs_shadow:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:708"]
  T6["method:NSMutableAttributedString::as_setShadow:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:888"]
  S6 -->|calls| T6
  S7["method:NSMutableAttributedString::setAs_strikethroughStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:712"]
  T7["method:NSMutableAttributedString::as_setStrikethroughStyle:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:892"]
  S7 -->|calls| T7
  S8["method:NSMutableAttributedString::setAs_strikethroughColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:716"]
  T8["method:NSMutableAttributedString::as_setStrikethroughColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:897"]
  S8 -->|calls| T8
  S9["method:NSMutableAttributedString::setAs_underlineStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:720"]
  T9["method:NSMutableAttributedString::as_setUnderlineStyle:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:901"]
  S9 -->|calls| T9
  S10["method:NSMutableAttributedString::setAs_underlineColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:724"]
  T10["method:NSMutableAttributedString::as_setUnderlineColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:906"]
  S10 -->|calls| T10
  S11["method:NSMutableAttributedString::setAs_ligature:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:728"]
  T11["method:NSMutableAttributedString::as_setLigature:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:911"]
  S11 -->|calls| T11
  S12["method:NSMutableAttributedString::setAs_textEffect:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:732"]
  T12["method:NSMutableAttributedString::as_setTextEffect:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:915"]
  S12 -->|calls| T12
  S13["method:NSMutableAttributedString::setAs_obliqueness:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:736"]
  T13["method:NSMutableAttributedString::as_setObliqueness:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:919"]
  S13 -->|calls| T13
  S14["method:NSMutableAttributedString::setAs_expansion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:740"]
  T14["method:NSMutableAttributedString::as_setExpansion:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:923"]
  S14 -->|calls| T14
  S15["method:NSMutableAttributedString::setAs_baselineOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:744"]
  T15["method:NSMutableAttributedString::as_setBaselineOffset:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:927"]
  S15 -->|calls| T15
  S16["method:NSMutableAttributedString::setAs_verticalGlyphForm:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:748"]
  T16["method:NSMutableAttributedString::as_setVerticalGlyphForm:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:931"]
  S16 -->|calls| T16
  S17["method:NSMutableAttributedString::setAs_language:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:752"]
  T17["method:NSMutableAttributedString::as_setLanguage:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:936"]
  S17 -->|calls| T17
  S18["method:NSMutableAttributedString::setAs_writingDirection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:756"]
  T18["method:NSMutableAttributedString::as_setWritingDirection:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:940"]
  S18 -->|calls| T18
  S19["method:NSMutableAttributedString::setAs_paragraphStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:760"]
  T19["method:NSMutableAttributedString::as_setParagraphStyle:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:944"]
  S19 -->|calls| T19
  S20["method:NSMutableAttributedString::setAs_alignment:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:772"]
  T20["method:NSMutableAttributedString::as_setAlignment:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:980"]
  S20 -->|calls| T20
  S21["method:NSMutableAttributedString::setAs_baseWritingDirection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:776"]
  T21["method:NSMutableAttributedString::as_setBaseWritingDirection:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:984"]
  S21 -->|calls| T21
  S22["method:NSMutableAttributedString::setAs_lineSpacing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:780"]
  T22["method:NSMutableAttributedString::as_setLineSpacing:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:988"]
  S22 -->|calls| T22
  S23["method:NSMutableAttributedString::setAs_paragraphSpacing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:784"]
  T23["method:NSMutableAttributedString::as_setParagraphSpacing:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:992"]
  S23 -->|calls| T23
  S24["method:NSMutableAttributedString::setAs_paragraphSpacingBefore:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:788"]
  T24["method:NSMutableAttributedString::as_setParagraphSpacing:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:992"]
  S24 -->|calls| T24
  S25["method:NSMutableAttributedString::setAs_firstLineHeadIndent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:792"]
  T25["method:NSMutableAttributedString::as_setFirstLineHeadIndent:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1000"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
