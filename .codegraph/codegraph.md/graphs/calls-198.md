# `calls 符号关系 - 198`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppIconRibbonGenerator::render<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:228"]
  T1["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  S1 -->|calls| T1
  S2["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T2["method:TABBaseComponent::lineWithMode<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:356"]
  S2 -->|calls| T2
  S3["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T3["method:TABBaseComponent::lineWithMode<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:356"]
  S3 -->|calls| T3
  S4["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T4["method:TABBaseComponent::lineWithMode<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimated/Decorate/Chain/TABBaseComponent.m:356"]
  S4 -->|calls| T4
  S5["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T5["method:FileFolderHandleTool::sizeOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:500"]
  S5 -->|calls| T5
  S6["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T6["method:UIImage::draw<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S6 -->|calls| T6
  S7["file:JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:1"]
  T7["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S7 -->|calls| T7
  S8["file:JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:1"]
  T8["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S8 -->|calls| T8
  S9["file:JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:1"]
  T9["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S9 -->|calls| T9
  S10["file:JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:1"]
  T10["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S10 -->|calls| T10
  S11["function:(void)<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:68"]
  T11["function:JobsDeviceRealWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:316"]
  S11 -->|calls| T11
  S12["function:(void)<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:68"]
  T12["function:JobsDeviceRealHeight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:312"]
  S12 -->|calls| T12
  S13["function:JobsRealWidth<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:72"]
  T13["function:JobsDeviceRealHeight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:312"]
  S13 -->|calls| T13
  S14["function:JobsRealWidth<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:72"]
  T14["function:JobsDeviceRealWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:316"]
  S14 -->|calls| T14
  S15["method:JobsAppTools::sharedManager<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.m:21"]
  T15["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S15 -->|calls| T15
  S16["method:JobsAppTools::destroySingleton<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.m:37"]
  T16["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S16 -->|calls| T16
  S17["method:JobsAppTools::allocWithZone:<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.m:50"]
  T17["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  T18["method:JobsPodspecKitForJobsAppTools::standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:266"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsAppTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:273"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  S20 -->|calls| T20
  S21["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T21["function:jobsMakeButtonModel<br/>'JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.h':91"]
  S21 -->|calls| T21
  S22["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T22["method:UIButtonConfiguration::byImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:282"]
  S22 -->|calls| T22
  S23["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T23["method:UIButtonConfiguration::byImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:273"]
  S23 -->|calls| T23
  S24["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T24["method:FMBannerAdsModel::byRoundingCorners<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:272"]
  S24 -->|calls| T24
  S25["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T25["method:FMBannerAdsModel::bySelectedTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1577"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
