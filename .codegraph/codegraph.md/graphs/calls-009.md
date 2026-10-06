# `calls 符号关系 - 009`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T1["method:FileFolderHandleModel::byAsset<br/>JobsByPods/JobsModelDSL@Pods/Core/FileFolderHandleModel/FileFolderHandleModel+DSL/FileFolderHandleModel+DSL.m:11"]
  S1 -->|calls| T1
  S2["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T2["method:FileFolderHandleTool::AVAssetToData<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:777"]
  S2 -->|calls| T2
  S3["method:FileFolderHandleTool::getVideoFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:704"]
  T3["method:AVURLAsset::videoPreViewImage<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/AVURLAsset/AVURLAsset+Extra/AVURLAsset+Extra.m:12"]
  S3 -->|calls| T3
  S4["method:FileFolderHandleTool::getPicFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:726"]
  T4["function:jobsMakeTextView::jobsMakePHImageManager<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:660"]
  S4 -->|calls| T4
  S5["method:FileFolderHandleTool::getPicFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:726"]
  T5["function:jobsMakeTextView::jobsMakePHImageRequestOptions<br/>JobsByPods/JobsMakes@Pods/JobsMakes.h:667"]
  S5 -->|calls| T5
  S6["method:FileFolderHandleTool::getPicFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:726"]
  T6["method:PHImageRequestOptions::byDeliveryMode<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:854"]
  S6 -->|calls| T6
  S7["method:FileFolderHandleTool::getPicFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:726"]
  T7["method:PHImageRequestOptions::bySynchronous<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:845"]
  S7 -->|calls| T7
  S8["method:FileFolderHandleTool::getAudioFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:749"]
  T8["method:PHAssetResource::initBy<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/PHAssetResource/PHAssetResource+Extra/PHAssetResource+Extra.m:11"]
  S8 -->|calls| T8
  S9["method:FileFolderHandleTool::getAudioFromPHAsset:complete:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:749"]
  T9["method:NSURL::fileURLWithPath<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/NSURL/NSURL+Extra/NSURL+Extra.m:12"]
  S9 -->|calls| T9
  S10["method:FileFolderHandleTool::AVAssetToData<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:777"]
  T10["method:NSData::initByURL<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSData/NSData+Extra/NSData+Extra.m:32"]
  S10 -->|calls| T10
  S11["method:FileFolderHandleTool::attributeOfItemAtPath:forKey:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:818"]
  T11["method:NSDictionary::objectForKey<br/>JobsByPods/JobsAPIs@Pods/Support/UIKit/NSDictionary/NSDictionary+Extra/NSDictionary+Extra.m:32"]
  S11 -->|calls| T11
  S12["method:FileFolderHandleTool::attributeOfItemAtPath:forKey:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:818"]
  T12["method:FileFolderHandleTool::attributesOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:824"]
  S12 -->|calls| T12
  S13["method:FileFolderHandleTool::attributesOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:824"]
  T13["method:FileFolderHandleTool::attributesOfItemAtPath:error:<br/>JobsByPods/FileFolderHandleTool@Pods/Core/FileFolderHandleTool/FileFolderHandleTool.m:824"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_user_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:277"]
  T14["method:JobsPodspecKitForFileFolderHandleTool::standard_user_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:266"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_pod_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:273"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForFileFolderHandleTool::apply_standard_user_target_xcconfig<br/>JobsByPods/FileFolderHandleTool@Pods/JobsPodspecKit.rb:277"]
  S16 -->|calls| T16
  S17["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  T17["method:UILabel::byAttributedString<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:318"]
  S17 -->|calls| T17
  S18["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  T18["method:UILabel::byText<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:327"]
  S18 -->|calls| T18
  S19["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  T19["method:FMBannerAdsModel::byLineBreakMode<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:893"]
  S19 -->|calls| T19
  S20["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  T20["method:UILabel::byMinimumScaleFactor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:478"]
  S20 -->|calls| T20
  S21["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  T21["method:UILabel::byAdjustsFontSizeToFitWidth<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:451"]
  S21 -->|calls| T21
  S22["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  T22["method:UILabel::byNumberOfLines<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:260"]
  S22 -->|calls| T22
  S23["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  T23["method:UITextView::byTextAlignment<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/UITextView/UITextView+Extra/UITextView+Extra.m:33"]
  S23 -->|calls| T23
  S24["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  T24["method:JobsTextView::byFont<br/>JobsByPods/JobsBaseUI@Pods/Core/UIBaseTextView/JobsTextView/JobsTextView.m:74"]
  S24 -->|calls| T24
  S25["function:JobsGKConfigureNavigationTitleLabel<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Core/UIViewController+GKCustomNavigationBar/UIViewController+GKCustomNavigationBar.m:17"]
  T25["method:UILabel::byTextCor<br/>JobsByPods/JobsOCDSL@Pods/Core/UIKit/UILabel+DSLs/UILabel+DSL/UILabel+DSL.m:379"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
