# `calls 符号关系 - 148`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.h:1"]
  T1["function:JobsAppDoorResourceURL<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:125"]
  S1 -->|calls| T1
  S2["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  T2["function:JobsAppDoorResourceBundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:18"]
  S2 -->|calls| T2
  S3["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  T3["function:JobsAppDoorResourceBundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:18"]
  S3 -->|calls| T3
  S4["function:JobsAppDoorCustomerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:48"]
  T4["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S4 -->|calls| T4
  S5["function:JobsAppDoorCustomerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:48"]
  T5["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S5 -->|calls| T5
  S6["function:JobsAppDoorCustomerServiceIconImage<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:48"]
  T6["function:JobsAppDoorImageNamed<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:36"]
  S6 -->|calls| T6
  S7["function:JobsAppDoorResourceURL<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:125"]
  T7["function:JobsAppDoorResourceBundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:18"]
  S7 -->|calls| T7
  S8["function:JobsAppDoorResourceURL<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:125"]
  T8["function:JobsAppDoorResourceBundle<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/Resource/JobsAppDoorResource/JobsAppDoorResource.m:18"]
  S8 -->|calls| T8
  S9["method:BaseContentView::setFrame:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:30"]
  T9["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S9 -->|calls| T9
  S10["method:BaseContentView::jobsSetFrame<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:35"]
  T10["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  S10 -->|calls| T10
  S11["method:BaseContentView::drawRect:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:45"]
  T11["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S11 -->|calls| T11
  S12["method:BaseContentView::jobsDrawRect<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:50"]
  T12["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  S12 -->|calls| T12
  S13["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  T13["method:BaseContentView::byInitialContentViewRect<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:126"]
  S13 -->|calls| T13
  S14["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  T14["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  S14 -->|calls| T14
  S15["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  T15["method:MasonryModel::byCenterY<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:116"]
  S15 -->|calls| T15
  S16["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  T16["method:MasonryModel::byCenterX<br/>JobsByPods/JobsModelDSL@Pods/Core/MasonryModel/MasonryModel+DSL/MasonryModel+DSL.m:107"]
  S16 -->|calls| T16
  S17["method:BaseContentView::showContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:80"]
  T17["function:JobsMainScreen_WIDTH<br/>JobsByPods/JobsOCDefs@Pods/Core/MacroDef_Others/MacroDef_Size/MacroDef_Size.h:304"]
  S17 -->|calls| T17
  S18["method:BaseContentView::removeContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:102"]
  T18["method:BaseContentView::cacheInitialContentViewRectIfNeeded<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:60"]
  S18 -->|calls| T18
  S19["method:BaseContentView::removeContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:102"]
  T19["method:JobsTabBar::byY<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/BaseTabBar/JobsTabBar/JobsTabBar.m:339"]
  S19 -->|calls| T19
  S20["method:BaseContentView::removeContentViewWithOffsetY<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/BaseContentView/BaseContentView.m:102"]
  T20["method:JobsScrollYView::byX<br/>JobsByPods/JobsOCTools@Pods/Core/在指定的y区间内滑动视图/JobsScrollYView/JobsScrollYView.m:179"]
  S20 -->|calls| T20
  S21["method:JobsAppDoorForgotCodeContentView::init<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:32"]
  T21["method:ASDisplayNode::byBgColor<br/>JobsByPods/JobsOCDSL@Pods/Core/3rd/Texture+DSL/ASDisplayNode/ASDisplayNode+DSL/ASDisplayNode+DSL.m:29"]
  S21 -->|calls| T21
  S22["method:JobsAppDoorForgotCodeContentView::drawRect:<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:38"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T23["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S23 -->|calls| T23
  S24["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T24["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S24 -->|calls| T24
  S25["method:JobsAppDoorForgotCodeContentView::jobsRichViewByModel<br/>JobsByPods/JobsAppDoor@Pods/Core/登录注册模块公共件/View/JobsAppDoorForgotCodeContentView/JobsAppDoorForgotCodeContentView.m:58"]
  T25["method:FMBannerAdsModel::byAlpha<br/>JobsByPods/JobsModelDSL@Pods/Core/FMBannerAdsModel/FMBannerAdsModel+DSL/FMBannerAdsModel+DSL.m:1118"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
