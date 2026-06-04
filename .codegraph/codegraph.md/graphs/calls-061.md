# `calls 符号关系 - 061`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UITextField::getCurrentTextFieldValueByReplacementString<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:22"]
  T1["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S1 -->|calls| T1
  S2["method:UITextField::customSysClearBtn<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Extra/UITextField+Extra.m:44"]
  T2["method:UIButton::jobsInit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:307"]
  S2 -->|calls| T2
  S3["method:UITextField::placeholderLabel<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Placeholder/UITextField+Placeholder.m:18"]
  T3["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:24"]
  S3 -->|calls| T3
  S4["method:UITextField::titleAttributedDataMutArr<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Placeholder/UITextField+Placeholder.m:57"]
  T4["function:UIFontWeightRegularSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:30"]
  S4 -->|calls| T4
  S5["method:UITextView::switchs<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:14"]
  T5["method:ASCollectionNode::setContentOffset:animated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:728"]
  S5 -->|calls| T5
  S6["method:UITextView::contentSizeToFitByFont<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:184"]
  T6["function:helveticaNeue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:145"]
  S6 -->|calls| T6
  S7["method:UITextView::replacementText:beginNewLineBlock:delBlock:normalInputBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:251"]
  T7["method:NSString::validateContainsEmoji<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSString/NSString+Eomji/NSString+Eomji.m:46"]
  S7 -->|calls| T7
  S8["method:UITextView::indicateWordLimitLab<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextView/UITextView+IndicateWordLimit/UITextView+IndicateWordLimit.m:14"]
  T8["function:UIFontWeightMediumSize<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Font.h:34"]
  S8 -->|calls| T8
  S9["method:UIView::aop_willMoveToSuperview:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AOP/UIView+AOP.m:35"]
  T9["method:UIView::viewWithTag<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:731"]
  S9 -->|calls| T9
  S10["method:UIView::aop_willMoveToSuperview:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AOP/UIView+AOP.m:35"]
  T10["method:UIView::addSubview<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Extra/UIView+Extra.m:766"]
  S10 -->|calls| T10
  S11["method:UIView::graduallyShowWithAnimationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:146"]
  T11["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S11 -->|calls| T11
  S12["method:UIView::graduallyDisappearWithAnimationBlock:completionBlock:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:162"]
  T12["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S12 -->|calls| T12
  S13["method:UIView::shakeAnim<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:267"]
  T13["function:baseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:82"]
  S13 -->|calls| T13
  S14["method:UIView::shakeAnim<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:267"]
  T14["function:baseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:82"]
  S14 -->|calls| T14
  S15["method:UIView::shakeAnim<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+Animation/UIView+Animation.m:267"]
  T15["function:baseRandomContainBorderValue<br/>JobsByPods/JobsRandomUtils@Pods/Core/JobsRandomUtils.m:82"]
  S15 -->|calls| T15
  S16["method:UIView::labelAutoFontByWidth<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:21"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:UIView::buttonAutoWidthByFont<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:33"]
  T17["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S17 -->|calls| T17
  S18["method:UIView::buttonAutoFontByWidth<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:46"]
  T18["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S18 -->|calls| T18
  S19["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T19["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S19 -->|calls| T19
  S20["method:UIView::getFrameWithFreeWidth:maxHight:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:58"]
  T20["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S20 -->|calls| T20
  S21["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:UIView::getFrameWithFreeHight:maxWidth:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:89"]
  T22["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S22 -->|calls| T22
  S23["method:UIView::getFrameWithFreeWidth:maxHight:textSpace:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:122"]
  T23["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S23 -->|calls| T23
  S24["method:UIView::getFrameWithFreeWidth:maxHight:textSpace:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:122"]
  T24["method:NSMutableAttributedString::addkCTKernAttributeNameByParagraphStyleModel<br/>JobsByPods/JobsRichTextUtils@Pods/Core/UIKit/NSMutableAttributedString/NSMutableAttributedString+Extra/NSMutableAttributedString+Extra.m:134"]
  S24 -->|calls| T24
  S25["method:UIView::getFrameWithFreeHight:maxWidth:textSpace:lineSpace:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+AutoSelfAdaptionSize/UIView+AutoSelfAdaptionSize.m:150"]
  T25["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
