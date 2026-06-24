# `calls 符号关系 - 012`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T1["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S1 -->|calls| T1
  S2["method:NSString::jobsUrl<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T2["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S2 -->|calls| T2
  S3["method:NSString::URLRequest<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T3["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:NSString::jobsFileUrl<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T4["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T5["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:NSString::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T6["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S6 -->|calls| T6
  S7["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T7["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S7 -->|calls| T7
  S8["method:NSString::substringToIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T8["method:NSString::substringToIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S8 -->|calls| T8
  S9["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T9["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S9 -->|calls| T9
  S10["method:NSString::range<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T10["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S10 -->|calls| T10
  S11["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T11["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S11 -->|calls| T11
  S12["method:NSString::jobsUrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:NSString::URLRequest<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T13["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S13 -->|calls| T13
  S14["method:NSString::jobsFileUrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T14["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S14 -->|calls| T14
  S15["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T15["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:NSURL::normalURLPlus<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:22"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S16 -->|calls| T16
  S17["method:NSURL::URLRequest<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:48"]
  T17["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T18["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S18 -->|calls| T18
  S19["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T19["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S19 -->|calls| T19
  S20["method:UIImage::imageWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T20["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S20 -->|calls| T20
  S21["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T21["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S21 -->|calls| T21
  S22["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T22["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S22 -->|calls| T22
  S23["method:UINavigationController::initBy<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UINavigationController/UINavigationController+Extra/UINavigationController+Extra.m:12"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::currentController<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T24["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S24 -->|calls| T24
  S25["method:UIViewController::navCtrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIViewController/UIViewController+Extra/UIViewController+Extra.m:32"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
