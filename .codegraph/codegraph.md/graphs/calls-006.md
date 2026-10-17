# `calls 符号关系 - 006`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FileFolderHandleTool::bundleFile:toLocalFile:localFileSuffix:fileType:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:211"]
  T1["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  S1 -->|calls| T1
  S2["method:FileFolderHandleTool::bundleFile:toLocalFile:localFileSuffix:fileType:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:211"]
  T2["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:FileFolderHandleTool::bundleFile:toLocalFile:localFileSuffix:fileType:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:211"]
  T3["method:FileFolderHandleTool::createFileWithFolderAtPath:contentsData:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:93"]
  S3 -->|calls| T3
  S4["method:FileFolderHandleTool::bundleFile:toLocalFile:localFileSuffix:fileType:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:211"]
  T4["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S4 -->|calls| T4
  S5["method:FileFolderHandleTool::bundleFile:toLocalFile:localFileSuffix:fileType:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:211"]
  T5["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S5 -->|calls| T5
  S6["method:FileFolderHandleTool::bundleFile:toLocalFile:localFileSuffix:fileType:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:211"]
  T6["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:243"]
  S6 -->|calls| T6
  S7["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:243"]
  T7["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:454"]
  S7 -->|calls| T7
  S8["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:243"]
  T8["method:NSString::jobsUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:38"]
  S8 -->|calls| T8
  S9["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:243"]
  T9["method:NSString::jobsUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:38"]
  S9 -->|calls| T9
  S10["method:FileFolderHandleTool::delFile:fileSuffix:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:292"]
  T10["method:NSString::hasPrefix<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S10 -->|calls| T10
  S11["method:FileFolderHandleTool::delFile:fileSuffix:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:292"]
  T11["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S11 -->|calls| T11
  S12["method:FileFolderHandleTool::delFile:fileSuffix:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:292"]
  T12["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S12 -->|calls| T12
  S13["method:FileFolderHandleTool::removeItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:309"]
  T13["method:FileFolderHandleTool::removeItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:309"]
  S13 -->|calls| T13
  S14["method:FileFolderHandleTool::clearCachesDirectory<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:333"]
  T14["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S14 -->|calls| T14
  S15["method:FileFolderHandleTool::clearCachesDirectory<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:333"]
  T15["method:NSObject::cachesDir<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:94"]
  S15 -->|calls| T15
  S16["method:FileFolderHandleTool::clearTmpDirectory<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:344"]
  T16["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S16 -->|calls| T16
  S17["method:FileFolderHandleTool::clearTmpDirectory<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:344"]
  T17["method:NSObject::tmpDir<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:112"]
  S17 -->|calls| T17
  S18["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:361"]
  T18["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:454"]
  S18 -->|calls| T18
  S19["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:361"]
  T19["method:FileFolderHandleTool::directoryAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:441"]
  S19 -->|calls| T19
  S20["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:361"]
  T20["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:454"]
  S20 -->|calls| T20
  S21["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:361"]
  T21["method:FileFolderHandleTool::createDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:71"]
  S21 -->|calls| T21
  S22["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:361"]
  T22["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:454"]
  S22 -->|calls| T22
  S23["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:361"]
  T23["method:FileFolderHandleTool::removeItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:309"]
  S23 -->|calls| T23
  S24["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:397"]
  T24["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:454"]
  S24 -->|calls| T24
  S25["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:397"]
  T25["method:FileFolderHandleTool::directoryAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:441"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
