# `calls 符号关系 - 193`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorGraphicCaptchaConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:107"]
  T1["method:JobsAppDoorGraphicCaptchaConfig::byCharacterTypes<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:29"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorGraphicCaptchaConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:107"]
  T2["method:JobsAppDoorGraphicCaptchaConfig::byCaseSensitive<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:20"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorGraphicCaptchaConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:107"]
  T3["method:JobsAppDoorGraphicCaptchaConfig::byLength<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:11"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorRegisterConfig::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:19"]
  T4["method:JobsAppDoorGraphicCaptchaConfig::defaultConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:46"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorRegisterConfig::fullConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:33"]
  T5["method:JobsAppDoorRegisterConfig::basicConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:27"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorRegisterConfig::fullConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:33"]
  T6["method:JobsAppDoorRegisterConfig::byShowsMobileBinding<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:61"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorRegisterConfig::fullConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:33"]
  T7["method:JobsAppDoorRegisterConfig::byShowsGraphicCaptcha<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:52"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorRegisterConfig::fullConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:33"]
  T8["method:JobsAppDoorRegisterConfig::byGraphicCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:70"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorRegisterConfig::fullConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:33"]
  T9["method:JobsAppDoorGraphicCaptchaConfig::allCharactersConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:72"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorRegisterConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:43"]
  T10["method:JobsAppDoorRegisterConfig::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:19"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorRegisterConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:43"]
  T11["method:JobsAppDoorRegisterConfig::byShowsMobileBinding<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:61"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorRegisterConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:43"]
  T12["method:JobsAppDoorRegisterConfig::byShowsGraphicCaptcha<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:52"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorRegisterConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:43"]
  T13["method:JobsAppDoorRegisterConfig::byGraphicCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m:70"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsAppDoor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:277"]
  T14["method:JobsPodspecKitForJobsAppDoor::standard_user_target_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:266"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsAppDoor::apply_standard_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsAppDoor::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:273"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsAppDoor::apply_standard_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsAppDoor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:277"]
  S16 -->|calls| T16
  S17["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T17["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S17 -->|calls| T17
  S18["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T18["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S18 -->|calls| T18
  S19["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T19["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S19 -->|calls| T19
  S20["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T20["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S20 -->|calls| T20
  S21["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T21["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S21 -->|calls| T21
  S22["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T22["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S22 -->|calls| T22
  S23["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T23["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S23 -->|calls| T23
  S24["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T24["method:NSString::rangeOfString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:65"]
  S24 -->|calls| T24
  S25["struct:RibbonConfiguration<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:79"]
  T25["field:RibbonConfiguration::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:92"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
