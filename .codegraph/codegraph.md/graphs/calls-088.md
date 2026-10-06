# `calls 符号关系 - 088`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::getAnonymousString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:267"]
  T1["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:NSString::encryptedChineseTele<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:287"]
  T2["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  S2 -->|calls| T2
  S3["method:NSString::pureString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:NSString::removeDecimalPoint<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:321"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:NSString::removeRetMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:334"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:NSString::removeNewLineMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:347"]
  T6["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S6 -->|calls| T6
  S7["method:NSString::removeTableMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:360"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:NSString::removeEqualMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:373"]
  T8["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S8 -->|calls| T8
  S9["method:NSString::addNewlines<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:423"]
  T9["function:jobsMakeTextView::jobsMakeMutString<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:816"]
  S9 -->|calls| T9
  S10["method:NSString::cor<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:11"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSString::jobsCor<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:15"]
  T11["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S11 -->|calls| T11
  S12["method:NSString::range<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:73"]
  T12["method:NSString::rangeOfString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:65"]
  S12 -->|calls| T12
  S13["method:NSString::jobsUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  T14["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S14 -->|calls| T14
  S15["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  T15["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S15 -->|calls| T15
  S16["method:NSString::URLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:32"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:NSString::jobsURLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:36"]
  T17["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:11"]
  S17 -->|calls| T17
  S18["method:NSString::jobsURLRequest<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:36"]
  T18["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  S18 -->|calls| T18
  S19["method:NSString::jobsCanOpenUrl<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:55"]
  T19["method:NSString::jobsURL<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:18"]
  S19 -->|calls| T19
  S20["method:NSString::urlProtect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:68"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSString::jobsURLProtect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:72"]
  T21["method:NSString::remove200BMark<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:406"]
  S21 -->|calls| T21
  S22["method:NSString::byHttp<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:83"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:NSString::jobsByHttp<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:87"]
  T23["method:NSString::jobsURLProtect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:72"]
  S23 -->|calls| T23
  S24["method:NSString::byHttps<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:96"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:NSString::jobsByHttps<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:100"]
  T25["method:NSString::jobsURLProtect<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:72"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
