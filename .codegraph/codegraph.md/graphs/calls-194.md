# `calls 符号关系 - 194`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T1["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S1 -->|calls| T1
  S2["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T2["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S2 -->|calls| T2
  S3["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T3["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S3 -->|calls| T3
  S4["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T4["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  S4 -->|calls| T4
  S5["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T5["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S5 -->|calls| T5
  S6["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T6["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  S6 -->|calls| T6
  S7["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T7["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S7 -->|calls| T7
  S8["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T8["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S8 -->|calls| T8
  S9["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T9["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S9 -->|calls| T9
  S10["method:RibbonConfiguration::parseConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:143"]
  T10["field:RibbonConfiguration::text<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:82"]
  S10 -->|calls| T10
  S11["method:RibbonConfiguration::parseConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:143"]
  T11["field:RibbonConfiguration::text<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:82"]
  S11 -->|calls| T11
  S12["method:RibbonConfiguration::parseConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:143"]
  T12["method:BaseCollectionViewCell::setIndex:<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseCollectionViewCell/BaseCollectionViewCell/BaseCollectionViewCell.m:106"]
  S12 -->|calls| T12
  S13["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T13["method:FileFolderHandleTool::createDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:71"]
  S13 -->|calls| T13
  S14["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T14["method:FileFolderHandleTool::removeItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:309"]
  S14 -->|calls| T14
  S15["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T15["method:FileFolderHandleTool::copyItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:361"]
  S15 -->|calls| T15
  S16["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T16["method:NSObject::imageByDataURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:88"]
  S16 -->|calls| T16
  S17["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T17["method:OrderedDictionary::insert<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples_extra/ASDKgram-Swift/ASDKgram-Swift/OrderedDictionary/OrderedDictionary.swift:314"]
  S17 -->|calls| T17
  S18["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T18["method:JobsAppIconRibbonGenerator::render<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:228"]
  S18 -->|calls| T18
  S19["method:JobsAppIconRibbonGenerator::run<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:183"]
  T19["method:ZBCacheManager::fileExistsAtPath:<br/>JobsByPods/ManualByOCPods@Pods/ZBNetworking/Core/ZBCacheManager/ZBCacheManager.m:138"]
  S19 -->|calls| T19
  S20["method:JobsAppIconRibbonGenerator::render<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:228"]
  T20["method:JobsCoreTextScrollLayer::drawInContext:<br/>JobsByPods/JobsOCUILabelScrolling@Pods/Support/JobsCoreTextScrollLayer/JobsCoreTextScrollLayer.m:106"]
  S20 -->|calls| T20
  S21["method:JobsAppIconRibbonGenerator::render<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:228"]
  T21["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  S21 -->|calls| T21
  S22["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T22["method:TABBaseComponent::lineWithMode<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:356"]
  S22 -->|calls| T22
  S23["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T23["method:TABBaseComponent::lineWithMode<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:356"]
  S23 -->|calls| T23
  S24["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T24["method:TABBaseComponent::lineWithMode<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:356"]
  S24 -->|calls| T24
  S25["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T25["method:FileFolderHandleTool::sizeOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:500"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
