# `calls 符号关系 - 196`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':79"]
  T1["method:JobsOCGraphicCaptchaConfig::byMixedGroupCount<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaConfig/JobsOCGraphicCaptchaConfig.m:42"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':79"]
  T2["method:JobsOCGraphicCaptchaConfig::byCustomCharacterGroups<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaConfig/JobsOCGraphicCaptchaConfig.m:62"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':79"]
  T3["method:JobsAppDoorGraphicCaptchaConfig::byCaseSensitive<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':20"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':79"]
  T4["method:JobsOCGraphicCaptchaConfig::byLength<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaConfig/JobsOCGraphicCaptchaConfig.m:12"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorGraphicCaptchaConfig::copyWithZone:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':107"]
  T5["method:JobsAppDoorGraphicCaptchaConfig::init<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':38"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorGraphicCaptchaConfig::copyWithZone:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':107"]
  T6["method:JobsAppDoorGraphicCaptchaConfig::byCharacterTypes<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':29"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorGraphicCaptchaConfig::copyWithZone:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':107"]
  T7["method:JobsAppDoorGraphicCaptchaConfig::byCaseSensitive<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':20"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorGraphicCaptchaConfig::copyWithZone:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':107"]
  T8["method:JobsAppDoorGraphicCaptchaConfig::byLength<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':11"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorRegisterConfig::init<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':19"]
  T9["method:JobsAppDoorGraphicCaptchaConfig::defaultConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':46"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorRegisterConfig::fullConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':33"]
  T10["method:JobsAppDoorRegisterConfig::basicConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':27"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorRegisterConfig::fullConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':33"]
  T11["method:JobsAppDoorRegisterConfig::byShowsMobileBinding<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':61"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorRegisterConfig::fullConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':33"]
  T12["method:JobsAppDoorRegisterConfig::byShowsGraphicCaptcha<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':52"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorRegisterConfig::fullConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':33"]
  T13["method:JobsAppDoorRegisterConfig::byGraphicCaptchaConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':70"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorRegisterConfig::fullConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':33"]
  T14["method:JobsAppDoorGraphicCaptchaConfig::allCharactersConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m':72"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorRegisterConfig::copyWithZone:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':43"]
  T15["method:JobsAppDoorRegisterConfig::init<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':19"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorRegisterConfig::copyWithZone:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':43"]
  T16["method:JobsAppDoorRegisterConfig::byShowsMobileBinding<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':61"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorRegisterConfig::copyWithZone:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':43"]
  T17["method:JobsAppDoorRegisterConfig::byShowsGraphicCaptcha<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':52"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorRegisterConfig::copyWithZone:<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':43"]
  T18["method:JobsAppDoorRegisterConfig::byGraphicCaptchaConfig<br/>'JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorRegisterConfig/JobsAppDoorRegisterConfig.m':70"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsAppDoor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsAppDoor::standard_user_target_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsAppDoor::apply_standard_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsAppDoor::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsAppDoor::apply_standard_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsAppDoor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAppDoor@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T22["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S22 -->|calls| T22
  S23["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T23["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S23 -->|calls| T23
  S24["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T24["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S24 -->|calls| T24
  S25["struct:RibbonGeneratorOptions<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:49"]
  T25["field:RibbonGeneratorOptions::values<br/>JobsByPods/JobsAppIconRibbon@Pods/Scripts/JobsAppIconRibbonGenerator.swift:58"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
