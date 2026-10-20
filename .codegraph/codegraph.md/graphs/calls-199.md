# `calls 符号关系 - 199`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsBasePopupView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBasePopupView@Pods/JobsPodspecKit.rb:279"]
  T1["method:JobsPodspecKitForJobsBasePopupView::standard_user_target_xcconfig<br/>JobsByPods/JobsBasePopupView@Pods/JobsPodspecKit.rb:268"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsBasePopupView::apply_standard_xcconfig<br/>JobsByPods/JobsBasePopupView@Pods/JobsPodspecKit.rb:283"]
  T2["method:JobsPodspecKitForJobsBasePopupView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsBasePopupView@Pods/JobsPodspecKit.rb:275"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsBasePopupView::apply_standard_xcconfig<br/>JobsByPods/JobsBasePopupView@Pods/JobsPodspecKit.rb:283"]
  T3["method:JobsPodspecKitForJobsBasePopupView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsBasePopupView@Pods/JobsPodspecKit.rb:279"]
  S3 -->|calls| T3
  S4["method:BaseView::drawRect:<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:42"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:BaseView::layoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:62"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:BaseView::jobsLayoutSubviews<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:67"]
  T6["function:JobsSafeWidth::jobsZeroSizeValue<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:521"]
  S6 -->|calls| T6
  S7["method:BaseView::layoutIfNeeded<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:82"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:BaseView::closeBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:96"]
  T8["function:jobsMakeButtonModel<br/>JobsByPods/JobsModel@Pods/Core/UIKit数据束/UIButtonModel/UIButtonModel.h:91"]
  S8 -->|calls| T8
  S9["method:BaseView::closeBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:96"]
  T9["method:UIButtonConfiguration::byBaseBackgroundColor<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/UIButtonConfiguration/UIButtonConfiguration+Extra/UIButtonConfiguration+Extra.m:120"]
  S9 -->|calls| T9
  S10["method:BaseView::closeBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:96"]
  T10["method:FMBannerAdsModel::byRoundingCorners<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:272"]
  S10 -->|calls| T10
  S11["method:BaseView::closeBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:96"]
  T11["method:UIButtonModel::byBackgroundImage<br/>JobsByPods/JobsModelDSL@Pods/Core/UIButtonModel/UIButtonModel+DSL/UIButtonModel+DSL.m:1712"]
  S11 -->|calls| T11
  S12["method:BaseView::backBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:110"]
  T12["method:FMBannerAdsModel::byClickEventBlock<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1244"]
  S12 -->|calls| T12
  S13["method:BaseView::backBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:110"]
  T13["method:FMBannerAdsModel::byLongPressGestureEventBlock<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1253"]
  S13 -->|calls| T13
  S14["method:BaseView::backBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:110"]
  T14["method:NSObject::jobsMakeBackBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:133"]
  S14 -->|calls| T14
  S15["method:BaseView::backBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:110"]
  T15["variable:objBlock<br/>JobsByPods/JobsBlock@Pods/Core/Tools/NSObject+CallBackInfoByBlock/NSObject+CallBackInfoByBlock.h:44"]
  S15 -->|calls| T15
  S16["method:BaseView::backBtnModel<br/>JobsByPods/JobsBasePopupView@Pods/Support/BaseUI/BaseView/BaseView.m:110"]
  T16["method:NSObject::jobsBackBtnClickEvent<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:157"]
  S16 -->|calls| T16
  S17["method:NSData::decompressToStr<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:123"]
  T17["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  S17 -->|calls| T17
  S18["method:NSData::stringByUTF8Encoding<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:139"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:NSData::jobsStringByUTF8Encoding<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:143"]
  T19["method:NSString::initByUTF8Data<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S19 -->|calls| T19
  S20["method:NSMutableDictionary::add<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:11"]
  T20["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S20 -->|calls| T20
  S21["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:29"]
  T21["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:48"]
  S21 -->|calls| T21
  S22["method:NSMutableDictionary::jsonString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:38"]
  T22["method:NSString::initByUTF8Data<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T23["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:82"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T24["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:102"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsBasePopupView@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:126"]
  T25["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:110"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
