# `calls 符号关系 - 122`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  T1["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:69"]
  S1 -->|calls| T1
  S2["method:ASMultiplexImageNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:187"]
  T2["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:63"]
  S2 -->|calls| T2
  S3["method:ASMultiplexImageNode::dealloc<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:192"]
  T3["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S3 -->|calls| T3
  S4["method:ASMultiplexImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:199"]
  T4["method:ASMultiplexImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:199"]
  S4 -->|calls| T4
  S5["method:ASMultiplexImageNode::clearContents<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:199"]
  T5["method:ASMultiplexImageNode::_setDisplayedImageIdentifier:withImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:391"]
  S5 -->|calls| T5
  S6["method:ASMultiplexImageNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:207"]
  T6["method:ASMultiplexImageNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:207"]
  S6 -->|calls| T6
  S7["method:ASMultiplexImageNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:207"]
  T7["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S7 -->|calls| T7
  S8["method:ASMultiplexImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:227"]
  T8["method:ASMultiplexImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:227"]
  S8 -->|calls| T8
  S9["method:ASMultiplexImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:227"]
  T9["method:ASMultiplexImageNode::_loadImageIdentifiers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:432"]
  S9 -->|calls| T9
  S10["method:ASMultiplexImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:234"]
  T10["method:ASMultiplexImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:234"]
  S10 -->|calls| T10
  S11["method:ASMultiplexImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:234"]
  T11["method:ASMultiplexImageNode::_setDisplayedImageIdentifier:withImage:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:391"]
  S11 -->|calls| T11
  S12["method:ASMultiplexImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:234"]
  T12["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S12 -->|calls| T12
  S13["method:ASMultiplexImageNode::displayWillStartAsynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:268"]
  T13["method:ASMultiplexImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:227"]
  S13 -->|calls| T13
  S14["method:ASMultiplexImageNode::displayWillStartAsynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:268"]
  T14["method:ASMultiplexImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:473"]
  S14 -->|calls| T14
  S15["method:ASMultiplexImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:277"]
  T15["method:ASMultiplexImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:277"]
  S15 -->|calls| T15
  S16["method:ASMultiplexImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:277"]
  T16["method:ASMultiplexImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:473"]
  S16 -->|calls| T16
  S17["method:ASMultiplexImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:277"]
  T17["method:ASMultiplexImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:489"]
  S17 -->|calls| T17
  S18["method:ASMultiplexImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:284"]
  T18["method:ASMultiplexImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:284"]
  S18 -->|calls| T18
  S19["method:ASMultiplexImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:284"]
  T19["method:ASMultiplexImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:473"]
  S19 -->|calls| T19
  S20["method:ASMultiplexImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:284"]
  T20["method:ASMultiplexImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:489"]
  S20 -->|calls| T20
  S21["method:ASMultiplexImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:291"]
  T21["method:ASMultiplexImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:291"]
  S21 -->|calls| T21
  S22["method:ASMultiplexImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:291"]
  T22["method:ASMultiplexImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:473"]
  S22 -->|calls| T22
  S23["method:ASMultiplexImageNode::setShouldRenderProgressImages:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:337"]
  T23["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S23 -->|calls| T23
  S24["method:ASMultiplexImageNode::setShouldRenderProgressImages:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:337"]
  T24["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S24 -->|calls| T24
  S25["method:ASMultiplexImageNode::setShouldRenderProgressImages:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.mm:337"]
  T25["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
