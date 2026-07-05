# `calls 符号关系 - 136`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextNode::setTruncationMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1344"]
  T1["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S1 -->|calls| T1
  S2["method:ASTextNode::isTruncated<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  T2["method:ASTextNode::isTruncated<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  S2 -->|calls| T2
  S3["method:ASTextNode::isTruncated<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  T3["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S3 -->|calls| T3
  S4["method:ASTextNode::shouldTruncateForConstrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1361"]
  T4["method:ASTextNode::isTruncated<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1356"]
  S4 -->|calls| T4
  S5["method:ASTextNode::setPointSizeScaleFactors:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1366"]
  T5["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S5 -->|calls| T5
  S6["method:ASTextNode::setMaximumNumberOfLines:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1378"]
  T6["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S6 -->|calls| T6
  S7["method:ASTextNode::lineCount<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  T7["method:ASTextNode::lineCount<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  S7 -->|calls| T7
  S8["method:ASTextNode::lineCount<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1390"]
  T8["method:ASTextNode::_locked_renderer<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:384"]
  S8 -->|calls| T8
  S9["method:ASTextNode::_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1402"]
  T9["method:ASTextNode::_locked_invalidateTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1408"]
  S9 -->|calls| T9
  S10["method:ASTextNode::_locked_composedTruncationText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1440"]
  T10["function:ASTextNode::DefaultTruncationAttributedString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1308"]
  S10 -->|calls| T10
  S11["method:ASTextNode::_locked_prepareTruncationStringForDrawing:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1466"]
  T11["function:ASCleanseAttributedStringOfCoreTextAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextKit/ASTextKitCoreTextAdditions.mm:120"]
  S11 -->|calls| T11
  S12["method:ASTextNode::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  T12["method:ASTextNode::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  S12 -->|calls| T12
  S13["method:ASTextNode::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:ASTextNode::initialize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1513"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T15["method:Mutex::Mutex<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S15 -->|calls| T15
  S16["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T16["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S16 -->|calls| T16
  S17["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T17["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S17 -->|calls| T17
  S18["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T18["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S18 -->|calls| T18
  S19["function:ASTextNodeCompatibleLayoutWithContainerAndText<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:50"]
  T19["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S19 -->|calls| T19
  S20["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T20["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S20 -->|calls| T20
  S21["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T21["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  S21 -->|calls| T21
  S22["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T22["method:ASTextNode::shadowOffset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1264"]
  S22 -->|calls| T22
  S23["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T23["method:ASTextNode::shadowColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1242"]
  S23 -->|calls| T23
  S24["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T24["method:ASTextNode::shadowOpacity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1276"]
  S24 -->|calls| T24
  S25["function:init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode2.mm:187"]
  T25["method:ASTextNode::shadowRadius<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1288"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
