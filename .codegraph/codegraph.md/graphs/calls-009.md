# `calls 符号关系 - 009`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T1["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:273"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  S2 -->|calls| T2
  S3["method:NSData::initWithData<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T3["method:NSData::initWithData<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:NSString::substringFromIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  T4["method:NSString::substringFromIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:28"]
  S4 -->|calls| T4
  S5["method:NSString::substringToIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  T5["method:NSString::substringToIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S5 -->|calls| T5
  S6["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  T6["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S6 -->|calls| T6
  S7["method:NSString::range<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:60"]
  T7["method:NSString::rangeOfString<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:52"]
  S7 -->|calls| T7
  S8["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  T8["method:NSString::characterAtIndex<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:72"]
  S8 -->|calls| T8
  S9["method:NSString::jobsUrl<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:12"]
  T9["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S9 -->|calls| T9
  S10["method:NSString::URLRequest<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:21"]
  T10["method:NSURLRequest::initBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSURLRequest/NSURLRequest+Extra/NSURLRequest+Extra.m:12"]
  S10 -->|calls| T10
  S11["method:NSString::jobsFileUrl<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T11["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsDropDownListView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:277"]
  T12["method:JobsPodspecKitForJobsDropDownListView::standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:266"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsDropDownListView::apply_standard_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:281"]
  T13["method:JobsPodspecKitForJobsDropDownListView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:273"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsDropDownListView::apply_standard_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsDropDownListView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:277"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsFiltrationView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:277"]
  T15["method:JobsPodspecKitForJobsFiltrationView::standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:266"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsFiltrationView::apply_standard_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJobsFiltrationView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:273"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsFiltrationView::apply_standard_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsFiltrationView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:277"]
  S17 -->|calls| T17
  S18["method:JobsGestureLockConfiguration::copyWithZone:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockConfiguration/JobsGestureLockConfiguration.m:37"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:JobsGestureLockStorage::saveGesturePassword:forKey:<br/>JobsByPods/JobsGestureLock@Pods/Core/JobsGestureLockStorage/JobsGestureLockStorage.m:16"]
  T19["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  T20["method:JobsPodspecKitForJobsGestureLock::standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:266"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T21["method:JobsPodspecKitForJobsGestureLock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:273"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  T23["method:JobsPodspecKitForJobsGetWindow::standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:266"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForJobsGetWindow::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:273"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsGetWindow::apply_standard_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:281"]
  T25["method:JobsPodspecKitForJobsGetWindow::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGetWindow@Pods/JobsPodspecKit.rb:277"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
