# `calls 符号关系 - 196`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSAttributedString::as_expansionAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:180"]
  T1["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S1 -->|calls| T1
  S2["method:NSAttributedString::as_baselineOffsetAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:188"]
  T2["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S2 -->|calls| T2
  S3["method:NSAttributedString::as_verticalGlyphFormAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:196"]
  T3["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S3 -->|calls| T3
  S4["method:NSAttributedString::as_languageAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:205"]
  T4["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S4 -->|calls| T4
  S5["method:NSAttributedString::as_writingDirectionAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:213"]
  T5["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S5 -->|calls| T5
  S6["method:NSAttributedString::as_paragraphStyleAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:221"]
  T6["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S6 -->|calls| T6
  S7["method:NSAttributedString::as_textShadowAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:376"]
  T7["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S7 -->|calls| T7
  S8["method:NSAttributedString::as_textInnerShadowAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:384"]
  T8["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S8 -->|calls| T8
  S9["method:NSAttributedString::as_textUnderlineAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:392"]
  T9["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S9 -->|calls| T9
  S10["method:NSAttributedString::as_textStrikethroughAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:400"]
  T10["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S10 -->|calls| T10
  S11["method:NSAttributedString::as_textBorderAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:408"]
  T11["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S11 -->|calls| T11
  S12["method:NSAttributedString::as_textBackgroundBorderAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:416"]
  T12["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S12 -->|calls| T12
  S13["method:NSAttributedString::as_textGlyphTransformAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:424"]
  T13["method:NSAttributedString::as_attribute:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:29"]
  S13 -->|calls| T13
  S14["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T14["function:ASTextEmojiGetAscentWithFontSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:109"]
  S14 -->|calls| T14
  S15["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T15["function:ASTextEmojiGetDescentWithFontSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:126"]
  S15 -->|calls| T15
  S16["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T16["function:ASTextEmojiGetGlyphBoundingRectWithFontSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:143"]
  S16 -->|calls| T16
  S17["method:NSAttributedString::as_attachmentStringWithEmojiImage:fontSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:523"]
  T17["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S17 -->|calls| T17
  S18["method:NSMutableAttributedString::setAs_attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:651"]
  T18["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S18 -->|calls| T18
  S19["method:NSMutableAttributedString::setAs_attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:651"]
  T19["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  S19 -->|calls| T19
  S20["method:NSMutableAttributedString::setAs_attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:651"]
  T20["method:NSMutableAttributedString::as_setAttribute:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:659"]
  S20 -->|calls| T20
  S21["method:NSMutableAttributedString::as_setAttribute:value:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:659"]
  T21["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  S21 -->|calls| T21
  S22["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  T22["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S22 -->|calls| T22
  S23["method:NSMutableAttributedString::as_setAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:663"]
  T23["method:ASMutableAttributedStringBuilder::removeAttribute:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:201"]
  S23 -->|calls| T23
  S24["method:NSMutableAttributedString::as_removeAttributesInRange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:669"]
  T24["method:ASMutableAttributedStringBuilder::setAttributes:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:185"]
  S24 -->|calls| T24
  S25["method:NSMutableAttributedString::setAs_font:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:675"]
  T25["method:NSMutableAttributedString::as_setFont:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:862"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
