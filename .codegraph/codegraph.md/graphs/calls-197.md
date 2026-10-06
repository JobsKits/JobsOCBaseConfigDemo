# `calls 符号关系 - 197`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T1["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S1 -->|calls| T1
  S2["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T2["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S2 -->|calls| T2
  S3["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T3["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S3 -->|calls| T3
  S4["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T4["method:NSString::rangeOfString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:65"]
  S4 -->|calls| T4
  S5["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T5["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S5 -->|calls| T5
  S6["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T6["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S6 -->|calls| T6
  S7["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T7["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S7 -->|calls| T7
  S8["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T8["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S8 -->|calls| T8
  S9["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T9["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  S9 -->|calls| T9
  S10["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T10["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S10 -->|calls| T10
  S11["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T11["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  S11 -->|calls| T11
  S12["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T12["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S12 -->|calls| T12
  S13["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T13["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S13 -->|calls| T13
  S14["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T14["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S14 -->|calls| T14
  S15["method:RibbonConfiguration::parseConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:143"]
  T15["field:RibbonConfiguration::text<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:82"]
  S15 -->|calls| T15
  S16["method:RibbonConfiguration::parseConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:143"]
  T16["field:RibbonConfiguration::text<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:82"]
  S16 -->|calls| T16
  S17["method:RibbonConfiguration::parseConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:143"]
  T17["method:BaseCollectionViewCell::setIndex:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:106"]
  S17 -->|calls| T17
  S18["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T18["method:FileFolderHandleTool::createDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:71"]
  S18 -->|calls| T18
  S19["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T19["method:FileFolderHandleTool::removeItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:309"]
  S19 -->|calls| T19
  S20["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T20["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:361"]
  S20 -->|calls| T20
  S21["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T21["method:NSObject::imageByDataURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:88"]
  S21 -->|calls| T21
  S22["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T22["method:OrderedDictionary::insert<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:314"]
  S22 -->|calls| T22
  S23["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T23["method:JobsAppIconRibbonGenerator::render<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:228"]
  S23 -->|calls| T23
  S24["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T24["method:ZBCacheManager::fileExistsAtPath:<br/>JobsByPods/ManualByOCPods@Pods/ZBNetworking/Core/ZBCacheManager/ZBCacheManager.m:138"]
  S24 -->|calls| T24
  S25["method:JobsAppIconRibbonGenerator::render<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:228"]
  T25["method:JobsCoreTextScrollLayer::drawInContext:<br/>JobsByPods/JobsOCUILabelScrolling@Pods/Support/JobsCoreTextScrollLayer/JobsCoreTextScrollLayer.m:106"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
