# `calls 符号关系 - 135`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h:1"]
  T1["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S1 -->|calls| T1
  S2["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h:1"]
  T2["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h:1"]
  T3["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S3 -->|calls| T3
  S4["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h:1"]
  T4["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S4 -->|calls| T4
  S5["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h:1"]
  T5["variable:property<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/NSAttributedString+ASText.h:60"]
  S5 -->|calls| T5
  S6["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.h:1"]
  T6["property:ASNetworkImageNode::ASDISPLAYNODE_DEPRECATED_MSG<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.h:91"]
  S6 -->|calls| T6
  S7["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:62"]
  T7["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S7 -->|calls| T7
  S8["method:ASTextNodeRendererKey::hash<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:71"]
  T8["function:ASHashBytes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASHashing.mm:17"]
  S8 -->|calls| T8
  S9["function:sharedRendererCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:101"]
  T9["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S9 -->|calls| T9
  S10["function:_rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:118"]
  T10["function:sharedRendererCache<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:101"]
  S10 -->|calls| T10
  S11["function:_rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:118"]
  T11["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:62"]
  S11 -->|calls| T11
  S12["function:_rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:118"]
  T12["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:62"]
  S12 -->|calls| T12
  S13["function:rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:135"]
  T13["method:ASTextNodeRendererKey::initWithTextKitAttributes:constrainedSize:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:62"]
  S13 -->|calls| T13
  S14["function:rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:135"]
  T14["function:_rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:118"]
  S14 -->|calls| T14
  S15["function:rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:135"]
  T15["function:_rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:118"]
  S15 -->|calls| T15
  S16["method:ASTextNodeDrawParameter::initWithRendererAttributes:backgroundColor:textContainerInsets:contentScale:opaque:bounds:traitCollection:willDisplayNodeContentWithRenderingContext:didDisplayNodeContentWithRenderingContext:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:168"]
  T16["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S16 -->|calls| T16
  S17["method:ASTextNodeDrawParameter::rendererForBounds:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:193"]
  T17["function:rendererForAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:135"]
  S17 -->|calls| T17
  S18["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T18["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  S18 -->|calls| T18
  S19["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T19["method:ASTextNode::shadowOffset<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1264"]
  S19 -->|calls| T19
  S20["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T20["method:ASTextNode::shadowColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1242"]
  S20 -->|calls| T20
  S21["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T21["method:ASTextNode::shadowOpacity<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1276"]
  S21 -->|calls| T21
  S22["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T22["method:ASTextNode::shadowRadius<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:1288"]
  S22 -->|calls| T22
  S23["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T23["function:ASTextNode::DefaultLinkAttributeNames<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:243"]
  S23 -->|calls| T23
  S24["method:ASTextNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:252"]
  T24["function:ASDisplayNodeDefaultPlaceholderColor<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNodeExtras.mm:305"]
  S24 -->|calls| T24
  S25["method:ASTextNode::_plainStringForDescription<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASTextNode.mm:303"]
  T25["method:NSString::substringToIndex<br/>JobsByPods/GKCustomNavigationBarExtra@Pods/Support/UIKit/NSString/NSString+Sys/NSString+Sys.m:36"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
