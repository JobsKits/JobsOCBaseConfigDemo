# `calls 符号关系 - 056`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::reservedStateAttributedTitleBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:517"]
  T1["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S1 -->|calls| T1
  S2["method:UICollectionView::registerCollectionElementKindSectionHeaderClass_<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:68"]
  T2["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S2 -->|calls| T2
  S3["method:UICollectionView::registerCollectionElementKindSectionFooterClass_<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UICollectionView/UICollectionView+JobsRegisterClass/UICollectionView+JobsRegisterClass.m:88"]
  T3["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S3 -->|calls| T3
  S4["method:UIColor::jobsCor<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T4["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S4 -->|calls| T4
  S5["method:UIColor::jobsCor<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T5["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S5 -->|calls| T5
  S6["method:UIColor::jobsColorByHex<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:58"]
  T6["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:44"]
  S6 -->|calls| T6
  S7["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T7["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S7 -->|calls| T7
  S8["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T8["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S8 -->|calls| T8
  S9["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T9["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S9 -->|calls| T9
  S10["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T10["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S10 -->|calls| T10
  S11["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T11["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S11 -->|calls| T11
  S12["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T12["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S12 -->|calls| T12
  S13["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T13["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S13 -->|calls| T13
  S14["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T14["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S14 -->|calls| T14
  S15["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T15["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S15 -->|calls| T15
  S16["method:UIColor::colorWithHexString<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:111"]
  T16["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  S16 -->|calls| T16
  S17["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T17["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S17 -->|calls| T17
  S18["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T18["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S18 -->|calls| T18
  S19["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T19["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S19 -->|calls| T19
  S20["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T20["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S20 -->|calls| T20
  S21["method:UIImage::createNonInterpolatedUIImageFormString:withSize:<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:62"]
  T21["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S21 -->|calls| T21
  S22["method:UIImage::dw_SubImageWithRect<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:143"]
  T22["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S22 -->|calls| T22
  S23["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  T23["method:UIImage::imageWithData<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:238"]
  S23 -->|calls| T23
  S24["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  T24["method:UIImage::imageWithCGImage<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:244"]
  S24 -->|calls| T24
  S25["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  T25["method:UIImage::imageWithContentsOfFile<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/UIImage/UIImage+Extra/UIImage+Extra.m:250"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
