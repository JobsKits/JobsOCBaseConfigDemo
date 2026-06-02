# `calls 符号关系 - 132`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::getAnonymousString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:237"]
  T1["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:59"]
  S1 -->|calls| T1
  S2["method:NSString::encryptedChineseTele<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:252"]
  T2["method:NSString::omitByReplaceStr:replaceStrLenth:lineBreakMode:limit:<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:202"]
  S2 -->|calls| T2
  S3["method:NSString::removeLastChars<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:259"]
  T3["method:NSString::substringToIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S3 -->|calls| T3
  S4["method:NSString::substringWithRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  T4["method:NSString::substringWithRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S4 -->|calls| T4
  S5["method:NSString::addNewlines<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:309"]
  T5["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S5 -->|calls| T5
  S6["method:NSString::cor<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T6["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S6 -->|calls| T6
  S7["method:NSString::substringFromIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T7["method:NSString::substringFromIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S7 -->|calls| T7
  S8["method:NSString::substringToIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T8["method:NSString::substringToIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S8 -->|calls| T8
  S9["method:NSString::substringByRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:44"]
  T9["method:NSString::substringWithRange<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S9 -->|calls| T9
  S10["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T10["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S10 -->|calls| T10
  S11["method:NSString::range<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T11["method:NSString::rangeOfString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S11 -->|calls| T11
  S12["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T12["method:NSString::characterAtIndex<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S12 -->|calls| T12
  S13["method:NSString::jobsUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T13["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S13 -->|calls| T13
  S14["method:NSString::URLRequest<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T14["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSString::jobsFileUrl<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T15["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSString::urlProtect<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:38"]
  T16["method:NSString::containsString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:29"]
  S16 -->|calls| T16
  S17["method:NSURLRequest::print<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:18"]
  T17["function:JobsPrintURLRequest<br/>JobsByPods/YTKNetworkExtra@Pods/Core/NSObject+YTKNetwork/NSObject+YTKNetwork.h:59"]
  S17 -->|calls| T17
  S18["method:UIButton::initByTitle<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T18["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S18 -->|calls| T18
  S19["method:UIButton::initByAttributedString<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T19["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S19 -->|calls| T19
  S20["method:UIButton::initByNormalImage<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T20["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S20 -->|calls| T20
  S21["method:UIButton::initByBackgroundImage<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T21["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S21 -->|calls| T21
  S22["method:UIButton::initByTitles<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T22["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S22 -->|calls| T22
  S23["method:UIButton::initByAttributedStrings<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T23["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S23 -->|calls| T23
  S24["method:UIButton::initByTitle_font<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T24["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S24 -->|calls| T24
  S25["method:UIButton::initByStyle1<br/>JobsByPods/JobsLinkageMenuView@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T25["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
