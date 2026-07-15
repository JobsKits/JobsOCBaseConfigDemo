# `calls 符号关系 - 149`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T1["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T2["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T3["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["method:ASElementMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:34"]
  T4["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  S4 -->|calls| T4
  S5["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  T5["method:ASElementMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:34"]
  S5 -->|calls| T5
  S6["method:ASElementMap::itemIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:74"]
  T6["function:ASIndexPathsForTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:66"]
  S6 -->|calls| T6
  S7["method:ASElementMap::itemElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:79"]
  T7["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S7 -->|calls| T7
  S8["method:ASElementMap::numberOfItemsInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:94"]
  T8["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S8 -->|calls| T8
  S9["method:ASElementMap::contextForSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:103"]
  T9["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S9 -->|calls| T9
  S10["method:ASElementMap::elementForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:126"]
  T10["method:ASElementMap::itemIndexPathIsValid:assert:item:section:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:251"]
  S10 -->|calls| T10
  S11["method:ASElementMap::elementForLayoutAttributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:141"]
  T11["method:ASElementMap::supplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:136"]
  S11 -->|calls| T11
  S12["method:ASElementMap::convertIndexPath:fromMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:156"]
  T12["method:ASElementMap::convertSection:fromMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:169"]
  S12 -->|calls| T12
  S13["method:ASElementMap::mutableCopyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:189"]
  T13["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  S13 -->|calls| T13
  S14["method:ASElementMap::smallDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:201"]
  T14["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S14 -->|calls| T14
  S15["method:ASElementMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  T15["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S15 -->|calls| T15
  S16["method:ASElementMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  T16["method:ASElementMap::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:220"]
  S16 -->|calls| T16
  S17["method:ASElementMap::itemIndexPathIsValid:assert:item:section:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:251"]
  T17["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S17 -->|calls| T17
  S18["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.h:1"]
  T18["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S18 -->|calls| T18
  S19["function:ASGraphicsCreateImageWithOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:28"]
  T19["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S19 -->|calls| T19
  S20["function:ASGraphicsCreateImageWithOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:28"]
  T20["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S20 -->|calls| T20
  S21["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T21["function:ASConfigureExtendedRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S21 -->|calls| T21
  S22["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T22["function:ASConfigureExtendedRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S22 -->|calls| T22
  S23["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T23["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S23 -->|calls| T23
  S24["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T24["function:ASConfigureExtendedRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S24 -->|calls| T24
  S25["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T25["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
