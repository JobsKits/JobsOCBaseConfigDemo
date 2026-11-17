# OC老工程 App骨架功能盘点

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、OC新旧共同需求与资产矩阵](#matrix)
- [二、实现形态与已知差异](#shape)
- [三、后续比对与验收](#verification)
- [四、Core Data 专项接入资产](#coredata-assets)
- [五、报告目录](#reports)
- [当前时区卡片与制式标题合同（2026-11-16）](#jobs-toc-heading-7)
- [首页返回、侧栏与开屏浮控增量](#home-return-sidebar-20261116)
- [六、中英混排核心与源码状态](#mixed-script-source-20261117)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

核查日期：2026-11-15。范围为 App 的启动、开屏、根容器、首页目录、导航、菜单、搜索、侧栏、设置、悬浮控件和全局生命周期。**不统计 Demo 子页面内的业务功能**；菜单目的页只核对是否真正路由进入。本文区分源码实现、构建和交互验收；本轮新增菜单、最近使用、自适应浮钟与世界时钟的验证记录，其它条目沿用已注明的证据边界。

Rust OCR 独立 Demo 的输入、结果、SDK 装配、生命周期与验证状态另见 [Rust OCR 集成资产盘点](./RustOCR集成/README.md)，不以首页登记替代识别功能验收。

## 一、<span id="matrix">OC新旧共同需求与资产矩阵</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

两工程需求完全相同；下表以同一组稳定编号分别记录实现。列中的源码行号来自本次工作区，未将代码存在当作设备验收。

| 编号 | 入口／资产 | 当前行为 | 默认／边界 | 持久化／状态键 | 状态 | OC新工程证据 | OC老工程证据 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| SKEL-01 | 进程启动与风险门禁 | AppDelegate启动先决策；被阻断则Scene展示拦截页并跳过业务初始化 | 门禁按设备结果决策；本次未运行实体风险场景 | `无首页偏好键` | 已核查接线；设备效果待验 | [AppDelegate+UIApplicationDelegate.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+UIApplicationDelegate/AppDelegate+UIApplicationDelegate.m>) 第 36 行（`JobsOCDeviceGuardLaunchGate.prepare`） | [AppDelegate+UIApplicationDelegate.m](<../JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+UIApplicationDelegate/AppDelegate+UIApplicationDelegate.m>) 第 36 行（`JobsOCDeviceGuardLaunchGate.prepare`） |
| SKEL-02 | Scene与独立Window | 每Scene创建Window；会话恢复分支直接路由Scene页面；进入后台写安全点 | 正常Scene进入根容器；存在恢复activity走恢复分支 | `UISceneSession.persistentIdentifier / NSUserActivity` | 已核查接线 | [SceneDelegate+UISceneDelegate.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/入口/SceneDelegate/SceneDelegate+UISceneDelegate/SceneDelegate+UISceneDelegate.m>) 第 55 行（`JobsOCMakeAppRootViewController`） | [SceneDelegate+UISceneDelegate.m](<../JobsOCBaseConfigDemo/入口/SceneDelegate/SceneDelegate+UISceneDelegate/SceneDelegate+UISceneDelegate.m>) 第 55 行（`JobsOCMakeAppRootViewController`） |
| SKEL-03 | 启动入口 | 设置可切Demo根列表／TabBar；返回后重建根控制器 | 默认直接Demo列表；TabBar为5个控制器容器 | `com.BSports.JobsOCDemoListUsesTabBarEntryUserDefaultsKey` | 已实现 | [AppDelegate+TabBarCtr.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+TabBarCtr/AppDelegate+TabBarCtr.m>) 第 37 行（`JobsOCMakeAppRootViewController`） | [AppDelegate+TabBarCtr.m](<../JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+TabBarCtr/AppDelegate+TabBarCtr.m>) 第 37 行（`JobsOCMakeAppRootViewController`） |
| SKEL-04 | 开屏显示与移除 | Scene在根容器之上展示开屏，8秒倒计时并可跳过；点击／摇动配置none；不把开屏留在导航栈 | 默认启用；图片、本地GIF、远程图片、本地视频、远程视频5类；默认内容由Preferences读取 | `com.BSports.JobsOCSplashEnabledUserDefaultsKey / com.jobs.splash.contentTypeForNextLaunch` | 已核查宿主；Presenter移除／离线缓存实体路径待验 | [AppDelegate+Func.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+Func/AppDelegate+Func.m>) 第 188 行（`byCountdownSeconds(@8)`） | [AppDelegate+Func.m](<../JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+Func/AppDelegate+Func.m>) 第 135 行（`byCountdownSeconds(@8)`） |
| SKEL-05 | 根导航与返回 | 独立导航容器进入功能页；返回策略可保持原样或回顶部刷新 | 默认回顶部并刷新 | `com.BSports.JobsOCDemoListReturnToTopAndRefreshUserDefaultsKey` | 已实现 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1948 行（`demoListReturnToTopAndRefreshEnabled`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1981 行（`demoListReturnToTopAndRefreshEnabled`） |
| SKEL-06 | 右上唯一菜单 | 32pt空心／实心圆圈省略号切换；搜索Demo／全部展开或收缩／设置三项动作；独立阴影壳承载圆角内容，外点收起 | 默认收起；宽至少112pt且随翻译扩宽，16pt字、行高至少48pt、上下内边距8pt、圆角8pt；真实按钮右缘对齐，向下4pt，安全区8pt防越界；布局与主题变化重定位 | `仅内存显示态` | 源码及前轮两工程arm64构建通过；两OC中文浅色菜单阴影／圆角／按钮右缘／下方间距及右缘不裁切均实看通过；深色／长文本待验；两OC AX源码补线与arm64构建通过；前轮CUA未完整暴露，末轮XCTest已实际读取三行完整标题／稳定ID；左按钮／右标签的CUA暴露仍待核 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 2305 行（`updateFunctionMenuLayout`）；`functionMenuShadowView / functionMenuTableWidth / functionMenuRowHeight` | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 2338 行（`updateFunctionMenuLayout`）；同组外观与尺寸方法 |
| SKEL-07 | 搜索独占与恢复 | 菜单进入；隐藏导航、浮控和Bug，禁用侧栏；取消恢复滚动位置与展开状态；收键盘不退出搜索 | 首页无常驻搜索框；进入搜索先展示空查询／历史 | `com.BSports.JobsOCDemoSearchHistoryUserDefaultsKey` | 源码已实现；新OC搜索“微应用沙箱”并由结果进入真实沙箱页已验；取消恢复仍待验 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3490 行（`setSearchEnabled`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3523 行（`setSearchEnabled`） |
| SKEL-08 | 搜索匹配与空态 | 按标题／分类／类型等目录字段过滤，历史可复用；空结果由Searcher与列表空态处理 | 无查询为搜索落地态；搜索结果与首页目录分离 | `搜索历史使用07所列key` | 已核查入口；所有异常输入与空态视觉待验 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3661 行（`demoSearchLandingActive`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3694 行（`demoSearchLandingActive`） |
| SKEL-09 | 左侧栏结构 | 左上按钮及左缘手势打开；用户信息／崩溃日志／最近使用／设置／关于 | 默认following，比例0.5，宽不超过320缩放单位；左导航源码已设置“打开侧栏”AX语义与稳定标识 jobs.coverage.open.sideMenu，本批原生UI测试已实际点击并确认首页平移 | `JobsOCDemoSideDrawerFixed（false为following）` | 最近使用接入实际列表；关于仍Toast占位 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1406 行（`demoSideMenuTitles / handleDemoSideMenuItemAtIndex`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1203 行（同入口） |
| SKEL-10 | 侧栏内容联动与比例 | 设置切following与fixed；following将主页向右推移，fixed覆盖主内容；公共配置支持比例 | 首页当前固定0.5，设置未提供半开／全宽比例选择 | `JobsOCDemoSideDrawerFixed` | 跟随／固定已接入；首页全宽选择缺失 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1484 行（`byPresentedRatio(0.5)`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1517 行（`byPresentedRatio(0.5)`） |
| SKEL-11 | 分组展开／收缩 | 每组可单独展开收起；右上菜单批量切；搜索匹配时展开结果 | 默认第一组展开；展开集合在内存，非跨启动记忆 | `expandedDemoSectionIndexSet（内存）` | 已实现 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3706 行（`foldDemoSectionsWithFirstUnfolded`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3739 行（`foldDemoSectionsWithFirstUnfolded`） |
| SKEL-12 | 分组拖放顺序 | 长按组头及编辑移动；释放写顺序；移动时同步展开状态；“其他”强制末尾 | 保存终点顺序并在下次启动恢复；未找到“不记忆”设置 | `com.BSports.JobsOCDemoListSectionOrderUserDefaultsKey` | 持久排序已实现；记忆开关缺失 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3297 行（`saveDemoSectionOrder`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3330 行（`saveDemoSectionOrder`） |
| SKEL-13 | 功能置顶／取消 | 功能项置顶后出现独立顶部section并从原组移除；取消回原组并展开，定位顶部 | 默认无置顶；与最近使用独立；按稳定类型key保存 | `com.BSports.JobsOCDemoPinnedDemoUserDefaultsKey` | 已实现 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 2677 行（`pinDemoViewModel`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 2710 行（`pinDemoViewModel`） |
| SKEL-14 | 悬浮时间外观与移动 | 深蓝#1565C0／白字（静态对比5.75:1）、标题18粗体／时间13等宽数字随字体缩放，按本地化字形和安全区测量，padding16/10；短按直接push世界时钟，长按0.5秒后拖动，释放四边最近吸附（替代旧Toast／隐藏确认） | 默认显示；保留设置显隐；全屏四边吸附、布局／字体／语言变化保持吸附边并钳制，禁止固定宽和持续缩字 | `com.jobs.demoList.showsSuspendTimeButton；拖动坐标本页内存` | 源码已实现；共享生产测量实现单轮UIKit 682断言通过；两最终arm64包与中文浅色物理用例通过：长按位移／松手互斥／导航区可触／计时不拉回／push返回保位；字体和旋转实机矩阵待验 | [OC新首页](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>)（字号／测量／布局、push与长按） | [OC旧首页](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>)（字号／测量／布局、push与长按） |
| SKEL-15 | 时间隐藏恢复与计时 | 设置可重显；隐藏暂停时间Timer，显示恢复；不影响其它浮控 | 长按取消保留显示；确认隐藏持久化 | `com.jobs.demoList.showsSuspendTimeButton` | 已实现 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 779 行（`refreshSuspendTimeButtonVisibility`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 812 行（`refreshSuspendTimeButtonVisibility`） |
| SKEL-16 | 左下“按” | 紫色50×50；短按音效并切顶部／底部；0.8秒长按后1.2秒白色环进度和1.18缩放；释放／取消停止并吞随后短按 | 默认显示；支持拖动与吸边；短按位置开关在内存 | `suspendFuseLongPressConsumed / button.selected（内存）` | 已实现 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1693 行（`suspendFuseBtn`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1726 行（`suspendFuseBtn`） |
| SKEL-17 | 右下旋转计时 | 橙色50×50，22pt粗体秒值；默认旋转，每秒加1；点击同时暂停／恢复动画和Timer，长按Toast | 默认显示且运行；计时与暂停态不跨启动记忆 | `ViewController_1.suspendSpinBtn.timer（注册ID，不是偏好）` | 已实现 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1644 行（`suspendSpinBtn`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 1677 行（`suspendSpinBtn`） |
| SKEL-18 | Bug调试入口 | Debug悬浮Bug图可拖，长按0.8秒隐藏，摇动恢复；点击调试面板；搜索临时抑制入口 | Debug默认隐藏，第一次摇动显示；隐藏不销毁拖动位置 | `隐藏态内存；环境使用com.jobs.debugPanel.environmentIdentifier` | 已核查组件源码；实体摇动待验 | [JobsDebugPanelManager.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsByPods/JobsDebugPanel@Pods/Core/JobsDebugPanelManager/JobsDebugPanelManager.m>) 第 369 行（`hideForCurrentLaunch`） | [JobsDebugPanelManager.m](<../Libs/OCBaseConfig/JobsMixFunc/JobsDebugPanel/Core/JobsDebugPanelManager/JobsDebugPanelManager.m>) 第 369 行（`hideForCurrentLaunch`） |
| SKEL-19 | 调试环境 | App注册本地Mock／httpbin／postman环境，切换回写网络基址；面板有环境和动作 | Debug默认local，恢复先前有效选择；Release不启动面板 | `com.jobs.debugPanel.environmentIdentifier` | 已实现；外部服务可用性未测试 | [AppDelegate+Func.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+Func/AppDelegate+Func.m>) 第 134 行（`byEnvironments`） | [AppDelegate+Func.m](<../JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+Func/AppDelegate+Func.m>) 第 171 行（`byEnvironments`） |
| SKEL-20 | 设置基础项 | 开屏开关、返回行为、时间显隐、主题、侧栏固定／跟随、启动入口、销毁提示；分区可收缩 | 按已有偏好恢复；开屏与入口变更按其下次启动／返回时机生效 | `各项key见对应资产；销毁提示key未在本次追到底层` | 已实现 | [JobsOCDemoListSettingsVC.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCDemoListSettingsVC/JobsOCDemoListSettingsVC.m>) 第 640 行（`generalSettingTitleArr`） | [JobsOCDemoListSettingsVC.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCDemoListSettingsVC/JobsOCDemoListSettingsVC.m>) 第 640 行（`generalSettingTitleArr`） |
| SKEL-21 | 语言与主题 | 语言支持系统＋简繁藏英日法西德俄韩Filipino；导航与设置主题共用白天／黑夜／跟随系统三选一菜单，勾选当前选择 | 未保存时沿主题包默认白天；currentStyle保留任意legacy raw，followingSystem独立保存kind；effectiveStyle按真实Scene解析；手动模式固定，前台重校准 | `LanMgr / JobsTheme.currentStyle / JobsTheme.followingSystem`（不保留任何raw名称或前缀） | 旧OC当前独立kind四项XCTest与强化生产UI通过；System实际深浅PNG已目视，手动固定／冷热恢复与菜单内外点击通过；证据见RustOCR集成/主题验收；新OC当前修订另验，完整十语／旧系统／大字号矩阵另验 | [JobsOCDemoListSettingsVC.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCDemoListSettingsVC/JobsOCDemoListSettingsVC.m>)（themeSwitchTitle／共用三态菜单入口） | [JobsOCDemoListSettingsVC.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCDemoListSettingsVC/JobsOCDemoListSettingsVC.m>)（themeSwitchTitle／共用三态菜单入口） |
| SKEL-22 | 列表文字策略 | 一般／省略号／缩小字体／连续跑马灯／左右往返；设置回写并刷新目录 | 默认continuous策略；不同主题配对前景背景 | `com.jobs.demoList.cellTextDisplayStrategy` | 已核查枚举与设置；默认以Preferences源码为准 | [JobsOCDemoListSettingsVC.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCDemoListSettingsVC/JobsOCDemoListSettingsVC.m>) 第 670 行（`cellTextDisplayStrategyTitleArr`） | [JobsOCDemoListSettingsVC.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCDemoListSettingsVC/JobsOCDemoListSettingsVC.m>) 第 670 行（`cellTextDisplayStrategyTitleArr`） |
| SKEL-23 | 刷新、空态与手势 | 首页下拉反馈／尾部刷新接线；列表空态按钮；滚动收菜单；搜索隔离侧缘手势；子页不得抢开侧栏 | 本地目录，不是服务端分页；空态保留恢复动作 | `刷新状态内存` | 已核查接线；取消竞态与完整无障碍待验 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3885 行（`demoListEmptyDataButtonModel`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 3918 行（`demoListEmptyDataButtonModel`） |
| SKEL-24 | 前后台与离屏Timer | 时间与旋转两Timer均配置JobsTimerBackgroundPolicyPauseAndResume；Scene记录前后台，Root销毁移除Timer，离开首页收侧栏 | 配置为后台暂停／前台恢复；首页viewWillDisappear未显式暂停两项浮控Timer，实际回调与离屏行为待验 | `Timer注册ID；无新偏好` | 后台策略已核查配置；运行与离屏效果待验 | [ViewController@1.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 804 行（`JobsTimerBackgroundPolicyPauseAndResume`） | [ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 837 行（`JobsTimerBackgroundPolicyPauseAndResume`） |
| SKEL-25 | 全局通知、日志与共享数据 | App启动注册本地通知、崩溃监控、主题资源、键盘／导航基础配置；语言快照同步Widget | 风险门禁放行后初始化；推送回调存在不代表远端推送已配置 | `Widget App Group / 崩溃与通知本地状态` | 宿主接线已核；权限／实体服务未验 | [AppDelegate+UIApplicationDelegate.m](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+UIApplicationDelegate/AppDelegate+UIApplicationDelegate.m>) 第 14 行（`JobsSyncWidgetLanguage`） | [AppDelegate+UIApplicationDelegate.m](<../JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+UIApplicationDelegate/AppDelegate+UIApplicationDelegate.m>) 第 14 行（`JobsSyncWidgetLanguage`） |
| SKEL-26 | 最近使用 | 侧栏进入独立最近列表；普通首页／搜索结果／最近列表统一真实跳转时记录，稳定Demo标识去重前插；返回保留最近来源 | 初始为空，最多30项；忽略已删除注册项；图标、标题、轻点重载完整空态；显示时及语言／主题通知重新读取，随宿主明暗和十语切换 | `com.BSports.JobsOCDemoRecentDemoUserDefaultsKey`（NSUserDefaults；重启恢复） | 源码已实现且前轮两工程arm64构建通过；新OC由搜索真实进入后已读回持久化cls:JobsMicroSandboxDemoVC；最近页重启UI／从最近进入并返回、30项上限和主题／十语仍待验 | [根目录记录与过滤](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 2528 行（`rememberRecentDemo / recentDemoEntries / pushDemoViewModel`）；[最近列表](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCRecentDemosVC/JobsOCRecentDemosVC.m>) | [根目录记录与过滤](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>) 第 2561 行（同入口）；[最近列表](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCRecentDemosVC/JobsOCRecentDemosVC.m>) |
| SKEL-27 | `项目相关报告/` 的 [**Xcode**](https://developer.apple.com/xcode/) 物理目录入口 | 根导航使用蓝色 `PBXFileSystemSynchronizedRootGroup`，文件及子目录按真实磁盘自动显示；增删报告不需逐个维护引用 | 仅导航，不属于任何 target，不进入 Sources／Resources／Copy Files | `磁盘文件；无App偏好或运行时生命周期` | 同步组与无target归属已只读核对；实际Xcode展开及增删跟随待实看 | [project.pbxproj](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo.xcodeproj/project.pbxproj>) 的 `项目相关报告` 同步组与根导航 | [project.pbxproj](<../JobsOCBaseConfigDemo.xcodeproj/project.pbxproj>) 的 `项目相关报告` 同步组与根导航 |

| SKEL-28 | 世界时钟与首页名称 | 源码已实现：短按悬浮时间进入独立世界时钟页；首页统一“功能实验室”，保留项目来源副标题；不增加Demo入口、不记最近、不改变目录计数 | 设备当前时区独立置顶；世界时区按当前有效UTC偏移各1代表、可与本地偏移重复；Paris／New York优先其组；包含30／45分钟偏移；完整日期、星期、秒值、UTC偏移和IANA；DST／系统时区准确 | 当前时区按系统、顶部独立强调卡片；制式原生开关默认关（24h），左标题随值显示24／12小时制，偏好键`com.jobs.worldClock.uses12HourFormat`，空值按关；只影响世界页，切换立即刷新并保留滚动；12h明确大写AM／PM（午夜12AM、正午12PM）；前台1秒刷新，离开／后台停 | 源码已实现；共享生产目录实现单轮1134断言通过；主体两arm64包和中文浅色完整物理链路通过（正式标题、24↔12、保持滚动、重启记忆、返回）；末尾返回文案补线新6／旧4已构建，新共享设备上的旧端返回短回归13.641秒通过；十语三主题与系统时区／DST实际切换待验 | [世界页](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCWorldClockVC/JobsOCWorldClockVC.m>)／[目录模型](<../../../JobsOCBaseConfigDemo@ByPods/JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCWorldClockVC/Model/JobsOCWorldClockCatalog/JobsOCWorldClockCatalog.m>) | [世界页](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCWorldClockVC/JobsOCWorldClockVC.m>)／[目录模型](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCWorldClockVC/Model/JobsOCWorldClockCatalog/JobsOCWorldClockCatalog.m>) |

| SKEL-29 | 测试target Pods上下文 | 安装时显式声明真实Tests并继承Pods搜索路径；同名配置仅合并App显式头／framework／library搜索设置，保留Tests已有值与继承变量 | 安装后、实际组件测试构建前校验Tests专属xcconfig及App自有搜索上下文；缺失明确失败；未安装Pods仍可audit-only盘点 | `构建配置；无App运行时偏好、行为或生命周期变化` | 源码已实现；同版CocoaPods DSL与去集成正反证、真实原PCH缺头负证／恢复上下文正证退出0及配置回归已验；正式Test专属xcconfig生成与完整52组件CI待验 | 新OC本轮不改 | [Podfile.deps](../Podfile.deps)／[Podfile](../Podfile)；[集成适配器](<../ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/jobs_stability_integrated.rb/jobs_stability_integrated.rb>)的`inherit_test_search_context / installed_test_configuration` |

## 二、<span id="shape">实现形态与已知差异</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- OC新工程：`byPods`，公共能力集中于 `JobsByPods` 的 Jobs自建本地Pod；OC老工程：`main`，对应能力集成于 `Libs/OCBaseConfig/JobsMixFunc` 等主工程目录。需求保持同一口径，形态差异不产生两套产品要求。
- 两侧根控制器、设置与Scene文件路径相同，函数行号可因导入和封装有差异。首页显示项目名不同属于识别信息。
- 两侧侧栏“用户信息”“崩溃日志”“最近使用”“设置”进入实际页面；收藏占位由最近使用替代，置顶保留；“关于”当前只弹Toast，不能计为完整关于流程。
- “记住组拖放终点”已有；“不记忆／重启还原”的显式设置本次未找到。首页半开／全宽比例选择也未找到；公共Drawer能配置比例不等于首页有可操作入口。

## 三、<span id="verification">后续比对与验收</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 对照Flutter先逐项核查相同资产编号对应的入口、状态变化和返回恢复，再补缺口；不要以另建Demo子页替代App骨架能力。
- 原生后续应验证：开屏倒计时／跳过／前后台恢复／移除后不可返回；搜索取消恢复；侧栏两内容模式及手势取消；组拖放终点重启恢复；置顶与取消的原组归属。
- 浮控应验证全屏边界、吸边、长按取消、隐藏恢复、进后台与离屏Timer策略；Bug应实体摇动、长按隐藏、临时抑制及多Scene验证。源码未显式表达的Timer后台策略仍为待核项。
- 主题入口现状须与“白天／黑夜／跟随系统”要求区分；语言入口存在不代替所有文案完整翻译验收。空态、无障碍、大字体、离线媒体缓存和外部权限服务均需独立验证。

- 归档联动例外：本轮曾调用现有 CoverageCatalog 生成器 `--apply`，更新本工程巡检 `Coverage/routes.json / Flows.json / SourceAudit.json` 的报告路径与文档登记；两 OC 合计 6 份输出。生成器校验 valid=true，业务 route 243／scenario 204、业务源码证据哈希更新数 0；文档数新工程307／老工程187各增加本盘点1份。这属于生成文档清单写入，不能描述成纯只读核查。生成前没有可靠逐字快照且工作区已有改动，未用HEAD覆盖或推算逆改；后续审阅需保留此边界。

- 2026-11-15 菜单视觉与锚定需求：用户确认以 [**Flutter**](https://flutter.dev/) 首页菜单为参考，将三原生首页菜单整理为紧凑圆角卡片、柔和投影与可辨识的表面层次；保留唯一圆圈省略号触发、搜索／批量展开收缩／设置三项动作及外点关闭。菜单必须将真实按钮坐标转换到承载浮层后定位，核对右侧对齐、按钮下方间距、安全区与屏幕边界；明暗主题、长翻译及布局变化下避免偏位或裁切。本轮源码按此合同实现：表面浅色 `#E8EFEB`／深色 `#232C28`，黑色投影半径8pt、偏移(0,4)、透明度0.18／0.42，菜单内容单独裁切，不绘制分隔线；原先左移一个按钮宽度的锚点已改为按钮右缘。构建与模拟器结果在下方单列记录。

- 2026-11-15 本轮验证：两工程均以 `ARCHS=arm64 ONLY_ACTIVE_ARCH=YES CODE_SIGNING_ALLOWED=NO` 完成 Debug 模拟器构建；24份语言字典通过 `plutil -lint`，新增键各一次，两份工程文件通过语法校验。修正新工程同步目录裸拷贝 README 的重复资源冲突，老工程将最近列表 `.m` 加入主App源码成员。源码核对菜单／锚定与最近行为相同，最近列表文件逐字一致；未修改公共组件或第三方代码。主控曾受 DeviceHub/CUA 窗口错误与超时影响；恢复后已实际验证两OC中文浅色菜单外观与位置，新OC搜索真实进入通过；最近列表重启恢复仍待验。

- 2026-11-16 无障碍补线：两OC首页中文浅色菜单的阴影、圆角、按钮右缘锚定、下方间距、屏幕右缘不裁切已实际验收；新OC点击搜索并由结果进入真实沙箱页通过。首页两个现有图像按钮源码已配置AX语义：左“打开侧栏”（`jobs.coverage.open.sideMenu`）、右“更多”（`jobs.coverage.open.functionMenu`，展开态名称不变）；名称随语言刷新，三菜单Cell源码已配置独立AX行，沿用各自完整标题与编号0／1／2标识，透明外壳／表格不作为独占AX元素。仅修改首页与24份语言字典，未调整布局或公共框架；首轮增量曾因磁盘空间不足在构建准备阶段中断，可用空间恢复后顺序重跑；两OC补线arm64增量构建通过；新包英文资源已读回 More／Open sidebar；两最终补线包实际AX读取仍仅见右上一个无label button、首行text／编号0，左导航与其余菜单行未完整暴露；产物与安装包哈希一致，已排除装旧包。最近页入口／返回／重启UI仍待验。

- 新OC最近使用已有单次真实写入证据：从独占搜索输入“微应用沙箱”，选择结果进入真实 `JobsMicroSandboxDemoVC`，宿主 `NSUserDefaults` 回读最近数组为 `cls:JobsMicroSandboxDemoVC`。这证明搜索真实路由的记录与落盘；不代替最近页重启恢复、从最近进入及返回来源验收。子页自定义返回缺AX且坐标操作受窗口错误影响，未将受阻动作写成通过。

- 2026-11-16 只读诊断：新增AX标识及中文标签确实存在于新包二进制；UIBarButtonItem工厂保留原customView，Jobs导航配置交付原bar items，GK setter直接赋予navigationItem，未检出显式重建按钮、accessibilityElements覆盖或隐藏子AX的源码。UIKit导航代理层、运行时属性与读取层差异尚未定位，不能把源码补线或构建通过当成AX交互通过；本次诊断未改代码、未重建。

- 2026-11-16 新确认骨架合同：时钟按本地化两行内容与字体缩放自适应；短按进入世界时钟、长按拖动替代旧隐藏确认，设置显隐保留。世界页本地专栏与全球UTC偏移代表列表分开，巴黎／纽约优先，完整当地日期／星期／秒值／UTC偏移／IANA，按系统DST和时区重算，前台刷新、离开及后台停止。首页改“功能实验室”且来源副标题保留；这属于App骨架，不新增Demo登记或最近使用。新增12小时制开关合同已确认：默认24h、独立持久偏好、明确AM／PM并覆盖12AM／12PM边界，仅作用世界页，首页继续24h。两OC源码已实现，模拟器Foundation 1134项目录／格式断言与UIKit 682项测量／布局断言通过，均为已核对两仓同实现的共享单轮计数；该阶段主App构建及真实交互尚未验收，最终状态见后续验收记录。

- 2026-11-16 世界页首轮真实XCTest（新OC final3）：长按移动、释放不push、进入导航区域仍可短按、秒刷新不拉回、进入世界页、24→12即时AM／PM与冷启动恢复12h均通过；12→24后可见行已24h，但离屏AX缓存仍有AM／PM，测试明确失败。截图另发现标题被基类覆盖为类名；两侧已补切换全表缓存／行高重建并保持offset；普通title／viewModel／GK标题修复在第二轮真实测试仍失败，已限定新页自有UILabel标题视图作为最终修复，禁止以字符串源码配置替代验收。最终两App（新final5／旧final3）arm64构建通过；共享独占模拟器上的最终真实XCTest均0失败，新41.692秒／旧38.931秒，已修复标题与缓存问题。新页次文字／组头改为72%主题主文字增强对比。旧OC首构建在规划写manifest时因errno28磁盘满中断、空间恢复后重跑通过，未计源码失败；仅本任务自建模拟器已删除可再生数据释放空间，xcresult／截图／日志保留。

- 2026-11-16 最终物理验收：独立轻Runner安装正常App，不使用coverage直达或debug自动打开；两OC分别长按0.7秒真实移动、松手不push、再拖到导航区域且仍可短按、等两个tick不拉回、短按进入世界页、同一根页面返回x／y不变均通过。世界页正式本地化标题、24→12即时大写AM／PM、滚动锚点与位置不变、终止／重启后12h恢复、关回24h且AX无离屏旧AM／PM、返回首页均通过。完整24份语言资源与最终App包逐键一致；实际仅中文浅色，藏文等十语、三主题、真实旋转／后台／系统时区与跨DST运行切换未完整遍历。最终截图发现旧世界页继承返回控件仍显示英文Back，新工程显示返回；已通过本页既有GK公开barItem.customView接口，仅给原UIButton刷新“返回”本地化与AX，保原动作／图标／尺寸，未改公共导航。末尾小增量（新final6／旧final4）构建通过，旧端返回文案真实短回归13.641秒0失败通过。日志new-ui-final2.log／old-ui-final.log及NewOCFinal2.xcresult／OldOCFinal.xcresult保留，失败轮次亦保留。

- 2026-11-16 外部环境重置：用户已确认清理模拟器设备集。新final5／旧final3先前已完成的完整物理通过证据保留，不计App失败；末尾页级返回文案新final6／旧final4构建通过，并在新共享设备609B上完成旧端13.641秒返回文案／实际点击回首页短回归。按用户授权仅重建一台共享设备继续尾项，不各自新建；延伸Flutter原包clock物理用例14.506秒通过、7个验证动作；原始日志与长拉证据由总表继续登记，不据有限场景宣布引擎错误已修复。

## 四、<span id="coredata-assets">Core Data 专项接入资产</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

2026-11-16 用户明确要求现有模型“接入、使用”，本节仅为本轮新增的 [**Core Data**](https://developer.apple.com/documentation/coredata) 专项资产，不将其它 Demo 子页纳入原骨架盘点范围。原有模型与持久化栈已连接到可达的手动操作页面，进入页面自动插入 Alice／Bob 的日志演示已替换；下表记录当前源码，不以源码存在替代运行验收。

| 编号 | 入口／资产 | 当前行为与默认值 | 持久化／生命周期／差异 | 代码位置 | 验证状态 |
| --- | --- | --- | --- | --- | --- |
| CD-01 | 首页、搜索与最近使用 | “数据、网络与文本 → Core Data 本地数据库”真实路由到 `CoreDataVC`，沿用共同注册及跳转路径 | 搜索／最近使用消费同一控制器注册；稳定路由 `CoreDataVC` | [首页注册](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>)、[页面](<../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@数据库/Core Data/ViewController/CoreDataVC/CoreDataVC.m>) | 两工程最终构建通过，最终App均安装并冷启动到CoreDataVC；普通首页／搜索／最近使用点击仍未验 |
| CD-02 | 模型与容器 | 保留 `User(name: String, age: Int32)` 与固定 `JobsOCBaseConfigDemo` 模型名；容器加载成功后才缓存 | 两OC继续 `NSPersistentCloudKitContainer` 及既有默认存储描述，不更名／清库；没有模型或加载失败可再次重试，不再中止进程 | [模型](<../JobsOCBaseConfigDemo/其他/CoreData/JobsOCBaseConfigDemo.xcdatamodeld/JobsBaseConfig.xcdatamodel/contents>)、[AppDelegate](<../JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate.m>) 的 `persistentContainer` | 两份momd均在最终包；OC旧App实际创建SQLite，OC新重启新PID88560后读同一共享bundle库，均已有读回证据 |
| CD-03 | 数据与表单默认值 | 新安装空库，不自动写样例；有历史记录则继续读取。添加表单姓名／年龄均为空 | 姓名去两端空白后不能为空，年龄须为0～150整数；按姓名、年龄升序查询。Swift UIKit表单年龄默认18，为实际实现差异 | [CoreDataVC](<../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@数据库/Core Data/ViewController/CoreDataVC/CoreDataVC.m>) 的 `editorAlert / saveEditor`、[存储层](<../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@数据库/Core Data/JobsCoreDataUserStore/JobsCoreDataUserStore.m>) | 同源Store27项断言通过；OC旧初始0，种子后两最终App均显示姓名、年龄42、数量1；OC新继承同bundle库，非第二个全新空库 |
| CD-04 | 增删改查与失败处理 | 导航提供添加、重载、清空；点行编辑，左滑单删；清空须确认 | 每次写入立即 `save`，失败 `rollback`；错误显示于页面／编辑器，不用清库掩盖加载错误 | 同上 `reloadUsers / presentUserEditor / clearAction` 与存储层 `insertName / updateUser / deleteUser / deleteAllInContext` | 实际生产Store27项断言通过，含CRUD、非法输入及只读SQLite保存失败回滚；iOS按钮CRUD、清空取消／确认未验 |
| CD-05 | 生命周期与线程 | 页面出现及回前台重读；重新加载可再次请求尚未成功建立的容器 | 上下文操作通过 `performBlockAndWait`；成功写入不依赖退后台。App后台保存只处理已经加载的容器，不主动创建数据库 | [页面](<../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@数据库/Core Data/ViewController/CoreDataVC/CoreDataVC.m>)、[AppDelegate](<../JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate.m>) 的 `saveContext` | 生命周期补线增量构建exit0；OC旧／新冷启动后同一库记录读回显示已实看；前后台／离页交互未验 |
| CD-06 | 空态、语言与主题 | `JobsEmptyAuto`完整空态含本地数据库图标、说明与重载；失败呈现错误；沿用全局语言和主题刷新 | 不增加私有语言开关；本地数据库教学页不请求业务API，不用假数据或网络图片；两OC源码语义一致，老工程直接编译主工程存储适配层，不增Pod | [页面](<../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@数据库/Core Data/ViewController/CoreDataVC/CoreDataVC.m>) 的 `emptyButtonModel / refreshPresentation` | 两最终读回图已实看姓名／年龄／数量，通知弹窗仍遮挡其它区域；实际菜单按钮、空态与十语三主题全遍历未验 |
| CD-07 | 本地图标与主词库 | `CoreDataDatabaseIcon`矢量模板图标；12份现有语言资源各增25键，共同32键完整 | 仅追加缺失键；旧字节前缀与全部旧字典值保留；`%@`占位一致；十语及原fil／fil-PH保留 | [图标](<../JobsOCBaseConfigDemo/其他/libs/图片资源文件/xcassets/Assets.xcassets/CoreDataDatabaseIcon.imageset/Contents.json>)、`其他/libs/语言包` | 两App各12份完整词典与当前源解析字典逐项一致，momd均在包；图标资源与词库静态校验通过，图标UI和完整翻译界面待验 |

数据库图标于2026-11-16复用上一轮已取得的 [**iconfont**「迈鼎icon」集合](https://www.iconfont.cn/collections/detail?cid=51731)中 `charts_数据库_data`（ID `43964161`，作者 `G_G曉楠`）；取得时为原创、免费素材，使用依据见[平台法律声明第三节第4条](https://terms.alicdn.com/legal-agreement/terms/product/20220705100131999/20220705100131999.html)，不推断为开源许可证。从同一原始SVG重导出44×44pt矢量PDF，仅调整逻辑页尺寸以适配UIKit按钮，不改变图形路径；原图与最终版同尺寸渲染已实看无差异、无裁切。保留矢量与模板渲染，随本工程既有Assets目录打包。

2026-11-16本轮验证：OC新旧最终完整Debug arm64模拟器构建通过，补齐 `viewDidAppear` 生命周期后两次增量构建均exit0；外部 `coredata-native/oc-old-final-incremental.log` 与 `oc-new-final-incremental.log` 保留最终结果。首次 `byMJRefreshHeader` 刷新链类型降级错误及失败日志保留，两侧均已改用现有 `UIScrollView.byMJ_header` 后再接视图DSL。实际生产Store与实际模型共编译的27项MacOS存储断言通过，范围见[测试说明](../Tests/CoreData/README.md)。OC旧独立模拟器启动直达 `CoreDataVC` 已创建 `Application Support/JobsOCBaseConfigDemo.sqlite`，初始数量0；使用同一Store和App内模型向该隔离库写入 `Jobs CoreData runtime / 42` 后，重启探针读取数量1。该写入来自测试程序；实际菜单／按钮CRUD、清空取消／确认、语言和主题遍历尚未验收。最终包冷启动读回图oc-old-readback.png已实看姓名Jobs CoreData runtime、年龄42和数量1；通知授权弹窗遮挡其它区域。OC新最终包安装后明确终止旧进程，再以新PID88560启动；oc-new-readback.png同样实看姓名／年龄42／数量1，oc-new-runtime-read.log只读Probe为数量1。两OC包读取同一bundle标识下的共享模拟器库，OC新继承已有种子记录，不能表述为两个全新空库。首次辅助RuntimeProbe使用安装迁移前的过期container UUID失败，日志oc-runtime-probe-stale-container.log保留；动态取得新container后已成功，属于验证工具定位失败，不计为产品数据故障。三App打包的完整词典按OC旧12／OC新12／Swift11共35份与当前源解析字典逐项一致，三份momd均在包。Mac锁定下的完整点击、清空确认和十语三主题遍历仍未验。

## 五、<span id="reports">报告目录</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本目录用于项目资产与审阅报告；根README保留为仓库入口，原有报告仅迁移并修正相对引用，不删减原文。其它源码旁README和OCDoc文档体系保留原位。


## <span id="jobs-toc-heading-7" data-jobs-toc="v2">当前时区卡片与制式标题合同（2026-11-16）</span><!-- jobs-toc:heading-end -->

用户明确要求原生世界页向Flutter学习：开关下方独立圆角当前时区卡片，以适配白天／黑夜的柔和强调底色、清晰主副文字和大号当前时间形成层级；卡内保留城市／IANA／UTC偏移、日期及星期，支持大字换行。全球列表仍在卡片之后。开关左侧标题反映已持久化的实际制式：ON为12小时制，OFF为24小时制，即时切换且十语完整。仅表现层增量，不改变偏好键、AM／PM、时区模型、生命周期、Demo注册或最近记录。

盘点：三个UIKit工程原为普通首分组行；SwiftUI虽为insetGrouped首分组，但没有独立强调底色与大号当前时间。实施前状态为待补齐；现四端生产源码已改，Swift语法通过，35份原生词典与SwiftUI十语言制式词条有效；实际UIKit字体／生产formatter小测1项0失败（160组合）通过。卡片主／副字浅色与深色四对对比均≥4.5。字体测量不代替实际AutoLayout接线；本工程当前合并arm64最终3包构建通过，22.030秒卡片真实用例1项0失败：当前卡片独立、IANA／UTC／星期完整、大号时间、24↔12标题立即同步与AM／PM、每秒推进保持frame，以及卡片滚出到世界行再返回仍完整。当前卡片使用私有独立复用标识，避免Default／Subtitle共用ID。两态及滚动归位图已导出，12h图已实看；测试结束恢复原格式。实际范围限iPhone18Pro／iOS27.2简中浅色，其它语言／深色／极端字号画面仍待验。


## <span id="home-return-sidebar-20261116">首页返回、侧栏与开屏浮控增量</span>

2026-11-16用户新需求，先登记后实现：设置增加真实开关“返回首页时收缩分组”，默认开；只从具体Demo返回主首页时自动收缩，关闭后保留离开时展开与滚动位置，手动单组／批量收缩仍可用。选择持久保存，不能被既有“返回回顶部并刷新”间接覆盖；设置、搜索、最近列表和世界时钟返回不冒充具体Demo返回。首页分组展开与浮钟坐标仍属视图内存，不泛称所有状态均跨启动保存。

用户报告左上侧栏点击无反应，并补充Swift疑似异常、OC正常：优先核查Swift实际按钮事件、宿主查找与呈现链路，OC只回归既有路径；没有既有侧栏的工程不额外创造侧栏入口。用户还报告浮钟盖住开屏：实际开屏呈现期间隐藏且不接收触摸，真正结束且首页可交互后恢复；重播／根切换／多Scene以当前owner的生命周期为准，不使用固定延迟。

收口复核补充：三UIKit时间Timer原先使用全局固定注册ID，两个首页实例会共用同一个Timer，按ID暂停可能影响另一Scene。现仅时间Timer改为每首页实例唯一ID：两OC懒注册`ViewController_1.suspendTimeBtn.<实例地址>`，Swift为`RootListVC.suspendBtn.<UUID>`；恢复／暂停／销毁使用自己的ID，旋转Timer与手势不扩围。原单Scene首页／开屏真实用例证据保留。另以生产源码逐字提取的两个ID及实际JobsTimerMgr／JobsSwiftTimerMgr后端验证暂停、恢复与移除隔离，独立XCTest两项／零失败；OC新旧Manager源码哈希相同。收口ID增量先受并行RustOCR集成阻断，旧失败日志保留；OCRowner修复guarded调用方及旧target membership后，两OC final6普通arm64增量均构建通过，独立冻结App及逐文件哈希，在A3以冻结包完成最终开屏短验：新10.225秒／旧7.214秒，两项／零失败；两端倒计时画面均无浮钟，skip后恢复可命中，四张截图已实看。该包未集成OCR Apple SDK，不代表OCR识别已验。Swift隔离副本已同步guarded OCR类与适配，唯一ID普通增量构建通过，在新共享设备A3（JobsDemoSharedFinal3）真实开屏短验1项／零失败（13.072秒），倒计时画面无浮钟、skip后恢复可命中且截图实看通过。各阶段包和证据明确对应，实际多Scene窗口组合仍待验。

起始缺口：新返回收缩开关尚未提供；UIKit原有返回刷新可能重建展开集合；SwiftUI当前只有一个未提供收缩交互的“系统 UI Demo”分组、没有侧栏，也没有独立开屏。新增开关须在SwiftUI补齐该既有组的手动展开／收缩语义；不新增侧栏或开屏。三个UIKit工程的侧栏按钮及开屏期间浮控命中需要本轮复测。当前源码已接入新开关及具体Demo返回门禁：OC新旧键com.BSports.JobsOCDemoListCollapseOnDemoReturn、Swift键RootList.collapseOnDemoReturn、SwiftUI键JobsSwiftUIBaseConfigDemo.collapseOnDemoReturn，均NSUserDefaults／UserDefaults，缺值默认开。三个UIKit的开屏以当前宿主树呈现前抑制、真实finish移除后的下一主队列恢复，首页不可交互时仍隐藏并暂停；不缩小原全屏拖动范围。Swift左菜单改factory显式注入真实drawer owner，避免可选祖先查找静默无动作。HOME-04：两OC/SUI首页按Swift卡片圆角14／H10V8留白、组17/13与内行17/12、基准行56及多行标题测高对齐，保留目录稳定ID和交互。当前源码、构建与限定真实UI验证均已完成，范围见下表；完整矩阵继续单列待验。


OC首页折叠卡片视觉对齐盘点：现有14圆角、水平10／垂直8留白已与Swift一致，保留；组标题16／副标题12、内部条目15／11和50行高与Swift的17／13、17／12、56行高存在差异。按Swift参数统一，深色卡片#191B20、分隔使用同义separator，内部Demo动作、置顶、拖动及图标不变。限定本首页骨架cell，不修改Demo子页。当前状态：源码与调用方测高接线已完成，最终3包合并构建通过；新旧首页卡片截图均已采集，当前新旧两端字体／留白／圆角／分隔和副字层级均已实看。设置／折叠／目录实际交互由同批首页专项分列记录，不把截图扩写为所有设备通过。


| 资产 | 当前行为／存储 | 本轮验证与边界 |
| --- | --- | --- |
| HOME-01 返回收缩开关 | 设置的原生UISwitch／Toggle；缺值默认开，只在本首页实际推入具体Demo后返回时处理；关闭优先保留离开前展开和滚动，普通设置／世界页及最近列表返回不当作Demo。新键UserDefaults落盘；展开集合与浮钟位置仍内存 | 四端实际开关ON／OFF、普通设置返回、具体Demo返回、冷启动新键恢复通过；当前只简中浅色，不冒称所有历史设置都已重新冷启验证 |
| HOME-02 左上侧栏 | Swift由根工厂把实际JobsSideDrawerVC弱引用注入首页，点按不再只依赖可选祖先查找；两OC未改正常侧栏实现；SwiftUI本无侧栏，不新增 | 三UIKit实际按钮点击、首页平移及收回通过并留图；用户信息／最近／设置等其它侧栏目的页不借本次入口测试冒称全验 |
| HOME-03 开屏浮钟 | 当前开屏宿主树中逐个抑制首页时间控件；skip／倒计时实际finish移除后下一主队列恢复，首页未可交互仍隐藏并暂停；多Scene只作用于该owner，不以秒数硬延迟，不限制既有全屏拖动 | 三UIKit实际开屏倒计时画面中控件AX不存在、结束后真实恢复且可点击通过；SwiftUI无开屏。实际多Scene／重播／根切换组合未穷举，源码按同一宿主树门禁处理 |
| HOME-04 首页目录视觉 | 两OC/SUI参照Swift：圆角14、卡片左右10／上下8；组17/13、内行17/12、基准行56，动态字号／自然增高与明暗语义色；两OC标题支持多行，代理高度和点按命中阈值同步；稳定Demo ID、拖排／置顶／最近入口不变 | OC收缩页与SwiftUI展开页实际简中浅色实看；SUI副文字改显式Color.primary的72%以消除控件层级继承变浅，最后纯色包另跑1真实用例；完整语言／主题／设备矩阵待验 |

当前代码入口：[ViewController@1.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/ViewController@1.m>)、[JobsOCDemoListSettingsVC.m](<../JobsOCBaseConfigDemo/业务逻辑/控制器/ViewController@1/JobsOCDemoListSettingsVC/JobsOCDemoListSettingsVC.m>)、[AppDelegate+Func.m](<../JobsOCBaseConfigDemo/入口/AppDelegate/AppDelegate+Func/AppDelegate+Func.m>)。

新增开关实际保存位置已逐App只读核验：App沙盒`Library/Preferences/<bundleID>.plist`核验时对应新键为true，未读取／展示其它偏好；CLI证据在本机任务产物`native-home-settings/preferences-on-disk.json`。UI通过的是正常主应用，没有`--jobs-coverage-route`或新测试探针；仅语言／旧开屏／旧入口／旧浮钟显隐使用临时launch arguments，新增收缩键没有用启动参数覆盖，冷启动读取的是实际落盘值。已恢复测试前该新开关选择；测试没有清空用户排序或最近记录。 这些四App落盘与冷启证据采自原609设备；随后用户授权的其它任务清理了整个设备集，原设备及其沙盒已不存在，历史证据继续保留。Root按原授权重建的A3为全新沙盒，本轮三UIKit最终开屏短验未改新增收缩键，也未用旧数据冒称新设备已保存；四App在A3的当前值均不由旧证据推断。 A3首次启动的Swift及两OC都在系统通知授权框选择了“不允许”（Runner记录Swift8.45秒、新OC6.62秒、旧OC3.71秒）；该测试选择仅属于新设备的通知许可，不能称所有偏好未变。未为恢复未询问状态而卸载或重置App。两OC短验后已恢复现装最终Flutter首页并截图确认，设备明确交还Root。

本工程bundle为`com.JobsOCBaseConfigDemo`，新增键`com.BSports.JobsOCDemoListCollapseOnDemoReturn`。首页完整链38.813秒／1test／0失败；开屏8.485秒／1test／0失败；最终3普通arm64构建通过。

失败历史保留：外部Runner首轮误选离屏侧栏同名“设置”，改已有稳定菜单panel／cellID后真实补轮通过；早期Swift开屏夹具查询不存在控件的isHittable会自动等待，恰好跨过5秒开屏结束，已改为skip存在同帧检查clock.exists。末轮五用例批次共5项／0失败（105.043秒）。最后SUI颜色新增短case首Runner编译错误导致一次0tests，明确排除；修正坐标类型、确认非零后11.001秒通过。生产未因夹具修改而放宽门禁或修改开屏时长。

## 六、<span id="mixed-script-source-20261117">中英混排核心与源码状态</span> <a href="#前言">🔼</a> <a href="#🔚">🔽</a>

当前[随仓源码](<../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@RustOCR/SDK/JobsRustOCR/Source/JobsOCR>)已同步本机验收通过的中英混排路由，包含 `pipeline.rs`、`runtime.rs`、`lib.rs`、`routing.rs`、独立 E2E 测试和 `MixedScript` 夹具。核心常规测试 30 项、显式 E2E 1 项覆盖 8 张真实夹具（其中 4 张精确逐行控制）通过；范围与证据见[共享核心回归记录](<../../../OCR/项目相关报告/混排回归/README.md>)。

本状态确认核心本机回归及随仓源码一致；本宿主尚未使用此次新核心重编、运行，原有 35 行样本／界面／Workflow 记录仍限原批次。使用新核心前先运行[SDK 本地构建入口](<../JobsOCBaseConfigDemo/业务逻辑/功能模块/Demo@RustOCR/SDK/JobsRustOCR/Scripts/BuildRustOCR.command>)，源码输入哈希变化会使旧库缓存失效；保留本地构建方式，不分发自建 `.a`。显式 E2E 需指定本机 ORT 与随 SDK 的模型目录。

<a id="🔚" href="#前言">返回首页</a>

- 2026-11-16 浮钟颜色共同基线：原调用方为系统蓝；iOS27.2先前真实截图实采#0088FF，对白字仅3.52，低于统一4.5（007AFF／0A84FF仅系统参考调色，未当作本机dark实测）。仅两首页时钟调用方改为#1565C0配白字，静态对比5.75:1；未修改公共颜色角色或其它悬浮控件，手势／尺寸／字体逻辑不变，颜色增量新final7／旧final5已构建通过，末尾两包中文浅色snapshot已验：无系统弹框遮罩原图实际背景均#1565C0，白字对比5.746:1；未重跑无关完整手势链。

- 2026-11-16 最终new7／old5菜单截图：同一独立轻Runner实际点首页右上按钮，XCTest三行Cell稳定ID与完整标题均存在，两case分别11.326秒／10.748秒0失败。两图实看菜单表面、圆角、柔影、按钮正下方与右缘对齐，右侧安全边未裁切；402pt画布内三行frame为x274、width112、y109／157／205、height48。首轮截图用例误把实际“搜索 Demo”写成“搜索Demo”，仅外部选择器空格错误导致失败，保留日志，改用既有Cell ID复验，未改变产品或放宽存在断言。深色／长翻译／旋转真实矩阵仍待验。
