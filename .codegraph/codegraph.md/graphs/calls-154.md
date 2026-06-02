# `calls 符号关系 - 154`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::disabledStateAttributedTitleBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:481"]
  T1["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S1 -->|calls| T1
  S2["method:UIButton::selectedStateAttributedTitleBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:490"]
  T2["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S2 -->|calls| T2
  S3["method:UIButton::focusedStateAttributedTitleBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:499"]
  T3["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S3 -->|calls| T3
  S4["method:UIButton::applicationStateAttributedTitleBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:508"]
  T4["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S4 -->|calls| T4
  S5["method:UIButton::reservedStateAttributedTitleBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:517"]
  T5["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S5 -->|calls| T5
  S6["method:UIColor::jobsCor<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T6["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S6 -->|calls| T6
  S7["method:UIColor::jobsCor<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T7["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S7 -->|calls| T7
  S8["method:UIColor::jobsColorByHex<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:58"]
  T8["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:44"]
  S8 -->|calls| T8
  S9["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T9["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S9 -->|calls| T9
  S10["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T10["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S10 -->|calls| T10
  S11["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T11["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S11 -->|calls| T11
  S12["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T12["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S12 -->|calls| T12
  S13["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T13["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S13 -->|calls| T13
  S14["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T14["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S14 -->|calls| T14
  S15["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T15["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S15 -->|calls| T15
  S16["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T16["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S16 -->|calls| T16
  S17["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T17["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S17 -->|calls| T17
  S18["method:UIColor::colorWithHexString<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:111"]
  T18["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  S18 -->|calls| T18
  S19["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T19["function:toStringByID<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:71"]
  S19 -->|calls| T19
  S20["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T20["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S20 -->|calls| T20
  S21["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T21["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S21 -->|calls| T21
  S22["method:UIColor::rgbCorStrBy<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:203"]
  T22["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S22 -->|calls| T22
  S23["method:UIImpactFeedbackGenerator::initByLightStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:18"]
  T23["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:UIImpactFeedbackGenerator::initByMediumStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:33"]
  T24["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:UIImpactFeedbackGenerator::initByHeavyStyle<br/>JobsByPods/JobsNavBar@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:48"]
  T25["method:UIImpactFeedbackGenerator::initByStyle<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIImpactFeedbackGenerator/UIImpactFeedbackGenerator+Extra/UIImpactFeedbackGenerator+Extra.m:12"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
