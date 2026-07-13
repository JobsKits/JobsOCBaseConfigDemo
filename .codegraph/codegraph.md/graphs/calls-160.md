# `calls 符号关系 - 160`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASPINRemoteImageDownloader::cancelImageDownloadWithResumePossibilityForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:326"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:ASPINRemoteImageDownloader::cancelImageDownloadWithResumePossibilityForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:326"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:ASPINRemoteImageDownloader::cancelImageDownloadWithResumePossibilityForIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:326"]
  T3["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S3 -->|calls| T3
  S4["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T6["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S6 -->|calls| T6
  S7["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T7["property:ZBURLRequest::progressBlock<br/>JobsByPods/ManualByOCPods@Pods/ZBNetworking/Core/ZBURLRequest/ZBURLRequest.h:167"]
  S7 -->|calls| T7
  S8["method:ASPINRemoteImageDownloader::setProgressImageBlock:callbackQueue:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:332"]
  T8["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S8 -->|calls| T8
  S9["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T11["function:PINRemoteImageManagerPriorityWithASImageDownloaderPriority<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:37"]
  S11 -->|calls| T11
  S12["method:ASPINRemoteImageDownloader::setPriority:withDownloadIdentifier:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:347"]
  T12["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S12 -->|calls| T12
  S13["method:ASPINRemoteImageDownloader::_performWithCallbackQueue:work:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:380"]
  T13["function:ASDisplayNodeThreadIsMain<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:21"]
  S13 -->|calls| T13
  S14["function:ASPageCoordinateForPageThatContainsPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:21"]
  T14["function:ASPageCoordinateMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:11"]
  S14 -->|calls| T14
  S15["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  T15["function:ASPageCoordinateGetX<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:26"]
  S15 -->|calls| T15
  S16["function:ASPageCoordinateGetPageRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:36"]
  T16["function:ASPageCoordinateGetY<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:31"]
  S16 -->|calls| T16
  S17["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T17["function:ASPageCoordinateForPageThatContainsPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:21"]
  S17 -->|calls| T17
  S18["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T18["function:ASPageCoordinateForPageThatContainsPoint<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:21"]
  S18 -->|calls| T18
  S19["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T19["function:ASPageCoordinateGetX<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:26"]
  S19 -->|calls| T19
  S20["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T20["function:ASPageCoordinateGetY<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:31"]
  S20 -->|calls| T20
  S21["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T21["function:ASPageCoordinateGetX<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:26"]
  S21 -->|calls| T21
  S22["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T22["function:ASPageCoordinateGetY<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:31"]
  S22 -->|calls| T22
  S23["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  T23["function:ASPageCoordinateMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:11"]
  S23 -->|calls| T23
  S24["method:NSMapTable::pageTableWithLayoutAttributes:contentSize:pageSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:109"]
  T24["method:NSMapTable::pageTableForStrongObjectPointers<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:89"]
  S24 -->|calls| T24
  S25["method:NSMapTable::pageTableWithLayoutAttributes:contentSize:pageSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:109"]
  T25["function:ASPageCoordinatesForPagesThatIntersectRect<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPageTable.mm:43"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
