# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASHighlightOverlayLayer::defaultValueForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:25"]
  T1["function:ASScreenScale<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:179"]
  S1 -->|calls| T1
  S2["method:ASHighlightOverlayLayer::defaultActionForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:49"]
  T2["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S2 -->|calls| T2
  S3["method:ASHighlightOverlayLayer::initWithRects:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:54"]
  T3["method:ASHighlightOverlayLayer::initWithRects:targetLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:59"]
  S3 -->|calls| T3
  S4["method:ASHighlightOverlayLayer::initWithRects:targetLayer:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHighlightOverlayLayer.mm:59"]
  T4["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S4 -->|calls| T4
  S5["method:ASIntegerMap::identityMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:29"]
  T5["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S5 -->|calls| T5
  S6["method:ASIntegerMap::emptyMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:41"]
  T6["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S6 -->|calls| T6
  S7["method:ASIntegerMap::mapForUpdateWithOldCount:deleted:inserted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:53"]
  T7["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S7 -->|calls| T7
  S8["method:ASIntegerMap::integerForKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:92"]
  T8["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S8 -->|calls| T8
  S9["method:ASIntegerMap::inverseMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:114"]
  T9["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S9 -->|calls| T9
  S10["method:ASIntegerMap::inverseMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:114"]
  T10["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S10 -->|calls| T10
  S11["method:ASIntegerMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:167"]
  T11["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  S11 -->|calls| T11
  S12["method:ASIntegerMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASIntegerMap.mm:167"]
  T12["method:ASElementMap::propertiesForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:220"]
  S12 -->|calls| T12
  S13["method:ASMainSerialQueue::performBlockOnMainThread:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:32"]
  T13["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  S13 -->|calls| T13
  S14["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T14["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S14 -->|calls| T14
  S15["method:ASMainSerialQueue::runBlocks<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:42"]
  T15["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S15 -->|calls| T15
  S16["method:ASMainSerialQueue::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:63"]
  T16["method:ASMainSerialQueue::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMainSerialQueue.mm:63"]
  S16 -->|calls| T16
  S17["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  T17["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S17 -->|calls| T17
  S18["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  T18["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S18 -->|calls| T18
  S19["method:ASMutableAttributedStringBuilder::initWithString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:34"]
  T19["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S19 -->|calls| T19
  S20["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  T20["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S20 -->|calls| T20
  S21["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  T21["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  S21 -->|calls| T21
  S22["method:ASMutableAttributedStringBuilder::initWithAttributedString:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:54"]
  T22["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S22 -->|calls| T22
  S23["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  T23["method:ASMutableAttributedStringBuilder::initWithString:attributes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:39"]
  S23 -->|calls| T23
  S24["method:ASMutableAttributedStringBuilder::_pendingRangeAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:81"]
  T24["method:ASMutableAttributedStringBuilder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:25"]
  S24 -->|calls| T24
  S25["method:ASMutableAttributedStringBuilder::_applyPendingRangeAttributions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:91"]
  T25["method:ASMutableAttributedStringBuilder::_attributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:63"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
