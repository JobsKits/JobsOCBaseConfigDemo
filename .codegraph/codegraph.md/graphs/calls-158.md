# `calls 符号关系 - 158`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASCollectionViewProxy::indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:150"]
  T1["method:ASDelegateProxy::_indexPathForElementWithModelIdentifier:inView:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:264"]
  S1 -->|calls| T1
  S2["method:ASDelegateProxy::initWithTarget:interceptor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:176"]
  T2["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S2 -->|calls| T2
  S3["method:ASDelegateProxy::methodSignatureForSelector:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:229"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASDelegateProxy::methodSignatureForSelector:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASDelegateProxy.mm:229"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T5["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T6["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T7["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T8["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S8 -->|calls| T8
  S9["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.h:1"]
  T9["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S9 -->|calls| T9
  S10["method:ASElementMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:34"]
  T10["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  S10 -->|calls| T10
  S11["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  T11["method:ASElementMap::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:34"]
  S11 -->|calls| T11
  S12["method:ASElementMap::itemIndexPaths<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:74"]
  T12["function:ASIndexPathsForTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:66"]
  S12 -->|calls| T12
  S13["method:ASElementMap::itemElements<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:79"]
  T13["function:ASElementsInTwoDimensionalArray<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASTwoDimensionalArrayUtils.mm:89"]
  S13 -->|calls| T13
  S14["method:ASElementMap::numberOfItemsInSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:94"]
  T14["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S14 -->|calls| T14
  S15["method:ASElementMap::contextForSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:103"]
  T15["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S15 -->|calls| T15
  S16["method:ASElementMap::elementForItemAtIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:126"]
  T16["method:ASElementMap::itemIndexPathIsValid:assert:item:section:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:251"]
  S16 -->|calls| T16
  S17["method:ASElementMap::elementForLayoutAttributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:141"]
  T17["method:ASElementMap::supplementaryElementOfKind:atIndexPath:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:136"]
  S17 -->|calls| T17
  S18["method:ASElementMap::convertIndexPath:fromMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:156"]
  T18["method:ASElementMap::convertSection:fromMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:169"]
  S18 -->|calls| T18
  S19["method:ASElementMap::mutableCopyWithZone:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:189"]
  T19["method:ASElementMap::initWithSections:items:supplementaryElements:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:39"]
  S19 -->|calls| T19
  S20["method:ASElementMap::smallDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:201"]
  T20["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S20 -->|calls| T20
  S21["method:ASElementMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  T21["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  S21 -->|calls| T21
  S22["method:ASElementMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  T22["method:ASElementMap::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:220"]
  S22 -->|calls| T22
  S23["method:ASElementMap::itemIndexPathIsValid:assert:item:section:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:251"]
  T23["method:ASElementMap::sectionIndexIsValid:assert:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:233"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.h:1"]
  T24["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S24 -->|calls| T24
  S25["function:ASGraphicsCreateImageWithOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:28"]
  T25["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
