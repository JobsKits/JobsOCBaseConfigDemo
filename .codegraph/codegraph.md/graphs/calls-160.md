# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  T1["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S1 -->|calls| T1
  S2["method:ASMutableAttributedStringBuilder::initWithString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:34"]
  T2["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S2 -->|calls| T2
  S3["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  T3["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S3 -->|calls| T3
  S4["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  T4["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S4 -->|calls| T4
  S5["method:ASMutableAttributedStringBuilder::initWithAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:54"]
  T5["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S5 -->|calls| T5
  S6["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  T6["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S6 -->|calls| T6
  S7["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  T7["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S7 -->|calls| T7
  S8["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T8["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S8 -->|calls| T8
  S9["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T9["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  S9 -->|calls| T9
  S10["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T10["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S10 -->|calls| T10
  S11["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T11["method:ASMutableAttributedStringBuilder::addAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:145"]
  S11 -->|calls| T11
  S12["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T12["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S12 -->|calls| T12
  S13["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  T13["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S13 -->|calls| T13
  S14["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  T14["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  S14 -->|calls| T14
  S15["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  T15["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S15 -->|calls| T15
  S16["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:123"]
  T16["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S16 -->|calls| T16
  S17["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:123"]
  T17["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:123"]
  S17 -->|calls| T17
  S18["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:123"]
  T18["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S18 -->|calls| T18
  S19["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  T19["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S19 -->|calls| T19
  S20["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  T20["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S20 -->|calls| T20
  S21["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  T21["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S21 -->|calls| T21
  S22["method:ASMutableAttributedStringBuilder::addAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:145"]
  T22["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S22 -->|calls| T22
  S23["method:ASMutableAttributedStringBuilder::addAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:145"]
  T23["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S23 -->|calls| T23
  S24["method:ASMutableAttributedStringBuilder::addAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:145"]
  T24["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S24 -->|calls| T24
  S25["method:ASMutableAttributedStringBuilder::insertAttributedString:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:161"]
  T25["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
