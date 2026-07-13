# `calls 符号关系 - 179`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.h:1"]
  T1["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S1 -->|calls| T1
  S2["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  T2["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S2 -->|calls| T2
  S3["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  T3["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S3 -->|calls| T3
  S4["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  T4["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S4 -->|calls| T4
  S5["method:ASLayoutSpec::style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:57"]
  T5["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S5 -->|calls| T5
  S6["method:ASLayoutSpec::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:172"]
  T6["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S6 -->|calls| T6
  S7["method:ASLayoutSpec::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:172"]
  T7["method:ASLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:161"]
  S7 -->|calls| T7
  S8["method:ASLayoutSpec::findDuplicatedElementsInSubtree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:180"]
  T8["method:ASLayoutSpec::_findDuplicatedElementsInSubtreeWithWorkingSet:workingCount:result:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:195"]
  S8 -->|calls| T8
  S9["method:ASLayoutSpec::_findDuplicatedElementsInSubtreeWithWorkingSet:workingCount:result:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:195"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:ASLayoutSpec::_findDuplicatedElementsInSubtreeWithWorkingSet:workingCount:result:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:195"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  T11["method:ASLayoutSpec::asciiArtName<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:248"]
  S11 -->|calls| T11
  S12["method:ASWrapperLayoutSpec::initWithLayoutElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:270"]
  T12["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S12 -->|calls| T12
  S13["method:ASWrapperLayoutSpec::initWithLayoutElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:284"]
  T13["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S13 -->|calls| T13
  S14["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  T14["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  S14 -->|calls| T14
  S15["method:ASLayoutSpec::asciiArtStringForChildren:parentName:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:337"]
  T15["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  S15 -->|calls| T15
  S16["method:ASOverlayLayoutSpec::overlayLayoutSpecWithChild:overlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:21"]
  T16["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  S16 -->|calls| T16
  S17["method:ASOverlayLayoutSpec::initWithChild:overlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:28"]
  T17["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S17 -->|calls| T17
  S18["method:ASOverlayLayoutSpec::setChild:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:40"]
  T18["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S18 -->|calls| T18
  S19["method:ASOverlayLayoutSpec::setOverlay:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:51"]
  T19["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  S19 -->|calls| T19
  S20["method:ASOverlayLayoutSpec::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASOverlayLayoutSpec.mm:67"]
  T20["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S20 -->|calls| T20
  S21["method:ASRatioLayoutSpec::ratioLayoutSpecWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:29"]
  T21["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  S21 -->|calls| T21
  S22["method:ASRatioLayoutSpec::initWithRatio:child:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:34"]
  T22["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S22 -->|calls| T22
  S23["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T23["function:ASPointsValidForSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:30"]
  S23 -->|calls| T23
  S24["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T24["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S24 -->|calls| T24
  S25["method:ASRatioLayoutSpec::calculateLayoutThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASRatioLayoutSpec.mm:58"]
  T25["function:ASFloorPixelValue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:209"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
