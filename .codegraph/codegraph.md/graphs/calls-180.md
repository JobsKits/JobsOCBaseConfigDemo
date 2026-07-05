# `calls 符号关系 - 180`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  T1["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S1 -->|calls| T1
  S2["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T2["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S2 -->|calls| T2
  S3["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T3["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S3 -->|calls| T3
  S4["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T4["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S4 -->|calls| T4
  S5["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T5["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S5 -->|calls| T5
  S6["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T6["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S6 -->|calls| T6
  S7["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T7["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S7 -->|calls| T7
  S8["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T8["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S8 -->|calls| T8
  S9["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T9["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S9 -->|calls| T9
  S10["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T10["function:ASSizeRangeIntersect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S10 -->|calls| T10
  S11["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T11["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S11 -->|calls| T11
  S12["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T12["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S12 -->|calls| T12
  S13["method:ASRatioLayoutSpec::asciiArtName<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:97"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.h:1"]
  T14["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S14 -->|calls| T14
  S15["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  T15["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S15 -->|calls| T15
  S16["method:ASRelativeLayoutSpec::relativePositionLayoutSpecWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:31"]
  T16["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  S16 -->|calls| T16
  S17["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T17["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S17 -->|calls| T17
  S18["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T18["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S18 -->|calls| T18
  S19["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T19["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S19 -->|calls| T19
  S20["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T20["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S20 -->|calls| T20
  S21["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T21["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S21 -->|calls| T21
  S22["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T22["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S22 -->|calls| T22
  S23["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T23["function:ASRoundPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:250"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASStackLayoutElement.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
