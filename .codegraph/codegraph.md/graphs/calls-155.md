# `calls 符号关系 - 155`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  T1["method:ASElementMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:34"]
  S1 -->|calls| T1
  S2["method:ASElementMap::itemIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:74"]
  T2["function:ASIndexPathsForTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:66"]
  S2 -->|calls| T2
  S3["method:ASElementMap::itemElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:79"]
  T3["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S3 -->|calls| T3
  S4["method:ASElementMap::numberOfItemsInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:94"]
  T4["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S4 -->|calls| T4
  S5["method:ASElementMap::contextForSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:103"]
  T5["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S5 -->|calls| T5
  S6["method:ASElementMap::elementForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:126"]
  T6["method:ASElementMap::itemIndexPathIsValid:assert:item:section:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:251"]
  S6 -->|calls| T6
  S7["method:ASElementMap::elementForLayoutAttributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:141"]
  T7["method:ASElementMap::supplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:136"]
  S7 -->|calls| T7
  S8["method:ASElementMap::convertIndexPath:fromMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:156"]
  T8["method:ASElementMap::convertSection:fromMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:169"]
  S8 -->|calls| T8
  S9["method:ASElementMap::mutableCopyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:189"]
  T9["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  S9 -->|calls| T9
  S10["method:ASElementMap::smallDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:201"]
  T10["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S10 -->|calls| T10
  S11["method:ASElementMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  T11["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S11 -->|calls| T11
  S12["method:ASElementMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  T12["method:ASElementMap::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:220"]
  S12 -->|calls| T12
  S13["method:ASElementMap::itemIndexPathIsValid:assert:item:section:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:251"]
  T13["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S13 -->|calls| T13
  S14["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.h:1"]
  T14["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S14 -->|calls| T14
  S15["function:ASGraphicsCreateImageWithOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:28"]
  T15["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S15 -->|calls| T15
  S16["function:ASGraphicsCreateImageWithOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:28"]
  T16["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S16 -->|calls| T16
  S17["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T17["function:ASConfigureExtendedRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S17 -->|calls| T17
  S18["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T18["function:ASConfigureExtendedRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S18 -->|calls| T18
  S19["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T19["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S19 -->|calls| T19
  S20["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T20["function:ASConfigureExtendedRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S20 -->|calls| T20
  S21["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T21["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S21 -->|calls| T21
  S22["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T22["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S22 -->|calls| T22
  S23["function:ASGraphicsCreateImageWithTraitCollectionAndOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:109"]
  T23["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S23 -->|calls| T23
  S24["method:ASHighlightOverlayLayer::defaultValueForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:25"]
  T24["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S24 -->|calls| T24
  S25["method:ASHighlightOverlayLayer::defaultActionForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:49"]
  T25["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
