# `calls 符号关系 - 152`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:UITabBar::textLabel<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:68"]
  T1["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S1 -->|calls| T1
  S2["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  T2["method:NSObject::isMemberOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:85"]
  S2 -->|calls| T2
  S3["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["function:UITabBar::imageView<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBar/UITabBar+Category/UITabBar+TLAnimation/UITabBar+TLAnimation.m:82"]
  T4["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S4 -->|calls| T4
  S5["method:JobsTabBarItem::initWithConfig:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBarItem/BaseTabBarItem/JobsTabBarItem.m:30"]
  T5["method:TransitionController::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：手势横向滚动子VC联动Tabbar切换/TransitionController/TransitionController.m:33"]
  S5 -->|calls| T5
  S6["method:JobsTabBarItem::initWithConfig:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBarItem/BaseTabBarItem/JobsTabBarItem.m:30"]
  T6["method:UITabBarItem::titleTextAttributesByNormalState<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITabBarItem/UITabBarItem+Extra/UITabBarItem+Extra.m:11"]
  S6 -->|calls| T6
  S7["method:JobsTabBarItem::initWithConfig:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/UITabBarItem/BaseTabBarItem/JobsTabBarItem.m:30"]
  T7["method:UITabBarItem::titleTextAttributesBySelectedState<br/>JobsByPods/JobsByOCPods@Pods/Core/UIKit/UITabBarItem/UITabBarItem+Extra/UITabBarItem+Extra.m:38"]
  S7 -->|calls| T7
  S8["function:playFrameAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:30"]
  T8["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S8 -->|calls| T8
  S9["method:TLBounceAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:124"]
  T9["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S9 -->|calls| T9
  S10["method:TLBounceAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:124"]
  T10["function:playFireworksAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:42"]
  S10 -->|calls| T10
  S11["method:TLFumeAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:152"]
  T11["function:TLFumeAnimation::playMoveIconAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:168"]
  S11 -->|calls| T11
  S12["method:TLFumeAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:152"]
  T12["function:TLFumeAnimation::playSelectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:179"]
  S12 -->|calls| T12
  S13["method:TLFumeAnimation::playDeselectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:160"]
  T13["function:TLFumeAnimation::playMoveIconAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:168"]
  S13 -->|calls| T13
  S14["method:TLFumeAnimation::playDeselectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:160"]
  T14["function:TLFumeAnimation::playDeselectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:199"]
  S14 -->|calls| T14
  S15["function:TLFumeAnimation::playMoveIconAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:168"]
  T15["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S15 -->|calls| T15
  S16["function:TLFumeAnimation::playSelectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:179"]
  T16["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S16 -->|calls| T16
  S17["function:TLFumeAnimation::playSelectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:179"]
  T17["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S17 -->|calls| T17
  S18["function:TLFumeAnimation::playSelectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:179"]
  T18["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S18 -->|calls| T18
  S19["function:TLFumeAnimation::playDeselectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:199"]
  T19["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S19 -->|calls| T19
  S20["function:TLFumeAnimation::playDeselectLabelAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:199"]
  T20["function:createAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:19"]
  S20 -->|calls| T20
  S21["method:TLFrameAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:237"]
  T21["function:playFrameAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:30"]
  S21 -->|calls| T21
  S22["method:TLFrameAnimation::playSelectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:237"]
  T22["function:playFireworksAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:42"]
  S22 -->|calls| T22
  S23["method:TLFrameAnimation::playDeselectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:252"]
  T23["function:playFrameAnimation<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:30"]
  S23 -->|calls| T23
  S24["method:TLFrameAnimation::playDeselectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:252"]
  T24["function:reversedArray<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：Tabbaritem的点击动效/TLTabBarAnimation/TLTabBarAnimation.m:12"]
  S24 -->|calls| T24
  S25["method:TransitionAnimation::initWithTargetEdge:<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：手势横向滚动子VC联动Tabbar切换/TransitionAnimation/TransitionAnimation.m:12"]
  T25["method:TransitionController::init<br/>JobsByPods/JobsOCTools@Pods/Core/UITabBarCtr/UITabBarCtrExtra/一些需要单独列出来的功能性模块/功能性动效：手势横向滚动子VC联动Tabbar切换/TransitionController/TransitionController.m:33"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
