# `calls 符号关系 - 066`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  T1["method:JobsPodspecKitForJobsBitsMonitor::standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:266"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:273"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsBlock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:277"]
  T4["method:JobsPodspecKitForJobsBlock::standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:266"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsBlock::apply_standard_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:281"]
  T5["method:JobsPodspecKitForJobsBlock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:273"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsBlock::apply_standard_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsBlock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBlock@Pods/JobsPodspecKit.rb:277"]
  S6 -->|calls| T6
  S7["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T7["method:AVAssetImageGenerator::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVAssetImageGenerator/AVAssetImageGenerator+Extra/AVAssetImageGenerator+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T8["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S8 -->|calls| T8
  S9["method:CALayer::curve<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:107"]
  T9["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S9 -->|calls| T9
  S10["method:CALayer::animaSubtype<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:122"]
  T10["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S10 -->|calls| T10
  S11["method:CALayer::animaTypeWithTransitionType<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:136"]
  T11["method:CALayer::objFromArray:index:isRamdom:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/CALayer/CALayer+Extra/CALayer+Extra.m:170"]
  S11 -->|calls| T11
  S12["method:NSArray::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T12["method:NSArray::containsObject<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S12 -->|calls| T12
  S13["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T13["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T14["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T15["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S15 -->|calls| T15
  S16["method:NSArray::jobsVisible<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  T17["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  S17 -->|calls| T17
  S18["method:NSCache::calcFolderSizeAtPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSCache/NSCache+Extra/NSCache+Extra.m:12"]
  T18["method:NSString::addPathComponent<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  S18 -->|calls| T18
  S19["method:NSCache::cleanCacheByPath:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSCache/NSCache+Extra/NSCache+Extra.m:35"]
  T19["method:NSString::addPathComponent<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  S19 -->|calls| T19
  S20["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T20["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSData::stringByUTF8Encoding<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:134"]
  T21["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S21 -->|calls| T21
  S22["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  T22["method:NSDate::timeIntervalSinceDate<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:38"]
  S22 -->|calls| T22
  S23["method:NSDate::toReadableTimeBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:61"]
  T23["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S23 -->|calls| T23
  S24["method:NSDate::readableDayTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:72"]
  T24["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S24 -->|calls| T24
  S25["method:NSDate::readableTime<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSDate/NSDate+Extra/NSDate+Extra.m:79"]
  T25["method:JobsTimeModel::timeZone<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/JobsTimeModel/JobsTimeModel.m:204"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
