# `calls 符号关系 - 165`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASLayoutSpec::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:172"]
  T1["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S1 -->|calls| T1
  S2["method:ASLayoutSpec::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:172"]
  T2["method:ASLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:161"]
  S2 -->|calls| T2
  S3["method:ASLayoutSpec::findDuplicatedElementsInSubtree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:180"]
  T3["method:ASLayoutSpec::_findDuplicatedElementsInSubtreeWithWorkingSet:workingCount:result:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:195"]
  S3 -->|calls| T3
  S4["method:ASLayoutSpec::_findDuplicatedElementsInSubtreeWithWorkingSet:workingCount:result:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:195"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  T5["method:ASLayoutSpec::asciiArtName<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:248"]
  S5 -->|calls| T5
  S6["method:ASWrapperLayoutSpec::initWithLayoutElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:270"]
  T6["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S6 -->|calls| T6
  S7["method:ASWrapperLayoutSpec::initWithLayoutElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:284"]
  T7["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S7 -->|calls| T7
  S8["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  T8["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  S8 -->|calls| T8
  S9["method:ASLayoutSpec::asciiArtStringForChildren:parentName:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:337"]
  T9["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  S9 -->|calls| T9
  S10["method:ASOverlayLayoutSpec::overlayLayoutSpecWithChild:overlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:21"]
  T10["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  S10 -->|calls| T10
  S11["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  T11["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S11 -->|calls| T11
  S12["method:ASOverlayLayoutSpec::setChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:40"]
  T12["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S12 -->|calls| T12
  S13["method:ASOverlayLayoutSpec::setOverlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:51"]
  T13["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S13 -->|calls| T13
  S14["method:ASOverlayLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:67"]
  T14["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S14 -->|calls| T14
  S15["method:ASRatioLayoutSpec::ratioLayoutSpecWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:29"]
  T15["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  S15 -->|calls| T15
  S16["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  T16["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S16 -->|calls| T16
  S17["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T17["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S17 -->|calls| T17
  S18["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T18["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S18 -->|calls| T18
  S19["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T19["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S19 -->|calls| T19
  S20["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T20["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S20 -->|calls| T20
  S21["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T21["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S21 -->|calls| T21
  S22["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T22["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S22 -->|calls| T22
  S23["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T23["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S23 -->|calls| T23
  S24["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T24["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S24 -->|calls| T24
  S25["class:ASRatioLayoutSpec<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:22"]
  T25["function:ASSizeRangeIntersect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:88"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
