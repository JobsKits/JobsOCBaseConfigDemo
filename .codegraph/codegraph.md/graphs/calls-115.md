# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T1["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  S1 -->|calls| T1
  S2["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T2["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S2 -->|calls| T2
  S3["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T3["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S3 -->|calls| T3
  S4["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T4["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S4 -->|calls| T4
  S5["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T5["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  S5 -->|calls| T5
  S6["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T6["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S6 -->|calls| T6
  S7["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T7["method:ASMapNode::removeLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:316"]
  S7 -->|calls| T7
  S8["method:ASMapNode::setLiveMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:105"]
  T8["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S8 -->|calls| T8
  S9["method:ASMapNode::setLiveMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:105"]
  T9["method:ASMapNode::removeLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:316"]
  S9 -->|calls| T9
  S10["method:ASMapNode::options<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:130"]
  T10["method:ASMapNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:40"]
  S10 -->|calls| T10
  S11["method:ASMapNode::setOptions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T11["method:ASMapNode::applySnapshotOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:285"]
  S11 -->|calls| T11
  S12["method:ASMapNode::setOptions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T12["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S12 -->|calls| T12
  S13["method:ASMapNode::setOptions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T13["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S13 -->|calls| T13
  S14["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  T14["method:ASMapNode::setUpSnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:274"]
  S14 -->|calls| T14
  S15["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  T15["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S15 -->|calls| T15
  S16["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  T16["method:ASMapNode::applySnapshotOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:285"]
  S16 -->|calls| T16
  S17["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  T17["method:MapHandlerNode::addAnnotations<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/ASMapNode/Sample/MapHandlerNode.m:230"]
  S17 -->|calls| T17
  S18["method:ASMapNode::setAnnotations:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:328"]
  T18["method:MapHandlerNode::addAnnotations<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/ASMapNode/Sample/MapHandlerNode.m:230"]
  S18 -->|calls| T18
  S19["method:ASMapNode::setAnnotations:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:328"]
  T19["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S19 -->|calls| T19
  S20["method:ASMapNode::setSnapshotSizeWithReloadIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:386"]
  T20["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S20 -->|calls| T20
  S21["method:ASMapNode::setSnapshotSizeWithReloadIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:386"]
  T21["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S21 -->|calls| T21
  S22["method:ASMapNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:397"]
  T22["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S22 -->|calls| T22
  S23["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:409"]
  T23["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:409"]
  S23 -->|calls| T23
  S24["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:409"]
  T24["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S24 -->|calls| T24
  S25["method:ASMapNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:419"]
  T25["method:ASMapNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:419"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
