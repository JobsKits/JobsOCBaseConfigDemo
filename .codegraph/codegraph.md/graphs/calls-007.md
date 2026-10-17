# `calls 符号关系 - 007`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:397"]
  T1["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:454"]
  S1 -->|calls| T1
  S2["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:397"]
  T2["method:FileFolderHandleTool::createDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:71"]
  S2 -->|calls| T2
  S3["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:397"]
  T3["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:454"]
  S3 -->|calls| T3
  S4["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:397"]
  T4["method:FileFolderHandleTool::removeItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:309"]
  S4 -->|calls| T4
  S5["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:397"]
  T5["method:FileFolderHandleTool::removeItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:309"]
  S5 -->|calls| T5
  S6["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:454"]
  T6["method:ZBCacheManager::fileExistsAtPath:<br/>JobsByPods/ManualByOCPods@Pods/ZBNetworking/Core/ZBCacheManager/ZBCacheManager.m:138"]
  S6 -->|calls| T6
  S7["method:FileFolderHandleTool::isEmptyItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:460"]
  T7["method:FileFolderHandleTool::isFileAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:474"]
  S7 -->|calls| T7
  S8["method:FileFolderHandleTool::isEmptyItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:460"]
  T8["method:FileFolderHandleTool::sizeOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:500"]
  S8 -->|calls| T8
  S9["method:FileFolderHandleTool::isEmptyItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:460"]
  T9["method:FileFolderHandleTool::isDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:467"]
  S9 -->|calls| T9
  S10["method:FileFolderHandleTool::isEmptyItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:460"]
  T10["method:FileFolderHandleTool::listFilesInDirectoryAtPath:deep:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:553"]
  S10 -->|calls| T10
  S11["method:FileFolderHandleTool::isDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:467"]
  T11["method:FileFolderHandleTool::attributeOfItemAtPath:forKey:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:818"]
  S11 -->|calls| T11
  S12["method:FileFolderHandleTool::isFileAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:474"]
  T12["method:FileFolderHandleTool::attributeOfItemAtPath:forKey:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:818"]
  S12 -->|calls| T12
  S13["method:FileFolderHandleTool::sizeOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:500"]
  T13["method:FileFolderHandleTool::attributeOfItemAtPath:forKey:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:818"]
  S13 -->|calls| T13
  S14["method:FileFolderHandleTool::sizeOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:507"]
  T14["method:FileFolderHandleTool::isDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:467"]
  S14 -->|calls| T14
  S15["method:FileFolderHandleTool::sizeOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:507"]
  T15["method:FileFolderHandleTool::listFilesInDirectoryAtPath:deep:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:553"]
  S15 -->|calls| T15
  S16["method:FileFolderHandleTool::sizeOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:507"]
  T16["method:FileFolderHandleTool::attributesOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:824"]
  S16 -->|calls| T16
  S17["method:FileFolderHandleTool::sizeOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:507"]
  T17["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S17 -->|calls| T17
  S18["method:FileFolderHandleTool::sizeOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:507"]
  T18["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S18 -->|calls| T18
  S19["method:FileFolderHandleTool::sizeFormattedOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:522"]
  T19["method:FileFolderHandleTool::sizeOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:500"]
  S19 -->|calls| T19
  S20["method:FileFolderHandleTool::sizeFormattedOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:522"]
  T20["method:FileFolderHandleTool::sizeFormatted<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:528"]
  S20 -->|calls| T20
  S21["method:FileFolderHandleTool::sizeFormattedOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:541"]
  T21["method:FileFolderHandleTool::sizeOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:507"]
  S21 -->|calls| T21
  S22["method:FileFolderHandleTool::sizeFormattedOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:541"]
  T22["method:FileFolderHandleTool::sizeFormatted<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:528"]
  S22 -->|calls| T22
  S23["method:FileFolderHandleTool::gettingLastResource<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:573"]
  T23["method:PHAsset::initByOptions<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAsset/PHAsset+Extra/PHAsset+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:FileFolderHandleTool::gettingLastResource<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:573"]
  T24["function:jobsMakeTextView::jobsMakePHFetchOptions<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:646"]
  S24 -->|calls| T24
  S25["method:FileFolderHandleTool::gettingLastResource<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:573"]
  T25["method:PHFetchOptions::bySortDescriptors<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:832"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
