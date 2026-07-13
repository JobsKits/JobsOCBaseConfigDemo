# `calls 符号关系 - 199`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextContainer::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:184"]
  T1["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S1 -->|calls| T1
  S2["method:ASTextContainer::setSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:226"]
  T2["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S2 -->|calls| T2
  S3["method:ASTextContainer::setSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:226"]
  T3["function:ASTextClipCGSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:26"]
  S3 -->|calls| T3
  S4["method:ASTextContainer::setInsets:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:234"]
  T4["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S4 -->|calls| T4
  S5["method:ASTextLayout::_init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:376"]
  T5["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S5 -->|calls| T5
  S6["method:ASTextLayout::layoutWithContainerSize:text:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:389"]
  T6["method:ASTextLayout::layoutWithContainer:text:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:394"]
  S6 -->|calls| T6
  S7["method:ASTextLayout::layoutWithContainer:text:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:394"]
  T7["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  S7 -->|calls| T7
  S8["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T8["method:ASTextContainer::makeImmutable<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:200"]
  S8 -->|calls| T8
  S9["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T9["method:ASTextLayout::_init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:376"]
  S9 -->|calls| T9
  S10["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T10["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S10 -->|calls| T10
  S11["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T11["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S11 -->|calls| T11
  S12["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T12["function:ASTextCFRangeFromNSRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:310"]
  S12 -->|calls| T12
  S13["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T13["function:ASTextUIEdgeInsetsInvert<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:178"]
  S13 -->|calls| T13
  S14["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T14["function:ASTextNSRangeFromCFRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:302"]
  S14 -->|calls| T14
  S15["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T15["method:NSMutableAttributedString::as_allDiscontinuousAttributeKeys<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.mm:1193"]
  S15 -->|calls| T15
  S16["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T16["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S16 -->|calls| T16
  S17["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T17["function:ASTextVerticalFormRotateCharacterSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.mm:11"]
  S17 -->|calls| T17
  S18["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T18["function:ASTextVerticalFormRotateAndMoveCharacterSet<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.mm:54"]
  S18 -->|calls| T18
  S19["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T19["function:ASTextCTFontContainsColorBitmapGlyphs<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:98"]
  S19 -->|calls| T19
  S20["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T20["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S20 -->|calls| T20
  S21["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T21["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S21 -->|calls| T21
  S22["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T22["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S22 -->|calls| T22
  S23["method:ASTextLayout::layoutWithContainer:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:398"]
  T23["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S23 -->|calls| T23
  S24["method:ASTextLayout::layoutWithContainers:text:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1013"]
  T24["method:ASTextLayout::layoutWithContainers:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1017"]
  S24 -->|calls| T24
  S25["method:ASTextLayout::layoutWithContainers:text:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:1017"]
  T25["method:ASTextContainer::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:127"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
