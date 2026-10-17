# `calls 符号关系 - 014`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:253"]
  T1["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  S1 -->|calls| T1
  S2["method:NSObject::jobsParagraphStyleLeft<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:12"]
  T2["function:jobsMakeParagraphStyle<br/>JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h:25"]
  S2 -->|calls| T2
  S3["method:NSObject::jobsParagraphStyleLeft<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:12"]
  T3["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S3 -->|calls| T3
  S4["method:NSObject::jobsParagraphStyleCenter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:23"]
  T4["function:jobsMakeParagraphStyle<br/>JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h:25"]
  S4 -->|calls| T4
  S5["method:NSObject::jobsParagraphStyleCenter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:23"]
  T5["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S5 -->|calls| T5
  S6["method:NSObject::jobsParagraphStyleRight<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:34"]
  T6["function:jobsMakeParagraphStyle<br/>JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h:25"]
  S6 -->|calls| T6
  S7["method:NSObject::jobsParagraphStyleRight<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:34"]
  T7["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S7 -->|calls| T7
  S8["method:NSObject::jobsParagraphStyleJustified<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:45"]
  T8["function:jobsMakeParagraphStyle<br/>JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h:25"]
  S8 -->|calls| T8
  S9["method:NSObject::jobsParagraphStyleJustified<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:45"]
  T9["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S9 -->|calls| T9
  S10["method:NSObject::jobsParagraphStyleNatural<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:62"]
  T10["function:jobsMakeParagraphStyle<br/>JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h:25"]
  S10 -->|calls| T10
  S11["method:NSObject::jobsParagraphStyleNatural<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:62"]
  T11["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S11 -->|calls| T11
  S12["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T12["method:NSObject::jobsParagraphStyleLeft<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:12"]
  S12 -->|calls| T12
  S13["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T13["method:NSObject::jobsParagraphStyleCenter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:23"]
  S13 -->|calls| T13
  S14["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T14["method:NSObject::jobsParagraphStyleRight<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:34"]
  S14 -->|calls| T14
  S15["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T15["method:NSObject::jobsParagraphStyleJustified<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:45"]
  S15 -->|calls| T15
  S16["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T16["method:NSObject::jobsParagraphStyleNatural<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:62"]
  S16 -->|calls| T16
  S17["method:NSString::isEqualStrA:strB:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T17["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S17 -->|calls| T17
  S18["method:NSString::isEqualStrA:strB:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T18["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S18 -->|calls| T18
  S19["method:NSString::isEqualStrA:strB:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T19["method:NSString::isEqualToString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S19 -->|calls| T19
  S20["method:NSString::isAllSameCharWithStandardChar<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:95"]
  T20["function:jobsMakeTextView::jobsMakeMutArr<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:802"]
  S20 -->|calls| T20
  S21["method:NSString::isAllSameCharWithStandardChar<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:95"]
  T21["function:StringWithUTF8String<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:66"]
  S21 -->|calls| T21
  S22["method:NSString::isAllSameCharWithStandardChar<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:95"]
  T22["method:NSMutableArray::add<br/>JobsByPods/BRPickerViewExtra@Pods/Support/UIKit/NSMutableArray/NSMutableArray+Extra/NSMutableArray+Extra.m:12"]
  S22 -->|calls| T22
  S23["method:NSString::isPhilippinesPhoneNum<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:292"]
  T23["method:NSString::isPureDigit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:317"]
  S23 -->|calls| T23
  S24["method:NSString::isPureDigit<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:317"]
  T24["method:NSString::jobsPureString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Replace/NSString+Replace.m:324"]
  S24 -->|calls| T24
  S25["method:NSString::isContainBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:328"]
  T25["method:NSString::isNotContainBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:336"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
