# `calls 符号关系 - 019`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::getAnonymousString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:267"]
  T1["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S1 -->|calls| T1
  S2["method:NSString::getAnonymousString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:267"]
  T2["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:66"]
  S2 -->|calls| T2
  S3["method:NSString::getAnonymousString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:267"]
  T3["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:NSString::encryptedChineseTele<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:287"]
  T4["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:232"]
  S4 -->|calls| T4
  S5["method:NSString::normalURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  T5["method:This::BaseUrl_Image<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:66"]
  S5 -->|calls| T5
  S6["method:NSString::normalURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  T6["method:NSString::containsString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S6 -->|calls| T6
  S7["method:NSString::normalURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  T7["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S7 -->|calls| T7
  S8["method:NSString::normalURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  T8["method:NSString::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:37"]
  S8 -->|calls| T8
  S9["method:NSString::normalURLPlus<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:308"]
  T9["method:This::BaseUrl_Image<br/>JobsByPods/JobsAPIs@Pods/Core/URLMgr/This+URLMgr/This+URLMgr.m:66"]
  S9 -->|calls| T9
  S10["method:NSString::pureString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:320"]
  T10["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S10 -->|calls| T10
  S11["method:NSString::removeDecimalPoint<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:333"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:NSString::removeRetMark<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:346"]
  T12["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S12 -->|calls| T12
  S13["method:NSString::removeNewLineMark<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:359"]
  T13["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S13 -->|calls| T13
  S14["method:NSString::removeTableMark<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:372"]
  T14["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S14 -->|calls| T14
  S15["method:NSString::removeEqualMark<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:385"]
  T15["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S15 -->|calls| T15
  S16["method:NSString::addNewlines<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:435"]
  T16["function:jobsMakeTextView::jobsMakeMutString<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:816"]
  S16 -->|calls| T16
  S17["method:NSString::cor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:11"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:NSString::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:15"]
  T18["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S18 -->|calls| T18
  S19["method:NSString::range<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:73"]
  T19["method:NSString::rangeOfString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:65"]
  S19 -->|calls| T19
  S20["method:NSString::jobsUrl<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:NSString::jobsURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  T21["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S21 -->|calls| T21
  S22["method:NSString::jobsURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S22 -->|calls| T22
  S23["method:NSString::URLRequest<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:29"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:NSString::jobsURLRequest<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:33"]
  T24["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:11"]
  S24 -->|calls| T24
  S25["method:NSString::jobsURLRequest<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:33"]
  T25["method:NSString::jobsURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
