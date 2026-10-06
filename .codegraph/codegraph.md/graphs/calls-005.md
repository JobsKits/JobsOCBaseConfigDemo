# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T1["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S1 -->|calls| T1
  S2["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T2["method:NSObject::cachesDir<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:94"]
  S2 -->|calls| T2
  S3["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S3 -->|calls| T3
  S4["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T4["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S4 -->|calls| T4
  S5["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T5["method:NSObject::cachesDir<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:94"]
  S5 -->|calls| T5
  S6["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T6["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S6 -->|calls| T6
  S7["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T7["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S7 -->|calls| T7
  S8["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T8["method:NSObject::cachesDir<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:94"]
  S8 -->|calls| T8
  S9["method:FileFolderHandleTool::createFileWithFolderAtPath:contentsData:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:93"]
  T9["method:FileFolderHandleTool::createFolderByFileUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:115"]
  S9 -->|calls| T9
  S10["method:FileFolderHandleTool::createFolderByFileUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:115"]
  T10["method:FileFolderHandleTool::directoryAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:441"]
  S10 -->|calls| T10
  S11["method:FileFolderHandleTool::createFolderByFileUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:115"]
  T11["method:FileFolderHandleTool::createFoldByFolderUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:129"]
  S11 -->|calls| T11
  S12["method:FileFolderHandleTool::createFoldByFolderUrl:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:129"]
  T12["method:FileFolderHandleTool::createDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:71"]
  S12 -->|calls| T12
  S13["method:FileFolderHandleTool::creationDateOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:143"]
  T13["method:FileFolderHandleTool::attributeOfItemAtPath:forKey:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:818"]
  S13 -->|calls| T13
  S14["method:FileFolderHandleTool::modificationDateOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:150"]
  T14["method:FileFolderHandleTool::attributeOfItemAtPath:forKey:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:818"]
  S14 -->|calls| T14
  S15["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T15["method:NSObject::jobsBundlePath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:16"]
  S15 -->|calls| T15
  S16["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S16 -->|calls| T16
  S17["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T17["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T18["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S18 -->|calls| T18
  S19["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T19["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S19 -->|calls| T19
  S20["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T20["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S20 -->|calls| T20
  S21["method:FileFolderHandleTool::bundleFile:bundleFileSuffix:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:161"]
  T21["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  S21 -->|calls| T21
  S22["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T22["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S22 -->|calls| T22
  S23["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T23["method:NSString::initByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:104"]
  S23 -->|calls| T23
  S24["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T24["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:247"]
  S24 -->|calls| T24
  S25["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:175"]
  T25["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
