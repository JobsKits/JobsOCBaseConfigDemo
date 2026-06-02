# `calls 符号关系 - 007`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIButton::jobsSetBtnTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:24"]
  T1["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S1 -->|calls| T1
  S2["method:UIButton::jobsSetBtnSubTitleFont:btnSubTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:30"]
  T2["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S2 -->|calls| T2
  S3["method:UIButton::jobsResetTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:390"]
  T3["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S3 -->|calls| T3
  S4["method:UIButton::jobsResetSubTitleBaseForegroundColor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:415"]
  T4["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S4 -->|calls| T4
  S5["method:UIButton::jobsResetTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:439"]
  T5["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S5 -->|calls| T5
  S6["method:UIButton::jobsResetSubTitleFont<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIButtonConfiguration/UIButton+UIButtonConfiguration.m:447"]
  T6["method:UIButton::jobsSetConfigTextAttributesTransformerByTitleFont:btnTitleCor:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UI/UIButton+UI.m:184"]
  S6 -->|calls| T6
  S7["method:UIButton::selectedAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:454"]
  T7["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S7 -->|calls| T7
  S8["method:UIButton::normalStateAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:463"]
  T8["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S8 -->|calls| T8
  S9["method:UIButton::highlightedStateAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:472"]
  T9["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S9 -->|calls| T9
  S10["method:UIButton::disabledStateAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:481"]
  T10["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S10 -->|calls| T10
  S11["method:UIButton::selectedStateAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:490"]
  T11["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S11 -->|calls| T11
  S12["method:UIButton::focusedStateAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:499"]
  T12["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S12 -->|calls| T12
  S13["method:UIButton::applicationStateAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:508"]
  T13["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S13 -->|calls| T13
  S14["method:UIButton::reservedStateAttributedTitleBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+UIControlState/UIButton+UIControlState.m:517"]
  T14["method:ASButtonNode::setAttributedTitle:forState:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:357"]
  S14 -->|calls| T14
  S15["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T15["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S15 -->|calls| T15
  S16["method:UIColor::jobsCor<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:13"]
  T16["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S16 -->|calls| T16
  S17["method:UIColor::jobsColorByHex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:58"]
  T17["method:UIColor::jobsColorByHexAlpha<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:44"]
  S17 -->|calls| T17
  S18["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T18["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S18 -->|calls| T18
  S19["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T19["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S19 -->|calls| T19
  S20["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T20["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S20 -->|calls| T20
  S21["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T21["method:NSString::hasPrefix<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:39"]
  S21 -->|calls| T21
  S22["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T22["method:NSString::substringFromIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S22 -->|calls| T22
  S23["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T23["method:ASMutableAttributedStringBuilder::length<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:223"]
  S23 -->|calls| T23
  S24["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T24["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S24 -->|calls| T24
  S25["method:UIColor::colorWithHexString:alpha:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIColor/UIColor+Extra/UIColor+Extra.m:64"]
  T25["method:NSString::substringWithRange<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:301"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
