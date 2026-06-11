# `calls 符号关系 - 126`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  T1["method:ASNetworkImageNode::callbackQueue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:118"]
  S1 -->|calls| T1
  S2["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  T2["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  S2 -->|calls| T2
  S3["method:ASNetworkImageNode::_locked_cancelDownloadAndClearImageWithResumePossibility:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:563"]
  T3["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S3 -->|calls| T3
  S4["method:ASNetworkImageNode::_locked_cancelImageDownloadWithResumePossibility:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:590"]
  T4["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S4 -->|calls| T4
  S5["method:ASNetworkImageNode::_locked_cancelImageDownloadWithResumePossibility:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:590"]
  T5["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S5 -->|calls| T5
  S6["method:ASNetworkImageNode::_downloadImageWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:611"]
  T6["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S6 -->|calls| T6
  S7["method:ASNetworkImageNode::_downloadImageWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:611"]
  T7["method:ASNetworkImageNode::callbackQueue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:118"]
  S7 -->|calls| T7
  S8["method:ASNetworkImageNode::_downloadImageWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:611"]
  T8["function:ASImageDownloaderPriorityWithInterfaceState<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:99"]
  S8 -->|calls| T8
  S9["method:ASNetworkImageNode::_downloadImageWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:611"]
  T9["property:ASMultiplexImageNode::shouldRetryImageDownload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.h:135"]
  S9 -->|calls| T9
  S10["method:ASNetworkImageNode::_downloadImageWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:611"]
  T10["property:ASMultiplexImageNode::shouldRetryImageDownload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASMultiplexImageNode.h:135"]
  S10 -->|calls| T10
  S11["method:ASNetworkImageNode::_downloadImageWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:611"]
  T11["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S11 -->|calls| T11
  S12["method:ASNetworkImageNode::_downloadImageWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:611"]
  T12["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S12 -->|calls| T12
  S13["method:ASNetworkImageNode::_downloadImageWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:611"]
  T13["method:ASNetworkImageNode::_updateProgressImageBlockOnDownloaderIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:501"]
  S13 -->|calls| T13
  S14["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T14["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S14 -->|calls| T14
  S15["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T15["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S15 -->|calls| T15
  S16["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T16["method:ASNetworkImageLoadInfo::initWithURL:sourceType:downloadIdentifier:userInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageLoadInfo.mm:13"]
  S16 -->|calls| T16
  S17["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T17["function:ASPerformBlockOnBackgroundThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:145"]
  S17 -->|calls| T17
  S18["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T18["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S18 -->|calls| T18
  S19["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T19["method:UIImage::asdk_image<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S19 -->|calls| T19
  S20["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T20["function:ASInterfaceStateIncludesPreload<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.h:44"]
  S20 -->|calls| T20
  S21["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T21["method:UIImage::asdk_animatedImageData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:19"]
  S21 -->|calls| T21
  S22["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T22["method:UIImage::asdk_image<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S22 -->|calls| T22
  S23["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T23["method:ASNetworkImageLoadInfo::initWithURL:sourceType:downloadIdentifier:userInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageLoadInfo.mm:13"]
  S23 -->|calls| T23
  S24["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T24["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S24 -->|calls| T24
  S25["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T25["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
