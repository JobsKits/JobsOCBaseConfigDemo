# `calls 符号关系 - 004`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T1["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S1 -->|calls| T1
  S2["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T2["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S2 -->|calls| T2
  S3["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T3["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S3 -->|calls| T3
  S4["method:JobsBioKit::biometryName<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:46"]
  T4["method:JobsBioKit::biometryType<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:21"]
  S4 -->|calls| T4
  S5["method:JobsBioKit::authenticateWithReason:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:73"]
  T5["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  S5 -->|calls| T5
  S6["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T6["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S6 -->|calls| T6
  S7["method:JobsBioKit::authenticateWithReason:localizedFallbackTitle:allowPasscodeFallback:reply:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:82"]
  T7["method:JobsBioKit::dispatchReply:result:success:error:<br/>JobsByPods/JobsBioKit@Pods/JobsBioKit/Core/JobsBioKit.m:179"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsBioKit::standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsBioKit::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsBioKit::apply_standard_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsBioKit::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBioKit@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  T11["method:JobsPodspecKitForJobsBitsMonitor::standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:266"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:273"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsBitsMonitor::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBitsMonitor@Pods/JobsPodspecKit.rb:277"]
  S13 -->|calls| T13
  S14["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T14["method:AVAssetImageGenerator::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVAssetImageGenerator/AVAssetImageGenerator+Extra/AVAssetImageGenerator+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  T15["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S15 -->|calls| T15
  S16["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  T16["method:NSBundle::objectForInfoDictionaryKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSBundle/NSBundle+Extra/NSBundle+Extra.m:36"]
  S16 -->|calls| T16
  S17["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T17["method:NSData::initWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:NSLocale::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSLocale/NSLocale+Extra/NSLocale+Extra.m:18"]
  T18["method:NSLocale::objectForKey<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSLocale/NSLocale+Extra/NSLocale+Extra.m:18"]
  S18 -->|calls| T18
  S19["method:NSString::emojiEncode<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:13"]
  T19["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S19 -->|calls| T19
  S20["method:NSString::toast<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Toast/NSString+Toast.m:12"]
  T20["method:NSObject::jobsToastMsg<br/>JobsByPods/WHToastExtra@Pods/Core/NSObject+WHToast.m:14"]
  S20 -->|calls| T20
  S21["method:NSString::jobsUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S21 -->|calls| T21
  S22["method:NSString::URLRequest<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T22["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSString::jobsFileUrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T23["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  T24["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T25["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
