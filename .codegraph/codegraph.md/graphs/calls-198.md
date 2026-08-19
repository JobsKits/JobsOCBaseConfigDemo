# `calls 符号关系 - 198`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSMutableAttributedString::setAs_headIndent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:796"]
  T1["method:NSMutableAttributedString::as_setHeadIndent:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1004"]
  S1 -->|calls| T1
  S2["method:NSMutableAttributedString::setAs_tailIndent:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:800"]
  T2["method:NSMutableAttributedString::as_setTailIndent:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1008"]
  S2 -->|calls| T2
  S3["method:NSMutableAttributedString::setAs_lineBreakMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:804"]
  T3["method:NSMutableAttributedString::as_setLineBreakMode:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1012"]
  S3 -->|calls| T3
  S4["method:NSMutableAttributedString::setAs_minimumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:808"]
  T4["method:NSMutableAttributedString::as_setMinimumLineHeight:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1016"]
  S4 -->|calls| T4
  S5["method:NSMutableAttributedString::setAs_maximumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:812"]
  T5["method:NSMutableAttributedString::as_setMaximumLineHeight:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1020"]
  S5 -->|calls| T5
  S6["method:NSMutableAttributedString::setAs_lineHeightMultiple:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:816"]
  T6["method:NSMutableAttributedString::as_setLineHeightMultiple:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1024"]
  S6 -->|calls| T6
  S7["method:NSMutableAttributedString::setAs_hyphenationFactor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:820"]
  T7["method:NSMutableAttributedString::as_setHyphenationFactor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1028"]
  S7 -->|calls| T7
  S8["method:NSMutableAttributedString::setAs_defaultTabInterval:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:824"]
  T8["method:NSMutableAttributedString::as_setDefaultTabInterval:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1032"]
  S8 -->|calls| T8
  S9["method:NSMutableAttributedString::setAs_tabStops:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:828"]
  T9["method:NSMutableAttributedString::as_setTabStops:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1036"]
  S9 -->|calls| T9
  S10["method:NSMutableAttributedString::setAs_textShadow:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:832"]
  T10["method:NSMutableAttributedString::as_setTextShadow:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1096"]
  S10 -->|calls| T10
  S11["method:NSMutableAttributedString::setAs_textInnerShadow:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:836"]
  T11["method:NSMutableAttributedString::as_setTextInnerShadow:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1100"]
  S11 -->|calls| T11
  S12["method:NSMutableAttributedString::setAs_textUnderline:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:840"]
  T12["method:NSMutableAttributedString::as_setTextUnderline:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1104"]
  S12 -->|calls| T12
  S13["method:NSMutableAttributedString::setAs_textStrikethrough:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:844"]
  T13["method:NSMutableAttributedString::as_setTextStrikethrough:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1108"]
  S13 -->|calls| T13
  S14["method:NSMutableAttributedString::setAs_textBorder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:848"]
  T14["method:NSMutableAttributedString::as_setTextBorder:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1112"]
  S14 -->|calls| T14
  S15["method:NSMutableAttributedString::setAs_textBackgroundBorder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:852"]
  T15["method:NSMutableAttributedString::as_setTextBackgroundBorder:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1116"]
  S15 -->|calls| T15
  S16["method:NSMutableAttributedString::setAs_textGlyphTransform:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:856"]
  T16["method:NSMutableAttributedString::as_setTextGlyphTransform:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1132"]
  S16 -->|calls| T16
  S17["method:NSMutableAttributedString::as_setFont:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:862"]
  T17["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S17 -->|calls| T17
  S18["method:NSMutableAttributedString::as_setKern:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:866"]
  T18["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S18 -->|calls| T18
  S19["method:NSMutableAttributedString::as_setColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:870"]
  T19["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S19 -->|calls| T19
  S20["method:NSMutableAttributedString::as_setColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:870"]
  T20["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S20 -->|calls| T20
  S21["method:NSMutableAttributedString::as_setBackgroundColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:875"]
  T21["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S21 -->|calls| T21
  S22["method:NSMutableAttributedString::as_setStrokeWidth:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:879"]
  T22["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S22 -->|calls| T22
  S23["method:NSMutableAttributedString::as_setStrokeColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:883"]
  T23["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S23 -->|calls| T23
  S24["method:NSMutableAttributedString::as_setStrokeColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:883"]
  T24["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S24 -->|calls| T24
  S25["method:NSMutableAttributedString::as_setShadow:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:888"]
  T25["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
