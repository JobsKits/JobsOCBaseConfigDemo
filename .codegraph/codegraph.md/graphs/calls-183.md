# `calls 符号关系 - 183`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASOverlayLayoutSpec::overlayLayoutSpecWithChild:overlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:21"]
  T1["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  S1 -->|calls| T1
  S2["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  T2["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S2 -->|calls| T2
  S3["method:ASOverlayLayoutSpec::setChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:40"]
  T3["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S3 -->|calls| T3
  S4["method:ASOverlayLayoutSpec::setOverlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:51"]
  T4["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S4 -->|calls| T4
  S5["method:ASOverlayLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:67"]
  T5["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S5 -->|calls| T5
  S6["method:ASRatioLayoutSpec::ratioLayoutSpecWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:29"]
  T6["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  S6 -->|calls| T6
  S7["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  T7["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S7 -->|calls| T7
  S8["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T8["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S8 -->|calls| T8
  S9["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T9["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S9 -->|calls| T9
  S10["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T10["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S10 -->|calls| T10
  S11["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T11["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S11 -->|calls| T11
  S12["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T12["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S12 -->|calls| T12
  S13["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T13["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S13 -->|calls| T13
  S14["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T14["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S14 -->|calls| T14
  S15["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T15["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S15 -->|calls| T15
  S16["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T16["function:ASSizeRangeIntersect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S16 -->|calls| T16
  S17["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T17["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S17 -->|calls| T17
  S18["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T18["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S18 -->|calls| T18
  S19["method:ASRatioLayoutSpec::asciiArtName<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:97"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.h:1"]
  T20["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  T21["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S21 -->|calls| T21
  S22["method:ASRelativeLayoutSpec::relativePositionLayoutSpecWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:31"]
  T22["method:ASRelativeLayoutSpec::initWithHorizontalPosition:verticalPosition:sizingOption:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:18"]
  S22 -->|calls| T22
  S23["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T23["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S23 -->|calls| T23
  S24["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T24["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S24 -->|calls| T24
  S25["method:ASRelativeLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRelativeLayoutSpec.mm:53"]
  T25["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
