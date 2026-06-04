# `calls 符号关系 - 093`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JobsDeviceIDKeychainRemove<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:49"]
  T1["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S1 -->|calls| T1
  S2["method:NSObject::deleteDeviceID<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:59"]
  T2["function:JobsDeviceIDKeychainRemove<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:49"]
  S2 -->|calls| T2
  S3["method:NSObject::deviceID<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:63"]
  T3["function:JobsDeviceIDKeychainLoad<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:21"]
  S3 -->|calls| T3
  S4["method:NSObject::deviceID<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:63"]
  T4["function:JobsDeviceIDKeychainSave<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:41"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  T5["method:JobsPodspecKitForJobsDeviceInfo::standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:266"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:273"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  S7 -->|calls| T7
  S8["method:NSArray::containsObject<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T8["method:NSArray::containsObject<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S8 -->|calls| T8
  S9["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T9["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T10["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T11["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S11 -->|calls| T11
  S12["method:NSArray::jobsVisible<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:NSData::initWithData<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T13["method:NSData::initWithData<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T14["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S14 -->|calls| T14
  S15["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T15["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S15 -->|calls| T15
  S16["method:NSString::isEqualStrA:strB:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T16["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S16 -->|calls| T16
  S17["method:NSString::isEqualToString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:NSString::isEqualToString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  T18["method:NSString::isEqualToString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S18 -->|calls| T18
  S19["method:NSString::containsString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:NSString::containsString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  T20["method:NSString::containsString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S20 -->|calls| T20
  S21["method:NSString::hasPrefix<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:NSString::hasPrefix<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  T22["method:NSString::hasPrefix<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S22 -->|calls| T22
  S23["method:NSString::hasSuffix<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:NSString::hasSuffix<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  T24["method:NSString::hasSuffix<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:49"]
  S24 -->|calls| T24
  S25["method:NSString::isNotBlank<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:59"]
  T25["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
