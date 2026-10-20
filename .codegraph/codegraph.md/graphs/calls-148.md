# `calls 符号关系 - 148`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:JobsAppDoorResourceURL<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:125"]
  T1["function:JobsAppDoorResourceBundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:18"]
  S1 -->|calls| T1
  S2["function:JobsAppDoorResourceURL<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:125"]
  T2["function:JobsAppDoorResourceBundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:18"]
  S2 -->|calls| T2
  S3["method:BaseContentView::setFrame:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:30"]
  T3["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S3 -->|calls| T3
  S4["method:BaseContentView::jobsSetFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:35"]
  T4["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  S4 -->|calls| T4
  S5["method:BaseContentView::drawRect:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:45"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:BaseContentView::jobsDrawRect<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:50"]
  T6["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  S6 -->|calls| T6
  S7["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  T7["method:BaseContentView::byInitialContentViewRect<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:126"]
  S7 -->|calls| T7
  S8["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  T8["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  S8 -->|calls| T8
  S9["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  T9["method:MasonryModel::byCenterY<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:116"]
  S9 -->|calls| T9
  S10["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  T10["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S10 -->|calls| T10
  S11["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  T11["function:JobsMainScreen_WIDTH<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:304"]
  S11 -->|calls| T11
  S12["method:BaseContentView::removeContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:102"]
  T12["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  S12 -->|calls| T12
  S13["method:BaseContentView::removeContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:102"]
  T13["method:JobsTabBar::byY<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/BaseTabBar/JobsTabBar/JobsTabBar.m:339"]
  S13 -->|calls| T13
  S14["method:BaseContentView::removeContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:102"]
  T14["method:JobsScrollYView::byX<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:179"]
  S14 -->|calls| T14
  S15["method:JobsAppDoorForgotCodeContentView::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:32"]
  T15["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S15 -->|calls| T15
  S16["method:JobsAppDoorForgotCodeContentView::drawRect:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:38"]
  T16["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S16 -->|calls| T16
  S17["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T17["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S17 -->|calls| T17
  S18["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T18["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S18 -->|calls| T18
  S19["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T19["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S19 -->|calls| T19
  S20["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T20["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T21["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T22["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T23["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T24["method:JobsAppDoorForgotCodeContentView::jobs_updateConfirmBtnState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:73"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorForgotCodeContentView::jobs_updateConfirmBtnState<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:73"]
  T25["method:JobsAppDoorForgotCodeContentView::jobs_canConfirmPassword<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:86"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
