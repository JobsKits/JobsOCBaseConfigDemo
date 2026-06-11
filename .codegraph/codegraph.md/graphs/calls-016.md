# `calls 符号关系 - 016`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T1["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T2["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S2 -->|calls| T2
  S3["method:NSArray::jobsVisible<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:89"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T4["method:NSData::initWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S4 -->|calls| T4
  S5["method:NSObject::tapImageWithIndexPath:imageDataMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:46"]
  T5["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S5 -->|calls| T5
  S6["method:NSObject::tapImageWithIndexPath:imageDataMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:46"]
  T6["function:NSObject::jobsMakeGKPhoto<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:12"]
  S6 -->|calls| T6
  S7["method:NSObject::tapImageWithIndexPath:imageUrlMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:64"]
  T7["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S7 -->|calls| T7
  S8["method:NSObject::tapImageWithIndexPath:imageUrlMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:64"]
  T8["function:NSObject::jobsMakeGKPhoto<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:12"]
  S8 -->|calls| T8
  S9["method:NSObject::tapImageWithIndexPath:imageUrlStrMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:82"]
  T9["function:NSObject::jobsMakeGKPhotoBrowserByPhotosArray<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:18"]
  S9 -->|calls| T9
  S10["method:NSObject::tapImageWithIndexPath:imageUrlStrMutArr:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:82"]
  T10["function:NSObject::jobsMakeGKPhoto<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSObject/NSObject+GKPhotoBrowser/NSObject+GKPhotoBrowser.m:12"]
  S10 -->|calls| T10
  S11["method:NSString::add<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Extra/NSString+Extra.m:12"]
  T11["function:JobsMutableString<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:10"]
  S11 -->|calls| T11
  S12["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T12["method:NSString::substringFromIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S12 -->|calls| T12
  S13["method:NSString::substringToIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T13["method:NSString::substringToIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S13 -->|calls| T13
  S14["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T14["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S14 -->|calls| T14
  S15["method:NSString::range<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T15["method:NSString::rangeOfString<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S15 -->|calls| T15
  S16["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T16["method:NSString::characterAtIndex<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S16 -->|calls| T16
  S17["method:NSString::jobsUrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T17["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S17 -->|calls| T17
  S18["method:NSString::URLRequest<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T18["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:NSString::jobsFileUrl<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T19["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  T20["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:NSURL::normalURLPlus<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:22"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S21 -->|calls| T21
  S22["method:NSURL::URLRequest<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:48"]
  T22["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T23["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S23 -->|calls| T23
  S24["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T24["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S24 -->|calls| T24
  S25["method:UIImage::imageWithData<br/>JobsByPods/JobsNavigationTransitionMgr@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T25["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
