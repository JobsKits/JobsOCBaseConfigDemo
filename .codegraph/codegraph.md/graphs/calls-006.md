# `calls 符号关系 - 006`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UIViewController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:12"]
  T1["method:UIViewController::exchangeMethod<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:34"]
  S1 -->|calls| T1
  S2["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T2["method:NSPointerArray::pointerByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:12"]
  S2 -->|calls| T2
  S3["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T4["method:NSPointerArray::removePointerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:29"]
  S4 -->|calls| T4
  S5["method:UIViewController::my_viewDidDisappear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:74"]
  T5["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S5 -->|calls| T5
  S6["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  T6["method:NSPointerArray::pointerByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:12"]
  S6 -->|calls| T6
  S7["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  T7["method:NSPointerArray::removePointerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:29"]
  S7 -->|calls| T7
  S8["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  T8["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  S8 -->|calls| T8
  S9["method:CustomZFPlayerControlView::gestureSingleTapped:<br/>JobsByPods/JobsByOCPods@Pods/Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.m:18"]
  T9["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S9 -->|calls| T9
  S10["method:CustomZFPlayerControlView::gestureDoubleTapped:<br/>JobsByPods/JobsByOCPods@Pods/Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.m:23"]
  T10["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S10 -->|calls| T10
  S11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  T11["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S11 -->|calls| T11
  S12["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  T12["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForJobsClass::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:277"]
  T13["method:JobsPodspecKitForJobsClass::standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:266"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJobsClass::apply_standard_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForJobsClass::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:273"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJobsClass::apply_standard_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJobsClass::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:277"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  T16["method:JobsPodspecKitForJobsClockView::standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:266"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJobsClockView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:273"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  S18 -->|calls| T18
  S19["function:aesEncryptData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:48"]
  T19["function:cipherOperation<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:14"]
  S19 -->|calls| T19
  S20["function:aesDecryptData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:58"]
  T20["function:cipherOperation<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:14"]
  S20 -->|calls| T20
  S21["function:aesEncryptString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:68"]
  T21["function:aesEncryptData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:48"]
  S21 -->|calls| T21
  S22["function:aesDecryptString<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:79"]
  T22["function:aesDecryptData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:58"]
  S22 -->|calls| T22
  S23["method:NSData::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:19"]
  T23["method:NSData::base32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:13"]
  S23 -->|calls| T23
  S24["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:30"]
  T24["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S24 -->|calls| T24
  S25["method:NSString::imageByBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSString+Base32/NSString+Base32.m:36"]
  T25["method:NSData::dataWithBase32String<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/Base编码系列/Base32/Base32（系统拓展）/NSData+Base32/NSData+Base32.m:24"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
