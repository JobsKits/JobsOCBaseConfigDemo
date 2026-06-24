# `calls 符号关系 - 162`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  T5["method:NSIndexSet::as_smallDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:68"]
  S5 -->|calls| T5
  S6["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  T8["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S8 -->|calls| T8
  S9["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  T9["function:ASGetDescriptionValueString<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:16"]
  S9 -->|calls| T9
  S10["function:ASObjectDescriptionMakeWithoutObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:66"]
  T10["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  S10 -->|calls| T10
  S11["function:ASObjectDescriptionMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:71"]
  T11["function:_ASObjectDescriptionMakePropertyList<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASObjectDescriptionHelpers.mm:49"]
  S11 -->|calls| T11
  S12["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  T12["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S12 -->|calls| T12
  S13["method:ASPINRemoteImageDownloader::setSharedImageManagerWithConfiguration:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:129"]
  T13["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  S13 -->|calls| T13
  S14["method:ASPINRemoteImageDownloader::setSharedImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:136"]
  T14["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  S14 -->|calls| T14
  S15["method:ASPINRemoteImageDownloader::setSharedPreconfiguredRemoteImageManager:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:146"]
  T15["method:ASElementMap::description<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASElementMap.mm:215"]
  S15 -->|calls| T15
  S16["method:ASPINRemoteImageDownloader::setSharedPreconfiguredRemoteImageManager:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:146"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:ASPINRemoteImageDownloader::PINRemoteImageManagerWithConfiguration:imageCache:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:156"]
  T17["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S17 -->|calls| T17
  S18["method:ASPINRemoteImageDownloader::sharedImageManagerSupportsMemoryRemoval<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:196"]
  T18["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S18 -->|calls| T18
  S19["method:ASPINRemoteImageDownloader::synchronouslyFetchedCachedImageWithURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:215"]
  T19["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S19 -->|calls| T19
  S20["method:ASPINRemoteImageDownloader::cachedImageWithURL:callbackQueue:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:228"]
  T20["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S20 -->|calls| T20
  S21["method:ASPINRemoteImageDownloader::cachedImageWithURL:callbackQueue:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:228"]
  T21["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S21 -->|calls| T21
  S22["method:ASPINRemoteImageDownloader::cachedImageWithURL:callbackQueue:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:228"]
  T22["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S22 -->|calls| T22
  S23["method:ASPINRemoteImageDownloader::cachedImageWithURL:callbackQueue:completion:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:228"]
  T23["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode+Beta.h:73"]
  S23 -->|calls| T23
  S24["method:ASPINRemoteImageDownloader::clearFetchedImageFromCacheWithURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:248"]
  T24["method:ASPINRemoteImageDownloader::sharedImageManagerSupportsMemoryRemoval<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:196"]
  S24 -->|calls| T24
  S25["method:ASPINRemoteImageDownloader::clearFetchedImageFromCacheWithURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:248"]
  T25["method:ASPINRemoteImageDownloader::sharedPINRemoteImageManager<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:188"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
