# `calls 符号关系 - 014`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXCategoryTitleBackgroundView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:18"]
  T1["method:JXCategoryTitleBackgroundView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:18"]
  S1 -->|calls| T1
  S2["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:46"]
  T2["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:46"]
  S2 -->|calls| T2
  S3["method:JobsBaseApi::buildCustomUrlRequest<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:13"]
  T3["method:NSObject::printRequestMessage<br/>JobsByPods/YTKNetworkExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:30"]
  S3 -->|calls| T3
  S4["method:UploadImageApi::initWithImage:<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.m:28"]
  T4["method:JobsBasePopupView::init<br/>JobsByPods/JobsBasePopupView@Pods/Core/JobsBasePopupView.m:26"]
  S4 -->|calls| T4
  S5["function:getIPaddress<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:13"]
  T5["method:NSString::isEqualToString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Check/NSString+Check.m:19"]
  S5 -->|calls| T5
  S6["function:isValidatIP<br/>JobsByPods/JobsAPIs@Pods/Core/DeviceIP/NSObject+DeviceIP/NSObject+DeviceIP.m:61"]
  T6["method:NSTextCheckingResult::rangeAtIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSTextCheckingResult/NSTextCheckingResult+Extra/NSTextCheckingResult+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsAPIs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:277"]
  T7["method:JobsPodspecKitForJobsAPIs::standard_user_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:266"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsAPIs::apply_standard_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForJobsAPIs::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:273"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsAPIs::apply_standard_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsAPIs::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsAPIs@Pods/JobsPodspecKit.rb:277"]
  S9 -->|calls| T9
  S10["method:NSData::initWithData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T10["method:NSData::initWithData<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSData::stringByUTF8Encoding<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:134"]
  T11["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S11 -->|calls| T11
  S12["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T12["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S12 -->|calls| T12
  S13["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  T13["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S13 -->|calls| T13
  S14["method:NSMutableDictionary::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T14["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S14 -->|calls| T14
  S15["method:NSMutableDictionary::add<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T15["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S15 -->|calls| T15
  S16["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T16["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S16 -->|calls| T16
  S17["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T17["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S17 -->|calls| T17
  S18["method:NSMutableDictionary::jsonString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:39"]
  T18["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S18 -->|calls| T18
  S19["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T19["function:KindOfNumberCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:95"]
  S19 -->|calls| T19
  S20["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T20["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S20 -->|calls| T20
  S21["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T21["function:toStringByNSInteger<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:95"]
  S21 -->|calls| T21
  S22["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T22["function:toStringByLong<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:103"]
  S22 -->|calls| T22
  S23["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T23["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S23 -->|calls| T23
  S24["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T24["function:toStringByInt<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:75"]
  S24 -->|calls| T24
  S25["method:NSNumber::toString<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSNumber/NSNumber+Extra/NSNumber+Extra.m:122"]
  T25["function:toStringByFloat<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:79"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
