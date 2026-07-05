# `calls 符号关系 - 005`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UINavigationController::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UINavigationController/UINavigationController+Extra/UINavigationController+Extra.m:12"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["method:UITextField::isValidate:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:13"]
  T2["method:UITextField::shakeAnimationForView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:25"]
  S2 -->|calls| T2
  S3["method:UITextField::isEmptyText<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:19"]
  T3["method:UITextField::shakeAnimationForView<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITextField/UITextField+Animation/UITextField+Animation.m:25"]
  S3 -->|calls| T3
  S4["method:UIView::currentController<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIView/UIView+ViewController/UIView+ViewController.m:12"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:UIViewController::navCtrl<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+Extra/UIViewController+Extra.m:32"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:UIViewController::load<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:12"]
  T6["method:UIViewController::exchangeMethod<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:34"]
  S6 -->|calls| T6
  S7["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T7["method:NSPointerArray::pointerByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:12"]
  S7 -->|calls| T7
  S8["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["method:UIViewController::my_viewDidAppear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:45"]
  T9["method:NSPointerArray::removePointerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:29"]
  S9 -->|calls| T9
  S10["method:UIViewController::my_viewDidDisappear:<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:74"]
  T10["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S10 -->|calls| T10
  S11["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  T11["method:NSPointerArray::pointerByIndex<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:12"]
  S11 -->|calls| T11
  S12["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  T12["method:NSPointerArray::removePointerBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSPointerArray/NSPointerArray+Extra/NSPointerArray+Extra.m:29"]
  S12 -->|calls| T12
  S13["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  T13["method:UIViewController::my_dealloc<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UIViewController/UIViewController+Sys/UIViewController+LeakCheck/UIViewController+LeakCheck.m:87"]
  S13 -->|calls| T13
  S14["method:CustomZFPlayerControlView::gestureSingleTapped:<br/>JobsByPods/JobsByOCPods@Pods/Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.m:18"]
  T14["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S14 -->|calls| T14
  S15["method:CustomZFPlayerControlView::gestureDoubleTapped:<br/>JobsByPods/JobsByOCPods@Pods/Core/播放器控制层/CustomZFPlayerControlView/CustomZFPlayerControlView.m:23"]
  T15["method:ASMutableAttributedStringBuilder::endEditing<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:249"]
  S15 -->|calls| T15
  S16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  T16["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S16 -->|calls| T16
  S17["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  T17["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJobsClass::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:277"]
  T18["method:JobsPodspecKitForJobsClass::standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:266"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForJobsClass::apply_standard_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForJobsClass::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:273"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForJobsClass::apply_standard_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForJobsClass::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClass@Pods/JobsPodspecKit.rb:277"]
  S20 -->|calls| T20
  S21["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  T21["method:JobsPodspecKitForJobsClockView::standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:266"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T22["method:JobsPodspecKitForJobsClockView::apply_standard_pod_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:273"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForJobsClockView::apply_standard_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForJobsClockView::apply_standard_user_target_xcconfig<br/>JobsByPods/JobsClockView@Pods/JobsPodspecKit.rb:277"]
  S23 -->|calls| T23
  S24["function:aesEncryptData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:48"]
  T24["function:cipherOperation<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:14"]
  S24 -->|calls| T24
  S25["function:aesDecryptData<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:58"]
  T25["function:cipherOperation<br/>JobsByPods/JobsCryptography@Pods/Core/加密（编码）算法/AES/AESCipher/AESCipher.m:14"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
