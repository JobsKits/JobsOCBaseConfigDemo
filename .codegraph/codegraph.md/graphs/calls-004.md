# `calls 符号关系 - 004`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIImage::MIMEStr<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:32"]
  T1["method:UIImage::MIMEStringByImage<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/MIME/UIImage+MIME/UIImage+MIME.m:25"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForJobsCryptography::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:277"]
  T2["method:JobsPodspecKitForJobsCryptography::standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:266"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForJobsCryptography::apply_standard_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForJobsCryptography::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:273"]
  S3 -->|calls| T3
  S4["method:JobsPodspecKitForJobsCryptography::apply_standard_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:281"]
  T4["method:JobsPodspecKitForJobsCryptography::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCryptography@Pods/JobsPodspecKit.rb:277"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  T5["method:JobsPodspecKitForJobsCustomView::standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:266"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForJobsCustomView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:273"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForJobsCustomView::apply_standard_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForJobsCustomView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsCustomView@Pods/JobsPodspecKit.rb:277"]
  S7 -->|calls| T7
  S8["method:NSData::initWithData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T8["method:NSData::initWithData<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S8 -->|calls| T8
  S9["method:NSString::jobsFileUrl<br/>JobsByPods/JobsCustomView@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T9["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  T10["method:JobsPodspecKitForJobsDebug::standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:266"]
  S10 -->|calls| T10
  S11["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T11["method:JobsPodspecKitForJobsDebug::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:273"]
  S11 -->|calls| T11
  S12["method:JobsPodspecKitForJobsDebug::apply_standard_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:281"]
  T12["method:JobsPodspecKitForJobsDebug::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDebug@Pods/JobsPodspecKit.rb:277"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  T13["method:JobsPodspecKitForJobsDeviceInfo::standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:266"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:273"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsDeviceInfo::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDeviceInfo@Pods/JobsPodspecKit.rb:277"]
  S15 -->|calls| T15
  S16["method:NSData::initWithData<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T16["method:NSData::initWithData<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:NSString::jobsFileUrl<br/>JobsByPods/JobsDeviceInfo@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:26"]
  T17["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsDropDownListView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:277"]
  T18["method:JobsPodspecKitForJobsDropDownListView::standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:266"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsDropDownListView::apply_standard_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsDropDownListView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:273"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsDropDownListView::apply_standard_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsDropDownListView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsDropDownListView@Pods/JobsPodspecKit.rb:277"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsFiltrationView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:277"]
  T21["method:JobsPodspecKitForJobsFiltrationView::standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:266"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsFiltrationView::apply_standard_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsFiltrationView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:273"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsFiltrationView::apply_standard_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsFiltrationView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsFiltrationView@Pods/JobsPodspecKit.rb:277"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForJobsGestureLock::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:277"]
  T24["method:JobsPodspecKitForJobsGestureLock::standard_user_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:266"]
  S24 -->|calls| T24
  S25["method:JobsPodspecKitForJobsGestureLock::apply_standard_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:281"]
  T25["method:JobsPodspecKitForJobsGestureLock::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsGestureLock@Pods/JobsPodspecKit.rb:273"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
