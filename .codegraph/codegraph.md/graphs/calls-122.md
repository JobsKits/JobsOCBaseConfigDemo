# `calls 符号关系 - 122`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  T1["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  S1 -->|calls| T1
  S2["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T3["method:ASAbstractRunLoopQueue::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:32"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T4["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T5["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T6["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S6 -->|calls| T6
  S7["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T7["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S7 -->|calls| T7
  S8["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASRunLoopQueue.mm:1"]
  T8["function:ASDisplayLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:41"]
  S8 -->|calls| T8
  S9["method:ASScrollView::layerClass<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:26"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:ASScrollView::scrollNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:31"]
  T10["function:ASViewToDisplayNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:80"]
  S10 -->|calls| T10
  S11["method:ASScrollView::didMoveToWindow<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:48"]
  T11["method:ASControlNode::__exitHierarchy<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASControlNode.mm:114"]
  S11 -->|calls| T11
  S12["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T12["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S12 -->|calls| T12
  S13["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  T13["method:ASScrollNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:72"]
  S13 -->|calls| T13
  S14["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T14["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S14 -->|calls| T14
  S15["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T15["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S15 -->|calls| T15
  S16["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T16["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S16 -->|calls| T16
  S17["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T17["function:ASSizeRangeClamp<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:275"]
  S17 -->|calls| T17
  S18["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T18["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S18 -->|calls| T18
  S19["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T19["function:ASPointsValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:19"]
  S19 -->|calls| T19
  S20["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T20["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S20 -->|calls| T20
  S21["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T21["function:ASScrollDirectionContainsHorizontalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:19"]
  S21 -->|calls| T21
  S22["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  T22["method:ASScrollNode::calculateLayoutThatFits:restrictedToSize:relativeToParentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:80"]
  S22 -->|calls| T22
  S23["method:ASScrollNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T23["method:ASScrollNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  S23 -->|calls| T23
  S24["method:ASScrollNode::layout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:137"]
  T24["function:ASIsCGSizeValidForLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.h:24"]
  S24 -->|calls| T24
  S25["method:ASScrollNode::setAutomaticallyManagesContentSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASScrollNode.mm:159"]
  T25["function:ASScrollDirectionContainsVerticalDirection<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASScrollDirection.mm:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
