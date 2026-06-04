# `calls 符号关系 - 018`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:75"]
  T1["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S1 -->|calls| T1
  S2["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:88"]
  T2["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S2 -->|calls| T2
  S3["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:88"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:88"]
  T4["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S4 -->|calls| T4
  S5["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:88"]
  T5["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S5 -->|calls| T5
  S6["method:JobsKeychainHelper::deleteAccountInfoByService<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:99"]
  T6["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S6 -->|calls| T6
  S7["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  T7["method:JobsKeychainHelper::getKeychainBaseQuery1<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:114"]
  S7 -->|calls| T7
  S8["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:141"]
  T8["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S8 -->|calls| T8
  S9["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:150"]
  T9["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:141"]
  S9 -->|calls| T9
  S10["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:150"]
  T10["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S10 -->|calls| T10
  S11["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:25"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:25"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSObject::feedbackGenerator<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:25"]
  T13["method:UIImpactFeedbackGenerator::initMediumStyleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:37"]
  S13 -->|calls| T13
  S14["method:NSObject::playSoundEffect<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:51"]
  T14["method:NSString::byFileFullName<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:52"]
  S14 -->|calls| T14
  S15["method:NSObject::img<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:68"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:NSObject::img<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:68"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S16 -->|calls| T16
  S17["method:NSObject::img<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:68"]
  T17["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S17 -->|calls| T17
  S18["method:NSObject::img<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:68"]
  T18["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S18 -->|calls| T18
  S19["method:NSObject::img<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:68"]
  T19["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S19 -->|calls| T19
  S20["method:NSObject::imageByDataURL<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:102"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:NSObject::makeBackBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:118"]
  T21["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S21 -->|calls| T21
  S22["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T22["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S22 -->|calls| T22
  S23["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T23["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S23 -->|calls| T23
  S24["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T24["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S24 -->|calls| T24
  S25["method:NSString::isEqualToString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
