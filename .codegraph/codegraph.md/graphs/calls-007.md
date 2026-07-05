# `calls 符号关系 - 007`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  T1["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S1 -->|calls| T1
  S2["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:42"]
  T2["method:NSString::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSString+MIME/NSString+MIME.m:36"]
  S2 -->|calls| T2
  S3["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  T3["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S3 -->|calls| T3
  S4["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  T4["method:NSData::dataByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/NSData+MIME/NSData+MIME.m:13"]
  S4 -->|calls| T4
  S5["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:19"]
  T5["method:UIImage::imageByMIMEString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:13"]
  S5 -->|calls| T5
  S6["method:UIImage::MIMEStr<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:32"]
  T6["method:UIImage::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:25"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsCryptography::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:277"]
  T7["method:JobsPodspecKitForJobsCryptography::standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:266"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsCryptography::apply_standard_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsCryptography::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:273"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsCryptography::apply_standard_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsCryptography::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:277"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  T10["method:JobsPodspecKitForJobsCustomView::standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:266"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsCustomView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:273"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  S12 -->|calls| T12
  S13["method:NSData::initWithData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T13["method:NSData::initWithData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSString::isContainsUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:22"]
  T14["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S14 -->|calls| T14
  S15["method:NSString::substringFromIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T15["method:NSString::substringFromIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S15 -->|calls| T15
  S16["method:NSString::substringToIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T16["method:NSString::substringToIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S16 -->|calls| T16
  S17["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T17["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S17 -->|calls| T17
  S18["method:NSString::range<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T18["method:NSString::rangeOfString<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S18 -->|calls| T18
  S19["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T19["method:NSString::characterAtIndex<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S19 -->|calls| T19
  S20["method:NSString::URLRequest<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T20["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSString::jobsFileUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T21["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  T22["method:JobsPodspecKitForJobsDebug::standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:266"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsDebug::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:273"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  T25["method:JobsPodspecKitForJobsDeviceInfo::standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:266"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
