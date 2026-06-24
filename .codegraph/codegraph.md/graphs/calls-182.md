# `calls 符号关系 - 182`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASLayoutElementStyle::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:765"]
  T1["method:ASLayoutElementStyle::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:765"]
  S1 -->|calls| T1
  S2["method:ASLayoutElementStyle::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:765"]
  T2["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S2 -->|calls| T2
  S3["method:ASLayoutElementStyle::destroyYogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:786"]
  T3["function:ASLayoutElementYogaUpdateMeasureFunc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASYogaUtilities.mm:157"]
  S3 -->|calls| T3
  S4["method:ASLayoutElementStyle::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:796"]
  T4["method:ASLayoutElementStyle::destroyYogaNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:786"]
  S4 -->|calls| T4
  S5["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  T5["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASAbsoluteLayoutSpec.mm:35"]
  S5 -->|calls| T5
  S6["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  T6["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S6 -->|calls| T6
  S7["method:ASLayoutSpec::setChild:atIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:52"]
  T7["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S7 -->|calls| T7
  S8["method:ASLayoutSpec::childAtIndex:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:73"]
  T8["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.h:1"]
  T9["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.h:1"]
  T10["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.h:1"]
  T11["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S11 -->|calls| T11
  S12["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  T12["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S12 -->|calls| T12
  S13["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  T13["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S13 -->|calls| T13
  S14["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  T14["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S14 -->|calls| T14
  S15["method:ASLayoutSpec::style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:57"]
  T15["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S15 -->|calls| T15
  S16["method:ASLayoutSpec::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:172"]
  T16["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S16 -->|calls| T16
  S17["method:ASLayoutSpec::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:172"]
  T17["method:ASLayoutSpec::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:161"]
  S17 -->|calls| T17
  S18["method:ASLayoutSpec::findDuplicatedElementsInSubtree<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:180"]
  T18["method:ASLayoutSpec::_findDuplicatedElementsInSubtreeWithWorkingSet:workingCount:result:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:195"]
  S18 -->|calls| T18
  S19["method:ASLayoutSpec::_findDuplicatedElementsInSubtreeWithWorkingSet:workingCount:result:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:195"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["method:ASLayoutSpec::_findDuplicatedElementsInSubtreeWithWorkingSet:workingCount:result:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:195"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  T21["method:ASLayoutSpec::asciiArtName<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:248"]
  S21 -->|calls| T21
  S22["method:ASWrapperLayoutSpec::initWithLayoutElement:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:270"]
  T22["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S22 -->|calls| T22
  S23["method:ASWrapperLayoutSpec::initWithLayoutElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:284"]
  T23["method:ASLayoutSpec::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:27"]
  S23 -->|calls| T23
  S24["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  T24["method:ASLayoutSpec::asciiArtString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:242"]
  S24 -->|calls| T24
  S25["method:ASLayoutSpec::asciiArtStringForChildren:parentName:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:337"]
  T25["method:ASLayoutSpec::asciiArtStringForChildren:parentName:direction:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec.mm:322"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
