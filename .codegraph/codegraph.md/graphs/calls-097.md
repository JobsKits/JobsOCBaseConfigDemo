# `calls 符号关系 - 097`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASDKViewController::primitiveTraitCollectionForUITraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:295"]
  T1["method:ASDisplayNode::primitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:126"]
  S1 -->|calls| T1
  S2["method:ASDKViewController::primitiveTraitCollectionForUITraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:295"]
  T2["function:ASPrimitiveTraitCollectionFromUITraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:51"]
  S2 -->|calls| T2
  S3["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T3["function:ASPrimitiveTraitCollectionIsEqualToASPrimitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:92"]
  S3 -->|calls| T3
  S4["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T4["function:ASNodeLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:29"]
  S4 -->|calls| T4
  S5["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T5["function:NSStringFromASPrimitiveTraitCollection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:218"]
  S5 -->|calls| T5
  S6["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T6["function:ASTraitCollectionPropagateDown<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASTraitCollection.mm:18"]
  S6 -->|calls| T6
  S7["method:ASDKViewController::propagateNewTraitCollection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:308"]
  T7["method:ASDKViewController::nodeConstrainedSize<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKViewController.mm:273"]
  S7 -->|calls| T7
  S8["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T8["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  S8 -->|calls| T8
  S9["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T9["method:Mutex::Mutex<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASThread.h:118"]
  S9 -->|calls| T9
  S10["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T10["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S10 -->|calls| T10
  S11["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T11["method:ASBasicImageDownloader::sharedImageDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:227"]
  S11 -->|calls| T11
  S12["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  T12["method:ASPINRemoteImageDownloader::sharedDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:120"]
  S12 -->|calls| T12
  S13["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  T13["method:ASDefaultImageDownloader::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:30"]
  S13 -->|calls| T13
  S14["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:83"]
  T14["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:83"]
  S14 -->|calls| T14
  S15["method:ASDefaultImageDownloader::defaultDownloader<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:83"]
  T15["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  S15 -->|calls| T15
  S16["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:88"]
  T16["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:88"]
  S16 -->|calls| T16
  S17["method:ASDefaultImageDownloader::defaultCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:88"]
  T17["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  S17 -->|calls| T17
  S18["method:ASDefaultImageDownloader::setDefaultDownloaderProvider:cacheProvider:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:93"]
  T18["method:ASDefaultImageDownloader::setDefaultDownloaderProvider:cacheProvider:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:93"]
  S18 -->|calls| T18
  S19["method:ASDefaultImageDownloader::setDefaultDownloaderProvider:cacheProvider:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:93"]
  T19["method:ASDefaultImageDownloader::sharedInstance<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDefaultImageDownloader.mm:53"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T20["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T21["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T22["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T23["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T24["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Beta.h:1"]
  T25["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
