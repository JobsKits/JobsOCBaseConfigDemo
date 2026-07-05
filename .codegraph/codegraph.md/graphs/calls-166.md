# `calls 符号关系 - 166`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["function:asdk_diffWithArray:insertions:deletions:compareBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:24"]
  T1["function:asdk_diffWithArray:insertions:deletions:moves:compareBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:37"]
  S1 -->|calls| T1
  S2["function:asdk_diffWithArray:insertions:deletions:moves:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:30"]
  T2["function:asdk_diffWithArray:insertions:deletions:moves:compareBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:37"]
  S2 -->|calls| T2
  S3["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSArray+Diffing.mm:1"]
  T3["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S3 -->|calls| T3
  S4["method:NSIndexSet::as_indexesByMapping:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:17"]
  T4["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S4 -->|calls| T4
  S5["method:NSIndexSet::as_indexesByMapping:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:17"]
  T5["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S5 -->|calls| T5
  S6["method:NSIndexSet::as_intersectionWithIndexes:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:31"]
  T6["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S6 -->|calls| T6
  S7["method:NSIndexSet::as_indexSetFromIndexPaths:inSection:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:42"]
  T7["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S7 -->|calls| T7
  S8["method:NSIndexSet::as_sectionsFromIndexPaths:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSIndexSet+ASHelpers.mm:82"]
  T8["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S8 -->|calls| T8
  S9["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:16"]
  T9["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S9 -->|calls| T9
  S10["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:16"]
  T10["method:NSMutableAttributedString::attributeTextInRange:withTextKitParagraphStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:42"]
  S10 -->|calls| T10
  S11["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:maximumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:26"]
  T11["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S11 -->|calls| T11
  S12["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:maximumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:26"]
  T12["method:NSMutableAttributedString::attributeTextInRange:withTextKitParagraphStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:42"]
  S12 -->|calls| T12
  S13["method:NSMutableAttributedString::attributeTextInRange:withTextKitLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:37"]
  T13["method:NSMutableAttributedString::attributeTextInRange:withTextKitMinimumLineHeight:maximumLineHeight:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:26"]
  S13 -->|calls| T13
  S14["method:NSMutableAttributedString::attributeTextInRange:withTextKitParagraphStyle:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/NSMutableAttributedString+TextKitAdditions.mm:42"]
  T14["method:ASMutableAttributedStringBuilder::addAttribute:value:range:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASMutableAttributedStringBuilder.mm:129"]
  S14 -->|calls| T14
  S15["method:ASAsyncTransactionOperation::initWithOperationCompletionBlock:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:34"]
  T15["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S15 -->|calls| T15
  S16["function:ASAsyncTransactionQueue::GroupImpl<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:106"]
  T16["function:ASAsyncTransactionQueue::GroupImpl<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:106"]
  S16 -->|calls| T16
  S17["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T17["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S17 -->|calls| T17
  S18["function:pushOperation<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:201"]
  T18["method:ASTextRange::end<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:74"]
  S18 -->|calls| T18
  S19["function:schedule<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:209"]
  T19["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S19 -->|calls| T19
  S20["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T20["function:PINCachedAnimatedImage::isDataSupported:::if<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASPINRemoteImageDownloader.mm:66"]
  S20 -->|calls| T20
  S21["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T21["method:ASNodeController::lock<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/ASNodeController+Beta.mm:112"]
  S21 -->|calls| T21
  S22["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T22["function:ASAsyncTransactionQueue<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:65"]
  S22 -->|calls| T22
  S23["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T23["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S23 -->|calls| T23
  S24["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T24["variable:block<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:351"]
  S24 -->|calls| T24
  S25["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/Transactions/_ASAsyncTransaction.mm:1"]
  T25["method:ASAbstractLayoutController::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASAbstractLayoutController.mm:136"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
