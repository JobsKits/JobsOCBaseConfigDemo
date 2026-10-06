# `calls 符号关系 - 089`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSURLRequest::initBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:11"]
  T1["method:ASPhotosFrameworkImageRequest::requestWithURL:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPhotosFrameworkImageRequest.mm:96"]
  S1 -->|calls| T1
  S2["method:NSURLRequest::print<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:17"]
  T2["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  S2 -->|calls| T2
  S3["method:NSURLRequest::print<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:17"]
  T3["method:NSObject::currentTimestampString<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:137"]
  S3 -->|calls| T3
  S4["method:UIColor::jobsCor<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T4["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S4 -->|calls| T4
  S5["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  T5["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S5 -->|calls| T5
  S6["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  T6["method:JobsCorModel::byBlue<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:29"]
  S6 -->|calls| T6
  S7["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  T7["method:JobsCorModel::byGreen<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:20"]
  S7 -->|calls| T7
  S8["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  T8["method:JobsCorModel::byRed<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:11"]
  S8 -->|calls| T8
  S9["method:UIColor::jobsColorByHex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:57"]
  T9["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  S9 -->|calls| T9
  S10["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T10["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S10 -->|calls| T10
  S11["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T11["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S11 -->|calls| T11
  S12["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T12["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S12 -->|calls| T12
  S13["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T13["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S13 -->|calls| T13
  S14["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T14["method:JobsCorModel::byBlue<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:29"]
  S14 -->|calls| T14
  S15["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T15["method:JobsCorModel::byGreen<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:20"]
  S15 -->|calls| T15
  S16["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T16["method:JobsCorModel::byRed<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:11"]
  S16 -->|calls| T16
  S17["method:UIColor::colorWithHexString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:110"]
  T17["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  S17 -->|calls| T17
  S18["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:140"]
  T18["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S18 -->|calls| T18
  S19["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:140"]
  T19["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:140"]
  T20["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T21["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:78"]
  S21 -->|calls| T21
  S22["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T22["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S22 -->|calls| T22
  S23["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T23["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S23 -->|calls| T23
  S24["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T24["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S24 -->|calls| T24
  S25["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T25["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
