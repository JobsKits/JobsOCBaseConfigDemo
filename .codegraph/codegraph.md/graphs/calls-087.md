# `calls 符号关系 - 087`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDKViewController::viewWillLayoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:138"]
  T1["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  S1 -->|calls| T1
  S2["method:ASDKViewController::viewDidLayoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:161"]
  T2["method:ASDKViewController::viewDidLayoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:161"]
  S2 -->|calls| T2
  S3["method:ASDKViewController::_updateNodeFallbackSafeArea<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:170"]
  T3["function:ASConcatInsets<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.h:90"]
  S3 -->|calls| T3
  S4["method:ASDKViewController::viewWillAppear:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:182"]
  T4["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S4 -->|calls| T4
  S5["method:ASDKViewController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:207"]
  T5["function:ASLayoutRangeModeForVisibilityDepth<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASVisibilityProtocols.mm:12"]
  S5 -->|calls| T5
  S6["method:ASDKViewController::visibilityDepthDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:207"]
  T6["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S6 -->|calls| T6
  S7["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  T7["function:ASSizeRangeMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:248"]
  S7 -->|calls| T7
  S8["method:ASDKViewController::primitiveTraitCollectionForUITraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:295"]
  T8["method:ASDisplayNode::primitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:126"]
  S8 -->|calls| T8
  S9["method:ASDKViewController::primitiveTraitCollectionForUITraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:295"]
  T9["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S9 -->|calls| T9
  S10["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T10["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S10 -->|calls| T10
  S11["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T11["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S11 -->|calls| T11
  S12["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T12["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  S12 -->|calls| T12
  S13["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T13["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S13 -->|calls| T13
  S14["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T14["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  S14 -->|calls| T14
  S15["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T15["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  S15 -->|calls| T15
  S16["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T16["method:Mutex::Mutex<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S16 -->|calls| T16
  S17["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T17["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S17 -->|calls| T17
  S18["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T18["method:ASBasicImageDownloader::sharedImageDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:227"]
  S18 -->|calls| T18
  S19["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T19["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S19 -->|calls| T19
  S20["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  T20["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  S20 -->|calls| T20
  S21["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:83"]
  T21["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:83"]
  S21 -->|calls| T21
  S22["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:83"]
  T22["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  S22 -->|calls| T22
  S23["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:88"]
  T23["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:88"]
  S23 -->|calls| T23
  S24["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:88"]
  T24["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  S24 -->|calls| T24
  S25["method:ASDefaultImageDownloader::setDefaultDownloaderProvider:cacheProvider:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:93"]
  T25["method:ASDefaultImageDownloader::setDefaultDownloaderProvider:cacheProvider:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:93"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
