# `calls 符号关系 - 121`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T1["method:UIImage::asdk_animatedImageData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:19"]
  S1 -->|calls| T1
  S2["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T2["method:UIImage::asdk_image<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S2 -->|calls| T2
  S3["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T3["method:ASNetworkImageLoadInfo::initWithURL:sourceType:downloadIdentifier:userInfo:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageLoadInfo.mm:13"]
  S3 -->|calls| T3
  S4["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T4["function:ASPerformBlockOnMainThread<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASInternalHelpers.mm:133"]
  S4 -->|calls| T4
  S5["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T5["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S5 -->|calls| T5
  S6["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T6["method:UIImage::asdk_image<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S6 -->|calls| T6
  S7["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T7["method:UIImage::asdk_animatedImageData<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:19"]
  S7 -->|calls| T7
  S8["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T8["function:ASImageLoadingLog<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Base/ASLog.mm:45"]
  S8 -->|calls| T8
  S9["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T9["method:UIImage::asdk_image<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASImageContainerProtocolCategories.mm:14"]
  S9 -->|calls| T9
  S10["method:ASNetworkImageNode::_lazilyLoadImageIfNecessary<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:700"]
  T10["method:ASNetworkImageNode::callbackQueue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:118"]
  S10 -->|calls| T10
  S11["method:ASNetworkImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:910"]
  T11["method:ASNetworkImageNode::displayDidFinish<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNetworkImageNode.mm:910"]
  S11 -->|calls| T11
  S12["method:ASNodeController::loadNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:22"]
  T12["method:ASButtonNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASButtonNode.mm:32"]
  S12 -->|calls| T12
  S13["method:ASNodeController::node<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:28"]
  T13["method:ASNodeController::loadNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:22"]
  S13 -->|calls| T13
  S14["method:ASNodeController::lockPair<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:96"]
  T14["function:ASLockSequence<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASLocking.h:103"]
  S14 -->|calls| T14
  S15["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  T15["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  S15 -->|calls| T15
  S16["method:ASPagerFlowLayout::prepareLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:29"]
  T16["method:ASPagerFlowLayout::_updateCurrentNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:72"]
  S16 -->|calls| T16
  S17["method:ASPagerFlowLayout::targetContentOffsetForProposedContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:37"]
  T17["method:ASPagerFlowLayout::_targetContentOffsetForItemAtIndexPath:proposedContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:51"]
  S17 -->|calls| T17
  S18["method:ASPagerFlowLayout::_targetContentOffsetForItemAtIndexPath:proposedContentOffset:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:51"]
  T18["method:ASPagerFlowLayout::_dataSourceIsEmpty<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:66"]
  S18 -->|calls| T18
  S19["method:ASPagerFlowLayout::shouldInvalidateLayoutForBoundsChange:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:96"]
  T19["method:ASPagerFlowLayout::_updateCurrentNode<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerFlowLayout.mm:72"]
  S19 -->|calls| T19
  S20["method:ASPagerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  T20["method:ASPagerNode::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:44"]
  S20 -->|calls| T20
  S21["method:ASPagerNode::initWithCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:54"]
  T21["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S21 -->|calls| T21
  S22["method:ASPagerNode::initWithCollectionViewLayout:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:54"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:ASPagerNode::initUsingAsyncCollectionLayout<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:62"]
  T23["method:ASCollectionNode::initWithLayoutDelegate:layoutFacilitator:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:272"]
  S23 -->|calls| T23
  S24["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T24["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  S24 -->|calls| T24
  S25["method:ASPagerNode::didLoad<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASPagerNode.mm:74"]
  T25["method:_ASCollectionPendingState::setTuningParameters:forRangeMode:rangeType:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASCollectionNode.mm:224"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
