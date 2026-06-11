# `calls 符号关系 - 125`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASNetworkImageNode::setURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:179"]
  T1["method:ASNetworkImageNode::setURL:resetToDefault:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:184"]
  S1 -->|calls| T1
  S2["method:ASNetworkImageNode::setShouldRenderProgressImages:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:333"]
  T2["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  S2 -->|calls| T2
  S3["method:ASNetworkImageNode::displayWillStartAsynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:365"]
  T3["method:UIImage::asdk_image<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S3 -->|calls| T3
  S4["method:ASNetworkImageNode::displayWillStartAsynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:365"]
  T4["method:ASNetworkImageLoadInfo::initWithURL:sourceType:downloadIdentifier:userInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageLoadInfo.mm:13"]
  S4 -->|calls| T4
  S5["method:ASNetworkImageNode::displayWillStartAsynchronously:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:365"]
  T5["method:ASNetworkImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:489"]
  S5 -->|calls| T5
  S6["method:ASNetworkImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:412"]
  T6["method:ASNetworkImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:412"]
  S6 -->|calls| T6
  S7["method:ASNetworkImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:412"]
  T7["method:ASNetworkImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:489"]
  S7 -->|calls| T7
  S8["method:ASNetworkImageNode::didEnterVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:412"]
  T8["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  S8 -->|calls| T8
  S9["method:ASNetworkImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:419"]
  T9["method:ASNetworkImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:419"]
  S9 -->|calls| T9
  S10["method:ASNetworkImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:419"]
  T10["method:ASNetworkImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:489"]
  S10 -->|calls| T10
  S11["method:ASNetworkImageNode::didExitVisibleState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:419"]
  T11["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  S11 -->|calls| T11
  S12["method:ASNetworkImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:426"]
  T12["method:ASNetworkImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:426"]
  S12 -->|calls| T12
  S13["method:ASNetworkImageNode::didExitDisplayState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:426"]
  T13["method:ASNetworkImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:489"]
  S13 -->|calls| T13
  S14["method:ASNetworkImageNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:432"]
  T14["method:ASNetworkImageNode::didExitPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:432"]
  S14 -->|calls| T14
  S15["method:ASNetworkImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:444"]
  T15["method:ASNetworkImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:444"]
  S15 -->|calls| T15
  S16["method:ASNetworkImageNode::didEnterPreloadState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:444"]
  T16["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  S16 -->|calls| T16
  S17["method:ASNetworkImageNode::handleProgressImage:progress:downloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:475"]
  T17["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S17 -->|calls| T17
  S18["method:ASNetworkImageNode::_updatePriorityOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:489"]
  T18["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  S18 -->|calls| T18
  S19["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  T19["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S19 -->|calls| T19
  S20["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  T20["function:ASInterfaceStateIncludesVisible<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:34"]
  S20 -->|calls| T20
  S21["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  T21["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S21 -->|calls| T21
  S22["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  T22["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S22 -->|calls| T22
  S23["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  T23["method:ASNetworkImageNode::callbackQueue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:118"]
  S23 -->|calls| T23
  S24["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  T24["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S24 -->|calls| T24
  S25["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  T25["method:ASNetworkImageNode::callbackQueue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:118"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
