# `calls 符号关系 - 064`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITextView::contentSizeToFitByFont<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:184"]
  T1["function:helveticaNeue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:145"]
  S1 -->|calls| T1
  S2["method:UITextView::replacementText:beginNewLineBlock:delBlock:normalInputBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:251"]
  T2["method:NSString::validateContainsEmoji<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:46"]
  S2 -->|calls| T2
  S3["method:UITextView::indicateWordLimitLab<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+IndicateWordLimit/UITextView+IndicateWordLimit.m:14"]
  T3["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S3 -->|calls| T3
  S4["method:UIView::aop_willMoveToSuperview:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AOP/UIView+AOP.m:35"]
  T4["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S4 -->|calls| T4
  S5["method:UIView::aop_willMoveToSuperview:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AOP/UIView+AOP.m:35"]
  T5["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S5 -->|calls| T5
  S6["method:UIView::graduallyShowWithAnimationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:146"]
  T6["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S6 -->|calls| T6
  S7["method:UIView::graduallyDisappearWithAnimationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:162"]
  T7["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S7 -->|calls| T7
  S8["method:UIView::shakeAnim<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:267"]
  T8["function:baseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:82"]
  S8 -->|calls| T8
  S9["method:UIView::shakeAnim<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:267"]
  T9["function:baseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:82"]
  S9 -->|calls| T9
  S10["method:UIView::shakeAnim<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:267"]
  T10["function:baseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:82"]
  S10 -->|calls| T10
  S11["method:UIView::labelAutoFontByWidth<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:21"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:33"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:UIView::buttonAutoFontByWidth<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:46"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T14["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S14 -->|calls| T14
  S15["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T15["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S15 -->|calls| T15
  S16["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:UIView::getFrameWithFreeWidth:maxHight:textSpace:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:122"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:UIView::getFrameWithFreeWidth:maxHight:textSpace:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:122"]
  T19["method:NSMutableAttributedString::addkCTKernAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:134"]
  S19 -->|calls| T19
  S20["method:UIView::getFrameWithFreeHight:maxWidth:textSpace:lineSpace:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:150"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::backgroundImageView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::backgroundImageView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::backgroundImageView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+BackgroundImage/UIView+BackgroundImage.m:21"]
  T23["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S23 -->|calls| T23
  S24["method:UIView::exchange_hitTest:withEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Chain/UIView+Chain.m:21"]
  T24["method:UIView::exchange_hitTest:withEvent:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Chain/UIView+Chain.m:21"]
  S24 -->|calls| T24
  S25["method:UIView::cleanSubviewBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+EmptyData/UIView+EmptyData.m:22"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
