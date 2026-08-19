# `calls 符号关系 - 200`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSMutableAttributedString::as_setTextBinding:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1092"]
  T1["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S1 -->|calls| T1
  S2["method:NSMutableAttributedString::as_setTextShadow:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1096"]
  T2["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S2 -->|calls| T2
  S3["method:NSMutableAttributedString::as_setTextInnerShadow:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1100"]
  T3["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S3 -->|calls| T3
  S4["method:NSMutableAttributedString::as_setTextUnderline:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1104"]
  T4["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S4 -->|calls| T4
  S5["method:NSMutableAttributedString::as_setTextStrikethrough:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1108"]
  T5["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S5 -->|calls| T5
  S6["method:NSMutableAttributedString::as_setTextBorder:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1112"]
  T6["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S6 -->|calls| T6
  S7["method:NSMutableAttributedString::as_setTextBackgroundBorder:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1116"]
  T7["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S7 -->|calls| T7
  S8["method:NSMutableAttributedString::as_setTextAttachment:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1120"]
  T8["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S8 -->|calls| T8
  S9["method:NSMutableAttributedString::as_setTextHighlight:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1124"]
  T9["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S9 -->|calls| T9
  S10["method:NSMutableAttributedString::as_setTextBlockBorder:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1128"]
  T10["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S10 -->|calls| T10
  S11["method:NSMutableAttributedString::as_setTextGlyphTransform:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1132"]
  T11["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S11 -->|calls| T11
  S12["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:tapAction:longPressAction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1137"]
  T12["method:NSMutableAttributedString::as_setColor:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:870"]
  S12 -->|calls| T12
  S13["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:tapAction:longPressAction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1137"]
  T13["method:NSMutableAttributedString::as_setTextHighlight:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1124"]
  S13 -->|calls| T13
  S14["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:tapAction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1151"]
  T14["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:tapAction:longPressAction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1137"]
  S14 -->|calls| T14
  S15["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1163"]
  T15["method:NSMutableAttributedString::as_setTextHighlightRange:color:backgroundColor:userInfo:tapAction:longPressAction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1137"]
  S15 -->|calls| T15
  S16["method:NSMutableAttributedString::as_insertString:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1175"]
  T16["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  S16 -->|calls| T16
  S17["method:NSMutableAttributedString::as_appendString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1180"]
  T17["method:ASMutableAttributedStringBuilder::replaceCharactersInRange:withString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:117"]
  S17 -->|calls| T17
  S18["method:NSMutableAttributedString::as_removeDiscontinuousAttributesInRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1186"]
  T18["method:NSMutableAttributedString::as_allDiscontinuousAttributeKeys<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1193"]
  S18 -->|calls| T18
  S19["method:NSMutableAttributedString::as_removeDiscontinuousAttributesInRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1186"]
  T19["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  S19 -->|calls| T19
  S20["method:ASLayoutManager::showCGGlyphs:positions:count:font:matrix:attributes:inContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASLayoutManager.mm:14"]
  T20["method:ASLayoutManager::showCGGlyphs:positions:count:font:matrix:attributes:inContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASLayoutManager.mm:14"]
  S20 -->|calls| T20
  S21["function:hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitAttributes.mm:19"]
  T21["function:ASHashBytes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S21 -->|calls| T21
  S22["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  T22["method:ASTextKitComponentsTextView::initWithFrame:textContainer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:24"]
  S22 -->|calls| T22
  S23["method:ASTextKitComponents::componentsWithAttributedSeedString:textContainerSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:78"]
  T23["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S23 -->|calls| T23
  S24["method:ASTextKitComponents::componentsWithAttributedSeedString:textContainerSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:78"]
  T24["method:ASTextKitComponents::componentsWithTextStorage:textContainerSize:layoutManager:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:88"]
  S24 -->|calls| T24
  S25["method:ASTextKitComponents::componentsWithAttributedSeedString:textContainerSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitComponents.mm:78"]
  T25["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
