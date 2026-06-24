# `calls 符号关系 - 159`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASGraphicsCreateImageWithOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:28"]
  T1["function:ASPrimitiveTraitCollectionMakeDefault<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:28"]
  S1 -->|calls| T1
  S2["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T2["function:ASConfigureExtendedRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S2 -->|calls| T2
  S3["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T3["function:ASConfigureExtendedRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S3 -->|calls| T3
  S4["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T4["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S4 -->|calls| T4
  S5["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T5["function:ASConfigureExtendedRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:23"]
  S5 -->|calls| T5
  S6["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T6["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S6 -->|calls| T6
  S7["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  T7["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S7 -->|calls| T7
  S8["function:ASGraphicsCreateImageWithTraitCollectionAndOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:109"]
  T8["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S8 -->|calls| T8
  S9["method:ASHighlightOverlayLayer::defaultValueForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:25"]
  T9["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S9 -->|calls| T9
  S10["method:ASHighlightOverlayLayer::defaultActionForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:49"]
  T10["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S10 -->|calls| T10
  S11["method:ASHighlightOverlayLayer::initWithRects:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:54"]
  T11["method:ASHighlightOverlayLayer::initWithRects:targetLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:59"]
  S11 -->|calls| T11
  S12["method:ASHighlightOverlayLayer::initWithRects:targetLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:59"]
  T12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S12 -->|calls| T12
  S13["method:ASIntegerMap::identityMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:29"]
  T13["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S13 -->|calls| T13
  S14["method:ASIntegerMap::emptyMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:41"]
  T14["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S14 -->|calls| T14
  S15["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  T15["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S15 -->|calls| T15
  S16["method:ASIntegerMap::integerForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:92"]
  T16["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S16 -->|calls| T16
  S17["method:ASIntegerMap::inverseMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:114"]
  T17["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S17 -->|calls| T17
  S18["method:ASIntegerMap::inverseMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:114"]
  T18["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S18 -->|calls| T18
  S19["method:ASIntegerMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:167"]
  T19["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S19 -->|calls| T19
  S20["method:ASIntegerMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:167"]
  T20["method:ASElementMap::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:220"]
  S20 -->|calls| T20
  S21["method:ASMainSerialQueue::performBlockOnMainThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:32"]
  T21["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  S21 -->|calls| T21
  S22["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T22["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S22 -->|calls| T22
  S23["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T23["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S23 -->|calls| T23
  S24["method:ASMainSerialQueue::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:63"]
  T24["method:ASMainSerialQueue::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:63"]
  S24 -->|calls| T24
  S25["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  T25["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
