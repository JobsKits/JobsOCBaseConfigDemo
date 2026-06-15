# `calls 符号关系 - 115`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMapNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:56"]
  T1["method:ASMapNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:56"]
  S1 -->|calls| T1
  S2["method:ASMapNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:56"]
  T2["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S2 -->|calls| T2
  S3["method:ASMapNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:64"]
  T3["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S3 -->|calls| T3
  S4["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T4["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  S4 -->|calls| T4
  S5["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T5["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S5 -->|calls| T5
  S6["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T6["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S6 -->|calls| T6
  S7["method:ASMapNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:75"]
  T7["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S7 -->|calls| T7
  S8["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T8["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  S8 -->|calls| T8
  S9["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T9["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S9 -->|calls| T9
  S10["method:ASMapNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:87"]
  T10["method:ASMapNode::removeLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:316"]
  S10 -->|calls| T10
  S11["method:ASMapNode::setLiveMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:105"]
  T11["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  S11 -->|calls| T11
  S12["method:ASMapNode::setLiveMap:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:105"]
  T12["method:ASMapNode::removeLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:316"]
  S12 -->|calls| T12
  S13["method:ASMapNode::options<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:130"]
  T13["method:ASMapNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:40"]
  S13 -->|calls| T13
  S14["method:ASMapNode::setOptions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T14["method:ASMapNode::applySnapshotOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:285"]
  S14 -->|calls| T14
  S15["method:ASMapNode::setOptions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T15["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S15 -->|calls| T15
  S16["method:ASMapNode::setOptions:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:144"]
  T16["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S16 -->|calls| T16
  S17["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  T17["method:ASMapNode::setUpSnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:274"]
  S17 -->|calls| T17
  S18["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  T18["function:ASGraphicsCreateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASGraphicsContext.mm:35"]
  S18 -->|calls| T18
  S19["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  T19["method:ASMapNode::applySnapshotOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:285"]
  S19 -->|calls| T19
  S20["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  T20["method:MapHandlerNode::addAnnotations<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/ASMapNode/Sample/MapHandlerNode.m:230"]
  S20 -->|calls| T20
  S21["method:ASMapNode::setAnnotations:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:328"]
  T21["method:MapHandlerNode::addAnnotations<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/ASMapNode/Sample/MapHandlerNode.m:230"]
  S21 -->|calls| T21
  S22["method:ASMapNode::setAnnotations:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:328"]
  T22["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S22 -->|calls| T22
  S23["method:ASMapNode::setSnapshotSizeWithReloadIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:386"]
  T23["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S23 -->|calls| T23
  S24["method:ASMapNode::setSnapshotSizeWithReloadIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:386"]
  T24["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S24 -->|calls| T24
  S25["method:ASMapNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:397"]
  T25["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
