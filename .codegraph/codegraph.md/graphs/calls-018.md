# `calls 符号关系 - 018`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::cor<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T1["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S1 -->|calls| T1
  S2["method:NSString::substringFromIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T2["method:NSString::substringFromIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S2 -->|calls| T2
  S3["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T3["method:NSString::substringToIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S3 -->|calls| T3
  S4["method:NSString::substringByRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:44"]
  T4["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S4 -->|calls| T4
  S5["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T5["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S5 -->|calls| T5
  S6["method:NSString::range<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T6["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S6 -->|calls| T6
  S7["method:NSString::characterAtIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T7["method:NSString::characterAtIndex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S7 -->|calls| T7
  S8["method:NSString::jobsUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:14"]
  T8["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S8 -->|calls| T8
  S9["method:NSString::URLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:23"]
  T9["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:NSString::jobsFileUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:28"]
  T10["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSString::urlProtect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:40"]
  T11["method:NSString::containsString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S11 -->|calls| T11
  S12["method:NSURL::URLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T12["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:NSURLRequest::print<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:18"]
  T13["method:NSObject::currentTimestampString<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:82"]
  S13 -->|calls| T13
  S14["method:UIColor::jobsCor<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T14["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S14 -->|calls| T14
  S15["method:UIColor::jobsCor<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T15["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S15 -->|calls| T15
  S16["method:UIColor::jobsColorByHex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:58"]
  T16["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:44"]
  S16 -->|calls| T16
  S17["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T17["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S17 -->|calls| T17
  S18["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T18["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S18 -->|calls| T18
  S19["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T19["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S19 -->|calls| T19
  S20["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T20["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S20 -->|calls| T20
  S21["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T21["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S21 -->|calls| T21
  S22["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T22["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S22 -->|calls| T22
  S23["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T23["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S23 -->|calls| T23
  S24["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T24["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S24 -->|calls| T24
  S25["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T25["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
