# `calls 符号关系 - 154`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASPINRemoteImageDownloader::downloadImageWithURL:shouldRetry:priority:callbackQueue:downloadProgress:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:271"]
  T1["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S1 -->|calls| T1
  S2["method:ASPINRemoteImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:320"]
  T2["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S2 -->|calls| T2
  S3["method:ASPINRemoteImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:320"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:ASPINRemoteImageDownloader::cancelImageDownloadForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:320"]
  T4["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S4 -->|calls| T4
  S5["method:ASPINRemoteImageDownloader::cancelImageDownloadWithResumePossibilityForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:326"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:ASPINRemoteImageDownloader::cancelImageDownloadWithResumePossibilityForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:326"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:ASPINRemoteImageDownloader::cancelImageDownloadWithResumePossibilityForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:326"]
  T7["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S7 -->|calls| T7
  S8["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T8["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S8 -->|calls| T8
  S9["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T10["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S10 -->|calls| T10
  S11["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T11["property:ZBURLRequest::progressBlock<br/>JobsByPods/ManualByOCPods@Pods/ZBNetworking/Core/ZBURLRequest/ZBURLRequest.h:167"]
  S11 -->|calls| T11
  S12["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T12["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S12 -->|calls| T12
  S13["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T15["function:PINRemoteImageManagerPriorityWithASImageDownloaderPriority<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:37"]
  S15 -->|calls| T15
  S16["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T16["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S16 -->|calls| T16
  S17["method:ASPINRemoteImageDownloader::_performWithCallbackQueue:work:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:380"]
  T17["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S17 -->|calls| T17
  S18["function:ASPageCoordinateForPageThatContainsPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:21"]
  T18["function:ASPageCoordinateMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:11"]
  S18 -->|calls| T18
  S19["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  T19["function:ASPageCoordinateGetX<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:26"]
  S19 -->|calls| T19
  S20["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  T20["function:ASPageCoordinateGetY<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:31"]
  S20 -->|calls| T20
  S21["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T21["function:ASPageCoordinateForPageThatContainsPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:21"]
  S21 -->|calls| T21
  S22["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T22["function:ASPageCoordinateForPageThatContainsPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:21"]
  S22 -->|calls| T22
  S23["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T23["function:ASPageCoordinateGetX<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:26"]
  S23 -->|calls| T23
  S24["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T24["function:ASPageCoordinateGetY<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:31"]
  S24 -->|calls| T24
  S25["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T25["function:ASPageCoordinateGetX<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:26"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
