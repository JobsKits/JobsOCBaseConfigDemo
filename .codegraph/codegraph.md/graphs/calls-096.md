# `calls 符号关系 - 096`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::substringByRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:44"]
  T1["method:NSString::substringWithRange<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:304"]
  S1 -->|calls| T1
  S2["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T2["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S2 -->|calls| T2
  S3["method:NSString::range<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T3["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S3 -->|calls| T3
  S4["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T4["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S4 -->|calls| T4
  S5["method:NSString::jobsUrl<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T5["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S5 -->|calls| T5
  S6["method:NSString::URLRequest<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T6["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:NSString::jobsFileUrl<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T7["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:NSString::urlProtect<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T8["method:NSString::containsString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S8 -->|calls| T8
  S9["method:UIColor::jobsCor<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T9["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S9 -->|calls| T9
  S10["method:UIColor::jobsCor<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T10["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S10 -->|calls| T10
  S11["method:UIColor::jobsColorByHex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:53"]
  T11["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:44"]
  S11 -->|calls| T11
  S12["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T12["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S12 -->|calls| T12
  S13["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T13["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S13 -->|calls| T13
  S14["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T14["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S14 -->|calls| T14
  S15["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T15["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S15 -->|calls| T15
  S16["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T16["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S16 -->|calls| T16
  S17["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T17["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S17 -->|calls| T17
  S18["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T18["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S18 -->|calls| T18
  S19["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T19["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S19 -->|calls| T19
  S20["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  T20["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S20 -->|calls| T20
  S21["method:UIColor::colorWithHexString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:101"]
  T21["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:59"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsDropDownListView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:277"]
  T22["method:JobsPodspecKitForJobsDropDownListView::standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:266"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsDropDownListView::apply_standard_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsDropDownListView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:273"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsDropDownListView::apply_standard_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsDropDownListView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:277"]
  S24 -->|calls| T24
  S25["method:NSArray::containsObject<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T25["method:NSArray::containsObject<br/>JobsByPods/JobsDropDownListView@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
