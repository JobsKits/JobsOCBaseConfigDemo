# `calls 符号关系 - 153`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASBasicImageDownloaderContext::contextForURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:66"]
  T1["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S1 -->|calls| T1
  S2["method:ASBasicImageDownloaderContext::initWithURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:88"]
  T2["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S2 -->|calls| T2
  S3["method:ASBasicImageDownloaderContext::performProgressBlocks:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:123"]
  T3["property:ZBURLRequest::progressBlock<br/>JobsByPods/ManualByOCPods@Pods/ZBNetworking/Core/ZBURLRequest/ZBURLRequest.h:167"]
  S3 -->|calls| T3
  S4["method:ASBasicImageDownloaderContext::completeWithImage:error:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:138"]
  T4["property:_ASAsyncTransaction::completionBlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.h:68"]
  S4 -->|calls| T4
  S5["method:NSURLRequest::setAsyncdisplaykit_context:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:205"]
  T5["function:NSURLRequest::ContextKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:201"]
  S5 -->|calls| T5
  S6["method:NSURLRequest::asyncdisplaykit_context<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:209"]
  T6["function:NSURLRequest::ContextKey<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:201"]
  S6 -->|calls| T6
  S7["method:ASBasicImageDownloader::sharedImageDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:227"]
  T7["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  S7 -->|calls| T7
  S8["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  T8["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S8 -->|calls| T8
  S9["method:ASBasicImageDownloader::_init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:239"]
  T9["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S9 -->|calls| T9
  S10["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:255"]
  T10["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  S10 -->|calls| T10
  S11["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  T11["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S11 -->|calls| T11
  S12["method:ASBasicImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:269"]
  T12["function:NSURLSessionTaskPriorityWithImageDownloaderPriority<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:29"]
  S12 -->|calls| T12
  S13["method:ASBasicImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:310"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:ASBasicImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:310"]
  T14["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S14 -->|calls| T14
  S15["method:ASBasicImageDownloader::URLSession:downloadTask:didFinishDownloadingToURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:331"]
  T15["method:ASBasicImageDownloaderContext::isCancelled<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:111"]
  S15 -->|calls| T15
  S16["method:ASBasicImageDownloader::URLSession:downloadTask:didFinishDownloadingToURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:331"]
  T16["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S16 -->|calls| T16
  S17["method:ASBatchContext::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:25"]
  T17["method:ASBatchContext::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:25"]
  S17 -->|calls| T17
  S18["method:ASBatchContext::completeBatchFetching:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBatchContext.mm:48"]
  T18["function:ASCollectionLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:37"]
  S18 -->|calls| T18
  S19["method:ASCollectionElement::initWithNodeModel:nodeBlock:supplementaryElementKind:constrainedSize:owningNode:traitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:26"]
  T19["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S19 -->|calls| T19
  S20["method:ASCollectionElement::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T20["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S20 -->|calls| T20
  S21["method:ASCollectionElement::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:46"]
  T21["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S21 -->|calls| T21
  S22["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T22["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S22 -->|calls| T22
  S23["method:ASCollectionElement::setTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionElement.mm:70"]
  T23["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S23 -->|calls| T23
  S24["method:ASCollectionFlowLayoutDelegate::initWithScrollableDirections:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:31"]
  T24["method:ASCollectionFlowLayoutDelegate::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:26"]
  S24 -->|calls| T24
  S25["method:ASCollectionFlowLayoutDelegate::calculateLayoutWithContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASCollectionFlowLayoutDelegate.mm:52"]
  T25["function:ASSizeRangeForCollectionLayoutThatFitsViewportSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASCollectionLayoutDefines.mm:11"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
