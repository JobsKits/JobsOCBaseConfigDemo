# `calls 符号关系 - 169`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsControlTarget::invoke:<br/>JobsByPods/JobsSuspend@Pods/Support/JobsControlTarget/JobsControlTarget.m:20"]
  T1["function:JobsControlTarget::_jobs_now<br/>JobsByPods/JobsSuspend@Pods/Support/JobsControlTarget/JobsControlTarget.m:16"]
  S1 -->|calls| T1
  S2["method:NSMutableDictionary::add<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T2["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S2 -->|calls| T2
  S3["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T3["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S3 -->|calls| T3
  S4["method:NSObject::img<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:NSObject::img<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSObject/NSObject+image/NSObject+image.m:12"]
  T5["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S5 -->|calls| T5
  S6["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T6["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S6 -->|calls| T6
  S7["method:NSString::nullableString:replaceString:<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T7["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S7 -->|calls| T7
  S8["method:NSString::cor<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:12"]
  T8["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  S8 -->|calls| T8
  S9["method:NSString::substringFromIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T9["method:NSString::substringFromIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S9 -->|calls| T9
  S10["method:NSString::substringToIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T10["method:NSString::substringToIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S10 -->|calls| T10
  S11["method:NSString::substringByRange<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:44"]
  T11["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S11 -->|calls| T11
  S12["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T12["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S12 -->|calls| T12
  S13["method:NSString::range<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T13["method:NSString::rangeOfString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S13 -->|calls| T13
  S14["method:NSString::characterAtIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T14["method:NSString::characterAtIndex<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S14 -->|calls| T14
  S15["method:UIButton::initByTitle<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:91"]
  T15["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S15 -->|calls| T15
  S16["method:UIButton::initByAttributedString<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:101"]
  T16["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S16 -->|calls| T16
  S17["method:UIButton::initByNormalImage<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:111"]
  T17["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S17 -->|calls| T17
  S18["method:UIButton::initByBackgroundImage<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:121"]
  T18["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S18 -->|calls| T18
  S19["method:UIButton::initByTitles<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:132"]
  T19["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S19 -->|calls| T19
  S20["method:UIButton::initByAttributedStrings<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:144"]
  T20["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S20 -->|calls| T20
  S21["method:UIButton::initByTitle_font<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:157"]
  T21["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S21 -->|calls| T21
  S22["method:UIButton::initByStyle1<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:169"]
  T22["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S22 -->|calls| T22
  S23["method:UIButton::initByStyle2<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:183"]
  T23["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S23 -->|calls| T23
  S24["method:UIButton::initByStyle3<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:203"]
  T24["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S24 -->|calls| T24
  S25["method:UIButton::initByStyle4<br/>JobsByPods/JobsSuspend@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:219"]
  T25["method:UIColor::colorWithAlphaComponentBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:265"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
