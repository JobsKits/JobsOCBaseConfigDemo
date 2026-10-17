# `calls 符号关系 - 011`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:115"]
  T1["function:JobsWidth<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:345"]
  S1 -->|calls| T1
  S2["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:115"]
  T2["method:MASConstraint::equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:27"]
  S2 -->|calls| T2
  S3["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:115"]
  T3["method:MASConstraint::mas_equalTo<br/>JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimatedDemo/TABAnimatedDemo/Third/Masonry/MASConstraint.m:33"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForGKCustomNavigationBarExtra::standard_user_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["method:NSData::decompressToStr<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:123"]
  T7["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  S7 -->|calls| T7
  S8["method:NSData::stringByUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:139"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  T9["method:NSString::initByUTF8Data<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S9 -->|calls| T9
  S10["method:NSMutableDictionary::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:11"]
  T10["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S10 -->|calls| T10
  S11["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:29"]
  T11["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S11 -->|calls| T11
  S12["method:NSMutableDictionary::jsonString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:38"]
  T12["method:NSString::initByUTF8Data<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S12 -->|calls| T12
  S13["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T13["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S13 -->|calls| T13
  S14["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T14["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:102"]
  S14 -->|calls| T14
  S15["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T15["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:110"]
  S15 -->|calls| T15
  S16["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T16["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S16 -->|calls| T16
  S17["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T17["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S17 -->|calls| T17
  S18["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T18["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:86"]
  S18 -->|calls| T18
  S19["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T19["function:toStringByDouble<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:90"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T20["function:toStringByChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:118"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T21["function:toStringByUnsignedChar<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:122"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T22["function:toStringByShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:94"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T23["function:toStringByUnsignedShort<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:98"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T24["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:110"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T25["function:toStringByNSUInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:106"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
