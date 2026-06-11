# `calls 符号关系 - 159`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSURLRequest::asyncdisplaykit_context<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:209"]
  T1["function:NSURLRequest::ContextKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:201"]
  S1 -->|calls| T1
  S2["method:ASBasicImageDownloader::sharedImageDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:227"]
  T2["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  S2 -->|calls| T2
  S3["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  T3["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S3 -->|calls| T3
  S4["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  T4["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S4 -->|calls| T4
  S5["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:255"]
  T5["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  S5 -->|calls| T5
  S6["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  T6["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S6 -->|calls| T6
  S7["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  T7["function:NSURLSessionTaskPriorityWithImageDownloaderPriority<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:29"]
  S7 -->|calls| T7
  S8["method:ASBasicImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:310"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:ASBasicImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:310"]
  T9["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S9 -->|calls| T9
  S10["method:ASBasicImageDownloader::URLSession:downloadTask:didFinishDownloadingToURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:331"]
  T10["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S10 -->|calls| T10
  S11["method:ASBasicImageDownloader::URLSession:downloadTask:didFinishDownloadingToURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:331"]
  T11["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S11 -->|calls| T11
  S12["method:ASBatchContext::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:25"]
  T12["method:ASBatchContext::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:25"]
  S12 -->|calls| T12
  S13["method:ASBatchContext::completeBatchFetching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:48"]
  T13["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S13 -->|calls| T13
  S14["method:ASCollectionElement::initWithNodeModel:nodeBlock:supplementaryElementKind:constrainedSize:owningNode:traitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:26"]
  T14["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S14 -->|calls| T14
  S15["method:ASCollectionElement::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T15["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S15 -->|calls| T15
  S16["method:ASCollectionElement::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T16["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S16 -->|calls| T16
  S17["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T17["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S17 -->|calls| T17
  S18["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T18["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S18 -->|calls| T18
  S19["method:ASCollectionFlowLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:31"]
  T19["method:ASCollectionFlowLayoutDelegate::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:26"]
  S19 -->|calls| T19
  S20["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T20["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S20 -->|calls| T20
  S21["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T21["method:ASCollectionLayoutState::initWithContext:layout:getElementBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionLayoutState.mm:48"]
  S21 -->|calls| T21
  S22["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T22["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S22 -->|calls| T22
  S23["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T23["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S23 -->|calls| T23
  S24["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T24["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S24 -->|calls| T24
  S25["method:ASCollectionGalleryLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionGalleryLayoutDelegate.mm:36"]
  T25["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
