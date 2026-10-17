# `calls 符号关系 - 004`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:UINavigationController::fd_setupViewControllerBasedNavigationBarAppearanceIfNeeded<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:233"]
  T1["method:UIViewController::byFd_willAppearInjectBlock<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:171"]
  S1 -->|calls| T1
  S2["method:UINavigationController::fd_setupViewControllerBasedNavigationBarAppearanceIfNeeded<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:233"]
  T2["method:UIViewController::byFd_willAppearInjectBlock<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:171"]
  S2 -->|calls| T2
  S3["method:UINavigationController::fd_popGestureRecognizerDelegate<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:257"]
  T3["method:_FDFullscreenPopGestureRecognizerDelegate::byNavigationController<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:98"]
  S3 -->|calls| T3
  S4["method:UINavigationController::fd_viewControllerBasedNavigationBarAppearanceEnabled<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:272"]
  T4["method:UINavigationController::byFd_viewControllerBasedNavigationBarAppearanceEnabled<br/>JobsByPods/FDFullscreenPopGesture@Pods/Core/UINavigationController+FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.m:283"]
  S4 -->|calls| T4
  S5["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_user_target_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:277"]
  T5["method:JobsPodspecKitForFDFullscreenPopGesture::standard_user_target_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:266"]
  S5 -->|calls| T5
  S6["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:281"]
  T6["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_pod_target_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:273"]
  S6 -->|calls| T6
  S7["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:281"]
  T7["method:JobsPodspecKitForFDFullscreenPopGesture::apply_standard_user_target_xcconfig<br/>JobsByPods/FDFullscreenPopGesture@Pods/JobsPodspecKit.rb:277"]
  S7 -->|calls| T7
  S8["method:FMDatabase::handleInsert<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m:110"]
  T8["method:FMDatabase::handleExecuteUpdate:withArgumentsInArray:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m:32"]
  S8 -->|calls| T8
  S9["method:FMDatabase::handleDelete<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m:120"]
  T9["method:FMDatabase::handleExecuteUpdate:withArgumentsInArray:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m:32"]
  S9 -->|calls| T9
  S10["method:FMDatabase::handleUpdate<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m:130"]
  T10["method:FMDatabase::handleExecuteUpdate:withArgumentsInArray:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m:32"]
  S10 -->|calls| T10
  S11["method:FMDatabase::handleTargetObj:transaction:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m:152"]
  T11["method:FMDatabase::jobsPerformTransaction:error:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m:48"]
  S11 -->|calls| T11
  S12["method:FMDatabase::handleTargetObj:transaction:<br/>JobsByPods/FMDatabaseExtra@Pods/Core/FMDatabase+Manager/FMDatabase+Manager.m:152"]
  T12["method:NSObject::targetObj:callingMethodWithName:<br/>JobsByPods/JobsOCRuntimeKits@Pods/Core/NSObject+DynamicInvoke/NSObject+DynamicInvoke.m:167"]
  S12 -->|calls| T12
  S13["method:JobsPodspecKitForFMDatabaseExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/FMDatabaseExtra@Pods/JobsPodspecKit.rb:277"]
  T13["method:JobsPodspecKitForFMDatabaseExtra::standard_user_target_xcconfig<br/>JobsByPods/FMDatabaseExtra@Pods/JobsPodspecKit.rb:266"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForFMDatabaseExtra::apply_standard_xcconfig<br/>JobsByPods/FMDatabaseExtra@Pods/JobsPodspecKit.rb:281"]
  T14["method:JobsPodspecKitForFMDatabaseExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/FMDatabaseExtra@Pods/JobsPodspecKit.rb:273"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForFMDatabaseExtra::apply_standard_xcconfig<br/>JobsByPods/FMDatabaseExtra@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForFMDatabaseExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/FMDatabaseExtra@Pods/JobsPodspecKit.rb:277"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForFSCalendarExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/FSCalendarExtra@Pods/JobsPodspecKit.rb:277"]
  T16["method:JobsPodspecKitForFSCalendarExtra::standard_user_target_xcconfig<br/>JobsByPods/FSCalendarExtra@Pods/JobsPodspecKit.rb:266"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForFSCalendarExtra::apply_standard_xcconfig<br/>JobsByPods/FSCalendarExtra@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForFSCalendarExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/FSCalendarExtra@Pods/JobsPodspecKit.rb:273"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForFSCalendarExtra::apply_standard_xcconfig<br/>JobsByPods/FSCalendarExtra@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForFSCalendarExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/FSCalendarExtra@Pods/JobsPodspecKit.rb:277"]
  S18 -->|calls| T18
  S19["method:FileFolderHandleTool::banSysDocSynchronization<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:38"]
  T19["method:NSString::jobsFileUrl<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+URL/NSString+URL.m:43"]
  S19 -->|calls| T19
  S20["method:FileFolderHandleTool::banSysDocSynchronization<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:38"]
  T20["method:NSObject::documentsDir<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:67"]
  S20 -->|calls| T20
  S21["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T21["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S21 -->|calls| T21
  S22["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T22["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S22 -->|calls| T22
  S23["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T23["method:NSObject::cachesDir<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSObject/NSObject+Path/NSObject+Path.m:94"]
  S23 -->|calls| T23
  S24["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T24["function:isNull<br/>JobsByPods/JobsStringUtils@Pods/Core/JobsStringUtils/JobsStringUtils.m:32"]
  S24 -->|calls| T24
  S25["method:FileFolderHandleTool::createCacheFolderPath:fileEx:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:51"]
  T25["method:NSString::addPathComponent<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:67"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
