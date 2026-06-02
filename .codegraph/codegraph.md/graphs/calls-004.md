# `calls 符号关系 - 004`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar.m:35"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:277"]
  T2["method:JobsPodspecKitForGKCustomNavigationBarExtra::standard_user_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:266"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:273"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:277"]
  S4 -->|calls| T4
  S5["method:NSData::initWithData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T5["method:NSData::initWithData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSData::stringByUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:134"]
  T6["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S6 -->|calls| T6
  S7["method:NSMutableDictionary::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T7["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S7 -->|calls| T7
  S8["method:NSMutableDictionary::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T8["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S8 -->|calls| T8
  S9["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T10["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S10 -->|calls| T10
  S11["method:NSMutableDictionary::jsonString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:39"]
  T11["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S11 -->|calls| T11
  S12["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  T14["method:UIImpactFeedbackGenerator::initMediumStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:37"]
  S14 -->|calls| T14
  S15["method:NSObject::playSoundEffect<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:38"]
  T15["method:NSString::byFileFullName<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:52"]
  S15 -->|calls| T15
  S16["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T17["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S17 -->|calls| T17
  S18["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T18["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S18 -->|calls| T18
  S19["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T19["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S19 -->|calls| T19
  S20["method:NSObject::img<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:55"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S20 -->|calls| T20
  S21["method:NSObject::imageByDataURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:89"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:NSObject::cor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:105"]
  T22["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S22 -->|calls| T22
  S23["method:NSObject::makeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:109"]
  T23["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S23 -->|calls| T23
  S24["method:NSObject::makeBackBtnModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:109"]
  T24["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size.h:377"]
  S24 -->|calls| T24
  S25["method:NSObject::initByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:136"]
  T25["method:NSData::dataByContentsOfFile<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:38"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
