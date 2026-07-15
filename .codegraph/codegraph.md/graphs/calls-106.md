# `calls 符号关系 - 106`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  T1["method:ASMapNode::applySnapshotOptions<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:285"]
  S1 -->|calls| T1
  S2["method:ASMapNode::addLiveMap<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:296"]
  T2["method:MapHandlerNode::addAnnotations<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/ASMapNode/Sample/MapHandlerNode.m:230"]
  S2 -->|calls| T2
  S3["method:ASMapNode::setAnnotations:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:328"]
  T3["method:MapHandlerNode::addAnnotations<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/ASMapNode/Sample/MapHandlerNode.m:230"]
  S3 -->|calls| T3
  S4["method:ASMapNode::setAnnotations:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:328"]
  T4["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S4 -->|calls| T4
  S5["method:ASMapNode::setSnapshotSizeWithReloadIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:386"]
  T5["method:ASMapNode::destroySnapshotter<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:279"]
  S5 -->|calls| T5
  S6["method:ASMapNode::setSnapshotSizeWithReloadIfNeeded:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:386"]
  T6["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S6 -->|calls| T6
  S7["method:ASMapNode::calculateSizeThatFits:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:397"]
  T7["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S7 -->|calls| T7
  S8["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:409"]
  T8["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:409"]
  S8 -->|calls| T8
  S9["method:ASMapNode::calculatedLayoutDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:409"]
  T9["method:ASMapNode::takeSnapshot<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:187"]
  S9 -->|calls| T9
  S10["method:ASMapNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:419"]
  T10["method:ASMapNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMapNode.mm:419"]
  S10 -->|calls| T10
  S11["method:ASMultiplexImageNode::initWithCache:downloader:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:165"]
  T11["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  S11 -->|calls| T11
  S12["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  T12["method:ASMultiplexImageNode::initWithCache:downloader:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:165"]
  S12 -->|calls| T12
  S13["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  T13["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:69"]
  S13 -->|calls| T13
  S14["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  T14["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:63"]
  S14 -->|calls| T14
  S15["method:ASMultiplexImageNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:192"]
  T15["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S15 -->|calls| T15
  S16["method:ASMultiplexImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:199"]
  T16["method:ASMultiplexImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:199"]
  S16 -->|calls| T16
  S17["method:ASMultiplexImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:199"]
  T17["method:ASMultiplexImageNode::_setDisplayedImageIdentifier:withImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:391"]
  S17 -->|calls| T17
  S18["method:ASMultiplexImageNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:207"]
  T18["method:ASMultiplexImageNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:207"]
  S18 -->|calls| T18
  S19["method:ASMultiplexImageNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:207"]
  T19["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S19 -->|calls| T19
  S20["method:ASMultiplexImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:227"]
  T20["method:ASMultiplexImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:227"]
  S20 -->|calls| T20
  S21["method:ASMultiplexImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:227"]
  T21["method:ASMultiplexImageNode::_loadImageIdentifiers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:432"]
  S21 -->|calls| T21
  S22["method:ASMultiplexImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:234"]
  T22["method:ASMultiplexImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:234"]
  S22 -->|calls| T22
  S23["method:ASMultiplexImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:234"]
  T23["method:ASMultiplexImageNode::_setDisplayedImageIdentifier:withImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:391"]
  S23 -->|calls| T23
  S24["method:ASMultiplexImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:234"]
  T24["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S24 -->|calls| T24
  S25["method:ASMultiplexImageNode::displayWillStartAsynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:268"]
  T25["method:ASMultiplexImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:227"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
