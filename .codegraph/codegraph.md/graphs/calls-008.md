# `calls 符号关系 - 008`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FileFolderHandleTool::sizeFormattedOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:541"]
  T1["method:FileFolderHandleTool::sizeFormatted<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:528"]
  S1 -->|calls| T1
  S2["method:FileFolderHandleTool::gettingLastResource<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:573"]
  T2["method:PHAsset::initByOptions<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAsset/PHAsset+Extra/PHAsset+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:FileFolderHandleTool::gettingLastResource<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:573"]
  T3["function:jobsMakeTextView::jobsMakePHFetchOptions<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:646"]
  S3 -->|calls| T3
  S4["method:FileFolderHandleTool::gettingLastResource<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:573"]
  T4["method:PHFetchOptions::bySortDescriptors<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:832"]
  S4 -->|calls| T4
  S5["method:FileFolderHandleTool::createAlbumFolder:ifExitFolderBlock:completionHandler:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:584"]
  T5["method:FileFolderHandleTool::isExistFolder<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:643"]
  S5 -->|calls| T5
  S6["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:596"]
  T6["method:FileFolderHandleTool::isExistFolder<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:643"]
  S6 -->|calls| T6
  S7["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:596"]
  T7["method:PHAssetCollectionChangeRequest::initByTitle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAssetCollectionChangeRequest/PHAssetCollectionChangeRequest+Extra/PHAssetCollectionChangeRequest+Extra.m:19"]
  S7 -->|calls| T7
  S8["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:596"]
  T8["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:611"]
  S8 -->|calls| T8
  S9["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:596"]
  T9["method:NSString::jobsURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  S9 -->|calls| T9
  S10["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:596"]
  T10["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:611"]
  S10 -->|calls| T10
  S11["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:596"]
  T11["method:NSString::jobsURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  S11 -->|calls| T11
  S12["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:611"]
  T12["method:PHCollectionList::initByOptions<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHCollectionList/PHCollectionList+Extra/PHCollectionList+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:611"]
  T13["method:NSString::isEqualToString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S13 -->|calls| T13
  S14["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:611"]
  T14["method:NSObject::appName<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+SysInfo/NSObject+SysInfo.m:49"]
  S14 -->|calls| T14
  S15["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:611"]
  T15["method:PHAssetChangeRequest::initByURL<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAssetChangeRequest/PHAssetChangeRequest+Extra/PHAssetChangeRequest+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:611"]
  T16["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:611"]
  T17["method:PHAssetCollectionChangeRequest::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAssetCollectionChangeRequest/PHAssetCollectionChangeRequest+Extra/PHAssetCollectionChangeRequest+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:FileFolderHandleTool::isExistFolder<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:643"]
  T18["method:NSString::isEqualToString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S18 -->|calls| T18
  S19["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T19["function:jobsMakeTextView::jobsMakePHVideoRequestOptions<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:653"]
  S19 -->|calls| T19
  S20["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T20["method:PHImageRequestOptions::byDeliveryMode<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:854"]
  S20 -->|calls| T20
  S21["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T21["method:PHVideoRequestOptions::byVersion<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:876"]
  S21 -->|calls| T21
  S22["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T22["method:UIBackgroundConfiguration::byImage<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBackgroundConfiguration/UIBackgroundConfiguration+Extra/UIBackgroundConfiguration+Extra.m:65"]
  S22 -->|calls| T22
  S23["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T23["method:NSObject::byData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSObject/NSObject+Data/NSObject+Data.m:32"]
  S23 -->|calls| T23
  S24["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T24["method:FileFolderHandleModel::byInfo<br/>JobsByPods/JobsModelDSL@Pods/Core/FileFolderHandleModel/FileFolderHandleModel+DSL/FileFolderHandleModel+DSL.m:29"]
  S24 -->|calls| T24
  S25["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T25["method:FileFolderHandleModel::byAudioMix<br/>JobsByPods/JobsModelDSL@Pods/Core/FileFolderHandleModel/FileFolderHandleModel+DSL/FileFolderHandleModel+DSL.m:20"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
