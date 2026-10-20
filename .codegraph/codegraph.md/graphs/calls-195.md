# `calls 符号关系 - 195`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppIconRibbonGenerator::drawRibbon<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:282"]
  T1["method:UIImage::draw<br/>JobsByPods/ManualByOCPods@Pods/Texture/examples/LayoutSpecExamples-Swift/Sample/Utilities.swift:70"]
  S1 -->|calls| T1
  S2["file:JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:1"]
  T2["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S2 -->|calls| T2
  S3["file:JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:1"]
  T3["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S3 -->|calls| T3
  S4["file:JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:1"]
  T4["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S4 -->|calls| T4
  S5["file:JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:1"]
  T5["function:Prop_assign<br/>JobsByPods/JobsLuckyEnvelopeRain@Pods/Core/JobsRedPacketRainConfig/JobsRedPacketRainConfig.h:22"]
  S5 -->|calls| T5
  S6["function:(void)<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:68"]
  T6["function:JobsDeviceRealWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:316"]
  S6 -->|calls| T6
  S7["function:(void)<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:68"]
  T7["function:JobsDeviceRealHeight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:312"]
  S7 -->|calls| T7
  S8["function:JobsRealWidth<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:72"]
  T8["function:JobsDeviceRealHeight<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:312"]
  S8 -->|calls| T8
  S9["function:JobsRealWidth<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.h:72"]
  T9["function:JobsDeviceRealWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:316"]
  S9 -->|calls| T9
  S10["method:JobsAppTools::sharedManager<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.m:21"]
  T10["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S10 -->|calls| T10
  S11["method:JobsAppTools::destroySingleton<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.m:37"]
  T11["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S11 -->|calls| T11
  S12["method:JobsAppTools::allocWithZone:<br/>JobsByPods/JobsAppTools@Pods/Core/JobsAppTools/JobsAppTools.m:50"]
  T12["function:JobsBlockClassMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:20"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  T13["method:JobsPodspecKitForJobsAppTools::standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:266"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsAppTools::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:273"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsAppTools::apply_standard_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsAppTools::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppTools@Pods/JobsPodspecKit.rb:277"]
  S15 -->|calls| T15
  S16["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T16["function:jobsMakeButtonModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.h:91"]
  S16 -->|calls| T16
  S17["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T17["method:UIButtonConfiguration::byImagePadding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:282"]
  S17 -->|calls| T17
  S18["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T18["method:UIButtonConfiguration::byImagePlacement<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:273"]
  S18 -->|calls| T18
  S19["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T19["method:FMBannerAdsModel::byRoundingCorners<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:272"]
  S19 -->|calls| T19
  S20["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T20["method:FMBannerAdsModel::bySelectedTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1577"]
  S20 -->|calls| T20
  S21["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T21["method:FMBannerAdsModel::byTitleCor<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1478"]
  S21 -->|calls| T21
  S22["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T22["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S22 -->|calls| T22
  S23["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T23["method:BRTextPickerView::byTitle<br/>JobsByPods/BRPickerViewExtra@Pods/Core/BRTextPickerView/BRTextPickerView+Extra/BRTextPickerView+Extra.m:27"]
  S23 -->|calls| T23
  S24["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T24["method:UIButtonConfiguration::byBaseBackgroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:120"]
  S24 -->|calls| T24
  S25["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsAppTools@Pods/Support/UIKit/NSObject/NSObject+AppTools/NSObject+AppTools.m:14"]
  T25["method:FMBannerAdsModel::byNormalImage<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1649"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
