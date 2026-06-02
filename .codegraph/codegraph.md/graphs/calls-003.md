# `calls 符号关系 - 003`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:377"]
  T1["method:FileFolderHandleTool::directoryAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:421"]
  S1 -->|calls| T1
  S2["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:377"]
  T2["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:434"]
  S2 -->|calls| T2
  S3["method:FileFolderHandleTool::moveItemAtPath:toPath:overwrite:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:377"]
  T3["method:FileFolderHandleTool::isExistsAtPath<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:434"]
  S3 -->|calls| T3
  S4["method:FileFolderHandleTool::isEmptyItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:440"]
  T4["function:JobsAppDoorContentView::count<br/>JobsByPods/JobsOCTools@Pods/Core/JobsAppDoor/View/JobsAppDoorContentView/JobsAppDoorContentView.m:331"]
  S4 -->|calls| T4
  S5["method:FileFolderHandleTool::sizeOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:487"]
  T5["method:ASResponderChainEnumerator::nextObject<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Private/ASResponderChainEnumerator.mm:28"]
  S5 -->|calls| T5
  S6["method:FileFolderHandleTool::sizeOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:487"]
  T6["method:NSString::addPathComponent<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSString/NSString+Path/NSString+Path.m:43"]
  S6 -->|calls| T6
  S7["method:FileFolderHandleTool::sizeFormattedOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:502"]
  T7["method:FileFolderHandleTool::sizeFormatted<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:508"]
  S7 -->|calls| T7
  S8["method:FileFolderHandleTool::sizeFormattedOfDirectoryAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:521"]
  T8["method:FileFolderHandleTool::sizeFormatted<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:508"]
  S8 -->|calls| T8
  S9["method:FileFolderHandleTool::gettingLastResource<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:553"]
  T9["method:PHAsset::initByOptions<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAsset/PHAsset+Extra/PHAsset+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:FileFolderHandleTool::createAlbumFolder:ifExitFolderBlock:completionHandler:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:564"]
  T10["method:FileFolderHandleTool::isExistFolder<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:623"]
  S10 -->|calls| T10
  S11["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:576"]
  T11["method:FileFolderHandleTool::isExistFolder<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:623"]
  S11 -->|calls| T11
  S12["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:576"]
  T12["method:PHAssetCollectionChangeRequest::initByTitle<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAssetCollectionChangeRequest/PHAssetCollectionChangeRequest+Extra/PHAssetCollectionChangeRequest+Extra.m:19"]
  S12 -->|calls| T12
  S13["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:576"]
  T13["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:591"]
  S13 -->|calls| T13
  S14["method:FileFolderHandleTool::createAlbumFolder:path:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:576"]
  T14["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:591"]
  S14 -->|calls| T14
  S15["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:591"]
  T15["method:PHCollectionList::initByOptions<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHCollectionList/PHCollectionList+Extra/PHCollectionList+Extra.m:12"]
  S15 -->|calls| T15
  S16["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:591"]
  T16["method:PHAssetChangeRequest::initByURL<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAssetChangeRequest/PHAssetChangeRequest+Extra/PHAssetChangeRequest+Extra.m:12"]
  S16 -->|calls| T16
  S17["method:FileFolderHandleTool::saveRes<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:591"]
  T17["method:PHAssetCollectionChangeRequest::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAssetCollectionChangeRequest/PHAssetCollectionChangeRequest+Extra/PHAssetCollectionChangeRequest+Extra.m:12"]
  S17 -->|calls| T17
  S18["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:682"]
  T18["method:FileFolderHandleTool::AVAssetToData<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:753"]
  S18 -->|calls| T18
  S19["method:FileFolderHandleTool::getAudioFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:725"]
  T19["method:PHAssetResource::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAssetResource/PHAssetResource+Extra/PHAssetResource+Extra.m:12"]
  S19 -->|calls| T19
  S20["method:FileFolderHandleTool::getAudioFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:725"]
  T20["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S20 -->|calls| T20
  S21["method:FileFolderHandleTool::AVAssetToData<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool.m:753"]
  T21["method:NSData::initByURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:32"]
  S21 -->|calls| T21
  S22["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_user_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:277"]
  T22["method:JobsPodspecKitForFileFolderHandleTool::standard_user_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:266"]
  S22 -->|calls| T22
  S23["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:281"]
  T23["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_pod_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:273"]
  S23 -->|calls| T23
  S24["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:281"]
  T24["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_user_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:277"]
  S24 -->|calls| T24
  S25["method:UIViewController::gk_navTitleBtn<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar.m:35"]
  T25["method:UIButton::initByButtonModel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UIButton/UIButton+SimplyMake/UIButton+SimplyMake.m:360"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
