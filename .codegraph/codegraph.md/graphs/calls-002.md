# `calls 符号关系 - 002`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:156"]
  T1["method:NSString::initByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:86"]
  S1 -->|calls| T1
  S2["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:156"]
  T2["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S2 -->|calls| T2
  S3["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:156"]
  T3["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S3 -->|calls| T3
  S4["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:156"]
  T4["method:NSData::initByURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:32"]
  S4 -->|calls| T4
  S5["method:FileFolderHandleTool::filePath:fileType:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:156"]
  T5["method:NSDictionary::initByContentsOfFile<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:FileFolderHandleTool::bundleFile:toLocalFile:localFileSuffix:fileType:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:193"]
  T6["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S6 -->|calls| T6
  S7["method:FileFolderHandleTool::bundleFile:toLocalFile:localFileSuffix:fileType:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:193"]
  T7["method:UIBezierPath::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIBezierPath/UIBezierPath+Extra/UIBezierPath+Extra.m:59"]
  S7 -->|calls| T7
  S8["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T8["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:434"]
  S8 -->|calls| T8
  S9["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:FileFolderHandleTool::writeFileAtPath:content:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:226"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["method:FileFolderHandleTool::delFile:fileSuffix:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:275"]
  T20["method:ASResponderChainEnumerator::nextObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:28"]
  S20 -->|calls| T20
  S21["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:341"]
  T21["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:434"]
  S21 -->|calls| T21
  S22["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:341"]
  T22["method:FileFolderHandleTool::directoryAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:421"]
  S22 -->|calls| T22
  S23["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:341"]
  T23["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:434"]
  S23 -->|calls| T23
  S24["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:341"]
  T24["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:434"]
  S24 -->|calls| T24
  S25["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:377"]
  T25["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:434"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
