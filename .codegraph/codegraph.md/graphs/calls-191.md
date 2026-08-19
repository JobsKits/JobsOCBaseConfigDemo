# `calls 符号关系 - 191`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T1["function:ASTextLayout::ASTextDrawBorder<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:2797"]
  S1 -->|calls| T1
  S2["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T2["method:ASBasicImageDownloaderContext::cancel<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Details/ASBasicImageDownloader.mm:97"]
  S2 -->|calls| T2
  S3["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  T3["function:ASTextLayout::ASTextDrawDebug<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3233"]
  S3 -->|calls| T3
  S4["method:ASTextLayout::drawInContext:size:debug:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3477"]
  T4["method:ASTextLayout::drawInContext:size:point:view:layer:debug:cancel:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLayout.mm:3426"]
  S4 -->|calls| T4
  S5["method:ASTextLine::setCTLine:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:30"]
  T5["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  S5 -->|calls| T5
  S6["method:ASTextLine::setPosition:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:57"]
  T6["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  S6 -->|calls| T6
  S7["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T7["function:ASTextNSRangeFromCFRange<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Utility/ASTextUtilities.h:302"]
  S7 -->|calls| T7
  S8["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T8["method:ASTextRange::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S8 -->|calls| T8
  S9["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T9["method:ASTextRange::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S9 -->|calls| T9
  S10["method:ASTextLine::reloadBounds<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextLine.mm:62"]
  T10["method:ASTextRange::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/Component/ASTextInput.mm:62"]
  S10 -->|calls| T10
  S11["file:JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.h<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.h:1"]
  T11["function:ASTextAttributeGetType<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:31"]
  S11 -->|calls| T11
  S12["method:ASTextBackedString::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:119"]
  T12["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S12 -->|calls| T12
  S13["method:ASTextBinding::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:146"]
  T13["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S13 -->|calls| T13
  S14["method:ASTextShadow::shadowWithNSShadow:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:171"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["method:ASTextShadow::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:203"]
  T15["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S15 -->|calls| T15
  S16["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  T16["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S16 -->|calls| T16
  S17["method:ASTextDecoration::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:251"]
  T17["method:ASTextDecoration::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:226"]
  S17 -->|calls| T17
  S18["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  T18["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S18 -->|calls| T18
  S19["method:ASTextBorder::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:305"]
  T19["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S19 -->|calls| T19
  S20["method:ASTextAttachment::initWithCoder:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:348"]
  T20["method:ASTextBorder::init<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:288"]
  S20 -->|calls| T20
  S21["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T22["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S22 -->|calls| T22
  S23["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T23["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S23 -->|calls| T23
  S24["method:ASTextHighlight::setFont:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:408"]
  T24["method:ASNullLayoutSpec::null<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/Layout/ASLayoutSpec+Subclasses.mm:23"]
  S24 -->|calls| T24
  S25["method:ASTextHighlight::setColor:<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:421"]
  T25["method:ASTextHighlight::_makeMutableAttributes<br/>JobsByPods/ManualByOCPods@Pods/Texture/Source/TextExperiment/String/ASTextAttribute.mm:400"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
