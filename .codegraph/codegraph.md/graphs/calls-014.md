# `calls 符号关系 - 014`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T1["method:MJRefreshConfigModel::byRefreshingTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:92"]
  S1 -->|calls| T1
  S2["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T2["method:MJRefreshConfigModel::byPullingTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:83"]
  S2 -->|calls| T2
  S3["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  T3["method:MJRefreshConfigModel::byStateIdleTitle<br/>JobsByPods/JobsModelDSL@Pods/Core/MJRefreshConfigModel/MJRefreshConfigModel+DSL/MJRefreshConfigModel+DSL.m:74"]
  S3 -->|calls| T3
  S4["method:NSObject::refreshFooterDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:244"]
  T4["method:MJRefreshConfigModel::byLoadBlock<br/>JobsByPods/JobsModel@Pods/Core/3rd/MJRefreshConfigModel/MJRefreshConfigModel.m:15"]
  S4 -->|calls| T4
  S5["method:NSObject::refreshFooterDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:244"]
  T5["method:NSObject::jobsMjFooterDefaultConfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:228"]
  S5 -->|calls| T5
  S6["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:253"]
  T6["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S6 -->|calls| T6
  S7["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:253"]
  T7["method:ASDKNavigationController::popViewControllerAnimated:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDKNavigationController.mm:104"]
  S7 -->|calls| T7
  S8["method:NSObject::jobsParagraphStyleLeft<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:12"]
  T8["function:jobsMakeParagraphStyle<br/>'JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h':25"]
  S8 -->|calls| T8
  S9["method:NSObject::jobsParagraphStyleLeft<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:12"]
  T9["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S9 -->|calls| T9
  S10["method:NSObject::jobsParagraphStyleCenter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:23"]
  T10["function:jobsMakeParagraphStyle<br/>'JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h':25"]
  S10 -->|calls| T10
  S11["method:NSObject::jobsParagraphStyleCenter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:23"]
  T11["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S11 -->|calls| T11
  S12["method:NSObject::jobsParagraphStyleRight<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:34"]
  T12["function:jobsMakeParagraphStyle<br/>'JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h':25"]
  S12 -->|calls| T12
  S13["method:NSObject::jobsParagraphStyleRight<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:34"]
  T13["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S13 -->|calls| T13
  S14["method:NSObject::jobsParagraphStyleJustified<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:45"]
  T14["function:jobsMakeParagraphStyle<br/>'JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h':25"]
  S14 -->|calls| T14
  S15["method:NSObject::jobsParagraphStyleJustified<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:45"]
  T15["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S15 -->|calls| T15
  S16["method:NSObject::jobsParagraphStyleNatural<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:62"]
  T16["function:jobsMakeParagraphStyle<br/>'JobsByPods/JobsModel@Pods/Core/富文本处理/JobsRichTextConfig/JobsRichTextConfig.h':25"]
  S16 -->|calls| T16
  S17["method:NSObject::jobsParagraphStyleNatural<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:62"]
  T17["method:NSMutableParagraphStyle::byAlignment<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/NSMutableParagraphStyle+DSLs/NSMutableParagraphStyle+DSL/NSMutableParagraphStyle+DSL.m:132"]
  S17 -->|calls| T17
  S18["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T18["method:NSObject::jobsParagraphStyleLeft<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:12"]
  S18 -->|calls| T18
  S19["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T19["method:NSObject::jobsParagraphStyleCenter<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:23"]
  S19 -->|calls| T19
  S20["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T20["method:NSObject::jobsParagraphStyleRight<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:34"]
  S20 -->|calls| T20
  S21["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T21["method:NSObject::jobsParagraphStyleJustified<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:45"]
  S21 -->|calls| T21
  S22["method:NSObject::jobsparagraphStyleByTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:77"]
  T22["method:NSObject::jobsParagraphStyleNatural<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+NSMutableParagraphStyle/NSObject+NSMutableParagraphStyle.m:62"]
  S22 -->|calls| T22
  S23["method:NSString::isEqualStrA:strB:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T23["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S23 -->|calls| T23
  S24["method:NSString::isEqualStrA:strB:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S24 -->|calls| T24
  S25["method:NSString::isEqualStrA:strB:<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:13"]
  T25["method:NSString::isEqualToString<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
