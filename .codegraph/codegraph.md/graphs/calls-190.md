# `calls 符号关系 - 190`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T1["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S1 -->|calls| T1
  S2["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T2["function:ASDisplayNodeNeedsSpecialPropertiesHandling<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:76"]
  S2 -->|calls| T2
  S3["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T3["function:ASBoundsAndPositionForFrame<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:83"]
  S3 -->|calls| T3
  S4["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T4["function:ASIsCGRectValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:51"]
  S4 -->|calls| T4
  S5["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T5["function:ASIsCGPositionValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:46"]
  S5 -->|calls| T5
  S6["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T6["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S6 -->|calls| T6
  S7["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T7["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S7 -->|calls| T7
  S8["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T8["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S8 -->|calls| T8
  S9["method:ASDisplayNode::setFrame:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:330"]
  T9["method:ASPendingStateController::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASPendingStateController.mm:40"]
  S9 -->|calls| T9
  S10["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  T10["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S10 -->|calls| T10
  S11["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  T11["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S11 -->|calls| T11
  S12["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  T12["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S12 -->|calls| T12
  S13["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  T13["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S13 -->|calls| T13
  S14["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  T14["method:_ASDisplayLayer::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:107"]
  S14 -->|calls| T14
  S15["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  T15["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S15 -->|calls| T15
  S16["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  T16["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S16 -->|calls| T16
  S17["method:ASDisplayNode::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:450"]
  T17["method:_ASDisplayLayer::setNeedsLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/_ASDisplayLayer.mm:91"]
  S17 -->|calls| T17
  S18["method:ASDisplayNode::layoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:481"]
  T18["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S18 -->|calls| T18
  S19["method:ASDisplayNode::layoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:481"]
  T19["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S19 -->|calls| T19
  S20["method:ASDisplayNode::setOpaque:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:517"]
  T20["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S20 -->|calls| T20
  S21["method:ASDisplayNode::setOpaque:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:517"]
  T21["method:ASDisplayNode::setNeedsDisplay<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:406"]
  S21 -->|calls| T21
  S22["method:ASDisplayNode::setOpaque:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:517"]
  T22["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S22 -->|calls| T22
  S23["method:ASDisplayNode::contentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:712"]
  T23["function:ASDisplayNodeUIContentModeFromCAContentsGravity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/_ASCoreAnimationExtras.mm:148"]
  S23 -->|calls| T23
  S24["method:ASDisplayNode::contentMode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:712"]
  T24["function:ASDisplayNodeGetPendingState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode.mm:81"]
  S24 -->|calls| T24
  S25["method:ASDisplayNode::setContentMode:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:726"]
  T25["function:ASDisplayNodeShouldApplyBridgedWriteToView<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASDisplayNode+UIViewBridge.mm:51"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
