# `calls 符号关系 - 192`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsAppDoorConfig::registerContentY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:67"]
  T1["function:JobsMainScreen_HEIGHT<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:308"]
  S1 -->|calls| T1
  S2["method:JobsAppDoorConfig::registerContentY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:67"]
  T2["method:JobsAppDoorConfig::registerContentHeight<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:55"]
  S2 -->|calls| T2
  S3["method:JobsAppDoorConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:76"]
  T3["method:JobsAppDoorConfig::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:21"]
  S3 -->|calls| T3
  S4["method:JobsAppDoorConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:76"]
  T4["method:JobsAppDoorConfig::byBackgroundType<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:87"]
  S4 -->|calls| T4
  S5["method:JobsAppDoorConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:76"]
  T5["method:JobsAppDoorConfig::byRegisterConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:96"]
  S5 -->|calls| T5
  S6["method:JobsAppDoorConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:76"]
  T6["method:JobsAppDoorConfig::byBackgroundImageName<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:105"]
  S6 -->|calls| T6
  S7["method:JobsAppDoorConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:76"]
  T7["method:JobsAppDoorConfig::byNotchVideoResourceName<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:123"]
  S7 -->|calls| T7
  S8["method:JobsAppDoorConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:76"]
  T8["method:JobsAppDoorConfig::byCompactVideoResourceName<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorConfig/JobsAppDoorConfig.m:114"]
  S8 -->|calls| T8
  S9["method:JobsAppDoorGraphicCaptchaConfig::numberAndEnglishConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:52"]
  T9["method:JobsAppDoorGraphicCaptchaConfig::defaultConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:46"]
  S9 -->|calls| T9
  S10["method:JobsAppDoorGraphicCaptchaConfig::numberAndChineseConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:58"]
  T10["method:JobsAppDoorGraphicCaptchaConfig::defaultConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:46"]
  S10 -->|calls| T10
  S11["method:JobsAppDoorGraphicCaptchaConfig::numberAndChineseConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:58"]
  T11["method:JobsAppDoorGraphicCaptchaConfig::byCharacterTypes<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:29"]
  S11 -->|calls| T11
  S12["method:JobsAppDoorGraphicCaptchaConfig::englishAndChineseConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:65"]
  T12["method:JobsAppDoorGraphicCaptchaConfig::defaultConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:46"]
  S12 -->|calls| T12
  S13["method:JobsAppDoorGraphicCaptchaConfig::englishAndChineseConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:65"]
  T13["method:JobsAppDoorGraphicCaptchaConfig::byCharacterTypes<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:29"]
  S13 -->|calls| T13
  S14["method:JobsAppDoorGraphicCaptchaConfig::allCharactersConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:72"]
  T14["method:JobsAppDoorGraphicCaptchaConfig::defaultConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:46"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorGraphicCaptchaConfig::allCharactersConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:72"]
  T15["method:JobsAppDoorGraphicCaptchaConfig::byCharacterTypes<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:29"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:79"]
  T16["method:JobsOCGraphicCaptchaGenerator::numberCharacters<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaGenerator/JobsOCGraphicCaptchaGenerator.m:17"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:79"]
  T17["method:JobsOCGraphicCaptchaGenerator::lowercaseLetterCharacters<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaGenerator/JobsOCGraphicCaptchaGenerator.m:27"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:79"]
  T18["method:JobsOCGraphicCaptchaGenerator::uppercaseLetterCharacters<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaGenerator/JobsOCGraphicCaptchaGenerator.m:38"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:79"]
  T19["method:JobsOCGraphicCaptchaGenerator::chineseCharacters<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaGenerator/JobsOCGraphicCaptchaGenerator.m:69"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:79"]
  T20["method:JobsOCGraphicCaptchaConfig::defaultConfig<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaConfig/JobsOCGraphicCaptchaConfig.m:81"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:79"]
  T21["method:JobsOCGraphicCaptchaConfig::byMixedGroupCount<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaConfig/JobsOCGraphicCaptchaConfig.m:42"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:79"]
  T22["method:JobsOCGraphicCaptchaConfig::byCustomCharacterGroups<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaConfig/JobsOCGraphicCaptchaConfig.m:62"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:79"]
  T23["method:JobsAppDoorGraphicCaptchaConfig::byCaseSensitive<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:20"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorGraphicCaptchaConfig::resolvedCaptchaConfig<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:79"]
  T24["method:JobsOCGraphicCaptchaConfig::byLength<br/>JobsByPods/JobsOCGraphicCaptcha@Pods/Core/JobsOCGraphicCaptchaConfig/JobsOCGraphicCaptchaConfig.m:12"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorGraphicCaptchaConfig::copyWithZone:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:107"]
  T25["method:JobsAppDoorGraphicCaptchaConfig::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/配置文件/JobsAppDoorGraphicCaptchaConfig/JobsAppDoorGraphicCaptchaConfig.m:38"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
