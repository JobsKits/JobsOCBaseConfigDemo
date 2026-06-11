# `calls 符号关系 - 010`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsCryptography::apply_standard_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsCryptography::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:277"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  T2["method:JobsPodspecKitForJobsCustomView::standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:266"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsCustomView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:273"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  S4 -->|calls| T4
  S5["method:NSArray::containsObject<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T5["method:NSArray::containsObject<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S5 -->|calls| T5
  S6["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T6["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T7["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T8["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S8 -->|calls| T8
  S9["method:NSArray::jobsVisible<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:NSData::initWithData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T10["method:NSData::initWithData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSString::emojiEncode<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:13"]
  T11["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S11 -->|calls| T11
  S12["method:NSString::add<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T12["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S12 -->|calls| T12
  S13["method:NSString::isContainsUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:22"]
  T13["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S13 -->|calls| T13
  S14["method:NSString::substringFromIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T14["method:NSString::substringFromIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S14 -->|calls| T14
  S15["method:NSString::substringToIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T15["method:NSString::substringToIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S15 -->|calls| T15
  S16["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T16["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S16 -->|calls| T16
  S17["method:NSString::range<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T17["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S17 -->|calls| T17
  S18["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T18["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S18 -->|calls| T18
  S19["method:NSString::jobsUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T19["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S19 -->|calls| T19
  S20["method:NSString::URLRequest<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T20["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSString::jobsFileUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T21["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:12"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIColor::jobsCor<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:53"]
  T23["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S23 -->|calls| T23
  S24["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T24["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T25["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
