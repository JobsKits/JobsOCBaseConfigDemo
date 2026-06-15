# `calls 符号关系 - 140`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::isTruncated<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  T1["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S1 -->|calls| T1
  S2["method:ASTextNode::shouldTruncateForConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1361"]
  T2["method:ASTextNode::isTruncated<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  S2 -->|calls| T2
  S3["method:ASTextNode::setPointSizeScaleFactors:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1366"]
  T3["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S3 -->|calls| T3
  S4["method:ASTextNode::setMaximumNumberOfLines:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1378"]
  T4["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S4 -->|calls| T4
  S5["method:ASTextNode::lineCount<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  T5["method:ASTextNode::lineCount<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  S5 -->|calls| T5
  S6["method:ASTextNode::lineCount<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  T6["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S6 -->|calls| T6
  S7["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  T7["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S7 -->|calls| T7
  S8["method:ASTextNode::_locked_composedTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1440"]
  T8["function:ASTextNode::DefaultTruncationAttributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1308"]
  S8 -->|calls| T8
  S9["method:ASTextNode::_locked_prepareTruncationStringForDrawing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1466"]
  T9["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  S9 -->|calls| T9
  S10["method:ASTextNode::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  T10["method:ASTextNode::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  S10 -->|calls| T10
  S11["method:ASTextNode::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["method:ASTextNode::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T13["method:Mutex::Mutex<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S13 -->|calls| T13
  S14["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T14["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S14 -->|calls| T14
  S15["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T15["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S15 -->|calls| T15
  S16["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T16["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S16 -->|calls| T16
  S17["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T17["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S17 -->|calls| T17
  S18["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T18["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S18 -->|calls| T18
  S19["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T19["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S19 -->|calls| T19
  S20["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T20["method:ASTextNode::shadowOffset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1264"]
  S20 -->|calls| T20
  S21["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T21["method:ASTextNode::shadowColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1242"]
  S21 -->|calls| T21
  S22["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T22["method:ASTextNode::shadowOpacity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1276"]
  S22 -->|calls| T22
  S23["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T23["method:ASTextNode::shadowRadius<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1288"]
  S23 -->|calls| T23
  S24["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T24["function:DefaultLinkAttributeNames<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:178"]
  S24 -->|calls| T24
  S25["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T25["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
