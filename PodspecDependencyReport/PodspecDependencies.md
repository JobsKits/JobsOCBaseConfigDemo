# Podspec 依赖分析报告
![Jobs出品，必属精品](https://picsum.photos/1500/400)
[toc]

## 🔥 <font id=前言>前言</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 此文件由脚本自动运行分析得出
- 分析目录：`/Users/jobs/Documents/Github/JobsOCBaseConfigDemo@ByPods`
- 生成时间：`2026-08-19 20:50:42`
- Podspec 数量：`122`
- 0 下游依赖 Pod 数量：`12`
- 全部依赖边数量：`872`
- 仓库内 Pod 依赖边数量：`711`
- Pod 间循环依赖数量：`0`
- 已过滤同 Pod 内部 subspec 依赖数量：`22`
- 外部依赖来源注释文件数量：`65`
- 已识别外部依赖来源链接数量：`78`
- DSL 执行式解析 Podspec 数量：`122`
- 静态兜底解析 Podspec 数量：`0`

> 更易读的动态关系图见：`PodspecDependencies_interactive.html`，其中默认保留 2D 关系图，并新增可拖动旋转的 3D 空间图。

## 一、总览 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| Pod | Podspec | 下游依赖数量 | 下游依赖 | 上游依赖数量 | 上游依赖方 |
|---|---|---:|---|---:|---|
| [**AFSecurityPolicyExtra**](#AFSecurityPolicyExtra) | `JobsByPods/AFSecurityPolicyExtra@Pods/AFSecurityPolicyExtra.podspec` | 3 | [AFNetworking](https://github.com/AFNetworking/AFNetworking), [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**BEMCheckBox**](#BEMCheckBox) | `JobsByPods/ManualByOCPods@Pods/BEMCheckBox/BEMCheckBox.podspec` | 0 |  | 0 |  |
| [**BRPickerView**](#BRPickerView) | `JobsByPods/ManualByOCPods@Pods/BRPickerView/BRPickerView.podspec` | 1 | [JobsModelDSL](#JobsModelDSL) | 3 | [**BRPickerViewExtra**](#BRPickerViewExtra), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView) |
| [**BRPickerViewExtra**](#BRPickerViewExtra) | `JobsByPods/BRPickerViewExtra@Pods/BRPickerViewExtra.podspec` | 7 | [BRPickerView](#BRPickerView), [JobsBlock](#JobsBlock), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDefs](#JobsOCDefs), [XYColorOC](#XYColorOC) | 2 | [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView) |
| [**DeviceKit**](#DeviceKit) | `JobsByPods/ManualByOCPods@Pods/DeviceKit/DeviceKit.podspec` | 0 |  | 1 | [**JobsByOCPods**](#JobsByOCPods) |
| [**FDFullscreenPopGesture**](#FDFullscreenPopGesture) | `JobsByPods/FDFullscreenPopGesture@Pods/FDFullscreenPopGesture.podspec` | 2 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 2 | [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCTools**](#JobsOCTools) |
| [**FMDatabaseExtra**](#FMDatabaseExtra) | `JobsByPods/FMDatabaseExtra@Pods/FMDatabaseExtra.podspec` | 4 | [FMDB](https://github.com/ccgus/fmdb), [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [JobsOCRuntimeKits](#JobsOCRuntimeKits) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**FSCalendar**](#FSCalendar) | `JobsByPods/ManualByOCPods@Pods/FSCalendar/FSCalendar.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDefs](#JobsOCDefs) | 4 | [**FSCalendarExtra**](#FSCalendarExtra), [**JobsByOCPods**](#JobsByOCPods), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCTools**](#JobsOCTools) |
| [**FSCalendarExtra**](#FSCalendarExtra) | `JobsByPods/FSCalendarExtra@Pods/FSCalendarExtra.podspec` | 3 | [FSCalendar](#FSCalendar), [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**FileFolderHandleTool**](#FileFolderHandleTool) | `JobsByPods/FileFolderHandleTool@Pods/FileFolderHandleTool.podspec` | 6 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDefs](#JobsOCDefs), [TXFileOperation](https://github.com/xtzPioneer/TXFileOperation) | 0 |  |
| [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra) | `JobsByPods/GKCustomNavigationBarExtra@Pods/GKCustomNavigationBarExtra.podspec` | 21 | [GKNavigationBar](https://github.com/QuintGao/GKNavigationBar), [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsDeviceInfo](#JobsDeviceInfo), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsRichTextUtils](#JobsRichTextUtils), [JobsStringUtils](#JobsStringUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [MJRefreshExtra](#MJRefreshExtra), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [TABAnimated](#TABAnimated), [XYColorOC](#XYColorOC), [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh) | 2 | [**JobsByOCPods**](#JobsByOCPods), [**JobsOCTools**](#JobsOCTools) |
| [**GTCaptcha4**](#GTCaptcha4) | `JobsByPods/ManualByOCPods@Pods/GTCaptcha4/GTCaptcha4.podspec` | 0 |  | 1 | [**JobsModel**](#JobsModel) |
| [**HTMLDocumentExtra**](#HTMLDocumentExtra) | `JobsByPods/HTMLDocumentExtra@Pods/HTMLDocumentExtra.podspec` | 3 | [HTMLReader](https://github.com/nolanw/HTMLReader), [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**HXPhotoManagerExtra**](#HXPhotoManagerExtra) | `JobsByPods/HXPhotoManagerExtra@Pods/HXPhotoManagerExtra.podspec` | 3 | [HXPhotoPickerObjC](https://github.com/SilenceLove/HXPhotoPickerObjC), [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**HXPhotoViewExtra**](#HXPhotoViewExtra) | `JobsByPods/HXPhotoViewExtra@Pods/HXPhotoViewExtra.podspec` | 3 | [HXPhotoPickerObjC](https://github.com/SilenceLove/HXPhotoPickerObjC), [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**IQKeyboardManagerExtra**](#IQKeyboardManagerExtra) | `JobsByPods/IQKeyboardManagerExtra@Pods/IQKeyboardManagerExtra.podspec` | 3 | [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager), [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**JXCategoryViewExtra**](#JXCategoryViewExtra) | `JobsByPods/JXCategoryViewExtra@Pods/JXCategoryViewExtra.podspec` | 6 | [JXCategoryView](https://github.com/pujiaxin33/JXCategoryView), [JXPagingView](https://github.com/pujiaxin33/JXPagingView), [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**JobsAPIs**](#JobsAPIs) | `JobsByPods/JobsAPIs@Pods/JobsAPIs.podspec` | 15 | [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsDeviceInfo](#JobsDeviceInfo), [JobsLanMgr](#JobsLanMgr), [JobsModelDSL](#JobsModelDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsStringUtils](#JobsStringUtils), [JobsTimeUtils](#JobsTimeUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [TXFileOperation](https://github.com/xtzPioneer/TXFileOperation), [This](#This), [WHToastExtra](#WHToastExtra), [YTKNetwork](https://github.com/yuantiku/YTKNetwork), [YTKNetworkExtra](#YTKNetworkExtra) | 1 | [**JobsByOCPods**](#JobsByOCPods) |
| [**JobsAppDoor**](#JobsAppDoor) | `JobsByPods/JobsAppDoor@Pods/JobsAppDoor.podspec` | 24 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsCountdownBtn](#JobsCountdownBtn), [JobsDeviceInfo](#JobsDeviceInfo), [JobsFuseAnimation](#JobsFuseAnimation), [JobsHotLabel](#JobsHotLabel), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModel](#JobsModel), [JobsModelDSL](#JobsModelDSL), [JobsOCCountryCodeCtrl](#JobsOCCountryCodeCtrl), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCGraphicCaptcha](#JobsOCGraphicCaptcha), [JobsOCKeyboardMgr](#JobsOCKeyboardMgr), [JobsOCProtocols](#JobsOCProtocols), [JobsOCTools](#JobsOCTools), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [UIBaseTextFieldDSL](#UIBaseTextFieldDSL), [XYColorOC](#XYColorOC), [ZFPlayer](https://github.com/renzifeng/ZFPlayer), [ZFPlayerExtra](#ZFPlayerExtra) | 0 |  |
| [**JobsAppIconRibbon**](#JobsAppIconRibbon) | `JobsByPods/JobsAppIconRibbon@Pods/JobsAppIconRibbon.podspec` | 0 |  | 0 |  |
| [**JobsAppTools**](#JobsAppTools) | `JobsByPods/JobsAppTools@Pods/JobsAppTools.podspec` | 11 | [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsStringUtils](#JobsStringUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [XYColorOC](#XYColorOC) | 8 | [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCTools**](#JobsOCTools) |
| [**JobsBasePopupView**](#JobsBasePopupView) | `JobsByPods/JobsBasePopupView@Pods/JobsBasePopupView.podspec` | 14 | [JobsAppTools](#JobsAppTools), [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsDeviceInfo](#JobsDeviceInfo), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsRichTextUtils](#JobsRichTextUtils), [JobsStringUtils](#JobsStringUtils), [Masonry](https://github.com/SnapKit/Masonry), [WHToastExtra](#WHToastExtra) | 1 | [**JobsBaseUI**](#JobsBaseUI) |
| [**JobsBaseUI**](#JobsBaseUI) | `JobsByPods/JobsBaseUI@Pods/JobsBaseUI.podspec` | 31 | [GKNavigationBar](https://github.com/QuintGao/GKNavigationBar), [JobsAppTools](#JobsAppTools), [JobsBasePopupView](#JobsBasePopupView), [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsDeviceInfo](#JobsDeviceInfo), [JobsLanMgr](#JobsLanMgr), [JobsLoadingImage](#JobsLoadingImage), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsNavBar](#JobsNavBar), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsRandomUtils](#JobsRandomUtils), [JobsRichTextUtils](#JobsRichTextUtils), [JobsStringUtils](#JobsStringUtils), [JobsTimeUtils](#JobsTimeUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [MJRefreshExtra](#MJRefreshExtra), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [SZTextViewExtra](#SZTextViewExtra), [TABAnimated](#TABAnimated), [This](#This), [WHToastExtra](#WHToastExtra), [XYColorOC](#XYColorOC), [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh), [lottie-ios](https://github.com/airbnb/lottie-ios) | 24 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAppDoor**](#JobsAppDoor), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsGestureLock**](#JobsGestureLock), [**JobsHotLabel**](#JobsHotLabel), [**JobsImageNumberView**](#JobsImageNumberView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCComment**](#JobsOCComment), [**JobsOCNumberStepper**](#JobsOCNumberStepper), [**JobsOCOpen**](#JobsOCOpen), [**JobsOCSearcher**](#JobsOCSearcher), [**JobsOCTools**](#JobsOCTools), [**JobsSuspend**](#JobsSuspend), [**JobsTabBarCtrl**](#JobsTabBarCtrl), [**JobsUploadingProgressView**](#JobsUploadingProgressView), [**JobsWallet**](#JobsWallet), [**UIBaseTextFieldDSL**](#UIBaseTextFieldDSL), [**ZFPlayerExtra**](#ZFPlayerExtra), [**ZMJCellExtra**](#ZMJCellExtra) |
| [**JobsBioKit**](#JobsBioKit) | `JobsByPods/JobsBioKit@Pods/JobsBioKit.podspec` | 2 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsBitsMonitor**](#JobsBitsMonitor) | `JobsByPods/JobsBitsMonitor@Pods/JobsBitsMonitor.podspec` | 9 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsLanMgr](#JobsLanMgr), [JobsModelDSL](#JobsModelDSL), [JobsNetWorkTools](#JobsNetWorkTools), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsSuspend](#JobsSuspend), [ZWPullMenuView](#ZWPullMenuView) | 0 |  |
| [**JobsBlock**](#JobsBlock) | `JobsByPods/JobsBlock@Pods/JobsBlock.podspec` | 1 | [SDWebImage](https://github.com/SDWebImage/SDWebImage) | 105 | [**AFSecurityPolicyExtra**](#AFSecurityPolicyExtra), [**BRPickerViewExtra**](#BRPickerViewExtra), [**FDFullscreenPopGesture**](#FDFullscreenPopGesture), [**FMDatabaseExtra**](#FMDatabaseExtra), [**FSCalendar**](#FSCalendar), [**FSCalendarExtra**](#FSCalendarExtra), [**FileFolderHandleTool**](#FileFolderHandleTool), [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**HTMLDocumentExtra**](#HTMLDocumentExtra), [**HXPhotoManagerExtra**](#HXPhotoManagerExtra), [**HXPhotoViewExtra**](#HXPhotoViewExtra), [**IQKeyboardManagerExtra**](#IQKeyboardManagerExtra), [**JXCategoryViewExtra**](#JXCategoryViewExtra), [**JobsAPIs**](#JobsAPIs), [**JobsAppDoor**](#JobsAppDoor), [**JobsAppTools**](#JobsAppTools), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsBioKit**](#JobsBioKit), [**JobsBitsMonitor**](#JobsBitsMonitor), [**JobsBluetooth**](#JobsBluetooth), [**JobsByOCPods**](#JobsByOCPods), [**JobsCallBackBlockDSL**](#JobsCallBackBlockDSL), [**JobsClass**](#JobsClass), [**JobsClockView**](#JobsClockView), [**JobsCountdownBtn**](#JobsCountdownBtn), [**JobsCryptography**](#JobsCryptography), [**JobsCustomView**](#JobsCustomView), [**JobsDebug**](#JobsDebug), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsFuseAnimation**](#JobsFuseAnimation), [**JobsGestureLock**](#JobsGestureLock), [**JobsHotLabel**](#JobsHotLabel), [**JobsIconfont**](#JobsIconfont), [**JobsImageNumberView**](#JobsImageNumberView), [**JobsImageRotation**](#JobsImageRotation), [**JobsLanMgr**](#JobsLanMgr), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsLoadingImage**](#JobsLoadingImage), [**JobsLocker**](#JobsLocker), [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain), [**JobsMakes**](#JobsMakes), [**JobsMarqueeView**](#JobsMarqueeView), [**JobsMenuView**](#JobsMenuView), [**JobsModel**](#JobsModel), [**JobsModelDSL**](#JobsModelDSL), [**JobsMonitorNetwoking**](#JobsMonitorNetwoking), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsNetWorkTools**](#JobsNetWorkTools), [**JobsOCAudioRecorder**](#JobsOCAudioRecorder), [**JobsOCCalendar**](#JobsOCCalendar), [**JobsOCComment**](#JobsOCComment), [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCDefs**](#JobsOCDefs), [**JobsOCExcel**](#JobsOCExcel), [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha), [**JobsOCKeyboardMgr**](#JobsOCKeyboardMgr), [**JobsOCMarkdown**](#JobsOCMarkdown), [**JobsOCNumberStepper**](#JobsOCNumberStepper), [**JobsOCOpen**](#JobsOCOpen), [**JobsOCPatch**](#JobsOCPatch), [**JobsOCProtocols**](#JobsOCProtocols), [**JobsOCRefresher**](#JobsOCRefresher), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits), [**JobsOCSearcher**](#JobsOCSearcher), [**JobsOCSkeletonView**](#JobsOCSkeletonView), [**JobsOCSnowflake**](#JobsOCSnowflake), [**JobsOCSplash**](#JobsOCSplash), [**JobsOCTimer**](#JobsOCTimer), [**JobsOCTimerMgr**](#JobsOCTimerMgr), [**JobsOCTools**](#JobsOCTools), [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling), [**JobsOCVideoRecorder**](#JobsOCVideoRecorder), [**JobsOCWebSocket**](#JobsOCWebSocket), [**JobsPresentTransitionMgr**](#JobsPresentTransitionMgr), [**JobsProgressBar**](#JobsProgressBar), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsScreenCapture**](#JobsScreenCapture), [**JobsSuspend**](#JobsSuspend), [**JobsTabBarCtrl**](#JobsTabBarCtrl), [**JobsTimeUtils**](#JobsTimeUtils), [**JobsUploadingProgressView**](#JobsUploadingProgressView), [**JobsViewNavigator**](#JobsViewNavigator), [**JobsViewPush**](#JobsViewPush), [**JobsWallet**](#JobsWallet), [**LMJDropdownMenuExtra**](#LMJDropdownMenuExtra), [**MGSwipeTableCellExtra**](#MGSwipeTableCellExtra), [**MJRefreshExtra**](#MJRefreshExtra), [**ReachabilityExtra**](#ReachabilityExtra), [**SRWebSocketExtra**](#SRWebSocketExtra), [**SYSAlertControllerExtra**](#SYSAlertControllerExtra), [**SZTextViewExtra**](#SZTextViewExtra), [**TFPopup**](#TFPopup), [**TFPopupExtra**](#TFPopupExtra), [**TKPermissionKit**](#TKPermissionKit), [**UIBaseTextFieldDSL**](#UIBaseTextFieldDSL), [**WHToastExtra**](#WHToastExtra), [**WMZCode**](#WMZCode), [**YTKNetworkExtra**](#YTKNetworkExtra), [**ZFPlayerExtra**](#ZFPlayerExtra), [**ZMJCellExtra**](#ZMJCellExtra) |
| [**JobsBluetooth**](#JobsBluetooth) | `JobsByPods/JobsBluetooth@Pods/JobsBluetooth.podspec` | 2 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsByOCPods**](#JobsByOCPods) | `JobsByPods/JobsByOCPods@Pods/JobsByOCPods.podspec` | 61 | [BRPickerView](#BRPickerView), [BRPickerViewExtra](#BRPickerViewExtra), [DeviceKit](#DeviceKit), [FMDB](https://github.com/ccgus/fmdb), [FSCalendar](#FSCalendar), [GKCustomNavigationBarExtra](#GKCustomNavigationBarExtra), [GKNavigationBar](https://github.com/QuintGao/GKNavigationBar), [GKPhotoBrowser](https://github.com/QuintGao/GKPhotoBrowser), [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager), [JPImageresizerView](https://github.com/Rogue24/JPImageresizerView), [JXCategoryView](https://github.com/pujiaxin33/JXCategoryView), [JXPagingView](https://github.com/pujiaxin33/JXPagingView), [JobsAPIs](#JobsAPIs), [JobsAppTools](#JobsAppTools), [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsDebug](#JobsDebug), [JobsDeviceInfo](#JobsDeviceInfo), [JobsDropDownListView](#JobsDropDownListView), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsNavigationTransitionMgr](#JobsNavigationTransitionMgr), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsOCSnowflake](#JobsOCSnowflake), [JobsOCTimer](#JobsOCTimer), [JobsRandomUtils](#JobsRandomUtils), [JobsRichTextUtils](#JobsRichTextUtils), [JobsStringUtils](#JobsStringUtils), [JobsTimeUtils](#JobsTimeUtils), [JobsViewNavigator](#JobsViewNavigator), [MGSwipeTableCell](https://github.com/MortimerGoro/MGSwipeTableCell), [MJExtension](https://github.com/CoderMJLee/MJExtension), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [Masonry](https://github.com/SnapKit/Masonry), [PPBadgeView](https://github.com/jkpang/PPBadgeView), [Reachability](https://github.com/tonymillion/Reachability), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [SDWebImage](https://github.com/SDWebImage/SDWebImage), [SZTextView](https://github.com/glaszig/SZTextView), [SocketRocket](https://github.com/facebookincubator/SocketRocket), [TABAnimated](#TABAnimated), [TFPopup](#TFPopup), [TXFileOperation](https://github.com/xtzPioneer/TXFileOperation), [This](#This), [UITextView+Placeholder](https://github.com/devxoul/UITextView-Placeholder), [WHToast](https://github.com/remember17/WHToast), [WHToastExtra](#WHToastExtra), [XYColorOC](#XYColorOC), [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh), [YTKNetworkExtra](#YTKNetworkExtra), YYImage, [ZBNetworking](#ZBNetworking), [ZFPlayer](https://github.com/renzifeng/ZFPlayer), [ZFPlayerExtra](#ZFPlayerExtra), [ZMJGanttChart](https://github.com/keshiim/ZMJGanttChart), [lottie-ios](https://github.com/airbnb/lottie-ios) | 19 | [**FileFolderHandleTool**](#FileFolderHandleTool), [**JobsAppDoor**](#JobsAppDoor), [**JobsBitsMonitor**](#JobsBitsMonitor), [**JobsCountdownBtn**](#JobsCountdownBtn), [**JobsCryptography**](#JobsCryptography), [**JobsHotLabel**](#JobsHotLabel), [**JobsImageNumberView**](#JobsImageNumberView), [**JobsMarqueeView**](#JobsMarqueeView), [**JobsMenuView**](#JobsMenuView), [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl), [**JobsOCSplash**](#JobsOCSplash), [**JobsOCTools**](#JobsOCTools), [**JobsOCVideoRecorder**](#JobsOCVideoRecorder), [**JobsTabBarCtrl**](#JobsTabBarCtrl), [**JobsUploadingProgressView**](#JobsUploadingProgressView), [**TFPopupExtra**](#TFPopupExtra), [**TKPermissionKit**](#TKPermissionKit), [**WMZCode**](#WMZCode), [**ZWPullMenuView**](#ZWPullMenuView) |
| [**JobsCallBackBlockDSL**](#JobsCallBackBlockDSL) | `JobsByPods/JobsCallBackBlockDSL@Pods/JobsCallBackBlockDSL.podspec` | 2 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsClass**](#JobsClass) | `JobsByPods/JobsClass@Pods/JobsClass.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [MJExtension](https://github.com/CoderMJLee/MJExtension) | 15 | [**JobsAPIs**](#JobsAPIs), [**JobsAppTools**](#JobsAppTools), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsModel**](#JobsModel), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsTimeUtils**](#JobsTimeUtils), [**WHToastExtra**](#WHToastExtra) |
| [**JobsClockView**](#JobsClockView) | `JobsByPods/JobsClockView@Pods/JobsClockView.podspec` | 6 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCTimer](#JobsOCTimer) | 0 |  |
| [**JobsCountdownBtn**](#JobsCountdownBtn) | `JobsByPods/JobsCountdownBtn@Pods/JobsCountdownBtn.podspec` | 5 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsLanMgr](#JobsLanMgr), [JobsOCDefs](#JobsOCDefs), [JobsOCTimer](#JobsOCTimer) | 2 | [**JobsAppDoor**](#JobsAppDoor), [**JobsOCTools**](#JobsOCTools) |
| [**JobsCryptography**](#JobsCryptography) | `JobsByPods/JobsCryptography@Pods/JobsCryptography.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsMakes](#JobsMakes), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**JobsCustomView**](#JobsCustomView) | `JobsByPods/JobsCustomView@Pods/JobsCustomView.podspec` | 25 | [BRPickerView](#BRPickerView), [BRPickerViewExtra](#BRPickerViewExtra), [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsStringUtils](#JobsStringUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [MJRefreshExtra](#MJRefreshExtra), [Masonry](https://github.com/SnapKit/Masonry), [Reachability](https://github.com/tonymillion/Reachability), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [TABAnimated](#TABAnimated), [TXFileOperation](https://github.com/xtzPioneer/TXFileOperation), [This](#This), [XYColorOC](#XYColorOC), [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh), [YTKNetworkExtra](#YTKNetworkExtra) | 1 | [**TFPopupExtra**](#TFPopupExtra) |
| [**JobsDebug**](#JobsDebug) | `JobsByPods/JobsDebug@Pods/JobsDebug.podspec` | 6 | [JobsBlock](#JobsBlock), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsStringUtils](#JobsStringUtils) | 2 | [**JobsByOCPods**](#JobsByOCPods), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr) |
| [**JobsDeviceInfo**](#JobsDeviceInfo) | `JobsByPods/JobsDeviceInfo@Pods/JobsDeviceInfo.podspec` | 16 | [AFNetworking](https://github.com/AFNetworking/AFNetworking), [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsRichTextUtils](#JobsRichTextUtils), [JobsStringUtils](#JobsStringUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [TXFileOperation](https://github.com/xtzPioneer/TXFileOperation), [YTKNetwork](https://github.com/yuantiku/YTKNetwork) | 12 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAPIs**](#JobsAPIs), [**JobsAppDoor**](#JobsAppDoor), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCTools**](#JobsOCTools), [**JobsSuspend**](#JobsSuspend), [**MJRefreshExtra**](#MJRefreshExtra) |
| [**JobsDropDownListView**](#JobsDropDownListView) | `JobsByPods/JobsDropDownListView@Pods/JobsDropDownListView.podspec` | 12 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModel](#JobsModel), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [MJRefresh](https://github.com/CoderMJLee/MJRefresh) | 1 | [**JobsByOCPods**](#JobsByOCPods) |
| [**JobsFiltrationView**](#JobsFiltrationView) | `JobsByPods/JobsFiltrationView@Pods/JobsFiltrationView.podspec` | 12 | [JobsAppTools](#JobsAppTools), [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsHotLabel](#JobsHotLabel), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [Masonry](https://github.com/SnapKit/Masonry), [XYColorOC](#XYColorOC) | 1 | [**TFPopupExtra**](#TFPopupExtra) |
| [**JobsFuseAnimation**](#JobsFuseAnimation) | `JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.podspec` | 6 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCTimer](#JobsOCTimer), [lottie-ios](https://github.com/airbnb/lottie-ios) | 3 | [**JobsAppDoor**](#JobsAppDoor), [**JobsOCRefresher**](#JobsOCRefresher), [**JobsOCTools**](#JobsOCTools) |
| [**JobsGestureLock**](#JobsGestureLock) | `JobsByPods/JobsGestureLock@Pods/JobsGestureLock.podspec` | 5 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsGetWindow**](#JobsGetWindow) | `JobsByPods/JobsGetWindow@Pods/JobsGetWindow.podspec` | 0 |  | 2 | [**JobsOCDefs**](#JobsOCDefs), [**JobsOCOpen**](#JobsOCOpen) |
| [**JobsHotLabel**](#JobsHotLabel) | `JobsByPods/JobsHotLabel@Pods/JobsHotLabel.podspec` | 8 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols) | 3 | [**JobsAppDoor**](#JobsAppDoor), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsOCTools**](#JobsOCTools) |
| [**JobsIconfont**](#JobsIconfont) | `JobsByPods/JobsIconfont@Pods/JobsIconfont.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [SDWebImage](https://github.com/SDWebImage/SDWebImage) | 0 |  |
| [**JobsImageNumberView**](#JobsImageNumberView) | `JobsByPods/JobsImageNumberView@Pods/JobsImageNumberView.podspec` | 7 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols) | 0 |  |
| [**JobsImageRotation**](#JobsImageRotation) | `JobsByPods/JobsImageRotation@Pods/JobsImageRotation.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCTimer](#JobsOCTimer) | 0 |  |
| [**JobsLanMgr**](#JobsLanMgr) | `JobsByPods/JobsLanMgr@Pods/JobsLanMgr.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [JobsStringUtils](#JobsStringUtils), [SDWebImage](https://github.com/SDWebImage/SDWebImage) | 32 | [**BRPickerViewExtra**](#BRPickerViewExtra), [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAPIs**](#JobsAPIs), [**JobsAppDoor**](#JobsAppDoor), [**JobsAppTools**](#JobsAppTools), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsBitsMonitor**](#JobsBitsMonitor), [**JobsByOCPods**](#JobsByOCPods), [**JobsCountdownBtn**](#JobsCountdownBtn), [**JobsCustomView**](#JobsCustomView), [**JobsDebug**](#JobsDebug), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsModel**](#JobsModel), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl), [**JobsOCRefresher**](#JobsOCRefresher), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits), [**JobsOCTimer**](#JobsOCTimer), [**JobsOCTools**](#JobsOCTools), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsSuspend**](#JobsSuspend), [**JobsUploadingProgressView**](#JobsUploadingProgressView), [**MJRefreshExtra**](#MJRefreshExtra), [**SYSAlertControllerExtra**](#SYSAlertControllerExtra), [**TKPermissionKit**](#TKPermissionKit), [**WHToastExtra**](#WHToastExtra), [**YTKNetworkExtra**](#YTKNetworkExtra) |
| [**JobsLinkageMenuView**](#JobsLinkageMenuView) | `JobsByPods/JobsLinkageMenuView@Pods/JobsLinkageMenuView.podspec` | 25 | [JobsAppTools](#JobsAppTools), [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsDeviceInfo](#JobsDeviceInfo), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsRichTextUtils](#JobsRichTextUtils), [JobsStringUtils](#JobsStringUtils), [JobsTimeUtils](#JobsTimeUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [MJRefreshExtra](#MJRefreshExtra), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [TABAnimated](#TABAnimated), [TXFileOperation](https://github.com/xtzPioneer/TXFileOperation), [XYColorOC](#XYColorOC), [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh), [YTKNetworkExtra](#YTKNetworkExtra) | 1 | [**JobsMenuView**](#JobsMenuView) |
| [**JobsLoadingImage**](#JobsLoadingImage) | `JobsByPods/JobsLoadingImage@Pods/JobsLoadingImage.podspec` | 1 | [JobsBlock](#JobsBlock) | 6 | [**JobsBaseUI**](#JobsBaseUI), [**JobsModel**](#JobsModel), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCTools**](#JobsOCTools), [**JobsSuspend**](#JobsSuspend), [**MJRefreshExtra**](#MJRefreshExtra) |
| [**JobsLocker**](#JobsLocker) | `JobsByPods/JobsLocker@Pods/JobsLocker.podspec` | 2 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain) | `JobsByPods/JobsLuckyEnvelopeRain@Pods/JobsLuckyEnvelopeRain.podspec` | 5 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCTimer](#JobsOCTimer) | 0 |  |
| [**JobsMakes**](#JobsMakes) | `JobsByPods/JobsMakes@Pods/JobsMakes.podspec` | 2 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 54 | [**BRPickerViewExtra**](#BRPickerViewExtra), [**FSCalendar**](#FSCalendar), [**FileFolderHandleTool**](#FileFolderHandleTool), [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JXCategoryViewExtra**](#JXCategoryViewExtra), [**JobsAppDoor**](#JobsAppDoor), [**JobsAppTools**](#JobsAppTools), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsClockView**](#JobsClockView), [**JobsCryptography**](#JobsCryptography), [**JobsCustomView**](#JobsCustomView), [**JobsDebug**](#JobsDebug), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsFuseAnimation**](#JobsFuseAnimation), [**JobsGestureLock**](#JobsGestureLock), [**JobsHotLabel**](#JobsHotLabel), [**JobsImageNumberView**](#JobsImageNumberView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsMenuView**](#JobsMenuView), [**JobsModel**](#JobsModel), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCCalendar**](#JobsOCCalendar), [**JobsOCComment**](#JobsOCComment), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCExcel**](#JobsOCExcel), [**JobsOCMarkdown**](#JobsOCMarkdown), [**JobsOCNumberStepper**](#JobsOCNumberStepper), [**JobsOCRefresher**](#JobsOCRefresher), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits), [**JobsOCSearcher**](#JobsOCSearcher), [**JobsOCSplash**](#JobsOCSplash), [**JobsOCTimer**](#JobsOCTimer), [**JobsOCTimerMgr**](#JobsOCTimerMgr), [**JobsOCTools**](#JobsOCTools), [**JobsOCVideoRecorder**](#JobsOCVideoRecorder), [**JobsPresentTransitionMgr**](#JobsPresentTransitionMgr), [**JobsProgressBar**](#JobsProgressBar), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsScreenCapture**](#JobsScreenCapture), [**JobsTabBarCtrl**](#JobsTabBarCtrl), [**JobsTimeUtils**](#JobsTimeUtils), [**JobsUploadingProgressView**](#JobsUploadingProgressView), [**JobsViewNavigator**](#JobsViewNavigator), [**JobsWallet**](#JobsWallet), [**MJRefreshExtra**](#MJRefreshExtra), [**WHToastExtra**](#WHToastExtra), [**WMZCode**](#WMZCode), [**YTKNetworkExtra**](#YTKNetworkExtra), [**ZMJCellExtra**](#ZMJCellExtra) |
| [**JobsMarqueeView**](#JobsMarqueeView) | `JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.podspec` | 5 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsOCDefs](#JobsOCDefs), [JobsOCTimerMgr](#JobsOCTimerMgr), [Masonry](https://github.com/SnapKit/Masonry) | 0 |  |
| [**JobsMenuView**](#JobsMenuView) | `JobsByPods/JobsMenuView@Pods/JobsMenuView.podspec` | 6 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsLinkageMenuView](#JobsLinkageMenuView), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsModel**](#JobsModel) | `JobsByPods/JobsModel@Pods/JobsModel.podspec` | 16 | [GTCaptcha4](#GTCaptcha4), [HXPhotoPickerObjC](https://github.com/SilenceLove/HXPhotoPickerObjC), [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsLanMgr](#JobsLanMgr), [JobsLoadingImage](#JobsLoadingImage), [JobsMakes](#JobsMakes), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsStringUtils](#JobsStringUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [SDWebImage](https://github.com/SDWebImage/SDWebImage), [SPAlertController](https://github.com/SPStore/SPAlertController), [XYColorOC](#XYColorOC) | 5 | [**JobsAppDoor**](#JobsAppDoor), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsModelDSL**](#JobsModelDSL), [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha), [**JobsWallet**](#JobsWallet) |
| [**JobsModelDSL**](#JobsModelDSL) | `JobsByPods/JobsModelDSL@Pods/JobsModelDSL.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsModel](#JobsModel), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols) | 32 | [**BRPickerView**](#BRPickerView), [**BRPickerViewExtra**](#BRPickerViewExtra), [**FileFolderHandleTool**](#FileFolderHandleTool), [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAPIs**](#JobsAPIs), [**JobsAppDoor**](#JobsAppDoor), [**JobsAppTools**](#JobsAppTools), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsBitsMonitor**](#JobsBitsMonitor), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsHotLabel**](#JobsHotLabel), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsNetWorkTools**](#JobsNetWorkTools), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits), [**JobsOCTools**](#JobsOCTools), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsSuspend**](#JobsSuspend), [**JobsTimeUtils**](#JobsTimeUtils), [**MJRefreshExtra**](#MJRefreshExtra), [**SYSAlertControllerExtra**](#SYSAlertControllerExtra), [**TFPopupExtra**](#TFPopupExtra), [**WHToastExtra**](#WHToastExtra), [**YTKNetworkExtra**](#YTKNetworkExtra) |
| [**JobsMonitorNetwoking**](#JobsMonitorNetwoking) | `JobsByPods/JobsMonitorNetwoking@Pods/JobsMonitorNetwoking.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsSuspend](#JobsSuspend) | 0 |  |
| [**JobsNavBar**](#JobsNavBar) | `JobsByPods/JobsNavBar@Pods/JobsNavBar.podspec` | 22 | [JobsAppTools](#JobsAppTools), [JobsBlock](#JobsBlock), [JobsDeviceInfo](#JobsDeviceInfo), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsRichTextUtils](#JobsRichTextUtils), [JobsStringUtils](#JobsStringUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [MJRefreshExtra](#MJRefreshExtra), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [TABAnimated](#TABAnimated), [WHToastExtra](#WHToastExtra), [XYColorOC](#XYColorOC), [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh), [lottie-ios](https://github.com/airbnb/lottie-ios) | 2 | [**JobsBaseUI**](#JobsBaseUI), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr) |
| [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr) | `JobsByPods/JobsNavigationTransitionMgr@Pods/JobsNavigationTransitionMgr.podspec` | 35 | [FDFullscreenPopGesture](#FDFullscreenPopGesture), [GKNavigationBar](https://github.com/QuintGao/GKNavigationBar), [GKPhotoBrowser](https://github.com/QuintGao/GKPhotoBrowser), [JobsAppTools](#JobsAppTools), [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsDebug](#JobsDebug), [JobsDeviceInfo](#JobsDeviceInfo), [JobsLanMgr](#JobsLanMgr), [JobsLoadingImage](#JobsLoadingImage), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsNavBar](#JobsNavBar), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsOCSnowflake](#JobsOCSnowflake), [JobsRichTextUtils](#JobsRichTextUtils), [JobsStringUtils](#JobsStringUtils), [JobsTimeUtils](#JobsTimeUtils), [JobsViewNavigator](#JobsViewNavigator), [MJExtension](https://github.com/CoderMJLee/MJExtension), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [MJRefreshExtra](#MJRefreshExtra), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [SDWebImage](https://github.com/SDWebImage/SDWebImage), [TABAnimated](#TABAnimated), [TFPopup](#TFPopup), [WHToast](https://github.com/remember17/WHToast), [WHToastExtra](#WHToastExtra), [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh), YYImage | 1 | [**JobsByOCPods**](#JobsByOCPods) |
| [**JobsNetWorkTools**](#JobsNetWorkTools) | `JobsByPods/JobsNetWorkTools@Pods/JobsNetWorkTools.podspec` | 5 | [JobsBlock](#JobsBlock), [JobsModelDSL](#JobsModelDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCTimer](#JobsOCTimer) | 1 | [**JobsBitsMonitor**](#JobsBitsMonitor) |
| [**JobsOCAudioRecorder**](#JobsOCAudioRecorder) | `JobsByPods/JobsOCAudioRecorder@Pods/JobsOCAudioRecorder.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCTimer](#JobsOCTimer) | 0 |  |
| [**JobsOCCalendar**](#JobsOCCalendar) | `JobsByPods/JobsOCCalendar@Pods/JobsOCCalendar.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsOCComment**](#JobsOCComment) | `JobsByPods/JobsOCComment@Pods/JobsOCComment.podspec` | 7 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCRefresher](#JobsOCRefresher), [Masonry](https://github.com/SnapKit/Masonry) | 0 |  |
| [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl) | `JobsByPods/JobsOCCountryCodeCtrl@Pods/JobsOCCountryCodeCtrl.podspec` | 6 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsLanMgr](#JobsLanMgr), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [XYColorOC](#XYColorOC) | 2 | [**JobsAppDoor**](#JobsAppDoor), [**JobsOCTools**](#JobsOCTools) |
| [**JobsOCDSL**](#JobsOCDSL) | `JobsByPods/JobsOCDSL@Pods/JobsOCDSL.podspec` | 17 | [FSCalendar](#FSCalendar), [GKNavigationBar](https://github.com/QuintGao/GKNavigationBar), [HXPhotoPickerObjC](https://github.com/SilenceLove/HXPhotoPickerObjC), [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsOCTimer](#JobsOCTimer), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [SDWebImage](https://github.com/SDWebImage/SDWebImage), [Texture](#Texture), [YTKNetwork](https://github.com/yuantiku/YTKNetwork), [ZFPlayer](https://github.com/renzifeng/ZFPlayer) | 59 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JXCategoryViewExtra**](#JXCategoryViewExtra), [**JobsAppDoor**](#JobsAppDoor), [**JobsAppTools**](#JobsAppTools), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsBitsMonitor**](#JobsBitsMonitor), [**JobsByOCPods**](#JobsByOCPods), [**JobsClockView**](#JobsClockView), [**JobsCustomView**](#JobsCustomView), [**JobsDebug**](#JobsDebug), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsFuseAnimation**](#JobsFuseAnimation), [**JobsGestureLock**](#JobsGestureLock), [**JobsHotLabel**](#JobsHotLabel), [**JobsImageNumberView**](#JobsImageNumberView), [**JobsImageRotation**](#JobsImageRotation), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain), [**JobsMenuView**](#JobsMenuView), [**JobsMonitorNetwoking**](#JobsMonitorNetwoking), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCAudioRecorder**](#JobsOCAudioRecorder), [**JobsOCCalendar**](#JobsOCCalendar), [**JobsOCComment**](#JobsOCComment), [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl), [**JobsOCExcel**](#JobsOCExcel), [**JobsOCKeyboardMgr**](#JobsOCKeyboardMgr), [**JobsOCMarkdown**](#JobsOCMarkdown), [**JobsOCNumberStepper**](#JobsOCNumberStepper), [**JobsOCOpen**](#JobsOCOpen), [**JobsOCRefresher**](#JobsOCRefresher), [**JobsOCSearcher**](#JobsOCSearcher), [**JobsOCSkeletonView**](#JobsOCSkeletonView), [**JobsOCSplash**](#JobsOCSplash), [**JobsOCTools**](#JobsOCTools), [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling), [**JobsOCVideoRecorder**](#JobsOCVideoRecorder), [**JobsPresentTransitionMgr**](#JobsPresentTransitionMgr), [**JobsProgressBar**](#JobsProgressBar), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsScreenCapture**](#JobsScreenCapture), [**JobsSuspend**](#JobsSuspend), [**JobsTabBarCtrl**](#JobsTabBarCtrl), [**JobsTimeUtils**](#JobsTimeUtils), [**JobsUploadingProgressView**](#JobsUploadingProgressView), [**JobsViewNavigator**](#JobsViewNavigator), [**JobsViewPush**](#JobsViewPush), [**JobsWallet**](#JobsWallet), [**LMJDropdownMenuExtra**](#LMJDropdownMenuExtra), [**MJRefreshExtra**](#MJRefreshExtra), [**SYSAlertControllerExtra**](#SYSAlertControllerExtra), [**TFPopupExtra**](#TFPopupExtra), [**YTKNetworkExtra**](#YTKNetworkExtra), [**ZFPlayerExtra**](#ZFPlayerExtra), [**ZMJCellExtra**](#ZMJCellExtra) |
| [**JobsOCDefs**](#JobsOCDefs) | `JobsByPods/JobsOCDefs@Pods/JobsOCDefs.podspec` | 6 | [GKNavigationBar](https://github.com/QuintGao/GKNavigationBar), [JobsBlock](#JobsBlock), [JobsGetWindow](#JobsGetWindow), [JobsStringUtils](#JobsStringUtils), [XYColorOC](#XYColorOC), [YTKNetwork](https://github.com/yuantiku/YTKNetwork) | 103 | [**AFSecurityPolicyExtra**](#AFSecurityPolicyExtra), [**BRPickerViewExtra**](#BRPickerViewExtra), [**FDFullscreenPopGesture**](#FDFullscreenPopGesture), [**FMDatabaseExtra**](#FMDatabaseExtra), [**FSCalendar**](#FSCalendar), [**FSCalendarExtra**](#FSCalendarExtra), [**FileFolderHandleTool**](#FileFolderHandleTool), [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**HTMLDocumentExtra**](#HTMLDocumentExtra), [**HXPhotoManagerExtra**](#HXPhotoManagerExtra), [**HXPhotoViewExtra**](#HXPhotoViewExtra), [**IQKeyboardManagerExtra**](#IQKeyboardManagerExtra), [**JXCategoryViewExtra**](#JXCategoryViewExtra), [**JobsAPIs**](#JobsAPIs), [**JobsAppDoor**](#JobsAppDoor), [**JobsAppTools**](#JobsAppTools), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsBioKit**](#JobsBioKit), [**JobsBitsMonitor**](#JobsBitsMonitor), [**JobsBluetooth**](#JobsBluetooth), [**JobsByOCPods**](#JobsByOCPods), [**JobsCallBackBlockDSL**](#JobsCallBackBlockDSL), [**JobsClass**](#JobsClass), [**JobsClockView**](#JobsClockView), [**JobsCountdownBtn**](#JobsCountdownBtn), [**JobsCryptography**](#JobsCryptography), [**JobsCustomView**](#JobsCustomView), [**JobsDebug**](#JobsDebug), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsFuseAnimation**](#JobsFuseAnimation), [**JobsGestureLock**](#JobsGestureLock), [**JobsHotLabel**](#JobsHotLabel), [**JobsIconfont**](#JobsIconfont), [**JobsImageNumberView**](#JobsImageNumberView), [**JobsImageRotation**](#JobsImageRotation), [**JobsLanMgr**](#JobsLanMgr), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsLocker**](#JobsLocker), [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain), [**JobsMakes**](#JobsMakes), [**JobsMarqueeView**](#JobsMarqueeView), [**JobsMenuView**](#JobsMenuView), [**JobsModel**](#JobsModel), [**JobsModelDSL**](#JobsModelDSL), [**JobsMonitorNetwoking**](#JobsMonitorNetwoking), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsNetWorkTools**](#JobsNetWorkTools), [**JobsOCAudioRecorder**](#JobsOCAudioRecorder), [**JobsOCCalendar**](#JobsOCCalendar), [**JobsOCComment**](#JobsOCComment), [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCExcel**](#JobsOCExcel), [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha), [**JobsOCKeyboardMgr**](#JobsOCKeyboardMgr), [**JobsOCMarkdown**](#JobsOCMarkdown), [**JobsOCNumberStepper**](#JobsOCNumberStepper), [**JobsOCOpen**](#JobsOCOpen), [**JobsOCPatch**](#JobsOCPatch), [**JobsOCProtocols**](#JobsOCProtocols), [**JobsOCRefresher**](#JobsOCRefresher), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits), [**JobsOCSearcher**](#JobsOCSearcher), [**JobsOCSkeletonView**](#JobsOCSkeletonView), [**JobsOCSnowflake**](#JobsOCSnowflake), [**JobsOCSplash**](#JobsOCSplash), [**JobsOCTimer**](#JobsOCTimer), [**JobsOCTimerMgr**](#JobsOCTimerMgr), [**JobsOCTools**](#JobsOCTools), [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling), [**JobsOCVideoRecorder**](#JobsOCVideoRecorder), [**JobsOCWebSocket**](#JobsOCWebSocket), [**JobsPresentTransitionMgr**](#JobsPresentTransitionMgr), [**JobsProgressBar**](#JobsProgressBar), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsScreenCapture**](#JobsScreenCapture), [**JobsSuspend**](#JobsSuspend), [**JobsTabBarCtrl**](#JobsTabBarCtrl), [**JobsTimeUtils**](#JobsTimeUtils), [**JobsUploadingProgressView**](#JobsUploadingProgressView), [**JobsViewNavigator**](#JobsViewNavigator), [**JobsViewPush**](#JobsViewPush), [**JobsWallet**](#JobsWallet), [**LMJDropdownMenuExtra**](#LMJDropdownMenuExtra), [**MGSwipeTableCellExtra**](#MGSwipeTableCellExtra), [**MJRefreshExtra**](#MJRefreshExtra), [**ReachabilityExtra**](#ReachabilityExtra), [**SRWebSocketExtra**](#SRWebSocketExtra), [**SYSAlertControllerExtra**](#SYSAlertControllerExtra), [**SZTextViewExtra**](#SZTextViewExtra), [**TFPopup**](#TFPopup), [**TFPopupExtra**](#TFPopupExtra), [**TKPermissionKit**](#TKPermissionKit), [**UIBaseTextFieldDSL**](#UIBaseTextFieldDSL), [**WHToastExtra**](#WHToastExtra), [**WMZCode**](#WMZCode), [**YTKNetworkExtra**](#YTKNetworkExtra), [**ZFPlayerExtra**](#ZFPlayerExtra), [**ZMJCellExtra**](#ZMJCellExtra) |
| [**JobsOCExcel**](#JobsOCExcel) | `JobsByPods/JobsOCExcel@Pods/JobsOCExcel.podspec` | 6 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCUILabelScrolling](#JobsOCUILabelScrolling), [Masonry](https://github.com/SnapKit/Masonry) | 0 |  |
| [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha) | `JobsByPods/JobsOCGraphicCaptcha@Pods/JobsOCGraphicCaptcha.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsModel](#JobsModel), [JobsModelDSL](#JobsModelDSL), [JobsOCDefs](#JobsOCDefs) | 2 | [**JobsAppDoor**](#JobsAppDoor), [**JobsOCTools**](#JobsOCTools) |
| [**JobsOCKeyboardMgr**](#JobsOCKeyboardMgr) | `JobsByPods/JobsOCKeyboardMgr@Pods/JobsOCKeyboardMgr.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 2 | [**JobsAppDoor**](#JobsAppDoor), [**JobsOCTools**](#JobsOCTools) |
| [**JobsOCMarkdown**](#JobsOCMarkdown) | `JobsByPods/JobsOCMarkdown@Pods/JobsOCMarkdown.podspec` | 5 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [Masonry](https://github.com/SnapKit/Masonry) | 0 |  |
| [**JobsOCNumberStepper**](#JobsOCNumberStepper) | `JobsByPods/JobsOCNumberStepper@Pods/JobsOCNumberStepper.podspec` | 6 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [Masonry](https://github.com/SnapKit/Masonry) | 0 |  |
| [**JobsOCOpen**](#JobsOCOpen) | `JobsByPods/JobsOCOpen@Pods/JobsOCOpen.podspec` | 6 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsGetWindow](#JobsGetWindow), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsStringUtils](#JobsStringUtils) | 0 |  |
| [**JobsOCPatch**](#JobsOCPatch) | `JobsByPods/JobsOCPatch@Pods/JobsOCPatch.podspec` | 2 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsOCProtocols**](#JobsOCProtocols) | `JobsByPods/JobsOCProtocols@Pods/JobsOCProtocols.podspec` | 5 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [SPAlertController](https://github.com/SPStore/SPAlertController), [YTKNetwork](https://github.com/yuantiku/YTKNetwork) | 30 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAPIs**](#JobsAPIs), [**JobsAppDoor**](#JobsAppDoor), [**JobsAppTools**](#JobsAppTools), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsClockView**](#JobsClockView), [**JobsCustomView**](#JobsCustomView), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsHotLabel**](#JobsHotLabel), [**JobsImageNumberView**](#JobsImageNumberView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsModel**](#JobsModel), [**JobsModelDSL**](#JobsModelDSL), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsNetWorkTools**](#JobsNetWorkTools), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits), [**JobsOCTimer**](#JobsOCTimer), [**JobsOCTimerMgr**](#JobsOCTimerMgr), [**JobsOCTools**](#JobsOCTools), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsWallet**](#JobsWallet), [**MJRefreshExtra**](#MJRefreshExtra), [**WHToastExtra**](#WHToastExtra), [**WMZCode**](#WMZCode), [**YTKNetworkExtra**](#YTKNetworkExtra) |
| [**JobsOCRefresher**](#JobsOCRefresher) | `JobsByPods/JobsOCRefresher@Pods/JobsOCRefresher.podspec` | 6 | [JobsBlock](#JobsBlock), [JobsFuseAnimation](#JobsFuseAnimation), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCComment**](#JobsOCComment) |
| [**JobsOCRuntimeKits**](#JobsOCRuntimeKits) | `JobsByPods/JobsOCRuntimeKits@Pods/JobsOCRuntimeKits.podspec` | 10 | [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCSnowflake](#JobsOCSnowflake), [JobsRandomUtils](#JobsRandomUtils), [WHToastExtra](#WHToastExtra) | 15 | [**FMDatabaseExtra**](#FMDatabaseExtra), [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCTools**](#JobsOCTools), [**JobsSuspend**](#JobsSuspend), [**MJRefreshExtra**](#MJRefreshExtra), [**SYSAlertControllerExtra**](#SYSAlertControllerExtra) |
| [**JobsOCSearcher**](#JobsOCSearcher) | `JobsByPods/JobsOCSearcher@Pods/JobsOCSearcher.podspec` | 6 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [Masonry](https://github.com/SnapKit/Masonry) | 0 |  |
| [**JobsOCSkeletonView**](#JobsOCSkeletonView) | `JobsByPods/JobsOCSkeletonView@Pods/JobsOCSkeletonView.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsOCSnowflake**](#JobsOCSnowflake) | `JobsByPods/JobsOCSnowflake@Pods/JobsOCSnowflake.podspec` | 2 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 3 | [**JobsByOCPods**](#JobsByOCPods), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits) |
| [**JobsOCSplash**](#JobsOCSplash) | `JobsByPods/JobsOCSplash@Pods/JobsOCSplash.podspec` | 6 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCTimer](#JobsOCTimer) | 0 |  |
| [**JobsOCTimer**](#JobsOCTimer) | `JobsByPods/JobsOCTimer@Pods/JobsOCTimer.podspec` | 9 | [JobsBlock](#JobsBlock), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsStringUtils](#JobsStringUtils), [SDWebImage](https://github.com/SDWebImage/SDWebImage), [WHToast](https://github.com/remember17/WHToast), [WHToastExtra](#WHToastExtra) | 13 | [**JobsByOCPods**](#JobsByOCPods), [**JobsClockView**](#JobsClockView), [**JobsCountdownBtn**](#JobsCountdownBtn), [**JobsFuseAnimation**](#JobsFuseAnimation), [**JobsImageRotation**](#JobsImageRotation), [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain), [**JobsNetWorkTools**](#JobsNetWorkTools), [**JobsOCAudioRecorder**](#JobsOCAudioRecorder), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCSplash**](#JobsOCSplash), [**JobsOCTimerMgr**](#JobsOCTimerMgr), [**JobsOCTools**](#JobsOCTools), [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling) |
| [**JobsOCTimerMgr**](#JobsOCTimerMgr) | `JobsByPods/JobsOCTimerMgr@Pods/JobsOCTimerMgr.podspec` | 5 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCTimer](#JobsOCTimer) | 1 | [**JobsMarqueeView**](#JobsMarqueeView) |
| [**JobsOCTools**](#JobsOCTools) | `JobsByPods/JobsOCTools@Pods/JobsOCTools.podspec` | 50 | [AFSecurityPolicyExtra](#AFSecurityPolicyExtra), [FDFullscreenPopGesture](#FDFullscreenPopGesture), [FMDatabaseExtra](#FMDatabaseExtra), [FSCalendar](#FSCalendar), [FSCalendarExtra](#FSCalendarExtra), [GKCustomNavigationBarExtra](#GKCustomNavigationBarExtra), [HTMLDocumentExtra](#HTMLDocumentExtra), [HXPhotoManagerExtra](#HXPhotoManagerExtra), [HXPhotoViewExtra](#HXPhotoViewExtra), [IQKeyboardManagerExtra](#IQKeyboardManagerExtra), [JXCategoryViewExtra](#JXCategoryViewExtra), [JobsAppTools](#JobsAppTools), [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsCountdownBtn](#JobsCountdownBtn), [JobsCryptography](#JobsCryptography), [JobsDeviceInfo](#JobsDeviceInfo), [JobsFuseAnimation](#JobsFuseAnimation), [JobsHotLabel](#JobsHotLabel), [JobsLanMgr](#JobsLanMgr), [JobsLoadingImage](#JobsLoadingImage), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCCountryCodeCtrl](#JobsOCCountryCodeCtrl), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCGraphicCaptcha](#JobsOCGraphicCaptcha), [JobsOCKeyboardMgr](#JobsOCKeyboardMgr), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsOCTimer](#JobsOCTimer), [JobsStringUtils](#JobsStringUtils), [JobsSuspend](#JobsSuspend), [LMJDropdownMenuExtra](#LMJDropdownMenuExtra), [MGSwipeTableCellExtra](#MGSwipeTableCellExtra), [Masonry](https://github.com/SnapKit/Masonry), [PPBadgeView](https://github.com/jkpang/PPBadgeView), [RACExtra](#RACExtra), [ReachabilityExtra](#ReachabilityExtra), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [SRWebSocketExtra](#SRWebSocketExtra), [SZTextViewExtra](#SZTextViewExtra), [SocketRocket](https://github.com/facebookincubator/SocketRocket), [TFPopupExtra](#TFPopupExtra), [XYColorOC](#XYColorOC), [ZFPlayer](https://github.com/renzifeng/ZFPlayer), [ZFPlayerExtra](#ZFPlayerExtra), [ZMJCellExtra](#ZMJCellExtra), [lottie-ios](https://github.com/airbnb/lottie-ios) | 1 | [**JobsAppDoor**](#JobsAppDoor) |
| [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling) | `JobsByPods/JobsOCUILabelScrolling@Pods/JobsOCUILabelScrolling.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCTimer](#JobsOCTimer) | 1 | [**JobsOCExcel**](#JobsOCExcel) |
| [**JobsOCVideoRecorder**](#JobsOCVideoRecorder) | `JobsByPods/JobsOCVideoRecorder@Pods/JobsOCVideoRecorder.podspec` | 7 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [Masonry](https://github.com/SnapKit/Masonry), [TKPermissionKit](#TKPermissionKit) | 0 |  |
| [**JobsOCWebSocket**](#JobsOCWebSocket) | `JobsByPods/JobsOCWebSocket@Pods/JobsOCWebSocket.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [SRWebSocketExtra](#SRWebSocketExtra), [SocketRocket](https://github.com/facebookincubator/SocketRocket) | 0 |  |
| [**JobsPresentTransitionMgr**](#JobsPresentTransitionMgr) | `JobsByPods/JobsPresentTransitionMgr@Pods/JobsPresentTransitionMgr.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsProgressBar**](#JobsProgressBar) | `JobsByPods/JobsProgressBar@Pods/JobsProgressBar.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsRandomUtils**](#JobsRandomUtils) | `JobsByPods/JobsRandomUtils@Pods/JobsRandomUtils.podspec` | 0 |  | 3 | [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits) |
| [**JobsRichTextUtils**](#JobsRichTextUtils) | `JobsByPods/JobsRichTextUtils@Pods/JobsRichTextUtils.podspec` | 10 | [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsStringUtils](#JobsStringUtils), [XYColorOC](#XYColorOC) | 10 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsSuspend**](#JobsSuspend), [**MJRefreshExtra**](#MJRefreshExtra) |
| [**JobsScreenCapture**](#JobsScreenCapture) | `JobsByPods/JobsScreenCapture@Pods/JobsScreenCapture.podspec` | 5 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [Masonry](https://github.com/SnapKit/Masonry) | 0 |  |
| [**JobsStringUtils**](#JobsStringUtils) | `JobsByPods/JobsStringUtils@Pods/JobsStringUtils.podspec` | 0 |  | 22 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAPIs**](#JobsAPIs), [**JobsAppTools**](#JobsAppTools), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsDebug**](#JobsDebug), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsLanMgr**](#JobsLanMgr), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsModel**](#JobsModel), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCDefs**](#JobsOCDefs), [**JobsOCOpen**](#JobsOCOpen), [**JobsOCTimer**](#JobsOCTimer), [**JobsOCTools**](#JobsOCTools), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsTimeUtils**](#JobsTimeUtils), [**MJRefreshExtra**](#MJRefreshExtra), [**YTKNetworkExtra**](#YTKNetworkExtra) |
| [**JobsSuspend**](#JobsSuspend) | `JobsByPods/JobsSuspend@Pods/JobsSuspend.podspec` | 12 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsDeviceInfo](#JobsDeviceInfo), [JobsLanMgr](#JobsLanMgr), [JobsLoadingImage](#JobsLoadingImage), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsRichTextUtils](#JobsRichTextUtils), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [XYColorOC](#XYColorOC) | 3 | [**JobsBitsMonitor**](#JobsBitsMonitor), [**JobsMonitorNetwoking**](#JobsMonitorNetwoking), [**JobsOCTools**](#JobsOCTools) |
| [**JobsTabBarCtrl**](#JobsTabBarCtrl) | `JobsByPods/JobsTabBarCtrl@Pods/JobsTabBarCtrl.podspec` | 6 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsTimeUtils**](#JobsTimeUtils) | `JobsByPods/JobsTimeUtils@Pods/JobsTimeUtils.podspec` | 8 | [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsStringUtils](#JobsStringUtils), [WHToastExtra](#WHToastExtra) | 6 | [**JobsAPIs**](#JobsAPIs), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**YTKNetworkExtra**](#YTKNetworkExtra) |
| [**JobsUploadingProgressView**](#JobsUploadingProgressView) | `JobsByPods/JobsUploadingProgressView@Pods/JobsUploadingProgressView.podspec` | 7 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsViewNavigator**](#JobsViewNavigator) | `JobsByPods/JobsViewNavigator@Pods/JobsViewNavigator.podspec` | 5 | [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [Masonry](https://github.com/SnapKit/Masonry) | 2 | [**JobsByOCPods**](#JobsByOCPods), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr) |
| [**JobsViewPush**](#JobsViewPush) | `JobsByPods/JobsViewPush@Pods/JobsViewPush.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs) | 0 |  |
| [**JobsWallet**](#JobsWallet) | `JobsByPods/JobsWallet@Pods/JobsWallet.podspec` | 9 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsModel](#JobsModel), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [Masonry](https://github.com/SnapKit/Masonry), [XYColorOC](#XYColorOC) | 0 |  |
| [**LMJDropdownMenuExtra**](#LMJDropdownMenuExtra) | `JobsByPods/LMJDropdownMenuExtra@Pods/LMJDropdownMenuExtra.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [LMJDropdownMenu](https://github.com/JerryLMJ/LMJDropdownMenu) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**MGSwipeTableCellExtra**](#MGSwipeTableCellExtra) | `JobsByPods/MGSwipeTableCellExtra@Pods/MGSwipeTableCellExtra.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [MGSwipeTableCell](https://github.com/MortimerGoro/MGSwipeTableCell) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**MJRefreshExtra**](#MJRefreshExtra) | `JobsByPods/MJRefreshExtra@Pods/MJRefreshExtra.podspec` | 18 | [JobsBlock](#JobsBlock), [JobsDeviceInfo](#JobsDeviceInfo), [JobsLanMgr](#JobsLanMgr), [JobsLoadingImage](#JobsLoadingImage), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [JobsRichTextUtils](#JobsRichTextUtils), [JobsStringUtils](#JobsStringUtils), [MJRefresh](https://github.com/CoderMJLee/MJRefresh), [TABAnimated](#TABAnimated), [WHToastExtra](#WHToastExtra), [XYColorOC](#XYColorOC), [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh), [lottie-ios](https://github.com/airbnb/lottie-ios) | 6 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsBaseUI**](#JobsBaseUI), [**JobsCustomView**](#JobsCustomView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr) |
| [**RACExtra**](#RACExtra) | `JobsByPods/RACExtra@Pods/RACExtra.podspec` | 0 |  | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**ReachabilityExtra**](#ReachabilityExtra) | `JobsByPods/ReachabilityExtra@Pods/ReachabilityExtra.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [Reachability](https://github.com/tonymillion/Reachability) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**SRWebSocketExtra**](#SRWebSocketExtra) | `JobsByPods/SRWebSocketExtra@Pods/SRWebSocketExtra.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [SocketRocket](https://github.com/facebookincubator/SocketRocket) | 2 | [**JobsOCTools**](#JobsOCTools), [**JobsOCWebSocket**](#JobsOCWebSocket) |
| [**SYSAlertControllerExtra**](#SYSAlertControllerExtra) | `JobsByPods/SYSAlertControllerExtra@Pods/SYSAlertControllerExtra.podspec` | 9 | [JobsBlock](#JobsBlock), [JobsLanMgr](#JobsLanMgr), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCRuntimeKits](#JobsOCRuntimeKits), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [WHToast](https://github.com/remember17/WHToast), [WHToastExtra](#WHToastExtra) | 0 |  |
| [**SZTextViewExtra**](#SZTextViewExtra) | `JobsByPods/SZTextViewExtra@Pods/SZTextViewExtra.podspec` | 3 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs), [SZTextView](https://github.com/glaszig/SZTextView) | 2 | [**JobsBaseUI**](#JobsBaseUI), [**JobsOCTools**](#JobsOCTools) |
| [**TABAnimated**](#TABAnimated) | `JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimated.podspec` | 0 |  | 8 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**MJRefreshExtra**](#MJRefreshExtra) |
| [**TFPopup**](#TFPopup) | `JobsByPods/ManualByOCPods@Pods/TFPopup/TFPopup.podspec` | 2 | [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 3 | [**JobsByOCPods**](#JobsByOCPods), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**TFPopupExtra**](#TFPopupExtra) |
| [**TFPopupExtra**](#TFPopupExtra) | `JobsByPods/TFPopupExtra@Pods/TFPopupExtra.podspec` | 8 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsCustomView](#JobsCustomView), [JobsFiltrationView](#JobsFiltrationView), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [TFPopup](#TFPopup) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**TKPermissionKit**](#TKPermissionKit) | `JobsByPods/ManualByOCPods@Pods/TKPermissionKit/TKPermissionKit.podspec` | 4 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsLanMgr](#JobsLanMgr), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsOCVideoRecorder**](#JobsOCVideoRecorder) |
| [**Texture**](#Texture) | `JobsByPods/ManualByOCPods@Pods/Texture/Texture.podspec` | 4 | IGListDiffKit, IGListKit, PINRemoteImage, Yoga | 1 | [**JobsOCDSL**](#JobsOCDSL) |
| [**This**](#This) | `JobsByPods/This@Pods/This.podspec` | 0 |  | 4 | [**JobsAPIs**](#JobsAPIs), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView) |
| [**UIBaseTextFieldDSL**](#UIBaseTextFieldDSL) | `JobsByPods/UIBaseTextFieldDSL@Pods/UIBaseTextFieldDSL.podspec` | 3 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsOCDefs](#JobsOCDefs) | 1 | [**JobsAppDoor**](#JobsAppDoor) |
| [**WHToastExtra**](#WHToastExtra) | `JobsByPods/WHToastExtra@Pods/WHToastExtra.podspec` | 13 | [JobsBlock](#JobsBlock), [JobsClass](#JobsClass), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [MJExtension](https://github.com/CoderMJLee/MJExtension), [Masonry](https://github.com/SnapKit/Masonry), [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), [SDWebImage](https://github.com/SDWebImage/SDWebImage), [WHToast](https://github.com/remember17/WHToast), [XYColorOC](#XYColorOC) | 12 | [**JobsAPIs**](#JobsAPIs), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCRuntimeKits**](#JobsOCRuntimeKits), [**JobsOCTimer**](#JobsOCTimer), [**JobsTimeUtils**](#JobsTimeUtils), [**MJRefreshExtra**](#MJRefreshExtra), [**SYSAlertControllerExtra**](#SYSAlertControllerExtra), [**YTKNetworkExtra**](#YTKNetworkExtra) |
| [**WMZCode**](#WMZCode) | `JobsByPods/ManualByOCPods@Pods/WMZCode/WMZCode.podspec` | 5 | [JobsBlock](#JobsBlock), [JobsByOCPods](#JobsByOCPods), [JobsMakes](#JobsMakes), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols) | 0 |  |
| [**XYColorOC**](#XYColorOC) | `JobsByPods/ManualByOCPods@Pods/XYColorOC/XYColorOC.podspec` | 0 |  | 19 | [**BRPickerViewExtra**](#BRPickerViewExtra), [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAppDoor**](#JobsAppDoor), [**JobsAppTools**](#JobsAppTools), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsModel**](#JobsModel), [**JobsNavBar**](#JobsNavBar), [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl), [**JobsOCDefs**](#JobsOCDefs), [**JobsOCTools**](#JobsOCTools), [**JobsRichTextUtils**](#JobsRichTextUtils), [**JobsSuspend**](#JobsSuspend), [**JobsWallet**](#JobsWallet), [**MJRefreshExtra**](#MJRefreshExtra), [**WHToastExtra**](#WHToastExtra) |
| [**YTKNetworkExtra**](#YTKNetworkExtra) | `JobsByPods/YTKNetworkExtra@Pods/YTKNetworkExtra.podspec` | 13 | [AFNetworking](https://github.com/AFNetworking/AFNetworking), [JobsBlock](#JobsBlock), [JobsLanMgr](#JobsLanMgr), [JobsMakes](#JobsMakes), [JobsModelDSL](#JobsModelDSL), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [JobsOCProtocols](#JobsOCProtocols), [JobsStringUtils](#JobsStringUtils), [JobsTimeUtils](#JobsTimeUtils), [MJExtension](https://github.com/CoderMJLee/MJExtension), [WHToastExtra](#WHToastExtra), [YTKNetwork](https://github.com/yuantiku/YTKNetwork) | 4 | [**JobsAPIs**](#JobsAPIs), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsLinkageMenuView**](#JobsLinkageMenuView) |
| [**YYKits**](#YYKits) | `JobsByPods/ManualByOCPods@Pods/YYKits/YYKits.podspec` | 0 |  | 0 |  |
| [**ZBNetworking**](#ZBNetworking) | `JobsByPods/ManualByOCPods@Pods/ZBNetworking/ZBNetworking.podspec` | 1 | [AFNetworking](https://github.com/AFNetworking/AFNetworking) | 1 | [**JobsByOCPods**](#JobsByOCPods) |
| [**ZFPlayerExtra**](#ZFPlayerExtra) | `JobsByPods/ZFPlayerExtra@Pods/ZFPlayerExtra.podspec` | 5 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [ZFPlayer](https://github.com/renzifeng/ZFPlayer) | 3 | [**JobsAppDoor**](#JobsAppDoor), [**JobsByOCPods**](#JobsByOCPods), [**JobsOCTools**](#JobsOCTools) |
| [**ZMJCellExtra**](#ZMJCellExtra) | `JobsByPods/ZMJCellExtra@Pods/ZMJCellExtra.podspec` | 6 | [JobsBaseUI](#JobsBaseUI), [JobsBlock](#JobsBlock), [JobsMakes](#JobsMakes), [JobsOCDSL](#JobsOCDSL), [JobsOCDefs](#JobsOCDefs), [ZMJGanttChart](https://github.com/keshiim/ZMJGanttChart) | 1 | [**JobsOCTools**](#JobsOCTools) |
| [**ZWPullMenuView**](#ZWPullMenuView) | `JobsByPods/ManualByOCPods@Pods/ZWPullMenuView/ZWPullMenuView.podspec` | 1 | [JobsByOCPods](#JobsByOCPods) | 1 | [**JobsBitsMonitor**](#JobsBitsMonitor) |

## 二、0 下游依赖 Pod <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| Pod | Podspec |
|---|---|
| [**BEMCheckBox**](#BEMCheckBox) | `JobsByPods/ManualByOCPods@Pods/BEMCheckBox/BEMCheckBox.podspec` |
| [**DeviceKit**](#DeviceKit) | `JobsByPods/ManualByOCPods@Pods/DeviceKit/DeviceKit.podspec` |
| [**GTCaptcha4**](#GTCaptcha4) | `JobsByPods/ManualByOCPods@Pods/GTCaptcha4/GTCaptcha4.podspec` |
| [**JobsAppIconRibbon**](#JobsAppIconRibbon) | `JobsByPods/JobsAppIconRibbon@Pods/JobsAppIconRibbon.podspec` |
| [**JobsGetWindow**](#JobsGetWindow) | `JobsByPods/JobsGetWindow@Pods/JobsGetWindow.podspec` |
| [**JobsRandomUtils**](#JobsRandomUtils) | `JobsByPods/JobsRandomUtils@Pods/JobsRandomUtils.podspec` |
| [**JobsStringUtils**](#JobsStringUtils) | `JobsByPods/JobsStringUtils@Pods/JobsStringUtils.podspec` |
| [**RACExtra**](#RACExtra) | `JobsByPods/RACExtra@Pods/RACExtra.podspec` |
| [**TABAnimated**](#TABAnimated) | `JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimated.podspec` |
| [**This**](#This) | `JobsByPods/This@Pods/This.podspec` |
| [**XYColorOC**](#XYColorOC) | `JobsByPods/ManualByOCPods@Pods/XYColorOC/XYColorOC.podspec` |
| [**YYKits**](#YYKits) | `JobsByPods/ManualByOCPods@Pods/YYKits/YYKits.podspec` |

## 三、已过滤的同 Pod 内部 subspec 依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

这些依赖只表达同一个 Pod 内部 subspec 的包含关系，不参与 Pod 与 Pod 之间的循环依赖判断。

| Pod | 声明位置 | 内部依赖 | 行号 |
|---|---|---|---:|
| [**TFPopup**](#TFPopup) | `TFPopup/Core` | `TFPopup/Support` | `193` |
| [**TFPopup**](#TFPopup) | `TFPopup/Core` | `TFPopup/Support/UIKit` | `193` |
| [**TFPopup**](#TFPopup) | `TFPopup/Core` | `TFPopup/Support/UIKit` | `196` |
| [**TFPopup**](#TFPopup) | `TFPopup/Core` | `TFPopup/Support/UIKit/NSObject` | `193` |
| [**TFPopup**](#TFPopup) | `TFPopup/Core` | `TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange` | `193` |
| [**TFPopup**](#TFPopup) | `TFPopup/Core` | `TFPopup/Support/UIKit/UIScrollView` | `193` |
| [**TFPopup**](#TFPopup) | `TFPopup/Core` | `TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup` | `193` |
| [**TFPopup**](#TFPopup) | `TFPopup/Core` | `TFPopup/Support/UIKit/UIView` | `193` |
| [**TFPopup**](#TFPopup) | `TFPopup/Core` | `TFPopup/Support/UIKit/UIView/UIView+TFPopup` | `193` |
| [**TKPermissionKit**](#TKPermissionKit) | `TKPermissionKit/Core` | `TKPermissionKit/Resource` | `167` |
| [**Texture**](#Texture) | `Texture/AssetsLibrary` | `Texture/Core` | `109` |
| [**Texture**](#Texture) | `Texture/IGListKit` | `Texture/Core` | `62` |
| [**Texture**](#Texture) | `Texture/MapKit` | `Texture/Core` | `93` |
| [**Texture**](#Texture) | `Texture/PINRemoteImage` | `Texture/Core` | `54` |
| [**Texture**](#Texture) | `Texture/Photos` | `Texture/Core` | `101` |
| [**Texture**](#Texture) | `Texture/TextNode2` | `Texture/Core` | `77` |
| [**Texture**](#Texture) | `Texture/Video` | `Texture/Core` | `85` |
| [**Texture**](#Texture) | `Texture/Yoga` | `Texture/Core` | `69` |
| [**ZBNetworking**](#ZBNetworking) | `ZBNetworking/Core` | `ZBNetworking/Support` | `122` |
| [**ZBNetworking**](#ZBNetworking) | `ZBNetworking/Core` | `ZBNetworking/Support/UIKit` | `122` |
| [**ZBNetworking**](#ZBNetworking) | `ZBNetworking/Core` | `ZBNetworking/Support/UIKit` | `127` |
| [**ZBNetworking**](#ZBNetworking) | `ZBNetworking/Core` | `ZBNetworking/Support/UIKit/NSString+ZBURLEncoding` | `122` |

## 四、Pod 间循环依赖检测 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 未发现仓库内 Pod 间循环依赖。

## 五、仓库内 Pod 相互依赖图 Mermaid <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

只展示依赖目标也在本次扫描到的 `.podspec` 里存在的关系；同 Pod 内部 subspec 依赖已过滤，不计入 Pod 级依赖/循环分析；跨 Pod subspec 依赖显示为主 Pod 名；仓库内 Pod 匹配只采用精确名称，避免把 MJRefresh 误判为 MJRefreshExtra。

```mermaid
flowchart LR
  N898a2c117de4["AFSecurityPolicyExtra"] --> N1df8cd4ff855["JobsBlock"]
  N898a2c117de4["AFSecurityPolicyExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nf545e7022087["BRPickerView"] --> N6be7f32159cc["JobsModelDSL"]
  N3b5551b6877a["BRPickerViewExtra"] --> Nf545e7022087["BRPickerView"]
  N3b5551b6877a["BRPickerViewExtra"] --> N1df8cd4ff855["JobsBlock"]
  N3b5551b6877a["BRPickerViewExtra"] --> N04d01727957b["JobsLanMgr"]
  N3b5551b6877a["BRPickerViewExtra"] --> N590072ebdded["JobsMakes"]
  N3b5551b6877a["BRPickerViewExtra"] --> N6be7f32159cc["JobsModelDSL"]
  N3b5551b6877a["BRPickerViewExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N3b5551b6877a["BRPickerViewExtra"] --> N78b271dac65c["XYColorOC"]
  N23605d3c636b["FDFullscreenPopGesture"] --> N1df8cd4ff855["JobsBlock"]
  N23605d3c636b["FDFullscreenPopGesture"] --> N0394efe9fe42["JobsOCDefs"]
  Nb92440121e0d["FMDatabaseExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nb92440121e0d["FMDatabaseExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nb92440121e0d["FMDatabaseExtra"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nad368d2952f0["FSCalendar"] --> N1df8cd4ff855["JobsBlock"]
  Nad368d2952f0["FSCalendar"] --> N590072ebdded["JobsMakes"]
  Nad368d2952f0["FSCalendar"] --> N0394efe9fe42["JobsOCDefs"]
  N5580487ca546["FSCalendarExtra"] --> Nad368d2952f0["FSCalendar"]
  N5580487ca546["FSCalendarExtra"] --> N1df8cd4ff855["JobsBlock"]
  N5580487ca546["FSCalendarExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N14fe593262c8["FileFolderHandleTool"] --> N1df8cd4ff855["JobsBlock"]
  N14fe593262c8["FileFolderHandleTool"] --> Nb81862f08afd["JobsByOCPods"]
  N14fe593262c8["FileFolderHandleTool"] --> N590072ebdded["JobsMakes"]
  N14fe593262c8["FileFolderHandleTool"] --> N6be7f32159cc["JobsModelDSL"]
  N14fe593262c8["FileFolderHandleTool"] --> N0394efe9fe42["JobsOCDefs"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Nab53e8669cd3["JobsBaseUI"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N1df8cd4ff855["JobsBlock"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N04d01727957b["JobsLanMgr"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N590072ebdded["JobsMakes"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N6be7f32159cc["JobsModelDSL"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N018c2243ba9d["JobsOCDSL"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Na65e59600826["JobsOCRuntimeKits"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ncc282d5e1810["JobsRichTextUtils"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ne65c588da9cd["JobsStringUtils"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N3476a8cdc1d9["TABAnimated"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N78b271dac65c["XYColorOC"]
  Nbf16aa830c40["HTMLDocumentExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nbf16aa830c40["HTMLDocumentExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N797f568867e8["HXPhotoManagerExtra"] --> N1df8cd4ff855["JobsBlock"]
  N797f568867e8["HXPhotoManagerExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N9115d69cc676["HXPhotoViewExtra"] --> N1df8cd4ff855["JobsBlock"]
  N9115d69cc676["HXPhotoViewExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nfae4768a9e4e["IQKeyboardManagerExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nfae4768a9e4e["IQKeyboardManagerExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> N590072ebdded["JobsMakes"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N24debe9de845["JobsAPIs"] --> N1df8cd4ff855["JobsBlock"]
  N24debe9de845["JobsAPIs"] --> Nb3ef9cb29680["JobsClass"]
  N24debe9de845["JobsAPIs"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N24debe9de845["JobsAPIs"] --> N04d01727957b["JobsLanMgr"]
  N24debe9de845["JobsAPIs"] --> N6be7f32159cc["JobsModelDSL"]
  N24debe9de845["JobsAPIs"] --> N0394efe9fe42["JobsOCDefs"]
  N24debe9de845["JobsAPIs"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N24debe9de845["JobsAPIs"] --> Ne65c588da9cd["JobsStringUtils"]
  N24debe9de845["JobsAPIs"] --> N210688fa7a59["JobsTimeUtils"]
  N24debe9de845["JobsAPIs"] --> N77631ca4f0e0["This"]
  N24debe9de845["JobsAPIs"] --> N08b2a250a092["WHToastExtra"]
  N24debe9de845["JobsAPIs"] --> N445bb6c02ab7["YTKNetworkExtra"]
  N4f58ddb65c39["JobsAppDoor"] --> Nab53e8669cd3["JobsBaseUI"]
  N4f58ddb65c39["JobsAppDoor"] --> N1df8cd4ff855["JobsBlock"]
  N4f58ddb65c39["JobsAppDoor"] --> Nb81862f08afd["JobsByOCPods"]
  N4f58ddb65c39["JobsAppDoor"] --> N6f44574f4279["JobsCountdownBtn"]
  N4f58ddb65c39["JobsAppDoor"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N4f58ddb65c39["JobsAppDoor"] --> N7ddf250cfc68["JobsFuseAnimation"]
  N4f58ddb65c39["JobsAppDoor"] --> N6672b574eed3["JobsHotLabel"]
  N4f58ddb65c39["JobsAppDoor"] --> N04d01727957b["JobsLanMgr"]
  N4f58ddb65c39["JobsAppDoor"] --> N590072ebdded["JobsMakes"]
  N4f58ddb65c39["JobsAppDoor"] --> N4f073af73f73["JobsModel"]
  N4f58ddb65c39["JobsAppDoor"] --> N6be7f32159cc["JobsModelDSL"]
  N4f58ddb65c39["JobsAppDoor"] --> N75ef9d14c110["JobsOCCountryCodeCtrl"]
  N4f58ddb65c39["JobsAppDoor"] --> N018c2243ba9d["JobsOCDSL"]
  N4f58ddb65c39["JobsAppDoor"] --> N0394efe9fe42["JobsOCDefs"]
  N4f58ddb65c39["JobsAppDoor"] --> N43d3c978045a["JobsOCGraphicCaptcha"]
  N4f58ddb65c39["JobsAppDoor"] --> N9599280b3643["JobsOCKeyboardMgr"]
  N4f58ddb65c39["JobsAppDoor"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N4f58ddb65c39["JobsAppDoor"] --> N823afb3a9d17["JobsOCTools"]
  N4f58ddb65c39["JobsAppDoor"] --> N9e7748a2dba5["UIBaseTextFieldDSL"]
  N4f58ddb65c39["JobsAppDoor"] --> N78b271dac65c["XYColorOC"]
  N4f58ddb65c39["JobsAppDoor"] --> N53b4ffc64c52["ZFPlayerExtra"]
  Nc5f7faa49a9e["JobsAppTools"] --> N1df8cd4ff855["JobsBlock"]
  Nc5f7faa49a9e["JobsAppTools"] --> Nb3ef9cb29680["JobsClass"]
  Nc5f7faa49a9e["JobsAppTools"] --> N04d01727957b["JobsLanMgr"]
  Nc5f7faa49a9e["JobsAppTools"] --> N590072ebdded["JobsMakes"]
  Nc5f7faa49a9e["JobsAppTools"] --> N6be7f32159cc["JobsModelDSL"]
  Nc5f7faa49a9e["JobsAppTools"] --> N018c2243ba9d["JobsOCDSL"]
  Nc5f7faa49a9e["JobsAppTools"] --> N0394efe9fe42["JobsOCDefs"]
  Nc5f7faa49a9e["JobsAppTools"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nc5f7faa49a9e["JobsAppTools"] --> Ne65c588da9cd["JobsStringUtils"]
  Nc5f7faa49a9e["JobsAppTools"] --> N78b271dac65c["XYColorOC"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Nc5f7faa49a9e["JobsAppTools"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N1df8cd4ff855["JobsBlock"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Nb3ef9cb29680["JobsClass"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N04d01727957b["JobsLanMgr"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N590072ebdded["JobsMakes"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N6be7f32159cc["JobsModelDSL"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N018c2243ba9d["JobsOCDSL"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N0394efe9fe42["JobsOCDefs"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Na65e59600826["JobsOCRuntimeKits"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Ncc282d5e1810["JobsRichTextUtils"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Ne65c588da9cd["JobsStringUtils"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N08b2a250a092["WHToastExtra"]
  Nab53e8669cd3["JobsBaseUI"] --> Nc5f7faa49a9e["JobsAppTools"]
  Nab53e8669cd3["JobsBaseUI"] --> N4976a4ac7fe9["JobsBasePopupView"]
  Nab53e8669cd3["JobsBaseUI"] --> N1df8cd4ff855["JobsBlock"]
  Nab53e8669cd3["JobsBaseUI"] --> Nb3ef9cb29680["JobsClass"]
  Nab53e8669cd3["JobsBaseUI"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nab53e8669cd3["JobsBaseUI"] --> N04d01727957b["JobsLanMgr"]
  Nab53e8669cd3["JobsBaseUI"] --> N9cfe528cfb91["JobsLoadingImage"]
  Nab53e8669cd3["JobsBaseUI"] --> N590072ebdded["JobsMakes"]
  Nab53e8669cd3["JobsBaseUI"] --> N6be7f32159cc["JobsModelDSL"]
  Nab53e8669cd3["JobsBaseUI"] --> Nd9dbfc611984["JobsNavBar"]
  Nab53e8669cd3["JobsBaseUI"] --> N018c2243ba9d["JobsOCDSL"]
  Nab53e8669cd3["JobsBaseUI"] --> N0394efe9fe42["JobsOCDefs"]
  Nab53e8669cd3["JobsBaseUI"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nab53e8669cd3["JobsBaseUI"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nab53e8669cd3["JobsBaseUI"] --> N3264ff988b83["JobsRandomUtils"]
  Nab53e8669cd3["JobsBaseUI"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nab53e8669cd3["JobsBaseUI"] --> Ne65c588da9cd["JobsStringUtils"]
  Nab53e8669cd3["JobsBaseUI"] --> N210688fa7a59["JobsTimeUtils"]
  Nab53e8669cd3["JobsBaseUI"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  Nab53e8669cd3["JobsBaseUI"] --> N7c1d94750a78["SZTextViewExtra"]
  Nab53e8669cd3["JobsBaseUI"] --> N3476a8cdc1d9["TABAnimated"]
  Nab53e8669cd3["JobsBaseUI"] --> N77631ca4f0e0["This"]
  Nab53e8669cd3["JobsBaseUI"] --> N08b2a250a092["WHToastExtra"]
  Nab53e8669cd3["JobsBaseUI"] --> N78b271dac65c["XYColorOC"]
  Na69255208fcb["JobsBioKit"] --> N1df8cd4ff855["JobsBlock"]
  Na69255208fcb["JobsBioKit"] --> N0394efe9fe42["JobsOCDefs"]
  N73b30f5870cb["JobsBitsMonitor"] --> N1df8cd4ff855["JobsBlock"]
  N73b30f5870cb["JobsBitsMonitor"] --> Nb81862f08afd["JobsByOCPods"]
  N73b30f5870cb["JobsBitsMonitor"] --> N04d01727957b["JobsLanMgr"]
  N73b30f5870cb["JobsBitsMonitor"] --> N6be7f32159cc["JobsModelDSL"]
  N73b30f5870cb["JobsBitsMonitor"] --> N18c94bbe12dd["JobsNetWorkTools"]
  N73b30f5870cb["JobsBitsMonitor"] --> N018c2243ba9d["JobsOCDSL"]
  N73b30f5870cb["JobsBitsMonitor"] --> N0394efe9fe42["JobsOCDefs"]
  N73b30f5870cb["JobsBitsMonitor"] --> Nf3b94b6ac482["JobsSuspend"]
  N73b30f5870cb["JobsBitsMonitor"] --> N1322c50635fd["ZWPullMenuView"]
  N996702c26fbe["JobsBluetooth"] --> N1df8cd4ff855["JobsBlock"]
  N996702c26fbe["JobsBluetooth"] --> N0394efe9fe42["JobsOCDefs"]
  Nb81862f08afd["JobsByOCPods"] --> Nf545e7022087["BRPickerView"]
  Nb81862f08afd["JobsByOCPods"] --> N3b5551b6877a["BRPickerViewExtra"]
  Nb81862f08afd["JobsByOCPods"] --> Nde605d320f8b["DeviceKit"]
  Nb81862f08afd["JobsByOCPods"] --> Nad368d2952f0["FSCalendar"]
  Nb81862f08afd["JobsByOCPods"] --> N1560a1ad96e5["GKCustomNavigationBarExtra"]
  Nb81862f08afd["JobsByOCPods"] --> N24debe9de845["JobsAPIs"]
  Nb81862f08afd["JobsByOCPods"] --> Nc5f7faa49a9e["JobsAppTools"]
  Nb81862f08afd["JobsByOCPods"] --> Nab53e8669cd3["JobsBaseUI"]
  Nb81862f08afd["JobsByOCPods"] --> N1df8cd4ff855["JobsBlock"]
  Nb81862f08afd["JobsByOCPods"] --> Nb3ef9cb29680["JobsClass"]
  Nb81862f08afd["JobsByOCPods"] --> N222be9ee417c["JobsDebug"]
  Nb81862f08afd["JobsByOCPods"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nb81862f08afd["JobsByOCPods"] --> N6d6b05a78d25["JobsDropDownListView"]
  Nb81862f08afd["JobsByOCPods"] --> N04d01727957b["JobsLanMgr"]
  Nb81862f08afd["JobsByOCPods"] --> N590072ebdded["JobsMakes"]
  Nb81862f08afd["JobsByOCPods"] --> N6be7f32159cc["JobsModelDSL"]
  Nb81862f08afd["JobsByOCPods"] --> N320bdff0b837["JobsNavigationTransitionMgr"]
  Nb81862f08afd["JobsByOCPods"] --> N018c2243ba9d["JobsOCDSL"]
  Nb81862f08afd["JobsByOCPods"] --> N0394efe9fe42["JobsOCDefs"]
  Nb81862f08afd["JobsByOCPods"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nb81862f08afd["JobsByOCPods"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nb81862f08afd["JobsByOCPods"] --> Nbc02b97f6aba["JobsOCSnowflake"]
  Nb81862f08afd["JobsByOCPods"] --> Ndddad2cfcaac["JobsOCTimer"]
  Nb81862f08afd["JobsByOCPods"] --> N3264ff988b83["JobsRandomUtils"]
  Nb81862f08afd["JobsByOCPods"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nb81862f08afd["JobsByOCPods"] --> Ne65c588da9cd["JobsStringUtils"]
  Nb81862f08afd["JobsByOCPods"] --> N210688fa7a59["JobsTimeUtils"]
  Nb81862f08afd["JobsByOCPods"] --> Na7770fd0750a["JobsViewNavigator"]
  Nb81862f08afd["JobsByOCPods"] --> N3476a8cdc1d9["TABAnimated"]
  Nb81862f08afd["JobsByOCPods"] --> N3e84d1e0eb01["TFPopup"]
  Nb81862f08afd["JobsByOCPods"] --> N77631ca4f0e0["This"]
  Nb81862f08afd["JobsByOCPods"] --> N08b2a250a092["WHToastExtra"]
  Nb81862f08afd["JobsByOCPods"] --> N78b271dac65c["XYColorOC"]
  Nb81862f08afd["JobsByOCPods"] --> N445bb6c02ab7["YTKNetworkExtra"]
  Nb81862f08afd["JobsByOCPods"] --> Ncd4126ca9727["ZBNetworking"]
  Nb81862f08afd["JobsByOCPods"] --> N53b4ffc64c52["ZFPlayerExtra"]
  Nb7992c83f5f2["JobsCallBackBlockDSL"] --> N1df8cd4ff855["JobsBlock"]
  Nb7992c83f5f2["JobsCallBackBlockDSL"] --> N0394efe9fe42["JobsOCDefs"]
  Nb3ef9cb29680["JobsClass"] --> N1df8cd4ff855["JobsBlock"]
  Nb3ef9cb29680["JobsClass"] --> N0394efe9fe42["JobsOCDefs"]
  N0c0a38e86b25["JobsClockView"] --> N1df8cd4ff855["JobsBlock"]
  N0c0a38e86b25["JobsClockView"] --> N590072ebdded["JobsMakes"]
  N0c0a38e86b25["JobsClockView"] --> N018c2243ba9d["JobsOCDSL"]
  N0c0a38e86b25["JobsClockView"] --> N0394efe9fe42["JobsOCDefs"]
  N0c0a38e86b25["JobsClockView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N0c0a38e86b25["JobsClockView"] --> Ndddad2cfcaac["JobsOCTimer"]
  N6f44574f4279["JobsCountdownBtn"] --> N1df8cd4ff855["JobsBlock"]
  N6f44574f4279["JobsCountdownBtn"] --> Nb81862f08afd["JobsByOCPods"]
  N6f44574f4279["JobsCountdownBtn"] --> N04d01727957b["JobsLanMgr"]
  N6f44574f4279["JobsCountdownBtn"] --> N0394efe9fe42["JobsOCDefs"]
  N6f44574f4279["JobsCountdownBtn"] --> Ndddad2cfcaac["JobsOCTimer"]
  N5cbdf62fdef4["JobsCryptography"] --> N1df8cd4ff855["JobsBlock"]
  N5cbdf62fdef4["JobsCryptography"] --> Nb81862f08afd["JobsByOCPods"]
  N5cbdf62fdef4["JobsCryptography"] --> N590072ebdded["JobsMakes"]
  N5cbdf62fdef4["JobsCryptography"] --> N0394efe9fe42["JobsOCDefs"]
  Nca8124599275["JobsCustomView"] --> Nf545e7022087["BRPickerView"]
  Nca8124599275["JobsCustomView"] --> N3b5551b6877a["BRPickerViewExtra"]
  Nca8124599275["JobsCustomView"] --> Nab53e8669cd3["JobsBaseUI"]
  Nca8124599275["JobsCustomView"] --> N1df8cd4ff855["JobsBlock"]
  Nca8124599275["JobsCustomView"] --> Nb3ef9cb29680["JobsClass"]
  Nca8124599275["JobsCustomView"] --> N04d01727957b["JobsLanMgr"]
  Nca8124599275["JobsCustomView"] --> N590072ebdded["JobsMakes"]
  Nca8124599275["JobsCustomView"] --> N6be7f32159cc["JobsModelDSL"]
  Nca8124599275["JobsCustomView"] --> N018c2243ba9d["JobsOCDSL"]
  Nca8124599275["JobsCustomView"] --> N0394efe9fe42["JobsOCDefs"]
  Nca8124599275["JobsCustomView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nca8124599275["JobsCustomView"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nca8124599275["JobsCustomView"] --> Ne65c588da9cd["JobsStringUtils"]
  Nca8124599275["JobsCustomView"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  Nca8124599275["JobsCustomView"] --> N3476a8cdc1d9["TABAnimated"]
  Nca8124599275["JobsCustomView"] --> N77631ca4f0e0["This"]
  Nca8124599275["JobsCustomView"] --> N78b271dac65c["XYColorOC"]
  Nca8124599275["JobsCustomView"] --> N445bb6c02ab7["YTKNetworkExtra"]
  N222be9ee417c["JobsDebug"] --> N1df8cd4ff855["JobsBlock"]
  N222be9ee417c["JobsDebug"] --> N04d01727957b["JobsLanMgr"]
  N222be9ee417c["JobsDebug"] --> N590072ebdded["JobsMakes"]
  N222be9ee417c["JobsDebug"] --> N018c2243ba9d["JobsOCDSL"]
  N222be9ee417c["JobsDebug"] --> N0394efe9fe42["JobsOCDefs"]
  N222be9ee417c["JobsDebug"] --> Ne65c588da9cd["JobsStringUtils"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N1df8cd4ff855["JobsBlock"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Nb3ef9cb29680["JobsClass"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N04d01727957b["JobsLanMgr"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N590072ebdded["JobsMakes"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N6be7f32159cc["JobsModelDSL"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N018c2243ba9d["JobsOCDSL"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N0394efe9fe42["JobsOCDefs"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Ncc282d5e1810["JobsRichTextUtils"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Ne65c588da9cd["JobsStringUtils"]
  N6d6b05a78d25["JobsDropDownListView"] --> Nab53e8669cd3["JobsBaseUI"]
  N6d6b05a78d25["JobsDropDownListView"] --> N1df8cd4ff855["JobsBlock"]
  N6d6b05a78d25["JobsDropDownListView"] --> Nb3ef9cb29680["JobsClass"]
  N6d6b05a78d25["JobsDropDownListView"] --> N04d01727957b["JobsLanMgr"]
  N6d6b05a78d25["JobsDropDownListView"] --> N590072ebdded["JobsMakes"]
  N6d6b05a78d25["JobsDropDownListView"] --> N4f073af73f73["JobsModel"]
  N6d6b05a78d25["JobsDropDownListView"] --> N6be7f32159cc["JobsModelDSL"]
  N6d6b05a78d25["JobsDropDownListView"] --> N018c2243ba9d["JobsOCDSL"]
  N6d6b05a78d25["JobsDropDownListView"] --> N0394efe9fe42["JobsOCDefs"]
  N6d6b05a78d25["JobsDropDownListView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N6d6b05a78d25["JobsDropDownListView"] --> Na65e59600826["JobsOCRuntimeKits"]
  N4b7420914260["JobsFiltrationView"] --> Nc5f7faa49a9e["JobsAppTools"]
  N4b7420914260["JobsFiltrationView"] --> Nab53e8669cd3["JobsBaseUI"]
  N4b7420914260["JobsFiltrationView"] --> N1df8cd4ff855["JobsBlock"]
  N4b7420914260["JobsFiltrationView"] --> N6672b574eed3["JobsHotLabel"]
  N4b7420914260["JobsFiltrationView"] --> N04d01727957b["JobsLanMgr"]
  N4b7420914260["JobsFiltrationView"] --> N590072ebdded["JobsMakes"]
  N4b7420914260["JobsFiltrationView"] --> N6be7f32159cc["JobsModelDSL"]
  N4b7420914260["JobsFiltrationView"] --> N018c2243ba9d["JobsOCDSL"]
  N4b7420914260["JobsFiltrationView"] --> N0394efe9fe42["JobsOCDefs"]
  N4b7420914260["JobsFiltrationView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N4b7420914260["JobsFiltrationView"] --> N78b271dac65c["XYColorOC"]
  N7ddf250cfc68["JobsFuseAnimation"] --> N1df8cd4ff855["JobsBlock"]
  N7ddf250cfc68["JobsFuseAnimation"] --> N590072ebdded["JobsMakes"]
  N7ddf250cfc68["JobsFuseAnimation"] --> N018c2243ba9d["JobsOCDSL"]
  N7ddf250cfc68["JobsFuseAnimation"] --> N0394efe9fe42["JobsOCDefs"]
  N7ddf250cfc68["JobsFuseAnimation"] --> Ndddad2cfcaac["JobsOCTimer"]
  N986e078dca69["JobsGestureLock"] --> Nab53e8669cd3["JobsBaseUI"]
  N986e078dca69["JobsGestureLock"] --> N1df8cd4ff855["JobsBlock"]
  N986e078dca69["JobsGestureLock"] --> N590072ebdded["JobsMakes"]
  N986e078dca69["JobsGestureLock"] --> N018c2243ba9d["JobsOCDSL"]
  N986e078dca69["JobsGestureLock"] --> N0394efe9fe42["JobsOCDefs"]
  N6672b574eed3["JobsHotLabel"] --> Nab53e8669cd3["JobsBaseUI"]
  N6672b574eed3["JobsHotLabel"] --> N1df8cd4ff855["JobsBlock"]
  N6672b574eed3["JobsHotLabel"] --> Nb81862f08afd["JobsByOCPods"]
  N6672b574eed3["JobsHotLabel"] --> N590072ebdded["JobsMakes"]
  N6672b574eed3["JobsHotLabel"] --> N6be7f32159cc["JobsModelDSL"]
  N6672b574eed3["JobsHotLabel"] --> N018c2243ba9d["JobsOCDSL"]
  N6672b574eed3["JobsHotLabel"] --> N0394efe9fe42["JobsOCDefs"]
  N6672b574eed3["JobsHotLabel"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nfc0e914631da["JobsIconfont"] --> N1df8cd4ff855["JobsBlock"]
  Nfc0e914631da["JobsIconfont"] --> N0394efe9fe42["JobsOCDefs"]
  N3a88a1607334["JobsImageNumberView"] --> Nab53e8669cd3["JobsBaseUI"]
  N3a88a1607334["JobsImageNumberView"] --> N1df8cd4ff855["JobsBlock"]
  N3a88a1607334["JobsImageNumberView"] --> Nb81862f08afd["JobsByOCPods"]
  N3a88a1607334["JobsImageNumberView"] --> N590072ebdded["JobsMakes"]
  N3a88a1607334["JobsImageNumberView"] --> N018c2243ba9d["JobsOCDSL"]
  N3a88a1607334["JobsImageNumberView"] --> N0394efe9fe42["JobsOCDefs"]
  N3a88a1607334["JobsImageNumberView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N01f9ce4ed41b["JobsImageRotation"] --> N1df8cd4ff855["JobsBlock"]
  N01f9ce4ed41b["JobsImageRotation"] --> N018c2243ba9d["JobsOCDSL"]
  N01f9ce4ed41b["JobsImageRotation"] --> N0394efe9fe42["JobsOCDefs"]
  N01f9ce4ed41b["JobsImageRotation"] --> Ndddad2cfcaac["JobsOCTimer"]
  N04d01727957b["JobsLanMgr"] --> N1df8cd4ff855["JobsBlock"]
  N04d01727957b["JobsLanMgr"] --> N0394efe9fe42["JobsOCDefs"]
  N04d01727957b["JobsLanMgr"] --> Ne65c588da9cd["JobsStringUtils"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Nc5f7faa49a9e["JobsAppTools"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Nab53e8669cd3["JobsBaseUI"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N1df8cd4ff855["JobsBlock"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Nb3ef9cb29680["JobsClass"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N04d01727957b["JobsLanMgr"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N590072ebdded["JobsMakes"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N6be7f32159cc["JobsModelDSL"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N018c2243ba9d["JobsOCDSL"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N0394efe9fe42["JobsOCDefs"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Ne65c588da9cd["JobsStringUtils"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N210688fa7a59["JobsTimeUtils"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N3476a8cdc1d9["TABAnimated"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N78b271dac65c["XYColorOC"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N445bb6c02ab7["YTKNetworkExtra"]
  N9cfe528cfb91["JobsLoadingImage"] --> N1df8cd4ff855["JobsBlock"]
  Nd6aa4d9abde6["JobsLocker"] --> N1df8cd4ff855["JobsBlock"]
  Nd6aa4d9abde6["JobsLocker"] --> N0394efe9fe42["JobsOCDefs"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> Nab53e8669cd3["JobsBaseUI"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> N1df8cd4ff855["JobsBlock"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> N018c2243ba9d["JobsOCDSL"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> N0394efe9fe42["JobsOCDefs"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> Ndddad2cfcaac["JobsOCTimer"]
  N590072ebdded["JobsMakes"] --> N1df8cd4ff855["JobsBlock"]
  N590072ebdded["JobsMakes"] --> N0394efe9fe42["JobsOCDefs"]
  N9e7dc84491e8["JobsMarqueeView"] --> N1df8cd4ff855["JobsBlock"]
  N9e7dc84491e8["JobsMarqueeView"] --> Nb81862f08afd["JobsByOCPods"]
  N9e7dc84491e8["JobsMarqueeView"] --> N0394efe9fe42["JobsOCDefs"]
  N9e7dc84491e8["JobsMarqueeView"] --> N091e7cb5cd1a["JobsOCTimerMgr"]
  N345646e1ffd7["JobsMenuView"] --> N1df8cd4ff855["JobsBlock"]
  N345646e1ffd7["JobsMenuView"] --> Nb81862f08afd["JobsByOCPods"]
  N345646e1ffd7["JobsMenuView"] --> Nd60fa915f486["JobsLinkageMenuView"]
  N345646e1ffd7["JobsMenuView"] --> N590072ebdded["JobsMakes"]
  N345646e1ffd7["JobsMenuView"] --> N018c2243ba9d["JobsOCDSL"]
  N345646e1ffd7["JobsMenuView"] --> N0394efe9fe42["JobsOCDefs"]
  N4f073af73f73["JobsModel"] --> Nc392171b969b["GTCaptcha4"]
  N4f073af73f73["JobsModel"] --> N1df8cd4ff855["JobsBlock"]
  N4f073af73f73["JobsModel"] --> Nb3ef9cb29680["JobsClass"]
  N4f073af73f73["JobsModel"] --> N04d01727957b["JobsLanMgr"]
  N4f073af73f73["JobsModel"] --> N9cfe528cfb91["JobsLoadingImage"]
  N4f073af73f73["JobsModel"] --> N590072ebdded["JobsMakes"]
  N4f073af73f73["JobsModel"] --> N0394efe9fe42["JobsOCDefs"]
  N4f073af73f73["JobsModel"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N4f073af73f73["JobsModel"] --> Ne65c588da9cd["JobsStringUtils"]
  N4f073af73f73["JobsModel"] --> N78b271dac65c["XYColorOC"]
  N6be7f32159cc["JobsModelDSL"] --> N1df8cd4ff855["JobsBlock"]
  N6be7f32159cc["JobsModelDSL"] --> N4f073af73f73["JobsModel"]
  N6be7f32159cc["JobsModelDSL"] --> N0394efe9fe42["JobsOCDefs"]
  N6be7f32159cc["JobsModelDSL"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nb1278635eafa["JobsMonitorNetwoking"] --> N1df8cd4ff855["JobsBlock"]
  Nb1278635eafa["JobsMonitorNetwoking"] --> N018c2243ba9d["JobsOCDSL"]
  Nb1278635eafa["JobsMonitorNetwoking"] --> N0394efe9fe42["JobsOCDefs"]
  Nb1278635eafa["JobsMonitorNetwoking"] --> Nf3b94b6ac482["JobsSuspend"]
  Nd9dbfc611984["JobsNavBar"] --> Nc5f7faa49a9e["JobsAppTools"]
  Nd9dbfc611984["JobsNavBar"] --> N1df8cd4ff855["JobsBlock"]
  Nd9dbfc611984["JobsNavBar"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nd9dbfc611984["JobsNavBar"] --> N04d01727957b["JobsLanMgr"]
  Nd9dbfc611984["JobsNavBar"] --> N590072ebdded["JobsMakes"]
  Nd9dbfc611984["JobsNavBar"] --> N6be7f32159cc["JobsModelDSL"]
  Nd9dbfc611984["JobsNavBar"] --> N018c2243ba9d["JobsOCDSL"]
  Nd9dbfc611984["JobsNavBar"] --> N0394efe9fe42["JobsOCDefs"]
  Nd9dbfc611984["JobsNavBar"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nd9dbfc611984["JobsNavBar"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nd9dbfc611984["JobsNavBar"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nd9dbfc611984["JobsNavBar"] --> Ne65c588da9cd["JobsStringUtils"]
  Nd9dbfc611984["JobsNavBar"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  Nd9dbfc611984["JobsNavBar"] --> N3476a8cdc1d9["TABAnimated"]
  Nd9dbfc611984["JobsNavBar"] --> N08b2a250a092["WHToastExtra"]
  Nd9dbfc611984["JobsNavBar"] --> N78b271dac65c["XYColorOC"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N23605d3c636b["FDFullscreenPopGesture"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nc5f7faa49a9e["JobsAppTools"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nab53e8669cd3["JobsBaseUI"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N1df8cd4ff855["JobsBlock"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nb3ef9cb29680["JobsClass"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N222be9ee417c["JobsDebug"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N04d01727957b["JobsLanMgr"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N9cfe528cfb91["JobsLoadingImage"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N590072ebdded["JobsMakes"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N6be7f32159cc["JobsModelDSL"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nd9dbfc611984["JobsNavBar"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N018c2243ba9d["JobsOCDSL"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N0394efe9fe42["JobsOCDefs"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Na65e59600826["JobsOCRuntimeKits"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nbc02b97f6aba["JobsOCSnowflake"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ncc282d5e1810["JobsRichTextUtils"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ne65c588da9cd["JobsStringUtils"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N210688fa7a59["JobsTimeUtils"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Na7770fd0750a["JobsViewNavigator"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N3476a8cdc1d9["TABAnimated"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N3e84d1e0eb01["TFPopup"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N08b2a250a092["WHToastExtra"]
  N18c94bbe12dd["JobsNetWorkTools"] --> N1df8cd4ff855["JobsBlock"]
  N18c94bbe12dd["JobsNetWorkTools"] --> N6be7f32159cc["JobsModelDSL"]
  N18c94bbe12dd["JobsNetWorkTools"] --> N0394efe9fe42["JobsOCDefs"]
  N18c94bbe12dd["JobsNetWorkTools"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N18c94bbe12dd["JobsNetWorkTools"] --> Ndddad2cfcaac["JobsOCTimer"]
  N459572160a1c["JobsOCAudioRecorder"] --> N1df8cd4ff855["JobsBlock"]
  N459572160a1c["JobsOCAudioRecorder"] --> N018c2243ba9d["JobsOCDSL"]
  N459572160a1c["JobsOCAudioRecorder"] --> N0394efe9fe42["JobsOCDefs"]
  N459572160a1c["JobsOCAudioRecorder"] --> Ndddad2cfcaac["JobsOCTimer"]
  N220743b9c0bc["JobsOCCalendar"] --> N1df8cd4ff855["JobsBlock"]
  N220743b9c0bc["JobsOCCalendar"] --> N590072ebdded["JobsMakes"]
  N220743b9c0bc["JobsOCCalendar"] --> N018c2243ba9d["JobsOCDSL"]
  N220743b9c0bc["JobsOCCalendar"] --> N0394efe9fe42["JobsOCDefs"]
  N84d9a7575a07["JobsOCComment"] --> Nab53e8669cd3["JobsBaseUI"]
  N84d9a7575a07["JobsOCComment"] --> N1df8cd4ff855["JobsBlock"]
  N84d9a7575a07["JobsOCComment"] --> N590072ebdded["JobsMakes"]
  N84d9a7575a07["JobsOCComment"] --> N018c2243ba9d["JobsOCDSL"]
  N84d9a7575a07["JobsOCComment"] --> N0394efe9fe42["JobsOCDefs"]
  N84d9a7575a07["JobsOCComment"] --> Nf75bc35bb2ad["JobsOCRefresher"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N1df8cd4ff855["JobsBlock"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> Nb81862f08afd["JobsByOCPods"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N04d01727957b["JobsLanMgr"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N018c2243ba9d["JobsOCDSL"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N0394efe9fe42["JobsOCDefs"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N78b271dac65c["XYColorOC"]
  N018c2243ba9d["JobsOCDSL"] --> Nad368d2952f0["FSCalendar"]
  N018c2243ba9d["JobsOCDSL"] --> N1df8cd4ff855["JobsBlock"]
  N018c2243ba9d["JobsOCDSL"] --> N590072ebdded["JobsMakes"]
  N018c2243ba9d["JobsOCDSL"] --> N6be7f32159cc["JobsModelDSL"]
  N018c2243ba9d["JobsOCDSL"] --> N0394efe9fe42["JobsOCDefs"]
  N018c2243ba9d["JobsOCDSL"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N018c2243ba9d["JobsOCDSL"] --> Na65e59600826["JobsOCRuntimeKits"]
  N018c2243ba9d["JobsOCDSL"] --> Ndddad2cfcaac["JobsOCTimer"]
  N018c2243ba9d["JobsOCDSL"] --> Na3e8ae43188a["Texture"]
  N0394efe9fe42["JobsOCDefs"] --> N1df8cd4ff855["JobsBlock"]
  N0394efe9fe42["JobsOCDefs"] --> N10ee0e68a559["JobsGetWindow"]
  N0394efe9fe42["JobsOCDefs"] --> Ne65c588da9cd["JobsStringUtils"]
  N0394efe9fe42["JobsOCDefs"] --> N78b271dac65c["XYColorOC"]
  Nd6d865286994["JobsOCExcel"] --> N1df8cd4ff855["JobsBlock"]
  Nd6d865286994["JobsOCExcel"] --> N590072ebdded["JobsMakes"]
  Nd6d865286994["JobsOCExcel"] --> N018c2243ba9d["JobsOCDSL"]
  Nd6d865286994["JobsOCExcel"] --> N0394efe9fe42["JobsOCDefs"]
  Nd6d865286994["JobsOCExcel"] --> N39c90393473f["JobsOCUILabelScrolling"]
  N43d3c978045a["JobsOCGraphicCaptcha"] --> N1df8cd4ff855["JobsBlock"]
  N43d3c978045a["JobsOCGraphicCaptcha"] --> N4f073af73f73["JobsModel"]
  N43d3c978045a["JobsOCGraphicCaptcha"] --> N6be7f32159cc["JobsModelDSL"]
  N43d3c978045a["JobsOCGraphicCaptcha"] --> N0394efe9fe42["JobsOCDefs"]
  N9599280b3643["JobsOCKeyboardMgr"] --> N1df8cd4ff855["JobsBlock"]
  N9599280b3643["JobsOCKeyboardMgr"] --> N018c2243ba9d["JobsOCDSL"]
  N9599280b3643["JobsOCKeyboardMgr"] --> N0394efe9fe42["JobsOCDefs"]
  Naf951c19c283["JobsOCMarkdown"] --> N1df8cd4ff855["JobsBlock"]
  Naf951c19c283["JobsOCMarkdown"] --> N590072ebdded["JobsMakes"]
  Naf951c19c283["JobsOCMarkdown"] --> N018c2243ba9d["JobsOCDSL"]
  Naf951c19c283["JobsOCMarkdown"] --> N0394efe9fe42["JobsOCDefs"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> Nab53e8669cd3["JobsBaseUI"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> N1df8cd4ff855["JobsBlock"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> N590072ebdded["JobsMakes"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> N018c2243ba9d["JobsOCDSL"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> N0394efe9fe42["JobsOCDefs"]
  N33b4c4623851["JobsOCOpen"] --> Nab53e8669cd3["JobsBaseUI"]
  N33b4c4623851["JobsOCOpen"] --> N1df8cd4ff855["JobsBlock"]
  N33b4c4623851["JobsOCOpen"] --> N10ee0e68a559["JobsGetWindow"]
  N33b4c4623851["JobsOCOpen"] --> N018c2243ba9d["JobsOCDSL"]
  N33b4c4623851["JobsOCOpen"] --> N0394efe9fe42["JobsOCDefs"]
  N33b4c4623851["JobsOCOpen"] --> Ne65c588da9cd["JobsStringUtils"]
  N7f281be01eb6["JobsOCPatch"] --> N1df8cd4ff855["JobsBlock"]
  N7f281be01eb6["JobsOCPatch"] --> N0394efe9fe42["JobsOCDefs"]
  Ncb2d118b07ea["JobsOCProtocols"] --> N1df8cd4ff855["JobsBlock"]
  Ncb2d118b07ea["JobsOCProtocols"] --> N0394efe9fe42["JobsOCDefs"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N1df8cd4ff855["JobsBlock"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N7ddf250cfc68["JobsFuseAnimation"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N04d01727957b["JobsLanMgr"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N590072ebdded["JobsMakes"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N018c2243ba9d["JobsOCDSL"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N0394efe9fe42["JobsOCDefs"]
  Na65e59600826["JobsOCRuntimeKits"] --> N1df8cd4ff855["JobsBlock"]
  Na65e59600826["JobsOCRuntimeKits"] --> Nb3ef9cb29680["JobsClass"]
  Na65e59600826["JobsOCRuntimeKits"] --> N04d01727957b["JobsLanMgr"]
  Na65e59600826["JobsOCRuntimeKits"] --> N590072ebdded["JobsMakes"]
  Na65e59600826["JobsOCRuntimeKits"] --> N6be7f32159cc["JobsModelDSL"]
  Na65e59600826["JobsOCRuntimeKits"] --> N0394efe9fe42["JobsOCDefs"]
  Na65e59600826["JobsOCRuntimeKits"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Na65e59600826["JobsOCRuntimeKits"] --> Nbc02b97f6aba["JobsOCSnowflake"]
  Na65e59600826["JobsOCRuntimeKits"] --> N3264ff988b83["JobsRandomUtils"]
  Na65e59600826["JobsOCRuntimeKits"] --> N08b2a250a092["WHToastExtra"]
  N3a0334fae65a["JobsOCSearcher"] --> Nab53e8669cd3["JobsBaseUI"]
  N3a0334fae65a["JobsOCSearcher"] --> N1df8cd4ff855["JobsBlock"]
  N3a0334fae65a["JobsOCSearcher"] --> N590072ebdded["JobsMakes"]
  N3a0334fae65a["JobsOCSearcher"] --> N018c2243ba9d["JobsOCDSL"]
  N3a0334fae65a["JobsOCSearcher"] --> N0394efe9fe42["JobsOCDefs"]
  N5adfa4de5117["JobsOCSkeletonView"] --> N1df8cd4ff855["JobsBlock"]
  N5adfa4de5117["JobsOCSkeletonView"] --> N018c2243ba9d["JobsOCDSL"]
  N5adfa4de5117["JobsOCSkeletonView"] --> N0394efe9fe42["JobsOCDefs"]
  Nbc02b97f6aba["JobsOCSnowflake"] --> N1df8cd4ff855["JobsBlock"]
  Nbc02b97f6aba["JobsOCSnowflake"] --> N0394efe9fe42["JobsOCDefs"]
  N0c2b78161683["JobsOCSplash"] --> N1df8cd4ff855["JobsBlock"]
  N0c2b78161683["JobsOCSplash"] --> Nb81862f08afd["JobsByOCPods"]
  N0c2b78161683["JobsOCSplash"] --> N590072ebdded["JobsMakes"]
  N0c2b78161683["JobsOCSplash"] --> N018c2243ba9d["JobsOCDSL"]
  N0c2b78161683["JobsOCSplash"] --> N0394efe9fe42["JobsOCDefs"]
  N0c2b78161683["JobsOCSplash"] --> Ndddad2cfcaac["JobsOCTimer"]
  Ndddad2cfcaac["JobsOCTimer"] --> N1df8cd4ff855["JobsBlock"]
  Ndddad2cfcaac["JobsOCTimer"] --> N04d01727957b["JobsLanMgr"]
  Ndddad2cfcaac["JobsOCTimer"] --> N590072ebdded["JobsMakes"]
  Ndddad2cfcaac["JobsOCTimer"] --> N0394efe9fe42["JobsOCDefs"]
  Ndddad2cfcaac["JobsOCTimer"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Ndddad2cfcaac["JobsOCTimer"] --> Ne65c588da9cd["JobsStringUtils"]
  Ndddad2cfcaac["JobsOCTimer"] --> N08b2a250a092["WHToastExtra"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> N1df8cd4ff855["JobsBlock"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> N590072ebdded["JobsMakes"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> N0394efe9fe42["JobsOCDefs"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> Ndddad2cfcaac["JobsOCTimer"]
  N823afb3a9d17["JobsOCTools"] --> N898a2c117de4["AFSecurityPolicyExtra"]
  N823afb3a9d17["JobsOCTools"] --> N23605d3c636b["FDFullscreenPopGesture"]
  N823afb3a9d17["JobsOCTools"] --> Nb92440121e0d["FMDatabaseExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nad368d2952f0["FSCalendar"]
  N823afb3a9d17["JobsOCTools"] --> N5580487ca546["FSCalendarExtra"]
  N823afb3a9d17["JobsOCTools"] --> N1560a1ad96e5["GKCustomNavigationBarExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nbf16aa830c40["HTMLDocumentExtra"]
  N823afb3a9d17["JobsOCTools"] --> N797f568867e8["HXPhotoManagerExtra"]
  N823afb3a9d17["JobsOCTools"] --> N9115d69cc676["HXPhotoViewExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nfae4768a9e4e["IQKeyboardManagerExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nab09bafb4a60["JXCategoryViewExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nc5f7faa49a9e["JobsAppTools"]
  N823afb3a9d17["JobsOCTools"] --> Nab53e8669cd3["JobsBaseUI"]
  N823afb3a9d17["JobsOCTools"] --> N1df8cd4ff855["JobsBlock"]
  N823afb3a9d17["JobsOCTools"] --> Nb81862f08afd["JobsByOCPods"]
  N823afb3a9d17["JobsOCTools"] --> N6f44574f4279["JobsCountdownBtn"]
  N823afb3a9d17["JobsOCTools"] --> N5cbdf62fdef4["JobsCryptography"]
  N823afb3a9d17["JobsOCTools"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N823afb3a9d17["JobsOCTools"] --> N7ddf250cfc68["JobsFuseAnimation"]
  N823afb3a9d17["JobsOCTools"] --> N6672b574eed3["JobsHotLabel"]
  N823afb3a9d17["JobsOCTools"] --> N04d01727957b["JobsLanMgr"]
  N823afb3a9d17["JobsOCTools"] --> N9cfe528cfb91["JobsLoadingImage"]
  N823afb3a9d17["JobsOCTools"] --> N590072ebdded["JobsMakes"]
  N823afb3a9d17["JobsOCTools"] --> N6be7f32159cc["JobsModelDSL"]
  N823afb3a9d17["JobsOCTools"] --> N75ef9d14c110["JobsOCCountryCodeCtrl"]
  N823afb3a9d17["JobsOCTools"] --> N018c2243ba9d["JobsOCDSL"]
  N823afb3a9d17["JobsOCTools"] --> N0394efe9fe42["JobsOCDefs"]
  N823afb3a9d17["JobsOCTools"] --> N43d3c978045a["JobsOCGraphicCaptcha"]
  N823afb3a9d17["JobsOCTools"] --> N9599280b3643["JobsOCKeyboardMgr"]
  N823afb3a9d17["JobsOCTools"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N823afb3a9d17["JobsOCTools"] --> Na65e59600826["JobsOCRuntimeKits"]
  N823afb3a9d17["JobsOCTools"] --> Ndddad2cfcaac["JobsOCTimer"]
  N823afb3a9d17["JobsOCTools"] --> Ne65c588da9cd["JobsStringUtils"]
  N823afb3a9d17["JobsOCTools"] --> Nf3b94b6ac482["JobsSuspend"]
  N823afb3a9d17["JobsOCTools"] --> N6954ddb01407["LMJDropdownMenuExtra"]
  N823afb3a9d17["JobsOCTools"] --> N709c11016a1f["MGSwipeTableCellExtra"]
  N823afb3a9d17["JobsOCTools"] --> N812111e15467["RACExtra"]
  N823afb3a9d17["JobsOCTools"] --> N6a2432b8d4d5["ReachabilityExtra"]
  N823afb3a9d17["JobsOCTools"] --> N72f8fe5d8652["SRWebSocketExtra"]
  N823afb3a9d17["JobsOCTools"] --> N7c1d94750a78["SZTextViewExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nd1f9f41f868b["TFPopupExtra"]
  N823afb3a9d17["JobsOCTools"] --> N78b271dac65c["XYColorOC"]
  N823afb3a9d17["JobsOCTools"] --> N53b4ffc64c52["ZFPlayerExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nc93bf4111366["ZMJCellExtra"]
  N39c90393473f["JobsOCUILabelScrolling"] --> N1df8cd4ff855["JobsBlock"]
  N39c90393473f["JobsOCUILabelScrolling"] --> N018c2243ba9d["JobsOCDSL"]
  N39c90393473f["JobsOCUILabelScrolling"] --> N0394efe9fe42["JobsOCDefs"]
  N39c90393473f["JobsOCUILabelScrolling"] --> Ndddad2cfcaac["JobsOCTimer"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> N1df8cd4ff855["JobsBlock"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> Nb81862f08afd["JobsByOCPods"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> N590072ebdded["JobsMakes"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> N018c2243ba9d["JobsOCDSL"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> N0394efe9fe42["JobsOCDefs"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> Nd56f06af52fd["TKPermissionKit"]
  N3b7ac27837fb["JobsOCWebSocket"] --> N1df8cd4ff855["JobsBlock"]
  N3b7ac27837fb["JobsOCWebSocket"] --> N0394efe9fe42["JobsOCDefs"]
  N3b7ac27837fb["JobsOCWebSocket"] --> N72f8fe5d8652["SRWebSocketExtra"]
  N9972bdad7441["JobsPresentTransitionMgr"] --> N1df8cd4ff855["JobsBlock"]
  N9972bdad7441["JobsPresentTransitionMgr"] --> N590072ebdded["JobsMakes"]
  N9972bdad7441["JobsPresentTransitionMgr"] --> N018c2243ba9d["JobsOCDSL"]
  N9972bdad7441["JobsPresentTransitionMgr"] --> N0394efe9fe42["JobsOCDefs"]
  Na62a2c62f899["JobsProgressBar"] --> N1df8cd4ff855["JobsBlock"]
  Na62a2c62f899["JobsProgressBar"] --> N590072ebdded["JobsMakes"]
  Na62a2c62f899["JobsProgressBar"] --> N018c2243ba9d["JobsOCDSL"]
  Na62a2c62f899["JobsProgressBar"] --> N0394efe9fe42["JobsOCDefs"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N1df8cd4ff855["JobsBlock"]
  Ncc282d5e1810["JobsRichTextUtils"] --> Nb3ef9cb29680["JobsClass"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N04d01727957b["JobsLanMgr"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N590072ebdded["JobsMakes"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N6be7f32159cc["JobsModelDSL"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N018c2243ba9d["JobsOCDSL"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N0394efe9fe42["JobsOCDefs"]
  Ncc282d5e1810["JobsRichTextUtils"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Ncc282d5e1810["JobsRichTextUtils"] --> Ne65c588da9cd["JobsStringUtils"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N78b271dac65c["XYColorOC"]
  Ncda689e68d60["JobsScreenCapture"] --> N1df8cd4ff855["JobsBlock"]
  Ncda689e68d60["JobsScreenCapture"] --> N590072ebdded["JobsMakes"]
  Ncda689e68d60["JobsScreenCapture"] --> N018c2243ba9d["JobsOCDSL"]
  Ncda689e68d60["JobsScreenCapture"] --> N0394efe9fe42["JobsOCDefs"]
  Nf3b94b6ac482["JobsSuspend"] --> Nab53e8669cd3["JobsBaseUI"]
  Nf3b94b6ac482["JobsSuspend"] --> N1df8cd4ff855["JobsBlock"]
  Nf3b94b6ac482["JobsSuspend"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nf3b94b6ac482["JobsSuspend"] --> N04d01727957b["JobsLanMgr"]
  Nf3b94b6ac482["JobsSuspend"] --> N9cfe528cfb91["JobsLoadingImage"]
  Nf3b94b6ac482["JobsSuspend"] --> N6be7f32159cc["JobsModelDSL"]
  Nf3b94b6ac482["JobsSuspend"] --> N018c2243ba9d["JobsOCDSL"]
  Nf3b94b6ac482["JobsSuspend"] --> N0394efe9fe42["JobsOCDefs"]
  Nf3b94b6ac482["JobsSuspend"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nf3b94b6ac482["JobsSuspend"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nf3b94b6ac482["JobsSuspend"] --> N78b271dac65c["XYColorOC"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> Nab53e8669cd3["JobsBaseUI"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> N1df8cd4ff855["JobsBlock"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> Nb81862f08afd["JobsByOCPods"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> N590072ebdded["JobsMakes"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> N018c2243ba9d["JobsOCDSL"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> N0394efe9fe42["JobsOCDefs"]
  N210688fa7a59["JobsTimeUtils"] --> N1df8cd4ff855["JobsBlock"]
  N210688fa7a59["JobsTimeUtils"] --> Nb3ef9cb29680["JobsClass"]
  N210688fa7a59["JobsTimeUtils"] --> N590072ebdded["JobsMakes"]
  N210688fa7a59["JobsTimeUtils"] --> N6be7f32159cc["JobsModelDSL"]
  N210688fa7a59["JobsTimeUtils"] --> N018c2243ba9d["JobsOCDSL"]
  N210688fa7a59["JobsTimeUtils"] --> N0394efe9fe42["JobsOCDefs"]
  N210688fa7a59["JobsTimeUtils"] --> Ne65c588da9cd["JobsStringUtils"]
  N210688fa7a59["JobsTimeUtils"] --> N08b2a250a092["WHToastExtra"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> Nab53e8669cd3["JobsBaseUI"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N1df8cd4ff855["JobsBlock"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> Nb81862f08afd["JobsByOCPods"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N04d01727957b["JobsLanMgr"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N590072ebdded["JobsMakes"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N018c2243ba9d["JobsOCDSL"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N0394efe9fe42["JobsOCDefs"]
  Na7770fd0750a["JobsViewNavigator"] --> N1df8cd4ff855["JobsBlock"]
  Na7770fd0750a["JobsViewNavigator"] --> N590072ebdded["JobsMakes"]
  Na7770fd0750a["JobsViewNavigator"] --> N018c2243ba9d["JobsOCDSL"]
  Na7770fd0750a["JobsViewNavigator"] --> N0394efe9fe42["JobsOCDefs"]
  Nc82869dc3347["JobsViewPush"] --> N1df8cd4ff855["JobsBlock"]
  Nc82869dc3347["JobsViewPush"] --> N018c2243ba9d["JobsOCDSL"]
  Nc82869dc3347["JobsViewPush"] --> N0394efe9fe42["JobsOCDefs"]
  N6b8d5419148e["JobsWallet"] --> Nab53e8669cd3["JobsBaseUI"]
  N6b8d5419148e["JobsWallet"] --> N1df8cd4ff855["JobsBlock"]
  N6b8d5419148e["JobsWallet"] --> N590072ebdded["JobsMakes"]
  N6b8d5419148e["JobsWallet"] --> N4f073af73f73["JobsModel"]
  N6b8d5419148e["JobsWallet"] --> N018c2243ba9d["JobsOCDSL"]
  N6b8d5419148e["JobsWallet"] --> N0394efe9fe42["JobsOCDefs"]
  N6b8d5419148e["JobsWallet"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N6b8d5419148e["JobsWallet"] --> N78b271dac65c["XYColorOC"]
  N6954ddb01407["LMJDropdownMenuExtra"] --> N1df8cd4ff855["JobsBlock"]
  N6954ddb01407["LMJDropdownMenuExtra"] --> N018c2243ba9d["JobsOCDSL"]
  N6954ddb01407["LMJDropdownMenuExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N709c11016a1f["MGSwipeTableCellExtra"] --> N1df8cd4ff855["JobsBlock"]
  N709c11016a1f["MGSwipeTableCellExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N1df8cd4ff855["JobsBlock"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N04d01727957b["JobsLanMgr"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N9cfe528cfb91["JobsLoadingImage"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N590072ebdded["JobsMakes"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N6be7f32159cc["JobsModelDSL"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> Na65e59600826["JobsOCRuntimeKits"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> Ne65c588da9cd["JobsStringUtils"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N3476a8cdc1d9["TABAnimated"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N08b2a250a092["WHToastExtra"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N78b271dac65c["XYColorOC"]
  N6a2432b8d4d5["ReachabilityExtra"] --> N1df8cd4ff855["JobsBlock"]
  N6a2432b8d4d5["ReachabilityExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N72f8fe5d8652["SRWebSocketExtra"] --> N1df8cd4ff855["JobsBlock"]
  N72f8fe5d8652["SRWebSocketExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N1df8cd4ff855["JobsBlock"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N04d01727957b["JobsLanMgr"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N6be7f32159cc["JobsModelDSL"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> Na65e59600826["JobsOCRuntimeKits"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N08b2a250a092["WHToastExtra"]
  N7c1d94750a78["SZTextViewExtra"] --> N1df8cd4ff855["JobsBlock"]
  N7c1d94750a78["SZTextViewExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N3e84d1e0eb01["TFPopup"] --> N1df8cd4ff855["JobsBlock"]
  N3e84d1e0eb01["TFPopup"] --> N0394efe9fe42["JobsOCDefs"]
  Nd1f9f41f868b["TFPopupExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nd1f9f41f868b["TFPopupExtra"] --> Nb81862f08afd["JobsByOCPods"]
  Nd1f9f41f868b["TFPopupExtra"] --> Nca8124599275["JobsCustomView"]
  Nd1f9f41f868b["TFPopupExtra"] --> N4b7420914260["JobsFiltrationView"]
  Nd1f9f41f868b["TFPopupExtra"] --> N6be7f32159cc["JobsModelDSL"]
  Nd1f9f41f868b["TFPopupExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Nd1f9f41f868b["TFPopupExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nd1f9f41f868b["TFPopupExtra"] --> N3e84d1e0eb01["TFPopup"]
  Nd56f06af52fd["TKPermissionKit"] --> N1df8cd4ff855["JobsBlock"]
  Nd56f06af52fd["TKPermissionKit"] --> Nb81862f08afd["JobsByOCPods"]
  Nd56f06af52fd["TKPermissionKit"] --> N04d01727957b["JobsLanMgr"]
  Nd56f06af52fd["TKPermissionKit"] --> N0394efe9fe42["JobsOCDefs"]
  N9e7748a2dba5["UIBaseTextFieldDSL"] --> Nab53e8669cd3["JobsBaseUI"]
  N9e7748a2dba5["UIBaseTextFieldDSL"] --> N1df8cd4ff855["JobsBlock"]
  N9e7748a2dba5["UIBaseTextFieldDSL"] --> N0394efe9fe42["JobsOCDefs"]
  N08b2a250a092["WHToastExtra"] --> N1df8cd4ff855["JobsBlock"]
  N08b2a250a092["WHToastExtra"] --> Nb3ef9cb29680["JobsClass"]
  N08b2a250a092["WHToastExtra"] --> N04d01727957b["JobsLanMgr"]
  N08b2a250a092["WHToastExtra"] --> N590072ebdded["JobsMakes"]
  N08b2a250a092["WHToastExtra"] --> N6be7f32159cc["JobsModelDSL"]
  N08b2a250a092["WHToastExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N08b2a250a092["WHToastExtra"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N08b2a250a092["WHToastExtra"] --> N78b271dac65c["XYColorOC"]
  Nab6d2d183fde["WMZCode"] --> N1df8cd4ff855["JobsBlock"]
  Nab6d2d183fde["WMZCode"] --> Nb81862f08afd["JobsByOCPods"]
  Nab6d2d183fde["WMZCode"] --> N590072ebdded["JobsMakes"]
  Nab6d2d183fde["WMZCode"] --> N0394efe9fe42["JobsOCDefs"]
  Nab6d2d183fde["WMZCode"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N1df8cd4ff855["JobsBlock"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N04d01727957b["JobsLanMgr"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N590072ebdded["JobsMakes"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N6be7f32159cc["JobsModelDSL"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N018c2243ba9d["JobsOCDSL"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N445bb6c02ab7["YTKNetworkExtra"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N445bb6c02ab7["YTKNetworkExtra"] --> Ne65c588da9cd["JobsStringUtils"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N210688fa7a59["JobsTimeUtils"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N08b2a250a092["WHToastExtra"]
  N53b4ffc64c52["ZFPlayerExtra"] --> Nab53e8669cd3["JobsBaseUI"]
  N53b4ffc64c52["ZFPlayerExtra"] --> N1df8cd4ff855["JobsBlock"]
  N53b4ffc64c52["ZFPlayerExtra"] --> N018c2243ba9d["JobsOCDSL"]
  N53b4ffc64c52["ZFPlayerExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nc93bf4111366["ZMJCellExtra"] --> Nab53e8669cd3["JobsBaseUI"]
  Nc93bf4111366["ZMJCellExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nc93bf4111366["ZMJCellExtra"] --> N590072ebdded["JobsMakes"]
  Nc93bf4111366["ZMJCellExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Nc93bf4111366["ZMJCellExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N1322c50635fd["ZWPullMenuView"] --> Nb81862f08afd["JobsByOCPods"]
```

## 六、全部依赖图 Mermaid <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```mermaid
flowchart LR
  N898a2c117de4["AFSecurityPolicyExtra"] --> Na75d452377f3["AFNetworking"]
  N898a2c117de4["AFSecurityPolicyExtra"] --> N1df8cd4ff855["JobsBlock"]
  N898a2c117de4["AFSecurityPolicyExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nf545e7022087["BRPickerView"] --> N6be7f32159cc["JobsModelDSL"]
  N3b5551b6877a["BRPickerViewExtra"] --> Nf545e7022087["BRPickerView"]
  N3b5551b6877a["BRPickerViewExtra"] --> N1df8cd4ff855["JobsBlock"]
  N3b5551b6877a["BRPickerViewExtra"] --> N04d01727957b["JobsLanMgr"]
  N3b5551b6877a["BRPickerViewExtra"] --> N590072ebdded["JobsMakes"]
  N3b5551b6877a["BRPickerViewExtra"] --> N6be7f32159cc["JobsModelDSL"]
  N3b5551b6877a["BRPickerViewExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N3b5551b6877a["BRPickerViewExtra"] --> N78b271dac65c["XYColorOC"]
  N23605d3c636b["FDFullscreenPopGesture"] --> N1df8cd4ff855["JobsBlock"]
  N23605d3c636b["FDFullscreenPopGesture"] --> N0394efe9fe42["JobsOCDefs"]
  Nb92440121e0d["FMDatabaseExtra"] --> Nf4e5de9d3d73["FMDB"]
  Nb92440121e0d["FMDatabaseExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nb92440121e0d["FMDatabaseExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nb92440121e0d["FMDatabaseExtra"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nad368d2952f0["FSCalendar"] --> N1df8cd4ff855["JobsBlock"]
  Nad368d2952f0["FSCalendar"] --> N590072ebdded["JobsMakes"]
  Nad368d2952f0["FSCalendar"] --> N0394efe9fe42["JobsOCDefs"]
  N5580487ca546["FSCalendarExtra"] --> Nad368d2952f0["FSCalendar"]
  N5580487ca546["FSCalendarExtra"] --> N1df8cd4ff855["JobsBlock"]
  N5580487ca546["FSCalendarExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N14fe593262c8["FileFolderHandleTool"] --> N1df8cd4ff855["JobsBlock"]
  N14fe593262c8["FileFolderHandleTool"] --> Nb81862f08afd["JobsByOCPods"]
  N14fe593262c8["FileFolderHandleTool"] --> N590072ebdded["JobsMakes"]
  N14fe593262c8["FileFolderHandleTool"] --> N6be7f32159cc["JobsModelDSL"]
  N14fe593262c8["FileFolderHandleTool"] --> N0394efe9fe42["JobsOCDefs"]
  N14fe593262c8["FileFolderHandleTool"] --> N20eef833ce4a["TXFileOperation"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ne367971cb8c1["GKNavigationBar"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Nab53e8669cd3["JobsBaseUI"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N1df8cd4ff855["JobsBlock"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N04d01727957b["JobsLanMgr"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N590072ebdded["JobsMakes"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N6be7f32159cc["JobsModelDSL"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N018c2243ba9d["JobsOCDSL"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Na65e59600826["JobsOCRuntimeKits"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ncc282d5e1810["JobsRichTextUtils"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ne65c588da9cd["JobsStringUtils"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N8ab384f265d0["MJExtension"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N0fbdcc518572["MJRefresh"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Naa47777dc638["Masonry"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N3476a8cdc1d9["TABAnimated"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N78b271dac65c["XYColorOC"]
  N1560a1ad96e5["GKCustomNavigationBarExtra"] --> N42769027b2d6["XZMRefresh"]
  Nbf16aa830c40["HTMLDocumentExtra"] --> N2d8b6ea128b0["HTMLReader"]
  Nbf16aa830c40["HTMLDocumentExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nbf16aa830c40["HTMLDocumentExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N797f568867e8["HXPhotoManagerExtra"] --> N90f81e089744["HXPhotoPickerObjC"]
  N797f568867e8["HXPhotoManagerExtra"] --> N1df8cd4ff855["JobsBlock"]
  N797f568867e8["HXPhotoManagerExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N9115d69cc676["HXPhotoViewExtra"] --> N90f81e089744["HXPhotoPickerObjC"]
  N9115d69cc676["HXPhotoViewExtra"] --> N1df8cd4ff855["JobsBlock"]
  N9115d69cc676["HXPhotoViewExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nfae4768a9e4e["IQKeyboardManagerExtra"] --> N8a0c9ab189ce["IQKeyboardManager"]
  Nfae4768a9e4e["IQKeyboardManagerExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nfae4768a9e4e["IQKeyboardManagerExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> N552e8eccd1bc["JXCategoryView"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> Nb50f0954f50e["JXPagingView"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> N590072ebdded["JobsMakes"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Nab09bafb4a60["JXCategoryViewExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N24debe9de845["JobsAPIs"] --> N1df8cd4ff855["JobsBlock"]
  N24debe9de845["JobsAPIs"] --> Nb3ef9cb29680["JobsClass"]
  N24debe9de845["JobsAPIs"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N24debe9de845["JobsAPIs"] --> N04d01727957b["JobsLanMgr"]
  N24debe9de845["JobsAPIs"] --> N6be7f32159cc["JobsModelDSL"]
  N24debe9de845["JobsAPIs"] --> N0394efe9fe42["JobsOCDefs"]
  N24debe9de845["JobsAPIs"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N24debe9de845["JobsAPIs"] --> Ne65c588da9cd["JobsStringUtils"]
  N24debe9de845["JobsAPIs"] --> N210688fa7a59["JobsTimeUtils"]
  N24debe9de845["JobsAPIs"] --> N8ab384f265d0["MJExtension"]
  N24debe9de845["JobsAPIs"] --> N20eef833ce4a["TXFileOperation"]
  N24debe9de845["JobsAPIs"] --> N77631ca4f0e0["This"]
  N24debe9de845["JobsAPIs"] --> N08b2a250a092["WHToastExtra"]
  N24debe9de845["JobsAPIs"] --> N14727719233d["YTKNetwork"]
  N24debe9de845["JobsAPIs"] --> N445bb6c02ab7["YTKNetworkExtra"]
  N4f58ddb65c39["JobsAppDoor"] --> Nab53e8669cd3["JobsBaseUI"]
  N4f58ddb65c39["JobsAppDoor"] --> N1df8cd4ff855["JobsBlock"]
  N4f58ddb65c39["JobsAppDoor"] --> Nb81862f08afd["JobsByOCPods"]
  N4f58ddb65c39["JobsAppDoor"] --> N6f44574f4279["JobsCountdownBtn"]
  N4f58ddb65c39["JobsAppDoor"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N4f58ddb65c39["JobsAppDoor"] --> N7ddf250cfc68["JobsFuseAnimation"]
  N4f58ddb65c39["JobsAppDoor"] --> N6672b574eed3["JobsHotLabel"]
  N4f58ddb65c39["JobsAppDoor"] --> N04d01727957b["JobsLanMgr"]
  N4f58ddb65c39["JobsAppDoor"] --> N590072ebdded["JobsMakes"]
  N4f58ddb65c39["JobsAppDoor"] --> N4f073af73f73["JobsModel"]
  N4f58ddb65c39["JobsAppDoor"] --> N6be7f32159cc["JobsModelDSL"]
  N4f58ddb65c39["JobsAppDoor"] --> N75ef9d14c110["JobsOCCountryCodeCtrl"]
  N4f58ddb65c39["JobsAppDoor"] --> N018c2243ba9d["JobsOCDSL"]
  N4f58ddb65c39["JobsAppDoor"] --> N0394efe9fe42["JobsOCDefs"]
  N4f58ddb65c39["JobsAppDoor"] --> N43d3c978045a["JobsOCGraphicCaptcha"]
  N4f58ddb65c39["JobsAppDoor"] --> N9599280b3643["JobsOCKeyboardMgr"]
  N4f58ddb65c39["JobsAppDoor"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N4f58ddb65c39["JobsAppDoor"] --> N823afb3a9d17["JobsOCTools"]
  N4f58ddb65c39["JobsAppDoor"] --> Naa47777dc638["Masonry"]
  N4f58ddb65c39["JobsAppDoor"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  N4f58ddb65c39["JobsAppDoor"] --> N9e7748a2dba5["UIBaseTextFieldDSL"]
  N4f58ddb65c39["JobsAppDoor"] --> N78b271dac65c["XYColorOC"]
  N4f58ddb65c39["JobsAppDoor"] --> Nfe492d71a912["ZFPlayer"]
  N4f58ddb65c39["JobsAppDoor"] --> N53b4ffc64c52["ZFPlayerExtra"]
  Nc5f7faa49a9e["JobsAppTools"] --> N1df8cd4ff855["JobsBlock"]
  Nc5f7faa49a9e["JobsAppTools"] --> Nb3ef9cb29680["JobsClass"]
  Nc5f7faa49a9e["JobsAppTools"] --> N04d01727957b["JobsLanMgr"]
  Nc5f7faa49a9e["JobsAppTools"] --> N590072ebdded["JobsMakes"]
  Nc5f7faa49a9e["JobsAppTools"] --> N6be7f32159cc["JobsModelDSL"]
  Nc5f7faa49a9e["JobsAppTools"] --> N018c2243ba9d["JobsOCDSL"]
  Nc5f7faa49a9e["JobsAppTools"] --> N0394efe9fe42["JobsOCDefs"]
  Nc5f7faa49a9e["JobsAppTools"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nc5f7faa49a9e["JobsAppTools"] --> Ne65c588da9cd["JobsStringUtils"]
  Nc5f7faa49a9e["JobsAppTools"] --> N8ab384f265d0["MJExtension"]
  Nc5f7faa49a9e["JobsAppTools"] --> N78b271dac65c["XYColorOC"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Nc5f7faa49a9e["JobsAppTools"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N1df8cd4ff855["JobsBlock"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Nb3ef9cb29680["JobsClass"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N04d01727957b["JobsLanMgr"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N590072ebdded["JobsMakes"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N6be7f32159cc["JobsModelDSL"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N018c2243ba9d["JobsOCDSL"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N0394efe9fe42["JobsOCDefs"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Na65e59600826["JobsOCRuntimeKits"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Ncc282d5e1810["JobsRichTextUtils"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Ne65c588da9cd["JobsStringUtils"]
  N4976a4ac7fe9["JobsBasePopupView"] --> Naa47777dc638["Masonry"]
  N4976a4ac7fe9["JobsBasePopupView"] --> N08b2a250a092["WHToastExtra"]
  Nab53e8669cd3["JobsBaseUI"] --> Ne367971cb8c1["GKNavigationBar"]
  Nab53e8669cd3["JobsBaseUI"] --> Nc5f7faa49a9e["JobsAppTools"]
  Nab53e8669cd3["JobsBaseUI"] --> N4976a4ac7fe9["JobsBasePopupView"]
  Nab53e8669cd3["JobsBaseUI"] --> N1df8cd4ff855["JobsBlock"]
  Nab53e8669cd3["JobsBaseUI"] --> Nb3ef9cb29680["JobsClass"]
  Nab53e8669cd3["JobsBaseUI"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nab53e8669cd3["JobsBaseUI"] --> N04d01727957b["JobsLanMgr"]
  Nab53e8669cd3["JobsBaseUI"] --> N9cfe528cfb91["JobsLoadingImage"]
  Nab53e8669cd3["JobsBaseUI"] --> N590072ebdded["JobsMakes"]
  Nab53e8669cd3["JobsBaseUI"] --> N6be7f32159cc["JobsModelDSL"]
  Nab53e8669cd3["JobsBaseUI"] --> Nd9dbfc611984["JobsNavBar"]
  Nab53e8669cd3["JobsBaseUI"] --> N018c2243ba9d["JobsOCDSL"]
  Nab53e8669cd3["JobsBaseUI"] --> N0394efe9fe42["JobsOCDefs"]
  Nab53e8669cd3["JobsBaseUI"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nab53e8669cd3["JobsBaseUI"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nab53e8669cd3["JobsBaseUI"] --> N3264ff988b83["JobsRandomUtils"]
  Nab53e8669cd3["JobsBaseUI"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nab53e8669cd3["JobsBaseUI"] --> Ne65c588da9cd["JobsStringUtils"]
  Nab53e8669cd3["JobsBaseUI"] --> N210688fa7a59["JobsTimeUtils"]
  Nab53e8669cd3["JobsBaseUI"] --> N8ab384f265d0["MJExtension"]
  Nab53e8669cd3["JobsBaseUI"] --> N0fbdcc518572["MJRefresh"]
  Nab53e8669cd3["JobsBaseUI"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  Nab53e8669cd3["JobsBaseUI"] --> Naa47777dc638["Masonry"]
  Nab53e8669cd3["JobsBaseUI"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  Nab53e8669cd3["JobsBaseUI"] --> N7c1d94750a78["SZTextViewExtra"]
  Nab53e8669cd3["JobsBaseUI"] --> N3476a8cdc1d9["TABAnimated"]
  Nab53e8669cd3["JobsBaseUI"] --> N77631ca4f0e0["This"]
  Nab53e8669cd3["JobsBaseUI"] --> N08b2a250a092["WHToastExtra"]
  Nab53e8669cd3["JobsBaseUI"] --> N78b271dac65c["XYColorOC"]
  Nab53e8669cd3["JobsBaseUI"] --> N42769027b2d6["XZMRefresh"]
  Nab53e8669cd3["JobsBaseUI"] --> N71d0944e102a["lottie-ios"]
  Na69255208fcb["JobsBioKit"] --> N1df8cd4ff855["JobsBlock"]
  Na69255208fcb["JobsBioKit"] --> N0394efe9fe42["JobsOCDefs"]
  N73b30f5870cb["JobsBitsMonitor"] --> N1df8cd4ff855["JobsBlock"]
  N73b30f5870cb["JobsBitsMonitor"] --> Nb81862f08afd["JobsByOCPods"]
  N73b30f5870cb["JobsBitsMonitor"] --> N04d01727957b["JobsLanMgr"]
  N73b30f5870cb["JobsBitsMonitor"] --> N6be7f32159cc["JobsModelDSL"]
  N73b30f5870cb["JobsBitsMonitor"] --> N18c94bbe12dd["JobsNetWorkTools"]
  N73b30f5870cb["JobsBitsMonitor"] --> N018c2243ba9d["JobsOCDSL"]
  N73b30f5870cb["JobsBitsMonitor"] --> N0394efe9fe42["JobsOCDefs"]
  N73b30f5870cb["JobsBitsMonitor"] --> Nf3b94b6ac482["JobsSuspend"]
  N73b30f5870cb["JobsBitsMonitor"] --> N1322c50635fd["ZWPullMenuView"]
  N1df8cd4ff855["JobsBlock"] --> N1173b6117a2c["SDWebImage"]
  N996702c26fbe["JobsBluetooth"] --> N1df8cd4ff855["JobsBlock"]
  N996702c26fbe["JobsBluetooth"] --> N0394efe9fe42["JobsOCDefs"]
  Nb81862f08afd["JobsByOCPods"] --> Nf545e7022087["BRPickerView"]
  Nb81862f08afd["JobsByOCPods"] --> N3b5551b6877a["BRPickerViewExtra"]
  Nb81862f08afd["JobsByOCPods"] --> Nde605d320f8b["DeviceKit"]
  Nb81862f08afd["JobsByOCPods"] --> Nf4e5de9d3d73["FMDB"]
  Nb81862f08afd["JobsByOCPods"] --> Nad368d2952f0["FSCalendar"]
  Nb81862f08afd["JobsByOCPods"] --> N1560a1ad96e5["GKCustomNavigationBarExtra"]
  Nb81862f08afd["JobsByOCPods"] --> Ne367971cb8c1["GKNavigationBar"]
  Nb81862f08afd["JobsByOCPods"] --> N475398cdf4e8["GKPhotoBrowser"]
  Nb81862f08afd["JobsByOCPods"] --> N8a0c9ab189ce["IQKeyboardManager"]
  Nb81862f08afd["JobsByOCPods"] --> N8c9f7c5c71d9["JPImageresizerView"]
  Nb81862f08afd["JobsByOCPods"] --> N552e8eccd1bc["JXCategoryView"]
  Nb81862f08afd["JobsByOCPods"] --> Nb50f0954f50e["JXPagingView"]
  Nb81862f08afd["JobsByOCPods"] --> N24debe9de845["JobsAPIs"]
  Nb81862f08afd["JobsByOCPods"] --> Nc5f7faa49a9e["JobsAppTools"]
  Nb81862f08afd["JobsByOCPods"] --> Nab53e8669cd3["JobsBaseUI"]
  Nb81862f08afd["JobsByOCPods"] --> N1df8cd4ff855["JobsBlock"]
  Nb81862f08afd["JobsByOCPods"] --> Nb3ef9cb29680["JobsClass"]
  Nb81862f08afd["JobsByOCPods"] --> N222be9ee417c["JobsDebug"]
  Nb81862f08afd["JobsByOCPods"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nb81862f08afd["JobsByOCPods"] --> N6d6b05a78d25["JobsDropDownListView"]
  Nb81862f08afd["JobsByOCPods"] --> N04d01727957b["JobsLanMgr"]
  Nb81862f08afd["JobsByOCPods"] --> N590072ebdded["JobsMakes"]
  Nb81862f08afd["JobsByOCPods"] --> N6be7f32159cc["JobsModelDSL"]
  Nb81862f08afd["JobsByOCPods"] --> N320bdff0b837["JobsNavigationTransitionMgr"]
  Nb81862f08afd["JobsByOCPods"] --> N018c2243ba9d["JobsOCDSL"]
  Nb81862f08afd["JobsByOCPods"] --> N0394efe9fe42["JobsOCDefs"]
  Nb81862f08afd["JobsByOCPods"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nb81862f08afd["JobsByOCPods"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nb81862f08afd["JobsByOCPods"] --> Nbc02b97f6aba["JobsOCSnowflake"]
  Nb81862f08afd["JobsByOCPods"] --> Ndddad2cfcaac["JobsOCTimer"]
  Nb81862f08afd["JobsByOCPods"] --> N3264ff988b83["JobsRandomUtils"]
  Nb81862f08afd["JobsByOCPods"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nb81862f08afd["JobsByOCPods"] --> Ne65c588da9cd["JobsStringUtils"]
  Nb81862f08afd["JobsByOCPods"] --> N210688fa7a59["JobsTimeUtils"]
  Nb81862f08afd["JobsByOCPods"] --> Na7770fd0750a["JobsViewNavigator"]
  Nb81862f08afd["JobsByOCPods"] --> N8e916e2ec79c["MGSwipeTableCell"]
  Nb81862f08afd["JobsByOCPods"] --> N8ab384f265d0["MJExtension"]
  Nb81862f08afd["JobsByOCPods"] --> N0fbdcc518572["MJRefresh"]
  Nb81862f08afd["JobsByOCPods"] --> Naa47777dc638["Masonry"]
  Nb81862f08afd["JobsByOCPods"] --> Nc998c270059a["PPBadgeView"]
  Nb81862f08afd["JobsByOCPods"] --> Nc79782e896e5["Reachability"]
  Nb81862f08afd["JobsByOCPods"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  Nb81862f08afd["JobsByOCPods"] --> N1173b6117a2c["SDWebImage"]
  Nb81862f08afd["JobsByOCPods"] --> Nbbe23e77453f["SZTextView"]
  Nb81862f08afd["JobsByOCPods"] --> Na934c317befe["SocketRocket"]
  Nb81862f08afd["JobsByOCPods"] --> N3476a8cdc1d9["TABAnimated"]
  Nb81862f08afd["JobsByOCPods"] --> N3e84d1e0eb01["TFPopup"]
  Nb81862f08afd["JobsByOCPods"] --> N20eef833ce4a["TXFileOperation"]
  Nb81862f08afd["JobsByOCPods"] --> N77631ca4f0e0["This"]
  Nb81862f08afd["JobsByOCPods"] --> Nf76330ced775["UITextView+Placeholder"]
  Nb81862f08afd["JobsByOCPods"] --> N17f3f0525bc1["WHToast"]
  Nb81862f08afd["JobsByOCPods"] --> N08b2a250a092["WHToastExtra"]
  Nb81862f08afd["JobsByOCPods"] --> N78b271dac65c["XYColorOC"]
  Nb81862f08afd["JobsByOCPods"] --> N42769027b2d6["XZMRefresh"]
  Nb81862f08afd["JobsByOCPods"] --> N445bb6c02ab7["YTKNetworkExtra"]
  Nb81862f08afd["JobsByOCPods"] --> N001f7163efd0["YYImage"]
  Nb81862f08afd["JobsByOCPods"] --> Ncd4126ca9727["ZBNetworking"]
  Nb81862f08afd["JobsByOCPods"] --> Nfe492d71a912["ZFPlayer"]
  Nb81862f08afd["JobsByOCPods"] --> N53b4ffc64c52["ZFPlayerExtra"]
  Nb81862f08afd["JobsByOCPods"] --> Ndda2a7afc7e7["ZMJGanttChart"]
  Nb81862f08afd["JobsByOCPods"] --> N71d0944e102a["lottie-ios"]
  Nb7992c83f5f2["JobsCallBackBlockDSL"] --> N1df8cd4ff855["JobsBlock"]
  Nb7992c83f5f2["JobsCallBackBlockDSL"] --> N0394efe9fe42["JobsOCDefs"]
  Nb3ef9cb29680["JobsClass"] --> N1df8cd4ff855["JobsBlock"]
  Nb3ef9cb29680["JobsClass"] --> N0394efe9fe42["JobsOCDefs"]
  Nb3ef9cb29680["JobsClass"] --> N8ab384f265d0["MJExtension"]
  N0c0a38e86b25["JobsClockView"] --> N1df8cd4ff855["JobsBlock"]
  N0c0a38e86b25["JobsClockView"] --> N590072ebdded["JobsMakes"]
  N0c0a38e86b25["JobsClockView"] --> N018c2243ba9d["JobsOCDSL"]
  N0c0a38e86b25["JobsClockView"] --> N0394efe9fe42["JobsOCDefs"]
  N0c0a38e86b25["JobsClockView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N0c0a38e86b25["JobsClockView"] --> Ndddad2cfcaac["JobsOCTimer"]
  N6f44574f4279["JobsCountdownBtn"] --> N1df8cd4ff855["JobsBlock"]
  N6f44574f4279["JobsCountdownBtn"] --> Nb81862f08afd["JobsByOCPods"]
  N6f44574f4279["JobsCountdownBtn"] --> N04d01727957b["JobsLanMgr"]
  N6f44574f4279["JobsCountdownBtn"] --> N0394efe9fe42["JobsOCDefs"]
  N6f44574f4279["JobsCountdownBtn"] --> Ndddad2cfcaac["JobsOCTimer"]
  N5cbdf62fdef4["JobsCryptography"] --> N1df8cd4ff855["JobsBlock"]
  N5cbdf62fdef4["JobsCryptography"] --> Nb81862f08afd["JobsByOCPods"]
  N5cbdf62fdef4["JobsCryptography"] --> N590072ebdded["JobsMakes"]
  N5cbdf62fdef4["JobsCryptography"] --> N0394efe9fe42["JobsOCDefs"]
  Nca8124599275["JobsCustomView"] --> Nf545e7022087["BRPickerView"]
  Nca8124599275["JobsCustomView"] --> N3b5551b6877a["BRPickerViewExtra"]
  Nca8124599275["JobsCustomView"] --> Nab53e8669cd3["JobsBaseUI"]
  Nca8124599275["JobsCustomView"] --> N1df8cd4ff855["JobsBlock"]
  Nca8124599275["JobsCustomView"] --> Nb3ef9cb29680["JobsClass"]
  Nca8124599275["JobsCustomView"] --> N04d01727957b["JobsLanMgr"]
  Nca8124599275["JobsCustomView"] --> N590072ebdded["JobsMakes"]
  Nca8124599275["JobsCustomView"] --> N6be7f32159cc["JobsModelDSL"]
  Nca8124599275["JobsCustomView"] --> N018c2243ba9d["JobsOCDSL"]
  Nca8124599275["JobsCustomView"] --> N0394efe9fe42["JobsOCDefs"]
  Nca8124599275["JobsCustomView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nca8124599275["JobsCustomView"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nca8124599275["JobsCustomView"] --> Ne65c588da9cd["JobsStringUtils"]
  Nca8124599275["JobsCustomView"] --> N8ab384f265d0["MJExtension"]
  Nca8124599275["JobsCustomView"] --> N0fbdcc518572["MJRefresh"]
  Nca8124599275["JobsCustomView"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  Nca8124599275["JobsCustomView"] --> Naa47777dc638["Masonry"]
  Nca8124599275["JobsCustomView"] --> Nc79782e896e5["Reachability"]
  Nca8124599275["JobsCustomView"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  Nca8124599275["JobsCustomView"] --> N3476a8cdc1d9["TABAnimated"]
  Nca8124599275["JobsCustomView"] --> N20eef833ce4a["TXFileOperation"]
  Nca8124599275["JobsCustomView"] --> N77631ca4f0e0["This"]
  Nca8124599275["JobsCustomView"] --> N78b271dac65c["XYColorOC"]
  Nca8124599275["JobsCustomView"] --> N42769027b2d6["XZMRefresh"]
  Nca8124599275["JobsCustomView"] --> N445bb6c02ab7["YTKNetworkExtra"]
  N222be9ee417c["JobsDebug"] --> N1df8cd4ff855["JobsBlock"]
  N222be9ee417c["JobsDebug"] --> N04d01727957b["JobsLanMgr"]
  N222be9ee417c["JobsDebug"] --> N590072ebdded["JobsMakes"]
  N222be9ee417c["JobsDebug"] --> N018c2243ba9d["JobsOCDSL"]
  N222be9ee417c["JobsDebug"] --> N0394efe9fe42["JobsOCDefs"]
  N222be9ee417c["JobsDebug"] --> Ne65c588da9cd["JobsStringUtils"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Na75d452377f3["AFNetworking"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N1df8cd4ff855["JobsBlock"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Nb3ef9cb29680["JobsClass"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N04d01727957b["JobsLanMgr"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N590072ebdded["JobsMakes"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N6be7f32159cc["JobsModelDSL"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N018c2243ba9d["JobsOCDSL"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N0394efe9fe42["JobsOCDefs"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Ncc282d5e1810["JobsRichTextUtils"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Ne65c588da9cd["JobsStringUtils"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N8ab384f265d0["MJExtension"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Naa47777dc638["Masonry"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N20eef833ce4a["TXFileOperation"]
  N9b73f18b8a4c["JobsDeviceInfo"] --> N14727719233d["YTKNetwork"]
  N6d6b05a78d25["JobsDropDownListView"] --> Nab53e8669cd3["JobsBaseUI"]
  N6d6b05a78d25["JobsDropDownListView"] --> N1df8cd4ff855["JobsBlock"]
  N6d6b05a78d25["JobsDropDownListView"] --> Nb3ef9cb29680["JobsClass"]
  N6d6b05a78d25["JobsDropDownListView"] --> N04d01727957b["JobsLanMgr"]
  N6d6b05a78d25["JobsDropDownListView"] --> N590072ebdded["JobsMakes"]
  N6d6b05a78d25["JobsDropDownListView"] --> N4f073af73f73["JobsModel"]
  N6d6b05a78d25["JobsDropDownListView"] --> N6be7f32159cc["JobsModelDSL"]
  N6d6b05a78d25["JobsDropDownListView"] --> N018c2243ba9d["JobsOCDSL"]
  N6d6b05a78d25["JobsDropDownListView"] --> N0394efe9fe42["JobsOCDefs"]
  N6d6b05a78d25["JobsDropDownListView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N6d6b05a78d25["JobsDropDownListView"] --> Na65e59600826["JobsOCRuntimeKits"]
  N6d6b05a78d25["JobsDropDownListView"] --> N0fbdcc518572["MJRefresh"]
  N4b7420914260["JobsFiltrationView"] --> Nc5f7faa49a9e["JobsAppTools"]
  N4b7420914260["JobsFiltrationView"] --> Nab53e8669cd3["JobsBaseUI"]
  N4b7420914260["JobsFiltrationView"] --> N1df8cd4ff855["JobsBlock"]
  N4b7420914260["JobsFiltrationView"] --> N6672b574eed3["JobsHotLabel"]
  N4b7420914260["JobsFiltrationView"] --> N04d01727957b["JobsLanMgr"]
  N4b7420914260["JobsFiltrationView"] --> N590072ebdded["JobsMakes"]
  N4b7420914260["JobsFiltrationView"] --> N6be7f32159cc["JobsModelDSL"]
  N4b7420914260["JobsFiltrationView"] --> N018c2243ba9d["JobsOCDSL"]
  N4b7420914260["JobsFiltrationView"] --> N0394efe9fe42["JobsOCDefs"]
  N4b7420914260["JobsFiltrationView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N4b7420914260["JobsFiltrationView"] --> Naa47777dc638["Masonry"]
  N4b7420914260["JobsFiltrationView"] --> N78b271dac65c["XYColorOC"]
  N7ddf250cfc68["JobsFuseAnimation"] --> N1df8cd4ff855["JobsBlock"]
  N7ddf250cfc68["JobsFuseAnimation"] --> N590072ebdded["JobsMakes"]
  N7ddf250cfc68["JobsFuseAnimation"] --> N018c2243ba9d["JobsOCDSL"]
  N7ddf250cfc68["JobsFuseAnimation"] --> N0394efe9fe42["JobsOCDefs"]
  N7ddf250cfc68["JobsFuseAnimation"] --> Ndddad2cfcaac["JobsOCTimer"]
  N7ddf250cfc68["JobsFuseAnimation"] --> N71d0944e102a["lottie-ios"]
  N986e078dca69["JobsGestureLock"] --> Nab53e8669cd3["JobsBaseUI"]
  N986e078dca69["JobsGestureLock"] --> N1df8cd4ff855["JobsBlock"]
  N986e078dca69["JobsGestureLock"] --> N590072ebdded["JobsMakes"]
  N986e078dca69["JobsGestureLock"] --> N018c2243ba9d["JobsOCDSL"]
  N986e078dca69["JobsGestureLock"] --> N0394efe9fe42["JobsOCDefs"]
  N6672b574eed3["JobsHotLabel"] --> Nab53e8669cd3["JobsBaseUI"]
  N6672b574eed3["JobsHotLabel"] --> N1df8cd4ff855["JobsBlock"]
  N6672b574eed3["JobsHotLabel"] --> Nb81862f08afd["JobsByOCPods"]
  N6672b574eed3["JobsHotLabel"] --> N590072ebdded["JobsMakes"]
  N6672b574eed3["JobsHotLabel"] --> N6be7f32159cc["JobsModelDSL"]
  N6672b574eed3["JobsHotLabel"] --> N018c2243ba9d["JobsOCDSL"]
  N6672b574eed3["JobsHotLabel"] --> N0394efe9fe42["JobsOCDefs"]
  N6672b574eed3["JobsHotLabel"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nfc0e914631da["JobsIconfont"] --> N1df8cd4ff855["JobsBlock"]
  Nfc0e914631da["JobsIconfont"] --> N0394efe9fe42["JobsOCDefs"]
  Nfc0e914631da["JobsIconfont"] --> N1173b6117a2c["SDWebImage"]
  N3a88a1607334["JobsImageNumberView"] --> Nab53e8669cd3["JobsBaseUI"]
  N3a88a1607334["JobsImageNumberView"] --> N1df8cd4ff855["JobsBlock"]
  N3a88a1607334["JobsImageNumberView"] --> Nb81862f08afd["JobsByOCPods"]
  N3a88a1607334["JobsImageNumberView"] --> N590072ebdded["JobsMakes"]
  N3a88a1607334["JobsImageNumberView"] --> N018c2243ba9d["JobsOCDSL"]
  N3a88a1607334["JobsImageNumberView"] --> N0394efe9fe42["JobsOCDefs"]
  N3a88a1607334["JobsImageNumberView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N01f9ce4ed41b["JobsImageRotation"] --> N1df8cd4ff855["JobsBlock"]
  N01f9ce4ed41b["JobsImageRotation"] --> N018c2243ba9d["JobsOCDSL"]
  N01f9ce4ed41b["JobsImageRotation"] --> N0394efe9fe42["JobsOCDefs"]
  N01f9ce4ed41b["JobsImageRotation"] --> Ndddad2cfcaac["JobsOCTimer"]
  N04d01727957b["JobsLanMgr"] --> N1df8cd4ff855["JobsBlock"]
  N04d01727957b["JobsLanMgr"] --> N0394efe9fe42["JobsOCDefs"]
  N04d01727957b["JobsLanMgr"] --> Ne65c588da9cd["JobsStringUtils"]
  N04d01727957b["JobsLanMgr"] --> N1173b6117a2c["SDWebImage"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Nc5f7faa49a9e["JobsAppTools"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Nab53e8669cd3["JobsBaseUI"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N1df8cd4ff855["JobsBlock"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Nb3ef9cb29680["JobsClass"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N04d01727957b["JobsLanMgr"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N590072ebdded["JobsMakes"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N6be7f32159cc["JobsModelDSL"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N018c2243ba9d["JobsOCDSL"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N0394efe9fe42["JobsOCDefs"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Ne65c588da9cd["JobsStringUtils"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N210688fa7a59["JobsTimeUtils"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N8ab384f265d0["MJExtension"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N0fbdcc518572["MJRefresh"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Naa47777dc638["Masonry"]
  Nd60fa915f486["JobsLinkageMenuView"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N3476a8cdc1d9["TABAnimated"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N20eef833ce4a["TXFileOperation"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N78b271dac65c["XYColorOC"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N42769027b2d6["XZMRefresh"]
  Nd60fa915f486["JobsLinkageMenuView"] --> N445bb6c02ab7["YTKNetworkExtra"]
  N9cfe528cfb91["JobsLoadingImage"] --> N1df8cd4ff855["JobsBlock"]
  Nd6aa4d9abde6["JobsLocker"] --> N1df8cd4ff855["JobsBlock"]
  Nd6aa4d9abde6["JobsLocker"] --> N0394efe9fe42["JobsOCDefs"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> Nab53e8669cd3["JobsBaseUI"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> N1df8cd4ff855["JobsBlock"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> N018c2243ba9d["JobsOCDSL"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> N0394efe9fe42["JobsOCDefs"]
  N899875e07d1b["JobsLuckyEnvelopeRain"] --> Ndddad2cfcaac["JobsOCTimer"]
  N590072ebdded["JobsMakes"] --> N1df8cd4ff855["JobsBlock"]
  N590072ebdded["JobsMakes"] --> N0394efe9fe42["JobsOCDefs"]
  N9e7dc84491e8["JobsMarqueeView"] --> N1df8cd4ff855["JobsBlock"]
  N9e7dc84491e8["JobsMarqueeView"] --> Nb81862f08afd["JobsByOCPods"]
  N9e7dc84491e8["JobsMarqueeView"] --> N0394efe9fe42["JobsOCDefs"]
  N9e7dc84491e8["JobsMarqueeView"] --> N091e7cb5cd1a["JobsOCTimerMgr"]
  N9e7dc84491e8["JobsMarqueeView"] --> Naa47777dc638["Masonry"]
  N345646e1ffd7["JobsMenuView"] --> N1df8cd4ff855["JobsBlock"]
  N345646e1ffd7["JobsMenuView"] --> Nb81862f08afd["JobsByOCPods"]
  N345646e1ffd7["JobsMenuView"] --> Nd60fa915f486["JobsLinkageMenuView"]
  N345646e1ffd7["JobsMenuView"] --> N590072ebdded["JobsMakes"]
  N345646e1ffd7["JobsMenuView"] --> N018c2243ba9d["JobsOCDSL"]
  N345646e1ffd7["JobsMenuView"] --> N0394efe9fe42["JobsOCDefs"]
  N4f073af73f73["JobsModel"] --> Nc392171b969b["GTCaptcha4"]
  N4f073af73f73["JobsModel"] --> N90f81e089744["HXPhotoPickerObjC"]
  N4f073af73f73["JobsModel"] --> N1df8cd4ff855["JobsBlock"]
  N4f073af73f73["JobsModel"] --> Nb3ef9cb29680["JobsClass"]
  N4f073af73f73["JobsModel"] --> N04d01727957b["JobsLanMgr"]
  N4f073af73f73["JobsModel"] --> N9cfe528cfb91["JobsLoadingImage"]
  N4f073af73f73["JobsModel"] --> N590072ebdded["JobsMakes"]
  N4f073af73f73["JobsModel"] --> N0394efe9fe42["JobsOCDefs"]
  N4f073af73f73["JobsModel"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N4f073af73f73["JobsModel"] --> Ne65c588da9cd["JobsStringUtils"]
  N4f073af73f73["JobsModel"] --> N8ab384f265d0["MJExtension"]
  N4f073af73f73["JobsModel"] --> Naa47777dc638["Masonry"]
  N4f073af73f73["JobsModel"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  N4f073af73f73["JobsModel"] --> N1173b6117a2c["SDWebImage"]
  N4f073af73f73["JobsModel"] --> Nafad72d3cdc0["SPAlertController"]
  N4f073af73f73["JobsModel"] --> N78b271dac65c["XYColorOC"]
  N6be7f32159cc["JobsModelDSL"] --> N1df8cd4ff855["JobsBlock"]
  N6be7f32159cc["JobsModelDSL"] --> N4f073af73f73["JobsModel"]
  N6be7f32159cc["JobsModelDSL"] --> N0394efe9fe42["JobsOCDefs"]
  N6be7f32159cc["JobsModelDSL"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nb1278635eafa["JobsMonitorNetwoking"] --> N1df8cd4ff855["JobsBlock"]
  Nb1278635eafa["JobsMonitorNetwoking"] --> N018c2243ba9d["JobsOCDSL"]
  Nb1278635eafa["JobsMonitorNetwoking"] --> N0394efe9fe42["JobsOCDefs"]
  Nb1278635eafa["JobsMonitorNetwoking"] --> Nf3b94b6ac482["JobsSuspend"]
  Nd9dbfc611984["JobsNavBar"] --> Nc5f7faa49a9e["JobsAppTools"]
  Nd9dbfc611984["JobsNavBar"] --> N1df8cd4ff855["JobsBlock"]
  Nd9dbfc611984["JobsNavBar"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nd9dbfc611984["JobsNavBar"] --> N04d01727957b["JobsLanMgr"]
  Nd9dbfc611984["JobsNavBar"] --> N590072ebdded["JobsMakes"]
  Nd9dbfc611984["JobsNavBar"] --> N6be7f32159cc["JobsModelDSL"]
  Nd9dbfc611984["JobsNavBar"] --> N018c2243ba9d["JobsOCDSL"]
  Nd9dbfc611984["JobsNavBar"] --> N0394efe9fe42["JobsOCDefs"]
  Nd9dbfc611984["JobsNavBar"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Nd9dbfc611984["JobsNavBar"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nd9dbfc611984["JobsNavBar"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nd9dbfc611984["JobsNavBar"] --> Ne65c588da9cd["JobsStringUtils"]
  Nd9dbfc611984["JobsNavBar"] --> N8ab384f265d0["MJExtension"]
  Nd9dbfc611984["JobsNavBar"] --> N0fbdcc518572["MJRefresh"]
  Nd9dbfc611984["JobsNavBar"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  Nd9dbfc611984["JobsNavBar"] --> Naa47777dc638["Masonry"]
  Nd9dbfc611984["JobsNavBar"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  Nd9dbfc611984["JobsNavBar"] --> N3476a8cdc1d9["TABAnimated"]
  Nd9dbfc611984["JobsNavBar"] --> N08b2a250a092["WHToastExtra"]
  Nd9dbfc611984["JobsNavBar"] --> N78b271dac65c["XYColorOC"]
  Nd9dbfc611984["JobsNavBar"] --> N42769027b2d6["XZMRefresh"]
  Nd9dbfc611984["JobsNavBar"] --> N71d0944e102a["lottie-ios"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N23605d3c636b["FDFullscreenPopGesture"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ne367971cb8c1["GKNavigationBar"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N475398cdf4e8["GKPhotoBrowser"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nc5f7faa49a9e["JobsAppTools"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nab53e8669cd3["JobsBaseUI"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N1df8cd4ff855["JobsBlock"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nb3ef9cb29680["JobsClass"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N222be9ee417c["JobsDebug"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N04d01727957b["JobsLanMgr"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N9cfe528cfb91["JobsLoadingImage"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N590072ebdded["JobsMakes"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N6be7f32159cc["JobsModelDSL"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nd9dbfc611984["JobsNavBar"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N018c2243ba9d["JobsOCDSL"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N0394efe9fe42["JobsOCDefs"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Na65e59600826["JobsOCRuntimeKits"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Nbc02b97f6aba["JobsOCSnowflake"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ncc282d5e1810["JobsRichTextUtils"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ne65c588da9cd["JobsStringUtils"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N210688fa7a59["JobsTimeUtils"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Na7770fd0750a["JobsViewNavigator"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N8ab384f265d0["MJExtension"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N0fbdcc518572["MJRefresh"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ncf0c5ad1f11e["MJRefreshExtra"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Naa47777dc638["Masonry"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N1173b6117a2c["SDWebImage"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N3476a8cdc1d9["TABAnimated"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N3e84d1e0eb01["TFPopup"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N17f3f0525bc1["WHToast"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N08b2a250a092["WHToastExtra"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N42769027b2d6["XZMRefresh"]
  N320bdff0b837["JobsNavigationTransitionMgr"] --> N001f7163efd0["YYImage"]
  N18c94bbe12dd["JobsNetWorkTools"] --> N1df8cd4ff855["JobsBlock"]
  N18c94bbe12dd["JobsNetWorkTools"] --> N6be7f32159cc["JobsModelDSL"]
  N18c94bbe12dd["JobsNetWorkTools"] --> N0394efe9fe42["JobsOCDefs"]
  N18c94bbe12dd["JobsNetWorkTools"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N18c94bbe12dd["JobsNetWorkTools"] --> Ndddad2cfcaac["JobsOCTimer"]
  N459572160a1c["JobsOCAudioRecorder"] --> N1df8cd4ff855["JobsBlock"]
  N459572160a1c["JobsOCAudioRecorder"] --> N018c2243ba9d["JobsOCDSL"]
  N459572160a1c["JobsOCAudioRecorder"] --> N0394efe9fe42["JobsOCDefs"]
  N459572160a1c["JobsOCAudioRecorder"] --> Ndddad2cfcaac["JobsOCTimer"]
  N220743b9c0bc["JobsOCCalendar"] --> N1df8cd4ff855["JobsBlock"]
  N220743b9c0bc["JobsOCCalendar"] --> N590072ebdded["JobsMakes"]
  N220743b9c0bc["JobsOCCalendar"] --> N018c2243ba9d["JobsOCDSL"]
  N220743b9c0bc["JobsOCCalendar"] --> N0394efe9fe42["JobsOCDefs"]
  N84d9a7575a07["JobsOCComment"] --> Nab53e8669cd3["JobsBaseUI"]
  N84d9a7575a07["JobsOCComment"] --> N1df8cd4ff855["JobsBlock"]
  N84d9a7575a07["JobsOCComment"] --> N590072ebdded["JobsMakes"]
  N84d9a7575a07["JobsOCComment"] --> N018c2243ba9d["JobsOCDSL"]
  N84d9a7575a07["JobsOCComment"] --> N0394efe9fe42["JobsOCDefs"]
  N84d9a7575a07["JobsOCComment"] --> Nf75bc35bb2ad["JobsOCRefresher"]
  N84d9a7575a07["JobsOCComment"] --> Naa47777dc638["Masonry"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N1df8cd4ff855["JobsBlock"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> Nb81862f08afd["JobsByOCPods"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N04d01727957b["JobsLanMgr"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N018c2243ba9d["JobsOCDSL"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N0394efe9fe42["JobsOCDefs"]
  N75ef9d14c110["JobsOCCountryCodeCtrl"] --> N78b271dac65c["XYColorOC"]
  N018c2243ba9d["JobsOCDSL"] --> Nad368d2952f0["FSCalendar"]
  N018c2243ba9d["JobsOCDSL"] --> Ne367971cb8c1["GKNavigationBar"]
  N018c2243ba9d["JobsOCDSL"] --> N90f81e089744["HXPhotoPickerObjC"]
  N018c2243ba9d["JobsOCDSL"] --> N1df8cd4ff855["JobsBlock"]
  N018c2243ba9d["JobsOCDSL"] --> N590072ebdded["JobsMakes"]
  N018c2243ba9d["JobsOCDSL"] --> N6be7f32159cc["JobsModelDSL"]
  N018c2243ba9d["JobsOCDSL"] --> N0394efe9fe42["JobsOCDefs"]
  N018c2243ba9d["JobsOCDSL"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N018c2243ba9d["JobsOCDSL"] --> Na65e59600826["JobsOCRuntimeKits"]
  N018c2243ba9d["JobsOCDSL"] --> Ndddad2cfcaac["JobsOCTimer"]
  N018c2243ba9d["JobsOCDSL"] --> N0fbdcc518572["MJRefresh"]
  N018c2243ba9d["JobsOCDSL"] --> Naa47777dc638["Masonry"]
  N018c2243ba9d["JobsOCDSL"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  N018c2243ba9d["JobsOCDSL"] --> N1173b6117a2c["SDWebImage"]
  N018c2243ba9d["JobsOCDSL"] --> Na3e8ae43188a["Texture"]
  N018c2243ba9d["JobsOCDSL"] --> N14727719233d["YTKNetwork"]
  N018c2243ba9d["JobsOCDSL"] --> Nfe492d71a912["ZFPlayer"]
  N0394efe9fe42["JobsOCDefs"] --> Ne367971cb8c1["GKNavigationBar"]
  N0394efe9fe42["JobsOCDefs"] --> N1df8cd4ff855["JobsBlock"]
  N0394efe9fe42["JobsOCDefs"] --> N10ee0e68a559["JobsGetWindow"]
  N0394efe9fe42["JobsOCDefs"] --> Ne65c588da9cd["JobsStringUtils"]
  N0394efe9fe42["JobsOCDefs"] --> N78b271dac65c["XYColorOC"]
  N0394efe9fe42["JobsOCDefs"] --> N14727719233d["YTKNetwork"]
  Nd6d865286994["JobsOCExcel"] --> N1df8cd4ff855["JobsBlock"]
  Nd6d865286994["JobsOCExcel"] --> N590072ebdded["JobsMakes"]
  Nd6d865286994["JobsOCExcel"] --> N018c2243ba9d["JobsOCDSL"]
  Nd6d865286994["JobsOCExcel"] --> N0394efe9fe42["JobsOCDefs"]
  Nd6d865286994["JobsOCExcel"] --> N39c90393473f["JobsOCUILabelScrolling"]
  Nd6d865286994["JobsOCExcel"] --> Naa47777dc638["Masonry"]
  N43d3c978045a["JobsOCGraphicCaptcha"] --> N1df8cd4ff855["JobsBlock"]
  N43d3c978045a["JobsOCGraphicCaptcha"] --> N4f073af73f73["JobsModel"]
  N43d3c978045a["JobsOCGraphicCaptcha"] --> N6be7f32159cc["JobsModelDSL"]
  N43d3c978045a["JobsOCGraphicCaptcha"] --> N0394efe9fe42["JobsOCDefs"]
  N9599280b3643["JobsOCKeyboardMgr"] --> N1df8cd4ff855["JobsBlock"]
  N9599280b3643["JobsOCKeyboardMgr"] --> N018c2243ba9d["JobsOCDSL"]
  N9599280b3643["JobsOCKeyboardMgr"] --> N0394efe9fe42["JobsOCDefs"]
  Naf951c19c283["JobsOCMarkdown"] --> N1df8cd4ff855["JobsBlock"]
  Naf951c19c283["JobsOCMarkdown"] --> N590072ebdded["JobsMakes"]
  Naf951c19c283["JobsOCMarkdown"] --> N018c2243ba9d["JobsOCDSL"]
  Naf951c19c283["JobsOCMarkdown"] --> N0394efe9fe42["JobsOCDefs"]
  Naf951c19c283["JobsOCMarkdown"] --> Naa47777dc638["Masonry"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> Nab53e8669cd3["JobsBaseUI"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> N1df8cd4ff855["JobsBlock"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> N590072ebdded["JobsMakes"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> N018c2243ba9d["JobsOCDSL"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> N0394efe9fe42["JobsOCDefs"]
  N3945b9c1aa78["JobsOCNumberStepper"] --> Naa47777dc638["Masonry"]
  N33b4c4623851["JobsOCOpen"] --> Nab53e8669cd3["JobsBaseUI"]
  N33b4c4623851["JobsOCOpen"] --> N1df8cd4ff855["JobsBlock"]
  N33b4c4623851["JobsOCOpen"] --> N10ee0e68a559["JobsGetWindow"]
  N33b4c4623851["JobsOCOpen"] --> N018c2243ba9d["JobsOCDSL"]
  N33b4c4623851["JobsOCOpen"] --> N0394efe9fe42["JobsOCDefs"]
  N33b4c4623851["JobsOCOpen"] --> Ne65c588da9cd["JobsStringUtils"]
  N7f281be01eb6["JobsOCPatch"] --> N1df8cd4ff855["JobsBlock"]
  N7f281be01eb6["JobsOCPatch"] --> N0394efe9fe42["JobsOCDefs"]
  Ncb2d118b07ea["JobsOCProtocols"] --> N1df8cd4ff855["JobsBlock"]
  Ncb2d118b07ea["JobsOCProtocols"] --> N0394efe9fe42["JobsOCDefs"]
  Ncb2d118b07ea["JobsOCProtocols"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  Ncb2d118b07ea["JobsOCProtocols"] --> Nafad72d3cdc0["SPAlertController"]
  Ncb2d118b07ea["JobsOCProtocols"] --> N14727719233d["YTKNetwork"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N1df8cd4ff855["JobsBlock"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N7ddf250cfc68["JobsFuseAnimation"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N04d01727957b["JobsLanMgr"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N590072ebdded["JobsMakes"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N018c2243ba9d["JobsOCDSL"]
  Nf75bc35bb2ad["JobsOCRefresher"] --> N0394efe9fe42["JobsOCDefs"]
  Na65e59600826["JobsOCRuntimeKits"] --> N1df8cd4ff855["JobsBlock"]
  Na65e59600826["JobsOCRuntimeKits"] --> Nb3ef9cb29680["JobsClass"]
  Na65e59600826["JobsOCRuntimeKits"] --> N04d01727957b["JobsLanMgr"]
  Na65e59600826["JobsOCRuntimeKits"] --> N590072ebdded["JobsMakes"]
  Na65e59600826["JobsOCRuntimeKits"] --> N6be7f32159cc["JobsModelDSL"]
  Na65e59600826["JobsOCRuntimeKits"] --> N0394efe9fe42["JobsOCDefs"]
  Na65e59600826["JobsOCRuntimeKits"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Na65e59600826["JobsOCRuntimeKits"] --> Nbc02b97f6aba["JobsOCSnowflake"]
  Na65e59600826["JobsOCRuntimeKits"] --> N3264ff988b83["JobsRandomUtils"]
  Na65e59600826["JobsOCRuntimeKits"] --> N08b2a250a092["WHToastExtra"]
  N3a0334fae65a["JobsOCSearcher"] --> Nab53e8669cd3["JobsBaseUI"]
  N3a0334fae65a["JobsOCSearcher"] --> N1df8cd4ff855["JobsBlock"]
  N3a0334fae65a["JobsOCSearcher"] --> N590072ebdded["JobsMakes"]
  N3a0334fae65a["JobsOCSearcher"] --> N018c2243ba9d["JobsOCDSL"]
  N3a0334fae65a["JobsOCSearcher"] --> N0394efe9fe42["JobsOCDefs"]
  N3a0334fae65a["JobsOCSearcher"] --> Naa47777dc638["Masonry"]
  N5adfa4de5117["JobsOCSkeletonView"] --> N1df8cd4ff855["JobsBlock"]
  N5adfa4de5117["JobsOCSkeletonView"] --> N018c2243ba9d["JobsOCDSL"]
  N5adfa4de5117["JobsOCSkeletonView"] --> N0394efe9fe42["JobsOCDefs"]
  Nbc02b97f6aba["JobsOCSnowflake"] --> N1df8cd4ff855["JobsBlock"]
  Nbc02b97f6aba["JobsOCSnowflake"] --> N0394efe9fe42["JobsOCDefs"]
  N0c2b78161683["JobsOCSplash"] --> N1df8cd4ff855["JobsBlock"]
  N0c2b78161683["JobsOCSplash"] --> Nb81862f08afd["JobsByOCPods"]
  N0c2b78161683["JobsOCSplash"] --> N590072ebdded["JobsMakes"]
  N0c2b78161683["JobsOCSplash"] --> N018c2243ba9d["JobsOCDSL"]
  N0c2b78161683["JobsOCSplash"] --> N0394efe9fe42["JobsOCDefs"]
  N0c2b78161683["JobsOCSplash"] --> Ndddad2cfcaac["JobsOCTimer"]
  Ndddad2cfcaac["JobsOCTimer"] --> N1df8cd4ff855["JobsBlock"]
  Ndddad2cfcaac["JobsOCTimer"] --> N04d01727957b["JobsLanMgr"]
  Ndddad2cfcaac["JobsOCTimer"] --> N590072ebdded["JobsMakes"]
  Ndddad2cfcaac["JobsOCTimer"] --> N0394efe9fe42["JobsOCDefs"]
  Ndddad2cfcaac["JobsOCTimer"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Ndddad2cfcaac["JobsOCTimer"] --> Ne65c588da9cd["JobsStringUtils"]
  Ndddad2cfcaac["JobsOCTimer"] --> N1173b6117a2c["SDWebImage"]
  Ndddad2cfcaac["JobsOCTimer"] --> N17f3f0525bc1["WHToast"]
  Ndddad2cfcaac["JobsOCTimer"] --> N08b2a250a092["WHToastExtra"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> N1df8cd4ff855["JobsBlock"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> N590072ebdded["JobsMakes"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> N0394efe9fe42["JobsOCDefs"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N091e7cb5cd1a["JobsOCTimerMgr"] --> Ndddad2cfcaac["JobsOCTimer"]
  N823afb3a9d17["JobsOCTools"] --> N898a2c117de4["AFSecurityPolicyExtra"]
  N823afb3a9d17["JobsOCTools"] --> N23605d3c636b["FDFullscreenPopGesture"]
  N823afb3a9d17["JobsOCTools"] --> Nb92440121e0d["FMDatabaseExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nad368d2952f0["FSCalendar"]
  N823afb3a9d17["JobsOCTools"] --> N5580487ca546["FSCalendarExtra"]
  N823afb3a9d17["JobsOCTools"] --> N1560a1ad96e5["GKCustomNavigationBarExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nbf16aa830c40["HTMLDocumentExtra"]
  N823afb3a9d17["JobsOCTools"] --> N797f568867e8["HXPhotoManagerExtra"]
  N823afb3a9d17["JobsOCTools"] --> N9115d69cc676["HXPhotoViewExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nfae4768a9e4e["IQKeyboardManagerExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nab09bafb4a60["JXCategoryViewExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nc5f7faa49a9e["JobsAppTools"]
  N823afb3a9d17["JobsOCTools"] --> Nab53e8669cd3["JobsBaseUI"]
  N823afb3a9d17["JobsOCTools"] --> N1df8cd4ff855["JobsBlock"]
  N823afb3a9d17["JobsOCTools"] --> Nb81862f08afd["JobsByOCPods"]
  N823afb3a9d17["JobsOCTools"] --> N6f44574f4279["JobsCountdownBtn"]
  N823afb3a9d17["JobsOCTools"] --> N5cbdf62fdef4["JobsCryptography"]
  N823afb3a9d17["JobsOCTools"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  N823afb3a9d17["JobsOCTools"] --> N7ddf250cfc68["JobsFuseAnimation"]
  N823afb3a9d17["JobsOCTools"] --> N6672b574eed3["JobsHotLabel"]
  N823afb3a9d17["JobsOCTools"] --> N04d01727957b["JobsLanMgr"]
  N823afb3a9d17["JobsOCTools"] --> N9cfe528cfb91["JobsLoadingImage"]
  N823afb3a9d17["JobsOCTools"] --> N590072ebdded["JobsMakes"]
  N823afb3a9d17["JobsOCTools"] --> N6be7f32159cc["JobsModelDSL"]
  N823afb3a9d17["JobsOCTools"] --> N75ef9d14c110["JobsOCCountryCodeCtrl"]
  N823afb3a9d17["JobsOCTools"] --> N018c2243ba9d["JobsOCDSL"]
  N823afb3a9d17["JobsOCTools"] --> N0394efe9fe42["JobsOCDefs"]
  N823afb3a9d17["JobsOCTools"] --> N43d3c978045a["JobsOCGraphicCaptcha"]
  N823afb3a9d17["JobsOCTools"] --> N9599280b3643["JobsOCKeyboardMgr"]
  N823afb3a9d17["JobsOCTools"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N823afb3a9d17["JobsOCTools"] --> Na65e59600826["JobsOCRuntimeKits"]
  N823afb3a9d17["JobsOCTools"] --> Ndddad2cfcaac["JobsOCTimer"]
  N823afb3a9d17["JobsOCTools"] --> Ne65c588da9cd["JobsStringUtils"]
  N823afb3a9d17["JobsOCTools"] --> Nf3b94b6ac482["JobsSuspend"]
  N823afb3a9d17["JobsOCTools"] --> N6954ddb01407["LMJDropdownMenuExtra"]
  N823afb3a9d17["JobsOCTools"] --> N709c11016a1f["MGSwipeTableCellExtra"]
  N823afb3a9d17["JobsOCTools"] --> Naa47777dc638["Masonry"]
  N823afb3a9d17["JobsOCTools"] --> Nc998c270059a["PPBadgeView"]
  N823afb3a9d17["JobsOCTools"] --> N812111e15467["RACExtra"]
  N823afb3a9d17["JobsOCTools"] --> N6a2432b8d4d5["ReachabilityExtra"]
  N823afb3a9d17["JobsOCTools"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  N823afb3a9d17["JobsOCTools"] --> N72f8fe5d8652["SRWebSocketExtra"]
  N823afb3a9d17["JobsOCTools"] --> N7c1d94750a78["SZTextViewExtra"]
  N823afb3a9d17["JobsOCTools"] --> Na934c317befe["SocketRocket"]
  N823afb3a9d17["JobsOCTools"] --> Nd1f9f41f868b["TFPopupExtra"]
  N823afb3a9d17["JobsOCTools"] --> N78b271dac65c["XYColorOC"]
  N823afb3a9d17["JobsOCTools"] --> Nfe492d71a912["ZFPlayer"]
  N823afb3a9d17["JobsOCTools"] --> N53b4ffc64c52["ZFPlayerExtra"]
  N823afb3a9d17["JobsOCTools"] --> Nc93bf4111366["ZMJCellExtra"]
  N823afb3a9d17["JobsOCTools"] --> N71d0944e102a["lottie-ios"]
  N39c90393473f["JobsOCUILabelScrolling"] --> N1df8cd4ff855["JobsBlock"]
  N39c90393473f["JobsOCUILabelScrolling"] --> N018c2243ba9d["JobsOCDSL"]
  N39c90393473f["JobsOCUILabelScrolling"] --> N0394efe9fe42["JobsOCDefs"]
  N39c90393473f["JobsOCUILabelScrolling"] --> Ndddad2cfcaac["JobsOCTimer"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> N1df8cd4ff855["JobsBlock"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> Nb81862f08afd["JobsByOCPods"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> N590072ebdded["JobsMakes"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> N018c2243ba9d["JobsOCDSL"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> N0394efe9fe42["JobsOCDefs"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> Naa47777dc638["Masonry"]
  N56bdb96561c5["JobsOCVideoRecorder"] --> Nd56f06af52fd["TKPermissionKit"]
  N3b7ac27837fb["JobsOCWebSocket"] --> N1df8cd4ff855["JobsBlock"]
  N3b7ac27837fb["JobsOCWebSocket"] --> N0394efe9fe42["JobsOCDefs"]
  N3b7ac27837fb["JobsOCWebSocket"] --> N72f8fe5d8652["SRWebSocketExtra"]
  N3b7ac27837fb["JobsOCWebSocket"] --> Na934c317befe["SocketRocket"]
  N9972bdad7441["JobsPresentTransitionMgr"] --> N1df8cd4ff855["JobsBlock"]
  N9972bdad7441["JobsPresentTransitionMgr"] --> N590072ebdded["JobsMakes"]
  N9972bdad7441["JobsPresentTransitionMgr"] --> N018c2243ba9d["JobsOCDSL"]
  N9972bdad7441["JobsPresentTransitionMgr"] --> N0394efe9fe42["JobsOCDefs"]
  Na62a2c62f899["JobsProgressBar"] --> N1df8cd4ff855["JobsBlock"]
  Na62a2c62f899["JobsProgressBar"] --> N590072ebdded["JobsMakes"]
  Na62a2c62f899["JobsProgressBar"] --> N018c2243ba9d["JobsOCDSL"]
  Na62a2c62f899["JobsProgressBar"] --> N0394efe9fe42["JobsOCDefs"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N1df8cd4ff855["JobsBlock"]
  Ncc282d5e1810["JobsRichTextUtils"] --> Nb3ef9cb29680["JobsClass"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N04d01727957b["JobsLanMgr"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N590072ebdded["JobsMakes"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N6be7f32159cc["JobsModelDSL"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N018c2243ba9d["JobsOCDSL"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N0394efe9fe42["JobsOCDefs"]
  Ncc282d5e1810["JobsRichTextUtils"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Ncc282d5e1810["JobsRichTextUtils"] --> Ne65c588da9cd["JobsStringUtils"]
  Ncc282d5e1810["JobsRichTextUtils"] --> N78b271dac65c["XYColorOC"]
  Ncda689e68d60["JobsScreenCapture"] --> N1df8cd4ff855["JobsBlock"]
  Ncda689e68d60["JobsScreenCapture"] --> N590072ebdded["JobsMakes"]
  Ncda689e68d60["JobsScreenCapture"] --> N018c2243ba9d["JobsOCDSL"]
  Ncda689e68d60["JobsScreenCapture"] --> N0394efe9fe42["JobsOCDefs"]
  Ncda689e68d60["JobsScreenCapture"] --> Naa47777dc638["Masonry"]
  Nf3b94b6ac482["JobsSuspend"] --> Nab53e8669cd3["JobsBaseUI"]
  Nf3b94b6ac482["JobsSuspend"] --> N1df8cd4ff855["JobsBlock"]
  Nf3b94b6ac482["JobsSuspend"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Nf3b94b6ac482["JobsSuspend"] --> N04d01727957b["JobsLanMgr"]
  Nf3b94b6ac482["JobsSuspend"] --> N9cfe528cfb91["JobsLoadingImage"]
  Nf3b94b6ac482["JobsSuspend"] --> N6be7f32159cc["JobsModelDSL"]
  Nf3b94b6ac482["JobsSuspend"] --> N018c2243ba9d["JobsOCDSL"]
  Nf3b94b6ac482["JobsSuspend"] --> N0394efe9fe42["JobsOCDefs"]
  Nf3b94b6ac482["JobsSuspend"] --> Na65e59600826["JobsOCRuntimeKits"]
  Nf3b94b6ac482["JobsSuspend"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Nf3b94b6ac482["JobsSuspend"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  Nf3b94b6ac482["JobsSuspend"] --> N78b271dac65c["XYColorOC"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> Nab53e8669cd3["JobsBaseUI"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> N1df8cd4ff855["JobsBlock"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> Nb81862f08afd["JobsByOCPods"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> N590072ebdded["JobsMakes"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> N018c2243ba9d["JobsOCDSL"]
  Nfc43fcff1647["JobsTabBarCtrl"] --> N0394efe9fe42["JobsOCDefs"]
  N210688fa7a59["JobsTimeUtils"] --> N1df8cd4ff855["JobsBlock"]
  N210688fa7a59["JobsTimeUtils"] --> Nb3ef9cb29680["JobsClass"]
  N210688fa7a59["JobsTimeUtils"] --> N590072ebdded["JobsMakes"]
  N210688fa7a59["JobsTimeUtils"] --> N6be7f32159cc["JobsModelDSL"]
  N210688fa7a59["JobsTimeUtils"] --> N018c2243ba9d["JobsOCDSL"]
  N210688fa7a59["JobsTimeUtils"] --> N0394efe9fe42["JobsOCDefs"]
  N210688fa7a59["JobsTimeUtils"] --> Ne65c588da9cd["JobsStringUtils"]
  N210688fa7a59["JobsTimeUtils"] --> N08b2a250a092["WHToastExtra"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> Nab53e8669cd3["JobsBaseUI"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N1df8cd4ff855["JobsBlock"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> Nb81862f08afd["JobsByOCPods"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N04d01727957b["JobsLanMgr"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N590072ebdded["JobsMakes"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N018c2243ba9d["JobsOCDSL"]
  Nbfe2f418dfb1["JobsUploadingProgressView"] --> N0394efe9fe42["JobsOCDefs"]
  Na7770fd0750a["JobsViewNavigator"] --> N1df8cd4ff855["JobsBlock"]
  Na7770fd0750a["JobsViewNavigator"] --> N590072ebdded["JobsMakes"]
  Na7770fd0750a["JobsViewNavigator"] --> N018c2243ba9d["JobsOCDSL"]
  Na7770fd0750a["JobsViewNavigator"] --> N0394efe9fe42["JobsOCDefs"]
  Na7770fd0750a["JobsViewNavigator"] --> Naa47777dc638["Masonry"]
  Nc82869dc3347["JobsViewPush"] --> N1df8cd4ff855["JobsBlock"]
  Nc82869dc3347["JobsViewPush"] --> N018c2243ba9d["JobsOCDSL"]
  Nc82869dc3347["JobsViewPush"] --> N0394efe9fe42["JobsOCDefs"]
  N6b8d5419148e["JobsWallet"] --> Nab53e8669cd3["JobsBaseUI"]
  N6b8d5419148e["JobsWallet"] --> N1df8cd4ff855["JobsBlock"]
  N6b8d5419148e["JobsWallet"] --> N590072ebdded["JobsMakes"]
  N6b8d5419148e["JobsWallet"] --> N4f073af73f73["JobsModel"]
  N6b8d5419148e["JobsWallet"] --> N018c2243ba9d["JobsOCDSL"]
  N6b8d5419148e["JobsWallet"] --> N0394efe9fe42["JobsOCDefs"]
  N6b8d5419148e["JobsWallet"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N6b8d5419148e["JobsWallet"] --> Naa47777dc638["Masonry"]
  N6b8d5419148e["JobsWallet"] --> N78b271dac65c["XYColorOC"]
  N6954ddb01407["LMJDropdownMenuExtra"] --> N1df8cd4ff855["JobsBlock"]
  N6954ddb01407["LMJDropdownMenuExtra"] --> N018c2243ba9d["JobsOCDSL"]
  N6954ddb01407["LMJDropdownMenuExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N6954ddb01407["LMJDropdownMenuExtra"] --> N5a3bd0594103["LMJDropdownMenu"]
  N709c11016a1f["MGSwipeTableCellExtra"] --> N1df8cd4ff855["JobsBlock"]
  N709c11016a1f["MGSwipeTableCellExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N709c11016a1f["MGSwipeTableCellExtra"] --> N8e916e2ec79c["MGSwipeTableCell"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N1df8cd4ff855["JobsBlock"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N9b73f18b8a4c["JobsDeviceInfo"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N04d01727957b["JobsLanMgr"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N9cfe528cfb91["JobsLoadingImage"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N590072ebdded["JobsMakes"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N6be7f32159cc["JobsModelDSL"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> Ncb2d118b07ea["JobsOCProtocols"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> Na65e59600826["JobsOCRuntimeKits"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> Ncc282d5e1810["JobsRichTextUtils"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> Ne65c588da9cd["JobsStringUtils"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N0fbdcc518572["MJRefresh"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N3476a8cdc1d9["TABAnimated"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N08b2a250a092["WHToastExtra"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N78b271dac65c["XYColorOC"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N42769027b2d6["XZMRefresh"]
  Ncf0c5ad1f11e["MJRefreshExtra"] --> N71d0944e102a["lottie-ios"]
  N6a2432b8d4d5["ReachabilityExtra"] --> N1df8cd4ff855["JobsBlock"]
  N6a2432b8d4d5["ReachabilityExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N6a2432b8d4d5["ReachabilityExtra"] --> Nc79782e896e5["Reachability"]
  N72f8fe5d8652["SRWebSocketExtra"] --> N1df8cd4ff855["JobsBlock"]
  N72f8fe5d8652["SRWebSocketExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N72f8fe5d8652["SRWebSocketExtra"] --> Na934c317befe["SocketRocket"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N1df8cd4ff855["JobsBlock"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N04d01727957b["JobsLanMgr"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N6be7f32159cc["JobsModelDSL"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> Na65e59600826["JobsOCRuntimeKits"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N17f3f0525bc1["WHToast"]
  Ncbcb1db34db1["SYSAlertControllerExtra"] --> N08b2a250a092["WHToastExtra"]
  N7c1d94750a78["SZTextViewExtra"] --> N1df8cd4ff855["JobsBlock"]
  N7c1d94750a78["SZTextViewExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N7c1d94750a78["SZTextViewExtra"] --> Nbbe23e77453f["SZTextView"]
  N3e84d1e0eb01["TFPopup"] --> N1df8cd4ff855["JobsBlock"]
  N3e84d1e0eb01["TFPopup"] --> N0394efe9fe42["JobsOCDefs"]
  Nd1f9f41f868b["TFPopupExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nd1f9f41f868b["TFPopupExtra"] --> Nb81862f08afd["JobsByOCPods"]
  Nd1f9f41f868b["TFPopupExtra"] --> Nca8124599275["JobsCustomView"]
  Nd1f9f41f868b["TFPopupExtra"] --> N4b7420914260["JobsFiltrationView"]
  Nd1f9f41f868b["TFPopupExtra"] --> N6be7f32159cc["JobsModelDSL"]
  Nd1f9f41f868b["TFPopupExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Nd1f9f41f868b["TFPopupExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nd1f9f41f868b["TFPopupExtra"] --> N3e84d1e0eb01["TFPopup"]
  Nd56f06af52fd["TKPermissionKit"] --> N1df8cd4ff855["JobsBlock"]
  Nd56f06af52fd["TKPermissionKit"] --> Nb81862f08afd["JobsByOCPods"]
  Nd56f06af52fd["TKPermissionKit"] --> N04d01727957b["JobsLanMgr"]
  Nd56f06af52fd["TKPermissionKit"] --> N0394efe9fe42["JobsOCDefs"]
  Na3e8ae43188a["Texture"] --> N001d8e9e7a99["IGListDiffKit"]
  Na3e8ae43188a["Texture"] --> N678cc0cad0b3["IGListKit"]
  Na3e8ae43188a["Texture"] --> N356eef9f9fab["PINRemoteImage"]
  Na3e8ae43188a["Texture"] --> N8be1c94fdc10["Yoga"]
  N9e7748a2dba5["UIBaseTextFieldDSL"] --> Nab53e8669cd3["JobsBaseUI"]
  N9e7748a2dba5["UIBaseTextFieldDSL"] --> N1df8cd4ff855["JobsBlock"]
  N9e7748a2dba5["UIBaseTextFieldDSL"] --> N0394efe9fe42["JobsOCDefs"]
  N08b2a250a092["WHToastExtra"] --> N1df8cd4ff855["JobsBlock"]
  N08b2a250a092["WHToastExtra"] --> Nb3ef9cb29680["JobsClass"]
  N08b2a250a092["WHToastExtra"] --> N04d01727957b["JobsLanMgr"]
  N08b2a250a092["WHToastExtra"] --> N590072ebdded["JobsMakes"]
  N08b2a250a092["WHToastExtra"] --> N6be7f32159cc["JobsModelDSL"]
  N08b2a250a092["WHToastExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N08b2a250a092["WHToastExtra"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N08b2a250a092["WHToastExtra"] --> N8ab384f265d0["MJExtension"]
  N08b2a250a092["WHToastExtra"] --> Naa47777dc638["Masonry"]
  N08b2a250a092["WHToastExtra"] --> Ndb4e3bc90cf4["ReactiveObjC"]
  N08b2a250a092["WHToastExtra"] --> N1173b6117a2c["SDWebImage"]
  N08b2a250a092["WHToastExtra"] --> N17f3f0525bc1["WHToast"]
  N08b2a250a092["WHToastExtra"] --> N78b271dac65c["XYColorOC"]
  Nab6d2d183fde["WMZCode"] --> N1df8cd4ff855["JobsBlock"]
  Nab6d2d183fde["WMZCode"] --> Nb81862f08afd["JobsByOCPods"]
  Nab6d2d183fde["WMZCode"] --> N590072ebdded["JobsMakes"]
  Nab6d2d183fde["WMZCode"] --> N0394efe9fe42["JobsOCDefs"]
  Nab6d2d183fde["WMZCode"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N445bb6c02ab7["YTKNetworkExtra"] --> Na75d452377f3["AFNetworking"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N1df8cd4ff855["JobsBlock"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N04d01727957b["JobsLanMgr"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N590072ebdded["JobsMakes"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N6be7f32159cc["JobsModelDSL"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N018c2243ba9d["JobsOCDSL"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N445bb6c02ab7["YTKNetworkExtra"] --> Ncb2d118b07ea["JobsOCProtocols"]
  N445bb6c02ab7["YTKNetworkExtra"] --> Ne65c588da9cd["JobsStringUtils"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N210688fa7a59["JobsTimeUtils"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N8ab384f265d0["MJExtension"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N08b2a250a092["WHToastExtra"]
  N445bb6c02ab7["YTKNetworkExtra"] --> N14727719233d["YTKNetwork"]
  Ncd4126ca9727["ZBNetworking"] --> Na75d452377f3["AFNetworking"]
  N53b4ffc64c52["ZFPlayerExtra"] --> Nab53e8669cd3["JobsBaseUI"]
  N53b4ffc64c52["ZFPlayerExtra"] --> N1df8cd4ff855["JobsBlock"]
  N53b4ffc64c52["ZFPlayerExtra"] --> N018c2243ba9d["JobsOCDSL"]
  N53b4ffc64c52["ZFPlayerExtra"] --> N0394efe9fe42["JobsOCDefs"]
  N53b4ffc64c52["ZFPlayerExtra"] --> Nfe492d71a912["ZFPlayer"]
  Nc93bf4111366["ZMJCellExtra"] --> Nab53e8669cd3["JobsBaseUI"]
  Nc93bf4111366["ZMJCellExtra"] --> N1df8cd4ff855["JobsBlock"]
  Nc93bf4111366["ZMJCellExtra"] --> N590072ebdded["JobsMakes"]
  Nc93bf4111366["ZMJCellExtra"] --> N018c2243ba9d["JobsOCDSL"]
  Nc93bf4111366["ZMJCellExtra"] --> N0394efe9fe42["JobsOCDefs"]
  Nc93bf4111366["ZMJCellExtra"] --> Ndda2a7afc7e7["ZMJGanttChart"]
  N1322c50635fd["ZWPullMenuView"] --> Nb81862f08afd["JobsByOCPods"]
```

## 七、外部依赖引用关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

这里统计本次扫描到的 `.podspec` 对外部 Pod 的引用；同 Pod 内部 subspec 依赖已过滤；跨 Pod subspec 依赖显示为主 Pod 名；仓库内 Pod 匹配只采用精确名称，避免把 MJRefresh 误判为 MJRefreshExtra。外部来源链接匹配规则已放宽为：完全匹配 → base 名匹配 → 字符串包含匹配。

| 外部依赖 | 被引用数量 | 引用方 | 引用声明 |
|---|---:|---|---|
| [AFNetworking](https://github.com/AFNetworking/AFNetworking) | 4 | [**AFSecurityPolicyExtra**](#AFSecurityPolicyExtra), [**JobsDeviceInfo**](#JobsDeviceInfo), [**YTKNetworkExtra**](#YTKNetworkExtra), [**ZBNetworking**](#ZBNetworking) | [AFNetworking](https://github.com/AFNetworking/AFNetworking) |
| [FMDB](https://github.com/ccgus/fmdb) | 2 | [**FMDatabaseExtra**](#FMDatabaseExtra), [**JobsByOCPods**](#JobsByOCPods) | [FMDB](https://github.com/ccgus/fmdb) |
| [GKNavigationBar](https://github.com/QuintGao/GKNavigationBar) | 6 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCDefs**](#JobsOCDefs) | [GKNavigationBar](https://github.com/QuintGao/GKNavigationBar) |
| [GKPhotoBrowser](https://github.com/QuintGao/GKPhotoBrowser) | 2 | [**JobsByOCPods**](#JobsByOCPods), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr) | [GKPhotoBrowser](https://github.com/QuintGao/GKPhotoBrowser) |
| [HTMLReader](https://github.com/nolanw/HTMLReader) | 1 | [**HTMLDocumentExtra**](#HTMLDocumentExtra) | [HTMLReader](https://github.com/nolanw/HTMLReader) |
| [HXPhotoPickerObjC](https://github.com/SilenceLove/HXPhotoPickerObjC) | 4 | [**HXPhotoManagerExtra**](#HXPhotoManagerExtra), [**HXPhotoViewExtra**](#HXPhotoViewExtra), [**JobsModel**](#JobsModel), [**JobsOCDSL**](#JobsOCDSL) | [HXPhotoPickerObjC](https://github.com/SilenceLove/HXPhotoPickerObjC) |
| IGListDiffKit | 1 | [**Texture**](#Texture) | IGListDiffKit |
| IGListKit | 1 | [**Texture**](#Texture) | IGListKit |
| [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager) | 2 | [**IQKeyboardManagerExtra**](#IQKeyboardManagerExtra), [**JobsByOCPods**](#JobsByOCPods) | [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager) |
| [JPImageresizerView](https://github.com/Rogue24/JPImageresizerView) | 1 | [**JobsByOCPods**](#JobsByOCPods) | [JPImageresizerView](https://github.com/Rogue24/JPImageresizerView) |
| [JXCategoryView](https://github.com/pujiaxin33/JXCategoryView) | 2 | [**JXCategoryViewExtra**](#JXCategoryViewExtra), [**JobsByOCPods**](#JobsByOCPods) | [JXCategoryView](https://github.com/pujiaxin33/JXCategoryView) |
| [JXPagingView](https://github.com/pujiaxin33/JXPagingView) | 2 | [**JXCategoryViewExtra**](#JXCategoryViewExtra), [**JobsByOCPods**](#JobsByOCPods) | [JXPagingView](https://github.com/pujiaxin33/JXPagingView) |
| [LMJDropdownMenu](https://github.com/JerryLMJ/LMJDropdownMenu) | 1 | [**LMJDropdownMenuExtra**](#LMJDropdownMenuExtra) | [LMJDropdownMenu](https://github.com/JerryLMJ/LMJDropdownMenu) |
| [MGSwipeTableCell](https://github.com/MortimerGoro/MGSwipeTableCell) | 2 | [**JobsByOCPods**](#JobsByOCPods), [**MGSwipeTableCellExtra**](#MGSwipeTableCellExtra) | [MGSwipeTableCell](https://github.com/MortimerGoro/MGSwipeTableCell) |
| [MJExtension](https://github.com/CoderMJLee/MJExtension) | 14 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAPIs**](#JobsAPIs), [**JobsAppTools**](#JobsAppTools), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsClass**](#JobsClass), [**JobsCustomView**](#JobsCustomView), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsModel**](#JobsModel), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**WHToastExtra**](#WHToastExtra), [**YTKNetworkExtra**](#YTKNetworkExtra) | [MJExtension](https://github.com/CoderMJLee/MJExtension) |
| [MJRefresh](https://github.com/CoderMJLee/MJRefresh) | 10 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsDropDownListView**](#JobsDropDownListView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCDSL**](#JobsOCDSL), [**MJRefreshExtra**](#MJRefreshExtra) | [MJRefresh](https://github.com/CoderMJLee/MJRefresh) |
| [Masonry](https://github.com/SnapKit/Masonry) | 25 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAppDoor**](#JobsAppDoor), [**JobsBasePopupView**](#JobsBasePopupView), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsFiltrationView**](#JobsFiltrationView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsMarqueeView**](#JobsMarqueeView), [**JobsModel**](#JobsModel), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCComment**](#JobsOCComment), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCExcel**](#JobsOCExcel), [**JobsOCMarkdown**](#JobsOCMarkdown), [**JobsOCNumberStepper**](#JobsOCNumberStepper), [**JobsOCSearcher**](#JobsOCSearcher), [**JobsOCTools**](#JobsOCTools), [**JobsOCVideoRecorder**](#JobsOCVideoRecorder), [**JobsScreenCapture**](#JobsScreenCapture), [**JobsViewNavigator**](#JobsViewNavigator), [**JobsWallet**](#JobsWallet), [**WHToastExtra**](#WHToastExtra) | [Masonry](https://github.com/SnapKit/Masonry) |
| PINRemoteImage | 1 | [**Texture**](#Texture) | PINRemoteImage |
| [PPBadgeView](https://github.com/jkpang/PPBadgeView) | 2 | [**JobsByOCPods**](#JobsByOCPods), [**JobsOCTools**](#JobsOCTools) | [PPBadgeView](https://github.com/jkpang/PPBadgeView) |
| [Reachability](https://github.com/tonymillion/Reachability) | 3 | [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**ReachabilityExtra**](#ReachabilityExtra) | [Reachability](https://github.com/tonymillion/Reachability) |
| [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC) | 16 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsAppDoor**](#JobsAppDoor), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsModel**](#JobsModel), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCProtocols**](#JobsOCProtocols), [**JobsOCTools**](#JobsOCTools), [**JobsSuspend**](#JobsSuspend), [**SYSAlertControllerExtra**](#SYSAlertControllerExtra), [**WHToastExtra**](#WHToastExtra) | [ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC) |
| [SDWebImage](https://github.com/SDWebImage/SDWebImage) | 9 | [**JobsBlock**](#JobsBlock), [**JobsByOCPods**](#JobsByOCPods), [**JobsIconfont**](#JobsIconfont), [**JobsLanMgr**](#JobsLanMgr), [**JobsModel**](#JobsModel), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCTimer**](#JobsOCTimer), [**WHToastExtra**](#WHToastExtra) | [SDWebImage](https://github.com/SDWebImage/SDWebImage) |
| [SPAlertController](https://github.com/SPStore/SPAlertController) | 2 | [**JobsModel**](#JobsModel), [**JobsOCProtocols**](#JobsOCProtocols) | [SPAlertController](https://github.com/SPStore/SPAlertController) |
| [SZTextView](https://github.com/glaszig/SZTextView) | 2 | [**JobsByOCPods**](#JobsByOCPods), [**SZTextViewExtra**](#SZTextViewExtra) | [SZTextView](https://github.com/glaszig/SZTextView) |
| [SocketRocket](https://github.com/facebookincubator/SocketRocket) | 4 | [**JobsByOCPods**](#JobsByOCPods), [**JobsOCTools**](#JobsOCTools), [**JobsOCWebSocket**](#JobsOCWebSocket), [**SRWebSocketExtra**](#SRWebSocketExtra) | [SocketRocket](https://github.com/facebookincubator/SocketRocket) |
| [TXFileOperation](https://github.com/xtzPioneer/TXFileOperation) | 6 | [**FileFolderHandleTool**](#FileFolderHandleTool), [**JobsAPIs**](#JobsAPIs), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsLinkageMenuView**](#JobsLinkageMenuView) | [TXFileOperation](https://github.com/xtzPioneer/TXFileOperation) |
| [UITextView+Placeholder](https://github.com/devxoul/UITextView-Placeholder) | 1 | [**JobsByOCPods**](#JobsByOCPods) | [UITextView+Placeholder](https://github.com/devxoul/UITextView-Placeholder) |
| [WHToast](https://github.com/remember17/WHToast) | 5 | [**JobsByOCPods**](#JobsByOCPods), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**JobsOCTimer**](#JobsOCTimer), [**SYSAlertControllerExtra**](#SYSAlertControllerExtra), [**WHToastExtra**](#WHToastExtra) | [WHToast](https://github.com/remember17/WHToast) |
| [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh) | 8 | [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra), [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsCustomView**](#JobsCustomView), [**JobsLinkageMenuView**](#JobsLinkageMenuView), [**JobsNavBar**](#JobsNavBar), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr), [**MJRefreshExtra**](#MJRefreshExtra) | [XZMRefresh](https://github.com/xiezhongmin/XZMRefresh) |
| [YTKNetwork](https://github.com/yuantiku/YTKNetwork) | 6 | [**JobsAPIs**](#JobsAPIs), [**JobsDeviceInfo**](#JobsDeviceInfo), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCDefs**](#JobsOCDefs), [**JobsOCProtocols**](#JobsOCProtocols), [**YTKNetworkExtra**](#YTKNetworkExtra) | [YTKNetwork](https://github.com/yuantiku/YTKNetwork) |
| YYImage | 2 | [**JobsByOCPods**](#JobsByOCPods), [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr) | YYImage |
| Yoga | 1 | [**Texture**](#Texture) | Yoga |
| [ZFPlayer](https://github.com/renzifeng/ZFPlayer) | 5 | [**JobsAppDoor**](#JobsAppDoor), [**JobsByOCPods**](#JobsByOCPods), [**JobsOCDSL**](#JobsOCDSL), [**JobsOCTools**](#JobsOCTools), [**ZFPlayerExtra**](#ZFPlayerExtra) | [ZFPlayer](https://github.com/renzifeng/ZFPlayer) |
| [ZMJGanttChart](https://github.com/keshiim/ZMJGanttChart) | 2 | [**JobsByOCPods**](#JobsByOCPods), [**ZMJCellExtra**](#ZMJCellExtra) | [ZMJGanttChart](https://github.com/keshiim/ZMJGanttChart) |
| [lottie-ios](https://github.com/airbnb/lottie-ios) | 6 | [**JobsBaseUI**](#JobsBaseUI), [**JobsByOCPods**](#JobsByOCPods), [**JobsFuseAnimation**](#JobsFuseAnimation), [**JobsNavBar**](#JobsNavBar), [**JobsOCTools**](#JobsOCTools), [**MJRefreshExtra**](#MJRefreshExtra) | [lottie-ios](https://github.com/airbnb/lottie-ios) |

## 八、明细 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 1、<font id="AFSecurityPolicyExtra">AFSecurityPolicyExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/AFSecurityPolicyExtra@Pods/AFSecurityPolicyExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**AFNetworking**](https://github.com/AFNetworking/AFNetworking)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 2、<font id="BEMCheckBox">BEMCheckBox</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/BEMCheckBox/BEMCheckBox.podspec`


### 3、<font id="BRPickerView">BRPickerView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/BRPickerView/BRPickerView.podspec`

- **上游依赖**

  - [**BRPickerViewExtra**](#BRPickerViewExtra)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)

- **下游依赖**

  - [**JobsModelDSL**](#JobsModelDSL)


### 4、<font id="BRPickerViewExtra">BRPickerViewExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/BRPickerViewExtra@Pods/BRPickerViewExtra.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)

- **下游依赖**

  - [**BRPickerView**](#BRPickerView)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**XYColorOC**](#XYColorOC)


### 5、<font id="DeviceKit">DeviceKit</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/DeviceKit/DeviceKit.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)


### 6、<font id="FDFullscreenPopGesture">FDFullscreenPopGesture</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/FDFullscreenPopGesture@Pods/FDFullscreenPopGesture.podspec`

- **上游依赖**

  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 7、<font id="FMDatabaseExtra">FMDatabaseExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/FMDatabaseExtra@Pods/FMDatabaseExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**FMDB**](https://github.com/ccgus/fmdb)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)


### 8、<font id="FSCalendar">FSCalendar</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/FSCalendar/FSCalendar.podspec`

- **上游依赖**

  - [**FSCalendarExtra**](#FSCalendarExtra)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDefs**](#JobsOCDefs)


### 9、<font id="FSCalendarExtra">FSCalendarExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/FSCalendarExtra@Pods/FSCalendarExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**FSCalendar**](#FSCalendar)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 10、<font id="FileFolderHandleTool">FileFolderHandleTool</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/FileFolderHandleTool@Pods/FileFolderHandleTool.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**TXFileOperation**](https://github.com/xtzPioneer/TXFileOperation)


### 11、<font id="GKCustomNavigationBarExtra">GKCustomNavigationBarExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/GKCustomNavigationBarExtra@Pods/GKCustomNavigationBarExtra.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**GKNavigationBar**](https://github.com/QuintGao/GKNavigationBar)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**TABAnimated**](#TABAnimated)
  - [**XYColorOC**](#XYColorOC)
  - [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh)


### 12、<font id="GTCaptcha4">GTCaptcha4</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/GTCaptcha4/GTCaptcha4.podspec`

- **上游依赖**

  - [**JobsModel**](#JobsModel)


### 13、<font id="HTMLDocumentExtra">HTMLDocumentExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/HTMLDocumentExtra@Pods/HTMLDocumentExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**HTMLReader**](https://github.com/nolanw/HTMLReader)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 14、<font id="HXPhotoManagerExtra">HXPhotoManagerExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/HXPhotoManagerExtra@Pods/HXPhotoManagerExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**HXPhotoPickerObjC**](https://github.com/SilenceLove/HXPhotoPickerObjC)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 15、<font id="HXPhotoViewExtra">HXPhotoViewExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/HXPhotoViewExtra@Pods/HXPhotoViewExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**HXPhotoPickerObjC**](https://github.com/SilenceLove/HXPhotoPickerObjC)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 16、<font id="IQKeyboardManagerExtra">IQKeyboardManagerExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/IQKeyboardManagerExtra@Pods/IQKeyboardManagerExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**IQKeyboardManager**](https://github.com/hackiftekhar/IQKeyboardManager)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 17、<font id="JXCategoryViewExtra">JXCategoryViewExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JXCategoryViewExtra@Pods/JXCategoryViewExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JXCategoryView**](https://github.com/pujiaxin33/JXCategoryView)
  - [**JXPagingView**](https://github.com/pujiaxin33/JXPagingView)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 18、<font id="JobsAPIs">JobsAPIs</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsAPIs@Pods/JobsAPIs.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**TXFileOperation**](https://github.com/xtzPioneer/TXFileOperation)
  - [**This**](#This)
  - [**WHToastExtra**](#WHToastExtra)
  - [**YTKNetwork**](https://github.com/yuantiku/YTKNetwork)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)


### 19、<font id="JobsAppDoor">JobsAppDoor</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsAppDoor@Pods/JobsAppDoor.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCountdownBtn**](#JobsCountdownBtn)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsFuseAnimation**](#JobsFuseAnimation)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModel**](#JobsModel)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha)
  - [**JobsOCKeyboardMgr**](#JobsOCKeyboardMgr)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCTools**](#JobsOCTools)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**UIBaseTextFieldDSL**](#UIBaseTextFieldDSL)
  - [**XYColorOC**](#XYColorOC)
  - [**ZFPlayer**](https://github.com/renzifeng/ZFPlayer)
  - [**ZFPlayerExtra**](#ZFPlayerExtra)


### 20、<font id="JobsAppIconRibbon">JobsAppIconRibbon</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsAppIconRibbon@Pods/JobsAppIconRibbon.podspec`


### 21、<font id="JobsAppTools">JobsAppTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsAppTools@Pods/JobsAppTools.podspec`

- **上游依赖**

  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**XYColorOC**](#XYColorOC)


### 22、<font id="JobsBasePopupView">JobsBasePopupView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsBasePopupView@Pods/JobsBasePopupView.podspec`

- **上游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)

- **下游依赖**

  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**WHToastExtra**](#WHToastExtra)


### 23、<font id="JobsBaseUI">JobsBaseUI</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsBaseUI@Pods/JobsBaseUI.podspec`

- **上游依赖**

  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsGestureLock**](#JobsGestureLock)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsImageNumberView**](#JobsImageNumberView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCComment**](#JobsOCComment)
  - [**JobsOCNumberStepper**](#JobsOCNumberStepper)
  - [**JobsOCOpen**](#JobsOCOpen)
  - [**JobsOCSearcher**](#JobsOCSearcher)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsSuspend**](#JobsSuspend)
  - [**JobsTabBarCtrl**](#JobsTabBarCtrl)
  - [**JobsUploadingProgressView**](#JobsUploadingProgressView)
  - [**JobsWallet**](#JobsWallet)
  - [**UIBaseTextFieldDSL**](#UIBaseTextFieldDSL)
  - [**ZFPlayerExtra**](#ZFPlayerExtra)
  - [**ZMJCellExtra**](#ZMJCellExtra)

- **下游依赖**

  - [**GKNavigationBar**](https://github.com/QuintGao/GKNavigationBar)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsLoadingImage**](#JobsLoadingImage)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsRandomUtils**](#JobsRandomUtils)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**SZTextViewExtra**](#SZTextViewExtra)
  - [**TABAnimated**](#TABAnimated)
  - [**This**](#This)
  - [**WHToastExtra**](#WHToastExtra)
  - [**XYColorOC**](#XYColorOC)
  - [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh)
  - [**lottie-ios**](https://github.com/airbnb/lottie-ios)


### 24、<font id="JobsBioKit">JobsBioKit</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsBioKit@Pods/JobsBioKit.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 25、<font id="JobsBitsMonitor">JobsBitsMonitor</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsBitsMonitor@Pods/JobsBitsMonitor.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsNetWorkTools**](#JobsNetWorkTools)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsSuspend**](#JobsSuspend)
  - [**ZWPullMenuView**](#ZWPullMenuView)


### 26、<font id="JobsBlock">JobsBlock</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsBlock@Pods/JobsBlock.podspec`

- **上游依赖**

  - [**AFSecurityPolicyExtra**](#AFSecurityPolicyExtra)
  - [**BRPickerViewExtra**](#BRPickerViewExtra)
  - [**FDFullscreenPopGesture**](#FDFullscreenPopGesture)
  - [**FMDatabaseExtra**](#FMDatabaseExtra)
  - [**FSCalendar**](#FSCalendar)
  - [**FSCalendarExtra**](#FSCalendarExtra)
  - [**FileFolderHandleTool**](#FileFolderHandleTool)
  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**HTMLDocumentExtra**](#HTMLDocumentExtra)
  - [**HXPhotoManagerExtra**](#HXPhotoManagerExtra)
  - [**HXPhotoViewExtra**](#HXPhotoViewExtra)
  - [**IQKeyboardManagerExtra**](#IQKeyboardManagerExtra)
  - [**JXCategoryViewExtra**](#JXCategoryViewExtra)
  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBioKit**](#JobsBioKit)
  - [**JobsBitsMonitor**](#JobsBitsMonitor)
  - [**JobsBluetooth**](#JobsBluetooth)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCallBackBlockDSL**](#JobsCallBackBlockDSL)
  - [**JobsClass**](#JobsClass)
  - [**JobsClockView**](#JobsClockView)
  - [**JobsCountdownBtn**](#JobsCountdownBtn)
  - [**JobsCryptography**](#JobsCryptography)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDebug**](#JobsDebug)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsFuseAnimation**](#JobsFuseAnimation)
  - [**JobsGestureLock**](#JobsGestureLock)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsIconfont**](#JobsIconfont)
  - [**JobsImageNumberView**](#JobsImageNumberView)
  - [**JobsImageRotation**](#JobsImageRotation)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsLoadingImage**](#JobsLoadingImage)
  - [**JobsLocker**](#JobsLocker)
  - [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsMarqueeView**](#JobsMarqueeView)
  - [**JobsMenuView**](#JobsMenuView)
  - [**JobsModel**](#JobsModel)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsMonitorNetwoking**](#JobsMonitorNetwoking)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsNetWorkTools**](#JobsNetWorkTools)
  - [**JobsOCAudioRecorder**](#JobsOCAudioRecorder)
  - [**JobsOCCalendar**](#JobsOCCalendar)
  - [**JobsOCComment**](#JobsOCComment)
  - [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCExcel**](#JobsOCExcel)
  - [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha)
  - [**JobsOCKeyboardMgr**](#JobsOCKeyboardMgr)
  - [**JobsOCMarkdown**](#JobsOCMarkdown)
  - [**JobsOCNumberStepper**](#JobsOCNumberStepper)
  - [**JobsOCOpen**](#JobsOCOpen)
  - [**JobsOCPatch**](#JobsOCPatch)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRefresher**](#JobsOCRefresher)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCSearcher**](#JobsOCSearcher)
  - [**JobsOCSkeletonView**](#JobsOCSkeletonView)
  - [**JobsOCSnowflake**](#JobsOCSnowflake)
  - [**JobsOCSplash**](#JobsOCSplash)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**JobsOCTimerMgr**](#JobsOCTimerMgr)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling)
  - [**JobsOCVideoRecorder**](#JobsOCVideoRecorder)
  - [**JobsOCWebSocket**](#JobsOCWebSocket)
  - [**JobsPresentTransitionMgr**](#JobsPresentTransitionMgr)
  - [**JobsProgressBar**](#JobsProgressBar)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsScreenCapture**](#JobsScreenCapture)
  - [**JobsSuspend**](#JobsSuspend)
  - [**JobsTabBarCtrl**](#JobsTabBarCtrl)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**JobsUploadingProgressView**](#JobsUploadingProgressView)
  - [**JobsViewNavigator**](#JobsViewNavigator)
  - [**JobsViewPush**](#JobsViewPush)
  - [**JobsWallet**](#JobsWallet)
  - [**LMJDropdownMenuExtra**](#LMJDropdownMenuExtra)
  - [**MGSwipeTableCellExtra**](#MGSwipeTableCellExtra)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**ReachabilityExtra**](#ReachabilityExtra)
  - [**SRWebSocketExtra**](#SRWebSocketExtra)
  - [**SYSAlertControllerExtra**](#SYSAlertControllerExtra)
  - [**SZTextViewExtra**](#SZTextViewExtra)
  - [**TFPopup**](#TFPopup)
  - [**TFPopupExtra**](#TFPopupExtra)
  - [**TKPermissionKit**](#TKPermissionKit)
  - [**UIBaseTextFieldDSL**](#UIBaseTextFieldDSL)
  - [**WHToastExtra**](#WHToastExtra)
  - [**WMZCode**](#WMZCode)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)
  - [**ZFPlayerExtra**](#ZFPlayerExtra)
  - [**ZMJCellExtra**](#ZMJCellExtra)

- **下游依赖**

  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)


### 27、<font id="JobsBluetooth">JobsBluetooth</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsBluetooth@Pods/JobsBluetooth.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 28、<font id="JobsByOCPods">JobsByOCPods</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsByOCPods@Pods/JobsByOCPods.podspec`

- **上游依赖**

  - [**FileFolderHandleTool**](#FileFolderHandleTool)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsBitsMonitor**](#JobsBitsMonitor)
  - [**JobsCountdownBtn**](#JobsCountdownBtn)
  - [**JobsCryptography**](#JobsCryptography)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsImageNumberView**](#JobsImageNumberView)
  - [**JobsMarqueeView**](#JobsMarqueeView)
  - [**JobsMenuView**](#JobsMenuView)
  - [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl)
  - [**JobsOCSplash**](#JobsOCSplash)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsOCVideoRecorder**](#JobsOCVideoRecorder)
  - [**JobsTabBarCtrl**](#JobsTabBarCtrl)
  - [**JobsUploadingProgressView**](#JobsUploadingProgressView)
  - [**TFPopupExtra**](#TFPopupExtra)
  - [**TKPermissionKit**](#TKPermissionKit)
  - [**WMZCode**](#WMZCode)
  - [**ZWPullMenuView**](#ZWPullMenuView)

- **下游依赖**

  - [**BRPickerView**](#BRPickerView)
  - [**BRPickerViewExtra**](#BRPickerViewExtra)
  - [**DeviceKit**](#DeviceKit)
  - [**FMDB**](https://github.com/ccgus/fmdb)
  - [**FSCalendar**](#FSCalendar)
  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**GKNavigationBar**](https://github.com/QuintGao/GKNavigationBar)
  - [**GKPhotoBrowser**](https://github.com/QuintGao/GKPhotoBrowser)
  - [**IQKeyboardManager**](https://github.com/hackiftekhar/IQKeyboardManager)
  - [**JPImageresizerView**](https://github.com/Rogue24/JPImageresizerView)
  - [**JXCategoryView**](https://github.com/pujiaxin33/JXCategoryView)
  - [**JXPagingView**](https://github.com/pujiaxin33/JXPagingView)
  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsDebug**](#JobsDebug)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCSnowflake**](#JobsOCSnowflake)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**JobsRandomUtils**](#JobsRandomUtils)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**JobsViewNavigator**](#JobsViewNavigator)
  - [**MGSwipeTableCell**](https://github.com/MortimerGoro/MGSwipeTableCell)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**PPBadgeView**](https://github.com/jkpang/PPBadgeView)
  - [**Reachability**](https://github.com/tonymillion/Reachability)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)
  - [**SZTextView**](https://github.com/glaszig/SZTextView)
  - [**SocketRocket**](https://github.com/facebookincubator/SocketRocket)
  - [**TABAnimated**](#TABAnimated)
  - [**TFPopup**](#TFPopup)
  - [**TXFileOperation**](https://github.com/xtzPioneer/TXFileOperation)
  - [**This**](#This)
  - [**UITextView+Placeholder**](https://github.com/devxoul/UITextView-Placeholder)
  - [**WHToast**](https://github.com/remember17/WHToast)
  - [**WHToastExtra**](#WHToastExtra)
  - [**XYColorOC**](#XYColorOC)
  - [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)
  - **YYImage**
  - [**ZBNetworking**](#ZBNetworking)
  - [**ZFPlayer**](https://github.com/renzifeng/ZFPlayer)
  - [**ZFPlayerExtra**](#ZFPlayerExtra)
  - [**ZMJGanttChart**](https://github.com/keshiim/ZMJGanttChart)
  - [**lottie-ios**](https://github.com/airbnb/lottie-ios)


### 29、<font id="JobsCallBackBlockDSL">JobsCallBackBlockDSL</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsCallBackBlockDSL@Pods/JobsCallBackBlockDSL.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 30、<font id="JobsClass">JobsClass</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsClass@Pods/JobsClass.podspec`

- **上游依赖**

  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsModel**](#JobsModel)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**WHToastExtra**](#WHToastExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)


### 31、<font id="JobsClockView">JobsClockView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsClockView@Pods/JobsClockView.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCTimer**](#JobsOCTimer)


### 32、<font id="JobsCountdownBtn">JobsCountdownBtn</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsCountdownBtn@Pods/JobsCountdownBtn.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCTimer**](#JobsOCTimer)


### 33、<font id="JobsCryptography">JobsCryptography</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsCryptography@Pods/JobsCryptography.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDefs**](#JobsOCDefs)


### 34、<font id="JobsCustomView">JobsCustomView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsCustomView@Pods/JobsCustomView.podspec`

- **上游依赖**

  - [**TFPopupExtra**](#TFPopupExtra)

- **下游依赖**

  - [**BRPickerView**](#BRPickerView)
  - [**BRPickerViewExtra**](#BRPickerViewExtra)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**Reachability**](https://github.com/tonymillion/Reachability)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**TABAnimated**](#TABAnimated)
  - [**TXFileOperation**](https://github.com/xtzPioneer/TXFileOperation)
  - [**This**](#This)
  - [**XYColorOC**](#XYColorOC)
  - [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)


### 35、<font id="JobsDebug">JobsDebug</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsDebug@Pods/JobsDebug.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsStringUtils**](#JobsStringUtils)


### 36、<font id="JobsDeviceInfo">JobsDeviceInfo</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsDeviceInfo@Pods/JobsDeviceInfo.podspec`

- **上游依赖**

  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsSuspend**](#JobsSuspend)
  - [**MJRefreshExtra**](#MJRefreshExtra)

- **下游依赖**

  - [**AFNetworking**](https://github.com/AFNetworking/AFNetworking)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**TXFileOperation**](https://github.com/xtzPioneer/TXFileOperation)
  - [**YTKNetwork**](https://github.com/yuantiku/YTKNetwork)


### 37、<font id="JobsDropDownListView">JobsDropDownListView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsDropDownListView@Pods/JobsDropDownListView.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModel**](#JobsModel)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)


### 38、<font id="JobsFiltrationView">JobsFiltrationView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsFiltrationView@Pods/JobsFiltrationView.podspec`

- **上游依赖**

  - [**TFPopupExtra**](#TFPopupExtra)

- **下游依赖**

  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**XYColorOC**](#XYColorOC)


### 39、<font id="JobsFuseAnimation">JobsFuseAnimation</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsFuseAnimation@Pods/JobsFuseAnimation.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsOCRefresher**](#JobsOCRefresher)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**lottie-ios**](https://github.com/airbnb/lottie-ios)


### 40、<font id="JobsGestureLock">JobsGestureLock</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsGestureLock@Pods/JobsGestureLock.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 41、<font id="JobsGetWindow">JobsGetWindow</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsGetWindow@Pods/JobsGetWindow.podspec`

- **上游依赖**

  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCOpen**](#JobsOCOpen)


### 42、<font id="JobsHotLabel">JobsHotLabel</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsHotLabel@Pods/JobsHotLabel.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)


### 43、<font id="JobsIconfont">JobsIconfont</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsIconfont@Pods/JobsIconfont.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)


### 44、<font id="JobsImageNumberView">JobsImageNumberView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsImageNumberView@Pods/JobsImageNumberView.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)


### 45、<font id="JobsImageRotation">JobsImageRotation</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsImageRotation@Pods/JobsImageRotation.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCTimer**](#JobsOCTimer)


### 46、<font id="JobsLanMgr">JobsLanMgr</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsLanMgr@Pods/JobsLanMgr.podspec`

- **上游依赖**

  - [**BRPickerViewExtra**](#BRPickerViewExtra)
  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBitsMonitor**](#JobsBitsMonitor)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCountdownBtn**](#JobsCountdownBtn)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDebug**](#JobsDebug)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsModel**](#JobsModel)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl)
  - [**JobsOCRefresher**](#JobsOCRefresher)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsSuspend**](#JobsSuspend)
  - [**JobsUploadingProgressView**](#JobsUploadingProgressView)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**SYSAlertControllerExtra**](#SYSAlertControllerExtra)
  - [**TKPermissionKit**](#TKPermissionKit)
  - [**WHToastExtra**](#WHToastExtra)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)


### 47、<font id="JobsLinkageMenuView">JobsLinkageMenuView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsLinkageMenuView@Pods/JobsLinkageMenuView.podspec`

- **上游依赖**

  - [**JobsMenuView**](#JobsMenuView)

- **下游依赖**

  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**TABAnimated**](#TABAnimated)
  - [**TXFileOperation**](https://github.com/xtzPioneer/TXFileOperation)
  - [**XYColorOC**](#XYColorOC)
  - [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)


### 48、<font id="JobsLoadingImage">JobsLoadingImage</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsLoadingImage@Pods/JobsLoadingImage.podspec`

- **上游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsModel**](#JobsModel)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsSuspend**](#JobsSuspend)
  - [**MJRefreshExtra**](#MJRefreshExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)


### 49、<font id="JobsLocker">JobsLocker</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsLocker@Pods/JobsLocker.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 50、<font id="JobsLuckyEnvelopeRain">JobsLuckyEnvelopeRain</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsLuckyEnvelopeRain@Pods/JobsLuckyEnvelopeRain.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCTimer**](#JobsOCTimer)


### 51、<font id="JobsMakes">JobsMakes</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsMakes@Pods/JobsMakes.podspec`

- **上游依赖**

  - [**BRPickerViewExtra**](#BRPickerViewExtra)
  - [**FSCalendar**](#FSCalendar)
  - [**FileFolderHandleTool**](#FileFolderHandleTool)
  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JXCategoryViewExtra**](#JXCategoryViewExtra)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsClockView**](#JobsClockView)
  - [**JobsCryptography**](#JobsCryptography)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDebug**](#JobsDebug)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsFuseAnimation**](#JobsFuseAnimation)
  - [**JobsGestureLock**](#JobsGestureLock)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsImageNumberView**](#JobsImageNumberView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsMenuView**](#JobsMenuView)
  - [**JobsModel**](#JobsModel)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCCalendar**](#JobsOCCalendar)
  - [**JobsOCComment**](#JobsOCComment)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCExcel**](#JobsOCExcel)
  - [**JobsOCMarkdown**](#JobsOCMarkdown)
  - [**JobsOCNumberStepper**](#JobsOCNumberStepper)
  - [**JobsOCRefresher**](#JobsOCRefresher)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCSearcher**](#JobsOCSearcher)
  - [**JobsOCSplash**](#JobsOCSplash)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**JobsOCTimerMgr**](#JobsOCTimerMgr)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsOCVideoRecorder**](#JobsOCVideoRecorder)
  - [**JobsPresentTransitionMgr**](#JobsPresentTransitionMgr)
  - [**JobsProgressBar**](#JobsProgressBar)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsScreenCapture**](#JobsScreenCapture)
  - [**JobsTabBarCtrl**](#JobsTabBarCtrl)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**JobsUploadingProgressView**](#JobsUploadingProgressView)
  - [**JobsViewNavigator**](#JobsViewNavigator)
  - [**JobsWallet**](#JobsWallet)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**WHToastExtra**](#WHToastExtra)
  - [**WMZCode**](#WMZCode)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)
  - [**ZMJCellExtra**](#ZMJCellExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 52、<font id="JobsMarqueeView">JobsMarqueeView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsMarqueeView@Pods/JobsMarqueeView.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCTimerMgr**](#JobsOCTimerMgr)
  - [**Masonry**](https://github.com/SnapKit/Masonry)


### 53、<font id="JobsMenuView">JobsMenuView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsMenuView@Pods/JobsMenuView.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 54、<font id="JobsModel">JobsModel</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsModel@Pods/JobsModel.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha)
  - [**JobsWallet**](#JobsWallet)

- **下游依赖**

  - [**GTCaptcha4**](#GTCaptcha4)
  - [**HXPhotoPickerObjC**](https://github.com/SilenceLove/HXPhotoPickerObjC)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsLoadingImage**](#JobsLoadingImage)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)
  - [**SPAlertController**](https://github.com/SPStore/SPAlertController)
  - [**XYColorOC**](#XYColorOC)


### 55、<font id="JobsModelDSL">JobsModelDSL</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsModelDSL@Pods/JobsModelDSL.podspec`

- **上游依赖**

  - [**BRPickerView**](#BRPickerView)
  - [**BRPickerViewExtra**](#BRPickerViewExtra)
  - [**FileFolderHandleTool**](#FileFolderHandleTool)
  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBitsMonitor**](#JobsBitsMonitor)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsNetWorkTools**](#JobsNetWorkTools)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsSuspend**](#JobsSuspend)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**SYSAlertControllerExtra**](#SYSAlertControllerExtra)
  - [**TFPopupExtra**](#TFPopupExtra)
  - [**WHToastExtra**](#WHToastExtra)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsModel**](#JobsModel)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)


### 56、<font id="JobsMonitorNetwoking">JobsMonitorNetwoking</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsMonitorNetwoking@Pods/JobsMonitorNetwoking.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsSuspend**](#JobsSuspend)


### 57、<font id="JobsNavBar">JobsNavBar</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsNavBar@Pods/JobsNavBar.podspec`

- **上游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)

- **下游依赖**

  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**TABAnimated**](#TABAnimated)
  - [**WHToastExtra**](#WHToastExtra)
  - [**XYColorOC**](#XYColorOC)
  - [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh)
  - [**lottie-ios**](https://github.com/airbnb/lottie-ios)


### 58、<font id="JobsNavigationTransitionMgr">JobsNavigationTransitionMgr</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsNavigationTransitionMgr@Pods/JobsNavigationTransitionMgr.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)

- **下游依赖**

  - [**FDFullscreenPopGesture**](#FDFullscreenPopGesture)
  - [**GKNavigationBar**](https://github.com/QuintGao/GKNavigationBar)
  - [**GKPhotoBrowser**](https://github.com/QuintGao/GKPhotoBrowser)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsDebug**](#JobsDebug)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsLoadingImage**](#JobsLoadingImage)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCSnowflake**](#JobsOCSnowflake)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**JobsViewNavigator**](#JobsViewNavigator)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)
  - [**TABAnimated**](#TABAnimated)
  - [**TFPopup**](#TFPopup)
  - [**WHToast**](https://github.com/remember17/WHToast)
  - [**WHToastExtra**](#WHToastExtra)
  - [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh)
  - **YYImage**


### 59、<font id="JobsNetWorkTools">JobsNetWorkTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsNetWorkTools@Pods/JobsNetWorkTools.podspec`

- **上游依赖**

  - [**JobsBitsMonitor**](#JobsBitsMonitor)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCTimer**](#JobsOCTimer)


### 60、<font id="JobsOCAudioRecorder">JobsOCAudioRecorder</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCAudioRecorder@Pods/JobsOCAudioRecorder.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCTimer**](#JobsOCTimer)


### 61、<font id="JobsOCCalendar">JobsOCCalendar</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCCalendar@Pods/JobsOCCalendar.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 62、<font id="JobsOCComment">JobsOCComment</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCComment@Pods/JobsOCComment.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCRefresher**](#JobsOCRefresher)
  - [**Masonry**](https://github.com/SnapKit/Masonry)


### 63、<font id="JobsOCCountryCodeCtrl">JobsOCCountryCodeCtrl</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCCountryCodeCtrl@Pods/JobsOCCountryCodeCtrl.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**XYColorOC**](#XYColorOC)


### 64、<font id="JobsOCDSL">JobsOCDSL</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCDSL@Pods/JobsOCDSL.podspec`

- **上游依赖**

  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JXCategoryViewExtra**](#JXCategoryViewExtra)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBitsMonitor**](#JobsBitsMonitor)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsClockView**](#JobsClockView)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDebug**](#JobsDebug)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsFuseAnimation**](#JobsFuseAnimation)
  - [**JobsGestureLock**](#JobsGestureLock)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsImageNumberView**](#JobsImageNumberView)
  - [**JobsImageRotation**](#JobsImageRotation)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain)
  - [**JobsMenuView**](#JobsMenuView)
  - [**JobsMonitorNetwoking**](#JobsMonitorNetwoking)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCAudioRecorder**](#JobsOCAudioRecorder)
  - [**JobsOCCalendar**](#JobsOCCalendar)
  - [**JobsOCComment**](#JobsOCComment)
  - [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl)
  - [**JobsOCExcel**](#JobsOCExcel)
  - [**JobsOCKeyboardMgr**](#JobsOCKeyboardMgr)
  - [**JobsOCMarkdown**](#JobsOCMarkdown)
  - [**JobsOCNumberStepper**](#JobsOCNumberStepper)
  - [**JobsOCOpen**](#JobsOCOpen)
  - [**JobsOCRefresher**](#JobsOCRefresher)
  - [**JobsOCSearcher**](#JobsOCSearcher)
  - [**JobsOCSkeletonView**](#JobsOCSkeletonView)
  - [**JobsOCSplash**](#JobsOCSplash)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling)
  - [**JobsOCVideoRecorder**](#JobsOCVideoRecorder)
  - [**JobsPresentTransitionMgr**](#JobsPresentTransitionMgr)
  - [**JobsProgressBar**](#JobsProgressBar)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsScreenCapture**](#JobsScreenCapture)
  - [**JobsSuspend**](#JobsSuspend)
  - [**JobsTabBarCtrl**](#JobsTabBarCtrl)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**JobsUploadingProgressView**](#JobsUploadingProgressView)
  - [**JobsViewNavigator**](#JobsViewNavigator)
  - [**JobsViewPush**](#JobsViewPush)
  - [**JobsWallet**](#JobsWallet)
  - [**LMJDropdownMenuExtra**](#LMJDropdownMenuExtra)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**SYSAlertControllerExtra**](#SYSAlertControllerExtra)
  - [**TFPopupExtra**](#TFPopupExtra)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)
  - [**ZFPlayerExtra**](#ZFPlayerExtra)
  - [**ZMJCellExtra**](#ZMJCellExtra)

- **下游依赖**

  - [**FSCalendar**](#FSCalendar)
  - [**GKNavigationBar**](https://github.com/QuintGao/GKNavigationBar)
  - [**HXPhotoPickerObjC**](https://github.com/SilenceLove/HXPhotoPickerObjC)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)
  - [**Texture**](#Texture)
  - [**YTKNetwork**](https://github.com/yuantiku/YTKNetwork)
  - [**ZFPlayer**](https://github.com/renzifeng/ZFPlayer)


### 65、<font id="JobsOCDefs">JobsOCDefs</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCDefs@Pods/JobsOCDefs.podspec`

- **上游依赖**

  - [**AFSecurityPolicyExtra**](#AFSecurityPolicyExtra)
  - [**BRPickerViewExtra**](#BRPickerViewExtra)
  - [**FDFullscreenPopGesture**](#FDFullscreenPopGesture)
  - [**FMDatabaseExtra**](#FMDatabaseExtra)
  - [**FSCalendar**](#FSCalendar)
  - [**FSCalendarExtra**](#FSCalendarExtra)
  - [**FileFolderHandleTool**](#FileFolderHandleTool)
  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**HTMLDocumentExtra**](#HTMLDocumentExtra)
  - [**HXPhotoManagerExtra**](#HXPhotoManagerExtra)
  - [**HXPhotoViewExtra**](#HXPhotoViewExtra)
  - [**IQKeyboardManagerExtra**](#IQKeyboardManagerExtra)
  - [**JXCategoryViewExtra**](#JXCategoryViewExtra)
  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBioKit**](#JobsBioKit)
  - [**JobsBitsMonitor**](#JobsBitsMonitor)
  - [**JobsBluetooth**](#JobsBluetooth)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCallBackBlockDSL**](#JobsCallBackBlockDSL)
  - [**JobsClass**](#JobsClass)
  - [**JobsClockView**](#JobsClockView)
  - [**JobsCountdownBtn**](#JobsCountdownBtn)
  - [**JobsCryptography**](#JobsCryptography)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDebug**](#JobsDebug)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsFuseAnimation**](#JobsFuseAnimation)
  - [**JobsGestureLock**](#JobsGestureLock)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsIconfont**](#JobsIconfont)
  - [**JobsImageNumberView**](#JobsImageNumberView)
  - [**JobsImageRotation**](#JobsImageRotation)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsLocker**](#JobsLocker)
  - [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsMarqueeView**](#JobsMarqueeView)
  - [**JobsMenuView**](#JobsMenuView)
  - [**JobsModel**](#JobsModel)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsMonitorNetwoking**](#JobsMonitorNetwoking)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsNetWorkTools**](#JobsNetWorkTools)
  - [**JobsOCAudioRecorder**](#JobsOCAudioRecorder)
  - [**JobsOCCalendar**](#JobsOCCalendar)
  - [**JobsOCComment**](#JobsOCComment)
  - [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCExcel**](#JobsOCExcel)
  - [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha)
  - [**JobsOCKeyboardMgr**](#JobsOCKeyboardMgr)
  - [**JobsOCMarkdown**](#JobsOCMarkdown)
  - [**JobsOCNumberStepper**](#JobsOCNumberStepper)
  - [**JobsOCOpen**](#JobsOCOpen)
  - [**JobsOCPatch**](#JobsOCPatch)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRefresher**](#JobsOCRefresher)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCSearcher**](#JobsOCSearcher)
  - [**JobsOCSkeletonView**](#JobsOCSkeletonView)
  - [**JobsOCSnowflake**](#JobsOCSnowflake)
  - [**JobsOCSplash**](#JobsOCSplash)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**JobsOCTimerMgr**](#JobsOCTimerMgr)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling)
  - [**JobsOCVideoRecorder**](#JobsOCVideoRecorder)
  - [**JobsOCWebSocket**](#JobsOCWebSocket)
  - [**JobsPresentTransitionMgr**](#JobsPresentTransitionMgr)
  - [**JobsProgressBar**](#JobsProgressBar)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsScreenCapture**](#JobsScreenCapture)
  - [**JobsSuspend**](#JobsSuspend)
  - [**JobsTabBarCtrl**](#JobsTabBarCtrl)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**JobsUploadingProgressView**](#JobsUploadingProgressView)
  - [**JobsViewNavigator**](#JobsViewNavigator)
  - [**JobsViewPush**](#JobsViewPush)
  - [**JobsWallet**](#JobsWallet)
  - [**LMJDropdownMenuExtra**](#LMJDropdownMenuExtra)
  - [**MGSwipeTableCellExtra**](#MGSwipeTableCellExtra)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**ReachabilityExtra**](#ReachabilityExtra)
  - [**SRWebSocketExtra**](#SRWebSocketExtra)
  - [**SYSAlertControllerExtra**](#SYSAlertControllerExtra)
  - [**SZTextViewExtra**](#SZTextViewExtra)
  - [**TFPopup**](#TFPopup)
  - [**TFPopupExtra**](#TFPopupExtra)
  - [**TKPermissionKit**](#TKPermissionKit)
  - [**UIBaseTextFieldDSL**](#UIBaseTextFieldDSL)
  - [**WHToastExtra**](#WHToastExtra)
  - [**WMZCode**](#WMZCode)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)
  - [**ZFPlayerExtra**](#ZFPlayerExtra)
  - [**ZMJCellExtra**](#ZMJCellExtra)

- **下游依赖**

  - [**GKNavigationBar**](https://github.com/QuintGao/GKNavigationBar)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsGetWindow**](#JobsGetWindow)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**XYColorOC**](#XYColorOC)
  - [**YTKNetwork**](https://github.com/yuantiku/YTKNetwork)


### 66、<font id="JobsOCExcel">JobsOCExcel</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCExcel@Pods/JobsOCExcel.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling)
  - [**Masonry**](https://github.com/SnapKit/Masonry)


### 67、<font id="JobsOCGraphicCaptcha">JobsOCGraphicCaptcha</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCGraphicCaptcha@Pods/JobsOCGraphicCaptcha.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsModel**](#JobsModel)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 68、<font id="JobsOCKeyboardMgr">JobsOCKeyboardMgr</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCKeyboardMgr@Pods/JobsOCKeyboardMgr.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 69、<font id="JobsOCMarkdown">JobsOCMarkdown</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCMarkdown@Pods/JobsOCMarkdown.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**Masonry**](https://github.com/SnapKit/Masonry)


### 70、<font id="JobsOCNumberStepper">JobsOCNumberStepper</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCNumberStepper@Pods/JobsOCNumberStepper.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**Masonry**](https://github.com/SnapKit/Masonry)


### 71、<font id="JobsOCOpen">JobsOCOpen</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCOpen@Pods/JobsOCOpen.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsGetWindow**](#JobsGetWindow)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsStringUtils**](#JobsStringUtils)


### 72、<font id="JobsOCPatch">JobsOCPatch</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCPatch@Pods/JobsOCPatch.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 73、<font id="JobsOCProtocols">JobsOCProtocols</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCProtocols@Pods/JobsOCProtocols.podspec`

- **上游依赖**

  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsClockView**](#JobsClockView)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsImageNumberView**](#JobsImageNumberView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsModel**](#JobsModel)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsNetWorkTools**](#JobsNetWorkTools)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**JobsOCTimerMgr**](#JobsOCTimerMgr)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsWallet**](#JobsWallet)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**WHToastExtra**](#WHToastExtra)
  - [**WMZCode**](#WMZCode)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**SPAlertController**](https://github.com/SPStore/SPAlertController)
  - [**YTKNetwork**](https://github.com/yuantiku/YTKNetwork)


### 74、<font id="JobsOCRefresher">JobsOCRefresher</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCRefresher@Pods/JobsOCRefresher.podspec`

- **上游依赖**

  - [**JobsOCComment**](#JobsOCComment)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsFuseAnimation**](#JobsFuseAnimation)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 75、<font id="JobsOCRuntimeKits">JobsOCRuntimeKits</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCRuntimeKits@Pods/JobsOCRuntimeKits.podspec`

- **上游依赖**

  - [**FMDatabaseExtra**](#FMDatabaseExtra)
  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDropDownListView**](#JobsDropDownListView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsSuspend**](#JobsSuspend)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**SYSAlertControllerExtra**](#SYSAlertControllerExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCSnowflake**](#JobsOCSnowflake)
  - [**JobsRandomUtils**](#JobsRandomUtils)
  - [**WHToastExtra**](#WHToastExtra)


### 76、<font id="JobsOCSearcher">JobsOCSearcher</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCSearcher@Pods/JobsOCSearcher.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**Masonry**](https://github.com/SnapKit/Masonry)


### 77、<font id="JobsOCSkeletonView">JobsOCSkeletonView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCSkeletonView@Pods/JobsOCSkeletonView.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 78、<font id="JobsOCSnowflake">JobsOCSnowflake</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCSnowflake@Pods/JobsOCSnowflake.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 79、<font id="JobsOCSplash">JobsOCSplash</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCSplash@Pods/JobsOCSplash.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCTimer**](#JobsOCTimer)


### 80、<font id="JobsOCTimer">JobsOCTimer</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCTimer@Pods/JobsOCTimer.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsClockView**](#JobsClockView)
  - [**JobsCountdownBtn**](#JobsCountdownBtn)
  - [**JobsFuseAnimation**](#JobsFuseAnimation)
  - [**JobsImageRotation**](#JobsImageRotation)
  - [**JobsLuckyEnvelopeRain**](#JobsLuckyEnvelopeRain)
  - [**JobsNetWorkTools**](#JobsNetWorkTools)
  - [**JobsOCAudioRecorder**](#JobsOCAudioRecorder)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCSplash**](#JobsOCSplash)
  - [**JobsOCTimerMgr**](#JobsOCTimerMgr)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsOCUILabelScrolling**](#JobsOCUILabelScrolling)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)
  - [**WHToast**](https://github.com/remember17/WHToast)
  - [**WHToastExtra**](#WHToastExtra)


### 81、<font id="JobsOCTimerMgr">JobsOCTimerMgr</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCTimerMgr@Pods/JobsOCTimerMgr.podspec`

- **上游依赖**

  - [**JobsMarqueeView**](#JobsMarqueeView)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCTimer**](#JobsOCTimer)


### 82、<font id="JobsOCTools">JobsOCTools</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCTools@Pods/JobsOCTools.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)

- **下游依赖**

  - [**AFSecurityPolicyExtra**](#AFSecurityPolicyExtra)
  - [**FDFullscreenPopGesture**](#FDFullscreenPopGesture)
  - [**FMDatabaseExtra**](#FMDatabaseExtra)
  - [**FSCalendar**](#FSCalendar)
  - [**FSCalendarExtra**](#FSCalendarExtra)
  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**HTMLDocumentExtra**](#HTMLDocumentExtra)
  - [**HXPhotoManagerExtra**](#HXPhotoManagerExtra)
  - [**HXPhotoViewExtra**](#HXPhotoViewExtra)
  - [**IQKeyboardManagerExtra**](#IQKeyboardManagerExtra)
  - [**JXCategoryViewExtra**](#JXCategoryViewExtra)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCountdownBtn**](#JobsCountdownBtn)
  - [**JobsCryptography**](#JobsCryptography)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsFuseAnimation**](#JobsFuseAnimation)
  - [**JobsHotLabel**](#JobsHotLabel)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsLoadingImage**](#JobsLoadingImage)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCGraphicCaptcha**](#JobsOCGraphicCaptcha)
  - [**JobsOCKeyboardMgr**](#JobsOCKeyboardMgr)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**JobsSuspend**](#JobsSuspend)
  - [**LMJDropdownMenuExtra**](#LMJDropdownMenuExtra)
  - [**MGSwipeTableCellExtra**](#MGSwipeTableCellExtra)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**PPBadgeView**](https://github.com/jkpang/PPBadgeView)
  - [**RACExtra**](#RACExtra)
  - [**ReachabilityExtra**](#ReachabilityExtra)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**SRWebSocketExtra**](#SRWebSocketExtra)
  - [**SZTextViewExtra**](#SZTextViewExtra)
  - [**SocketRocket**](https://github.com/facebookincubator/SocketRocket)
  - [**TFPopupExtra**](#TFPopupExtra)
  - [**XYColorOC**](#XYColorOC)
  - [**ZFPlayer**](https://github.com/renzifeng/ZFPlayer)
  - [**ZFPlayerExtra**](#ZFPlayerExtra)
  - [**ZMJCellExtra**](#ZMJCellExtra)
  - [**lottie-ios**](https://github.com/airbnb/lottie-ios)


### 83、<font id="JobsOCUILabelScrolling">JobsOCUILabelScrolling</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCUILabelScrolling@Pods/JobsOCUILabelScrolling.podspec`

- **上游依赖**

  - [**JobsOCExcel**](#JobsOCExcel)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCTimer**](#JobsOCTimer)


### 84、<font id="JobsOCVideoRecorder">JobsOCVideoRecorder</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCVideoRecorder@Pods/JobsOCVideoRecorder.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**TKPermissionKit**](#TKPermissionKit)


### 85、<font id="JobsOCWebSocket">JobsOCWebSocket</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsOCWebSocket@Pods/JobsOCWebSocket.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**SRWebSocketExtra**](#SRWebSocketExtra)
  - [**SocketRocket**](https://github.com/facebookincubator/SocketRocket)


### 86、<font id="JobsPresentTransitionMgr">JobsPresentTransitionMgr</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsPresentTransitionMgr@Pods/JobsPresentTransitionMgr.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 87、<font id="JobsProgressBar">JobsProgressBar</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsProgressBar@Pods/JobsProgressBar.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 88、<font id="JobsRandomUtils">JobsRandomUtils</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsRandomUtils@Pods/JobsRandomUtils.podspec`

- **上游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)


### 89、<font id="JobsRichTextUtils">JobsRichTextUtils</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsRichTextUtils@Pods/JobsRichTextUtils.podspec`

- **上游依赖**

  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsSuspend**](#JobsSuspend)
  - [**MJRefreshExtra**](#MJRefreshExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**XYColorOC**](#XYColorOC)


### 90、<font id="JobsScreenCapture">JobsScreenCapture</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsScreenCapture@Pods/JobsScreenCapture.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**Masonry**](https://github.com/SnapKit/Masonry)


### 91、<font id="JobsStringUtils">JobsStringUtils</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsStringUtils@Pods/JobsStringUtils.podspec`

- **上游依赖**

  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsDebug**](#JobsDebug)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsModel**](#JobsModel)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCOpen**](#JobsOCOpen)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)


### 92、<font id="JobsSuspend">JobsSuspend</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsSuspend@Pods/JobsSuspend.podspec`

- **上游依赖**

  - [**JobsBitsMonitor**](#JobsBitsMonitor)
  - [**JobsMonitorNetwoking**](#JobsMonitorNetwoking)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsLoadingImage**](#JobsLoadingImage)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**XYColorOC**](#XYColorOC)


### 93、<font id="JobsTabBarCtrl">JobsTabBarCtrl</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsTabBarCtrl@Pods/JobsTabBarCtrl.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 94、<font id="JobsTimeUtils">JobsTimeUtils</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsTimeUtils@Pods/JobsTimeUtils.podspec`

- **上游依赖**

  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**WHToastExtra**](#WHToastExtra)


### 95、<font id="JobsUploadingProgressView">JobsUploadingProgressView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsUploadingProgressView@Pods/JobsUploadingProgressView.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 96、<font id="JobsViewNavigator">JobsViewNavigator</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsViewNavigator@Pods/JobsViewNavigator.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**Masonry**](https://github.com/SnapKit/Masonry)


### 97、<font id="JobsViewPush">JobsViewPush</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsViewPush@Pods/JobsViewPush.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)


### 98、<font id="JobsWallet">JobsWallet</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/JobsWallet@Pods/JobsWallet.podspec`

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModel**](#JobsModel)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**XYColorOC**](#XYColorOC)


### 99、<font id="LMJDropdownMenuExtra">LMJDropdownMenuExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/LMJDropdownMenuExtra@Pods/LMJDropdownMenuExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**LMJDropdownMenu**](https://github.com/JerryLMJ/LMJDropdownMenu)


### 100、<font id="MGSwipeTableCellExtra">MGSwipeTableCellExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/MGSwipeTableCellExtra@Pods/MGSwipeTableCellExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**MGSwipeTableCell**](https://github.com/MortimerGoro/MGSwipeTableCell)


### 101、<font id="MJRefreshExtra">MJRefreshExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/MJRefreshExtra@Pods/MJRefreshExtra.podspec`

- **上游依赖**

  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsDeviceInfo**](#JobsDeviceInfo)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsLoadingImage**](#JobsLoadingImage)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**MJRefresh**](https://github.com/CoderMJLee/MJRefresh)
  - [**TABAnimated**](#TABAnimated)
  - [**WHToastExtra**](#WHToastExtra)
  - [**XYColorOC**](#XYColorOC)
  - [**XZMRefresh**](https://github.com/xiezhongmin/XZMRefresh)
  - [**lottie-ios**](https://github.com/airbnb/lottie-ios)


### 102、<font id="RACExtra">RACExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/RACExtra@Pods/RACExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)


### 103、<font id="ReachabilityExtra">ReachabilityExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ReachabilityExtra@Pods/ReachabilityExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**Reachability**](https://github.com/tonymillion/Reachability)


### 104、<font id="SRWebSocketExtra">SRWebSocketExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/SRWebSocketExtra@Pods/SRWebSocketExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsOCWebSocket**](#JobsOCWebSocket)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**SocketRocket**](https://github.com/facebookincubator/SocketRocket)


### 105、<font id="SYSAlertControllerExtra">SYSAlertControllerExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/SYSAlertControllerExtra@Pods/SYSAlertControllerExtra.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**WHToast**](https://github.com/remember17/WHToast)
  - [**WHToastExtra**](#WHToastExtra)


### 106、<font id="SZTextViewExtra">SZTextViewExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/SZTextViewExtra@Pods/SZTextViewExtra.podspec`

- **上游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**SZTextView**](https://github.com/glaszig/SZTextView)


### 107、<font id="TABAnimated">TABAnimated</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/TABAnimated/TABAnimated.podspec`

- **上游依赖**

  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**MJRefreshExtra**](#MJRefreshExtra)


### 108、<font id="TFPopup">TFPopup</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/TFPopup/TFPopup.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**TFPopupExtra**](#TFPopupExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 109、<font id="TFPopupExtra">TFPopupExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/TFPopupExtra@Pods/TFPopupExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**TFPopup**](#TFPopup)


### 110、<font id="TKPermissionKit">TKPermissionKit</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/TKPermissionKit/TKPermissionKit.podspec`

- **上游依赖**

  - [**JobsOCVideoRecorder**](#JobsOCVideoRecorder)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsOCDefs**](#JobsOCDefs)


### 111、<font id="Texture">Texture</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/Texture/Texture.podspec`

- **上游依赖**

  - [**JobsOCDSL**](#JobsOCDSL)

- **下游依赖**

  - **IGListDiffKit**
  - **IGListKit**
  - **PINRemoteImage**
  - **Yoga**


### 112、<font id="This">This</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/This@Pods/This.podspec`

- **上游依赖**

  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)


### 113、<font id="UIBaseTextFieldDSL">UIBaseTextFieldDSL</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/UIBaseTextFieldDSL@Pods/UIBaseTextFieldDSL.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDefs**](#JobsOCDefs)


### 114、<font id="WHToastExtra">WHToastExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/WHToastExtra@Pods/WHToastExtra.podspec`

- **上游依赖**

  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsBasePopupView**](#JobsBasePopupView)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsNavigationTransitionMgr**](#JobsNavigationTransitionMgr)
  - [**JobsOCRuntimeKits**](#JobsOCRuntimeKits)
  - [**JobsOCTimer**](#JobsOCTimer)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**SYSAlertControllerExtra**](#SYSAlertControllerExtra)
  - [**YTKNetworkExtra**](#YTKNetworkExtra)

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsClass**](#JobsClass)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**Masonry**](https://github.com/SnapKit/Masonry)
  - [**ReactiveObjC**](https://github.com/ReactiveCocoa/ReactiveObjC)
  - [**SDWebImage**](https://github.com/SDWebImage/SDWebImage)
  - [**WHToast**](https://github.com/remember17/WHToast)
  - [**XYColorOC**](#XYColorOC)


### 115、<font id="WMZCode">WMZCode</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/WMZCode/WMZCode.podspec`

- **下游依赖**

  - [**JobsBlock**](#JobsBlock)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)


### 116、<font id="XYColorOC">XYColorOC</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/XYColorOC/XYColorOC.podspec`

- **上游依赖**

  - [**BRPickerViewExtra**](#BRPickerViewExtra)
  - [**GKCustomNavigationBarExtra**](#GKCustomNavigationBarExtra)
  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsAppTools**](#JobsAppTools)
  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsFiltrationView**](#JobsFiltrationView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)
  - [**JobsModel**](#JobsModel)
  - [**JobsNavBar**](#JobsNavBar)
  - [**JobsOCCountryCodeCtrl**](#JobsOCCountryCodeCtrl)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCTools**](#JobsOCTools)
  - [**JobsRichTextUtils**](#JobsRichTextUtils)
  - [**JobsSuspend**](#JobsSuspend)
  - [**JobsWallet**](#JobsWallet)
  - [**MJRefreshExtra**](#MJRefreshExtra)
  - [**WHToastExtra**](#WHToastExtra)


### 117、<font id="YTKNetworkExtra">YTKNetworkExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/YTKNetworkExtra@Pods/YTKNetworkExtra.podspec`

- **上游依赖**

  - [**JobsAPIs**](#JobsAPIs)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsCustomView**](#JobsCustomView)
  - [**JobsLinkageMenuView**](#JobsLinkageMenuView)

- **下游依赖**

  - [**AFNetworking**](https://github.com/AFNetworking/AFNetworking)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsLanMgr**](#JobsLanMgr)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsModelDSL**](#JobsModelDSL)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**JobsOCProtocols**](#JobsOCProtocols)
  - [**JobsStringUtils**](#JobsStringUtils)
  - [**JobsTimeUtils**](#JobsTimeUtils)
  - [**MJExtension**](https://github.com/CoderMJLee/MJExtension)
  - [**WHToastExtra**](#WHToastExtra)
  - [**YTKNetwork**](https://github.com/yuantiku/YTKNetwork)


### 118、<font id="YYKits">YYKits</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/YYKits/YYKits.podspec`


### 119、<font id="ZBNetworking">ZBNetworking</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/ZBNetworking/ZBNetworking.podspec`

- **上游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)

- **下游依赖**

  - [**AFNetworking**](https://github.com/AFNetworking/AFNetworking)


### 120、<font id="ZFPlayerExtra">ZFPlayerExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ZFPlayerExtra@Pods/ZFPlayerExtra.podspec`

- **上游依赖**

  - [**JobsAppDoor**](#JobsAppDoor)
  - [**JobsByOCPods**](#JobsByOCPods)
  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**ZFPlayer**](https://github.com/renzifeng/ZFPlayer)


### 121、<font id="ZMJCellExtra">ZMJCellExtra</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ZMJCellExtra@Pods/ZMJCellExtra.podspec`

- **上游依赖**

  - [**JobsOCTools**](#JobsOCTools)

- **下游依赖**

  - [**JobsBaseUI**](#JobsBaseUI)
  - [**JobsBlock**](#JobsBlock)
  - [**JobsMakes**](#JobsMakes)
  - [**JobsOCDSL**](#JobsOCDSL)
  - [**JobsOCDefs**](#JobsOCDefs)
  - [**ZMJGanttChart**](https://github.com/keshiim/ZMJGanttChart)


### 122、<font id="ZWPullMenuView">ZWPullMenuView</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

Podspec：`JobsByPods/ManualByOCPods@Pods/ZWPullMenuView/ZWPullMenuView.podspec`

- **上游依赖**

  - [**JobsBitsMonitor**](#JobsBitsMonitor)

- **下游依赖**

  - [**JobsByOCPods**](#JobsByOCPods)


## 九、生成的文件 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `PodspecDependencies_interactive.html`：可搜索、可拖拽、可缩放动态图，内置 `2D 关系图` / `3D 空间图` 切换
- `PodspecDependencies.md`：本报告
- `PodspecDependencies_all.mmd`：全部依赖 Mermaid 图源码
- `PodspecDependencies_internal.mmd`：仓库内 Pod 相互依赖 Mermaid 图源码
- `PodspecDependencies_all.dot`：全部依赖 Graphviz DOT 源码
- `PodspecDependencies_internal.dot`：仓库内 Pod 相互依赖 Graphviz DOT 源码

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
