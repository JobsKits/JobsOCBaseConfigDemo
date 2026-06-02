# `calls 符号关系 - 116`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIView::endMJFooterRefreshingWithNoMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:533"]
  T1["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S1 -->|calls| T1
  S2["method:UIView::endMJFooterRefreshingWithMoreData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:544"]
  T2["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S2 -->|calls| T2
  S3["method:UIView::endXZMHeaderRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:560"]
  T3["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S3 -->|calls| T3
  S4["method:UIView::endXZMFooterRefreshing<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:571"]
  T4["function:KindOfScrollViewCls<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Sys/MacroDef_SDK.h:91"]
  S4 -->|calls| T4
  S5["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T5["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S5 -->|calls| T5
  S6["method:UIView::observeValueForKeyPath:ofObject:change:context:<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/UIView/UIView+Refresh/UIView+Refresh.m:602"]
  T6["method:NSObject::feedbackGenerator<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSObject/NSObject+Extra/NSObject+Extra.m:12"]
  S6 -->|calls| T6
  S7["function:jobsMakeWKWebViewByConfig<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.h:47"]
  T7["method:WKWebView::initBy<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/WKWebView/WKWebView+Extra/WKWebView+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  T8["method:JobsPodspecKitForJobsDebug::standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:266"]
  S8 -->|calls| T8
  S9["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T9["method:JobsPodspecKitForJobsDebug::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:273"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T10["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  S10 -->|calls| T10
  S11["method:NSData::stringByUTF8Encoding<br/>JobsByPods/JobsDebug@Pods/Support/UIKit/NSData/NSData+Extra.m:12"]
  T11["method:NSString::initByUTF8Data<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Conversion/NSString+Conversion.m:13"]
  S11 -->|calls| T11
  S12["function:JobsDeviceIDKeychainLoad<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:21"]
  T12["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S12 -->|calls| T12
  S13["function:JobsDeviceIDKeychainLoad<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:21"]
  T13["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S13 -->|calls| T13
  S14["function:JobsDeviceIDKeychainSave<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:41"]
  T14["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S14 -->|calls| T14
  S15["function:JobsDeviceIDKeychainRemove<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:49"]
  T15["function:JobsDeviceIDKeychainQuery<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:12"]
  S15 -->|calls| T15
  S16["method:NSObject::deleteDeviceID<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:59"]
  T16["function:JobsDeviceIDKeychainRemove<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:49"]
  S16 -->|calls| T16
  S17["method:NSObject::deviceID<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:63"]
  T17["function:JobsDeviceIDKeychainLoad<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:21"]
  S17 -->|calls| T17
  S18["method:NSObject::deviceID<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:63"]
  T18["function:JobsDeviceIDKeychainSave<br/>JobsByPods/JobsDeviceInfo@Pods/Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m:41"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  T19["method:JobsPodspecKitForJobsDeviceInfo::standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:266"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:273"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  S21 -->|calls| T21
  S22["method:NSArray::containsObject<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  T22["method:NSArray::containsObject<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S22 -->|calls| T22
  S23["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T23["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S23 -->|calls| T23
  S24["method:NSArray::compareEqualArrElement<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:49"]
  T24["method:NSSet::initByArr<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSSet/NSSet+Extra/NSSet+Extra.m:12"]
  S24 -->|calls| T24
  S25["method:NSArray::arrayForIntersectionWithOtherArray<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:57"]
  T25["method:NSArray::containsObject<br/>JobsByPods/JobsBaseUI@Pods/Support/UIKit/NSArray/NSArray+Extra/NSArray+Extra.m:28"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
