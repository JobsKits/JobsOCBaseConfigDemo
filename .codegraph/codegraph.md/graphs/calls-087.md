# `calls 符号关系 - 087`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSURLRequest::print<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:17"]
  T1["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  S1 -->|calls| T1
  S2["method:NSURLRequest::print<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:17"]
  T2["method:NSObject::currentTimestampString<br/>JobsByPods/JobsTimeUtils@Pods/Core/NSObject+Time/NSObject+Time.m:137"]
  S2 -->|calls| T2
  S3["method:UIColor::jobsCor<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T3["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S3 -->|calls| T3
  S4["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  T4["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S4 -->|calls| T4
  S5["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  T5["method:JobsCorModel::byBlue<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:29"]
  S5 -->|calls| T5
  S6["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  T6["method:JobsCorModel::byGreen<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:20"]
  S6 -->|calls| T6
  S7["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  T7["method:JobsCorModel::byRed<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:11"]
  S7 -->|calls| T7
  S8["method:UIColor::jobsColorByHex<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:57"]
  T8["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:43"]
  S8 -->|calls| T8
  S9["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T9["method:NSString::byTrimmingCharactersInSet<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:82"]
  S9 -->|calls| T9
  S10["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T10["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S10 -->|calls| T10
  S11["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T11["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S11 -->|calls| T11
  S12["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T12["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S12 -->|calls| T12
  S13["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T13["method:JobsCorModel::byBlue<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:29"]
  S13 -->|calls| T13
  S14["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T14["method:JobsCorModel::byGreen<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:20"]
  S14 -->|calls| T14
  S15["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  T15["method:JobsCorModel::byRed<br/>JobsByPods/JobsModelDSL@Pods/Core/JobsCorModel/JobsCorModel+DSL/JobsCorModel+DSL.m:11"]
  S15 -->|calls| T15
  S16["method:UIColor::colorWithHexString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:110"]
  T16["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:63"]
  S16 -->|calls| T16
  S17["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:140"]
  T17["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S17 -->|calls| T17
  S18["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:140"]
  T18["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S18 -->|calls| T18
  S19["method:UIColor::gradientCorDataMutArr:startPoint:endPoint:opaque:targetViewRect:<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:140"]
  T19["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T20["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:78"]
  S20 -->|calls| T20
  S21["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T21["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S21 -->|calls| T21
  S22["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T22["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S22 -->|calls| T22
  S23["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T23["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S23 -->|calls| T23
  S24["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:199"]
  T24["method:NSMutableArray::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIColor::hexadecimalCorStrBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:228"]
  T25["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
