# `calls 符号关系 - 161`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMutableAttributedStringBuilder::insertAttributedString:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:161"]
  T1["method:ASMutableAttributedStringBuilder::insertAttributedString:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:161"]
  S1 -->|calls| T1
  S2["method:ASMutableAttributedStringBuilder::insertAttributedString:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:161"]
  T2["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S2 -->|calls| T2
  S3["method:ASMutableAttributedStringBuilder::appendAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:167"]
  T3["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S3 -->|calls| T3
  S4["method:ASMutableAttributedStringBuilder::appendAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:167"]
  T4["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S4 -->|calls| T4
  S5["method:ASMutableAttributedStringBuilder::deleteCharactersInRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:173"]
  T5["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S5 -->|calls| T5
  S6["method:ASMutableAttributedStringBuilder::deleteCharactersInRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:173"]
  T6["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S6 -->|calls| T6
  S7["method:ASMutableAttributedStringBuilder::setAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:179"]
  T7["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S7 -->|calls| T7
  S8["method:ASMutableAttributedStringBuilder::setAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:179"]
  T8["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S8 -->|calls| T8
  S9["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  T9["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S9 -->|calls| T9
  S10["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  T10["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S10 -->|calls| T10
  S11["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  T11["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S11 -->|calls| T11
  S12["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  T12["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S12 -->|calls| T12
  S13["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  T13["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  S13 -->|calls| T13
  S14["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  T14["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S14 -->|calls| T14
  S15["method:ASMutableAttributedStringBuilder::composedAttributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:213"]
  T15["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S15 -->|calls| T15
  S16["method:ASMutableAttributedStringBuilder::composedAttributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:213"]
  T16["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S16 -->|calls| T16
  S17["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  T17["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  S17 -->|calls| T17
  S18["method:ASMutableAttributedStringBuilder::attributesAtIndex:effectiveRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:229"]
  T18["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S18 -->|calls| T18
  S19["method:ASMutableAttributedStringBuilder::mutableString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:239"]
  T19["method:ASMutableAttributedStringBuilder::mutableString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:239"]
  S19 -->|calls| T19
  S20["method:ASMutableAttributedStringBuilder::mutableString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:239"]
  T20["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S20 -->|calls| T20
  S21["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  T21["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  S21 -->|calls| T21
  S22["method:ASMutableAttributedStringBuilder::beginEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:244"]
  T22["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S22 -->|calls| T22
  S23["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  T23["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S23 -->|calls| T23
  S24["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  T24["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.h:1"]
  T25["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
