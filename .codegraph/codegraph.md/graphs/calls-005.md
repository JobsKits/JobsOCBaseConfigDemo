# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T1["method:NSObject::cachesDir<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:94"]
  S1 -->|calls| T1
  S2["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T2["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S2 -->|calls| T2
  S3["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T3["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S3 -->|calls| T3
  S4["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T4["method:NSObject::cachesDir<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:94"]
  S4 -->|calls| T4
  S5["method:FileFolderHandleTool::createFileWithFolderAtPath:contentsData:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:93"]
  T5["method:FileFolderHandleTool::createFolderByFileUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:115"]
  S5 -->|calls| T5
  S6["method:FileFolderHandleTool::createFolderByFileUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:115"]
  T6["method:FileFolderHandleTool::directoryAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:441"]
  S6 -->|calls| T6
  S7["method:FileFolderHandleTool::createFolderByFileUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:115"]
  T7["method:FileFolderHandleTool::createFoldByFolderUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:129"]
  S7 -->|calls| T7
  S8["method:FileFolderHandleTool::createFoldByFolderUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:129"]
  T8["method:FileFolderHandleTool::createDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:71"]
  S8 -->|calls| T8
  S9["method:FileFolderHandleTool::creationDateOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:143"]
  T9["method:FileFolderHandleTool::attributeOfItemAtPath:forKey:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:818"]
  S9 -->|calls| T9
  S10["method:FileFolderHandleTool::modificationDateOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:150"]
  T10["method:FileFolderHandleTool::attributeOfItemAtPath:forKey:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:818"]
  S10 -->|calls| T10
  S11["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T11["method:NSObject::jobsBundlePath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:16"]
  S11 -->|calls| T11
  S12["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S12 -->|calls| T12
  S13["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T13["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T14["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S14 -->|calls| T14
  S15["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T15["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S15 -->|calls| T15
  S16["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T16["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S16 -->|calls| T16
  S17["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T17["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  S17 -->|calls| T17
  S18["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T18["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S18 -->|calls| T18
  S19["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T19["method:NSString::initByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:104"]
  S19 -->|calls| T19
  S20["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T20["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:247"]
  S20 -->|calls| T20
  S21["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T21["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S21 -->|calls| T21
  S22["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T22["method:NSString::jobsFileUrl<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:43"]
  S22 -->|calls| T22
  S23["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T23["method:NSData::initByURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:32"]
  S23 -->|calls| T23
  S24["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T24["method:NSDictionary::initByContentsOfFile<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:FileFolderHandleTool::bundleFile:toLocalFile:localFileSuffix:fileType:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:211"]
  T25["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
