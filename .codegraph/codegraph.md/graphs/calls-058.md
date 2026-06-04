# `calls 符号关系 - 058`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T1["function:jobs_targetsMap<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:12"]
  S1 -->|calls| T1
  S2["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T2["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:384"]
  S2 -->|calls| T2
  S3["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T3["function:jobs_splitEvents<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:20"]
  S3 -->|calls| T3
  S4["method:UIControl::jobs_removeHandlersFor:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:101"]
  T4["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:384"]
  S4 -->|calls| T4
  S5["method:UIControl::jobs_removeAllHandlers<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:123"]
  T5["function:jobs_targetsMap<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIControl::jobs_removeAllHandlers<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:123"]
  T6["method:ASControlNode::removeTarget:action:forControlEvents:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:384"]
  S6 -->|calls| T6
  S7["method:UIControl::jobs_removeAllHandlers<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+Extra/UIControl+Extra.m:123"]
  T7["method:ASWeakSet::removeAllObjects<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASWeakSet.mm:37"]
  S7 -->|calls| T7
  S8["method:UIControl::__uxy_sendAction:to:forEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+XY/UIControl+XY.m:41"]
  T8["method:UIControl::__uxy_sendAction:to:forEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIControl/UIControl+XY/UIControl+XY.m:41"]
  S8 -->|calls| T8
  S9["method:UIDevice::platformBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIDevice/UIDevice+XMUtils/UIDevice+XMUtils.m:41"]
  T9["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S9 -->|calls| T9
  S10["method:UIDevice::platformBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIDevice/UIDevice+XMUtils/UIDevice+XMUtils.m:41"]
  T10["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S10 -->|calls| T10
  S11["method:UIDevice::platformBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIDevice/UIDevice+XMUtils/UIDevice+XMUtils.m:41"]
  T11["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S11 -->|calls| T11
  S12["method:UIFont::foreignAidFontName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIFont/UIFont+Extra/UIFont+Extra.m:26"]
  T12["method:UIFont::getAvailableFont<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIFont/UIFont+Extra/UIFont+Extra.m:12"]
  S12 -->|calls| T12
  S13["method:UIGestureRecognizer::rac_recognizer<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIGestureRecognizer/UIGestureRecognizer+RAC/UIGestureRecognizer+ReactiveCocoa/UIGestureRecognizer+ReactiveCocoa.m:12"]
  T13["method:UIGestureRecognizer::rac_initializeRAC<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIGestureRecognizer/UIGestureRecognizer+RAC/UIGestureRecognizer+ReactiveCocoa/UIGestureRecognizer+ReactiveCocoa.m:24"]
  S13 -->|calls| T13
  S14["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T14["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S14 -->|calls| T14
  S15["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T15["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S15 -->|calls| T15
  S16["method:UIImage::imageWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T16["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S16 -->|calls| T16
  S17["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T17["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S17 -->|calls| T17
  S18["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T18["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S18 -->|calls| T18
  S19["method:UIImage::imageByName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:20"]
  T19["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S19 -->|calls| T19
  S20["method:UIImage::imageByData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+SYS/UIImage+SYS.m:44"]
  T20["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S20 -->|calls| T20
  S21["method:UIImage::cropSquareImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+Tailor/UIImage+Tailor.m:12"]
  T21["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S21 -->|calls| T21
  S22["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  T22["method:UIImage::initByData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:232"]
  S22 -->|calls| T22
  S23["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  T23["method:UIImage::frameDurationAtIndex:source:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:47"]
  S23 -->|calls| T23
  S24["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T24["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S24 -->|calls| T24
  S25["method:UIImage::animatedGIFByName<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:74"]
  T25["method:UIImage::animatedGIFWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+YBGIF/UIImage+YBGIF.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
