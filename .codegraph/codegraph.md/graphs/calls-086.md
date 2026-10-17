# `calls 符号关系 - 086`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::encryptedChineseTele<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:287"]
  T1["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  S1 -->|calls| T1
  S2["method:NSString::pureString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  T2["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S2 -->|calls| T2
  S3["method:NSString::removeDecimalPoint<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:321"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSString::removeRetMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:334"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSString::removeNewLineMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:347"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSString::removeTableMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:360"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSString::removeEqualMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:373"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSString::addNewlines<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:423"]
  T8["function:jobsMakeTextView::jobsMakeMutString<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:816"]
  S8 -->|calls| T8
  S9["method:NSString::cor<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:11"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:NSString::jobsCor<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:15"]
  T10["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S10 -->|calls| T10
  S11["method:NSString::range<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:73"]
  T11["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:65"]
  S11 -->|calls| T11
  S12["method:NSString::jobsUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  T13["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S13 -->|calls| T13
  S14["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S14 -->|calls| T14
  S15["method:NSString::URLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:32"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSString::jobsURLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:36"]
  T16["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:11"]
  S16 -->|calls| T16
  S17["method:NSString::jobsURLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:36"]
  T17["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  S17 -->|calls| T17
  S18["method:NSString::jobsCanOpenUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:55"]
  T18["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  S18 -->|calls| T18
  S19["method:NSString::urlProtect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:68"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:NSString::jobsURLProtect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:72"]
  T20["method:NSString::remove200BMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:406"]
  S20 -->|calls| T20
  S21["method:NSString::byHttp<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:83"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:NSString::jobsByHttp<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:87"]
  T22["method:NSString::jobsURLProtect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:72"]
  S22 -->|calls| T22
  S23["method:NSString::byHttps<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:96"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSString::jobsByHttps<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:100"]
  T24["method:NSString::jobsURLProtect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:72"]
  S24 -->|calls| T24
  S25["method:NSURLRequest::initBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:11"]
  T25["method:ASPhotosFrameworkImageRequest::requestWithURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPhotosFrameworkImageRequest.mm:96"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
