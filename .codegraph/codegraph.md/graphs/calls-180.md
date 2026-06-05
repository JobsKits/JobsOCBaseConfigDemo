# `calls 符号关系 - 180`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TKPermissionTracking::authWithCompletion:<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/Tracking/TKPermissionTracking.m:15"]
  T1["variable:completion<br/>JobsByPods/ManualByOCPods@Pods/TKPermissionKit/NetWork/TKPermissionNetWork.h:28"]
  S1 -->|calls| T1
  S2["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  T2["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S2 -->|calls| T2
  S3["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  T3["method:ASLayoutElementStyle::justifyContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:804"]
  S3 -->|calls| T3
  S4["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T4["method:ASDisplayNode::_locked_style<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASDisplayNode+Layout.mm:57"]
  S4 -->|calls| T4
  S5["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T5["method:ASLayoutElementStyle::yogaNodeCreateIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutElement.mm:778"]
  S5 -->|calls| T5
  S6["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T6["function:ASButtonNodeResolveHorizontalAlignmentForStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:16"]
  S6 -->|calls| T6
  S7["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T7["function:ASButtonNodeResolveVerticalAlignmentForStyle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:24"]
  S7 -->|calls| T7
  S8["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T8["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S8 -->|calls| T8
  S9["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T9["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S9 -->|calls| T9
  S10["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T10["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S10 -->|calls| T10
  S11["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  T11["function:ASEdgeInsetsMake<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASDimension.mm:114"]
  S11 -->|calls| T11
  S12["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  T13["method:ASButtonNode::updateYogaLayoutIfNeeded<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode+Yoga.mm:34"]
  S13 -->|calls| T13
  S14["method:ASButtonNode::titleNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:50"]
  T14["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S14 -->|calls| T14
  S15["method:ASButtonNode::imageNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:70"]
  T15["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S15 -->|calls| T15
  S16["method:ASButtonNode::backgroundImageNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:80"]
  T16["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S16 -->|calls| T16
  S17["method:ASButtonNode::setEnabled:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:97"]
  T17["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  S17 -->|calls| T17
  S18["method:ASButtonNode::setHighlighted:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:106"]
  T18["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  S18 -->|calls| T18
  S19["method:ASButtonNode::setSelected:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:114"]
  T19["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  S19 -->|calls| T19
  S20["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  T20["method:ASButtonNode::updateBackgroundImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:212"]
  S20 -->|calls| T20
  S21["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  T21["method:ASButtonNode::updateImage<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:151"]
  S21 -->|calls| T21
  S22["method:ASButtonNode::updateButtonContent<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:122"]
  T22["method:ASButtonNode::updateTitle<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:180"]
  S22 -->|calls| T22
  S23["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  T23["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  S23 -->|calls| T23
  S24["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  T24["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S24 -->|calls| T24
  S25["method:ASButtonNode::tintColorDidChange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:137"]
  T25["method:ASNodeController::unlock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:117"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
