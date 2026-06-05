# `calls 符号关系 - 010`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T1["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:83"]
  S1 -->|calls| T1
  S2["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T2["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:111"]
  S2 -->|calls| T2
  S3["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T3["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:115"]
  S3 -->|calls| T3
  S4["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T4["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:87"]
  S4 -->|calls| T4
  S5["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T5["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:91"]
  S5 -->|calls| T5
  S6["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T6["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S6 -->|calls| T6
  S7["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T7["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:99"]
  S7 -->|calls| T7
  S8["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T8["function:toStringByLongLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:107"]
  S8 -->|calls| T8
  S9["method:JobsKeychainHelper::load<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:13"]
  T9["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:150"]
  S9 -->|calls| T9
  S10["method:JobsKeychainHelper::save:data:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:45"]
  T10["method:NSKeyedArchiver::initByObject<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSKeyedArchiver/NSKeyedArchiver+Extra/NSKeyedArchiver+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:75"]
  T11["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S11 -->|calls| T11
  S12["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:75"]
  T12["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S12 -->|calls| T12
  S13["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:75"]
  T13["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S13 -->|calls| T13
  S14["method:JobsKeychainHelper::saveAccount:password:forService:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:75"]
  T14["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S14 -->|calls| T14
  S15["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:88"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:88"]
  T16["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S16 -->|calls| T16
  S17["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:88"]
  T17["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S17 -->|calls| T17
  S18["method:JobsKeychainHelper::getPasswordByService:account:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:88"]
  T18["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S18 -->|calls| T18
  S19["method:JobsKeychainHelper::deleteAccountInfoByService<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:99"]
  T19["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S19 -->|calls| T19
  S20["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  T20["method:JobsKeychainHelper::getKeychainBaseQuery1<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:114"]
  S20 -->|calls| T20
  S21["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:141"]
  T21["method:JobsKeychainHelper::getKeychainBaseQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:132"]
  S21 -->|calls| T21
  S22["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:150"]
  T22["method:JobsKeychainHelper::getKeychainQuery<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:141"]
  S22 -->|calls| T22
  S23["method:JobsKeychainHelper::getKeychainQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:150"]
  T23["method:JobsKeychainHelper::getKeychainBaseQuery2<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m:123"]
  S23 -->|calls| T23
  S24["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S24 -->|calls| T24
  S25["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T25["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
