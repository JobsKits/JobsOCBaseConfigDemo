# `calls 符号关系 - 001`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:277"]
  T1["method:JobsPodspecKitForBRPickerViewExtra::standard_user_target_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:266"]
  S1 -->|calls| T1
  S2["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:281"]
  T2["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:273"]
  S2 -->|calls| T2
  S3["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:281"]
  T3["method:JobsPodspecKitForBRPickerViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/BRPickerViewExtra@Pods/JobsPodspecKit.rb:277"]
  S3 -->|calls| T3
  S4["method:UIViewController::fd_viewWillAppear:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:63"]
  T4["method:UIViewController::fd_willAppearInjectBlock<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:74"]
  S4 -->|calls| T4
  S5["method:UINavigationController::fd_pushViewController:animated:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:116"]
  T5["method:UINavigationController::fd_pushViewController:animated:<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:116"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_user_target_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:277"]
  T6["method:JobsPodspecKitForFDFullscreenPopGesture::standard_user_target_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:266"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_pod_target_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:273"]
  S7 -->|calls| T7
  S8["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:281"]
  T8["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_user_target_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:277"]
  S8 -->|calls| T8
  S9["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  T9["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S9 -->|calls| T9
  S10["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  T10["method:NSObject::valueForKey<br/>JobsByPods/FDFullscreenPopGesture@Pods/Support/UIKits/NSObject/NSObject+Extra/NSObject+Extra.m:19"]
  S10 -->|calls| T10
  S11["method:FMDatabase::handleInsert<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager.m:35"]
  T11["method:FMDatabase::handleExecuteUpdate:withArgumentsInArray:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager.m:25"]
  S11 -->|calls| T11
  S12["method:FMDatabase::handleDelete<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager.m:40"]
  T12["method:FMDatabase::handleExecuteUpdate:withArgumentsInArray:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager.m:25"]
  S12 -->|calls| T12
  S13["method:FMDatabase::handleUpdate<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager.m:45"]
  T13["method:FMDatabase::handleExecuteUpdate:withArgumentsInArray:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager.m:25"]
  S13 -->|calls| T13
  S14["method:FMDatabase::handleTargetObj:transaction:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager.m:57"]
  T14["method:_ASAsyncTransactionGroup::commit<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransactionGroup.mm:69"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_user_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:277"]
  T15["method:JobsPodspecKitForFileFolderHandleTool::standard_user_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:266"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_pod_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:273"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_user_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:277"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:277"]
  T18["method:JobsPodspecKitForGKCustomNavigationBarExtra::standard_user_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:266"]
  S18 -->|calls| T18
  S19["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:281"]
  T19["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:273"]
  S19 -->|calls| T19
  S20["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:281"]
  T20["method:JobsPodspecKitForGKCustomNavigationBarExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/JobsPodspecKit.rb:277"]
  S20 -->|calls| T20
  S21["method:NSData::initWithData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  T21["method:NSData::initWithData<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:12"]
  S21 -->|calls| T21
  S22["method:NSMutableDictionary::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T22["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S22 -->|calls| T22
  S23["method:NSMutableDictionary::add<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:12"]
  T23["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S23 -->|calls| T23
  S24["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T24["function:isValue<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils.m:41"]
  S24 -->|calls| T24
  S25["method:NSMutableDictionary::saveDataBy<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSMutableDictionary/NSMutableDictionary+Extra/NSMutableDictionary+Extra.m:30"]
  T25["method:ASWeakMap::setObject:forKey:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASWeakMap.mm:65"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
