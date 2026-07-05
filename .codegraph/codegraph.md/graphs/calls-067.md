# `calls 符号关系 - 067`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TFPopupPool::allPopup<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:73"]
  T1["method:TFPopupPool::shareInstance<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:29"]
  S1 -->|calls| T1
  S2["method:TFPopupPool::allPopup<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupExtension/TFPopupExtension.m:77"]
  T2["method:BEMCheckBoxGroup::init<br/>JobsByPods/ManualByOCPods@Pods/BEMCheckBox/Core/BEMCheckBoxGroup/BEMCheckBoxGroup.m:29"]
  S2 -->|calls| T2
  S3["method:TFPopupLoading::tf_show:msg:offset:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:37"]
  T3["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S3 -->|calls| T3
  S4["method:TFPopupLoading::tf_show:msg:offset:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:37"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:TFPopupLoading::tf_hide:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:69"]
  T5["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S5 -->|calls| T5
  S6["method:TFPopupLoading::tf_hide:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:69"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:TFPopupLoading::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:98"]
  T7["method:TFPopupLoading::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:98"]
  S7 -->|calls| T7
  S8["method:TFPopupToast::tf_show:msg:offset:dissmissDuration:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:35"]
  T8["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S8 -->|calls| T8
  S9["method:TFPopupToast::tf_show:msg:offset:dissmissDuration:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:35"]
  T9["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S9 -->|calls| T9
  S10["method:TFPopupToast::setMsg:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:84"]
  T10["method:TFPopupToast::toastFrame<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:105"]
  S10 -->|calls| T10
  S11["method:TFPopupToast::setMsg:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:84"]
  T11["method:TFPopupToast::toastLabelFrame<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:123"]
  S11 -->|calls| T11
  S12["method:TFPopupToast::toastDuration:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:92"]
  T12["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S12 -->|calls| T12
  S13["method:TFPopupToast::toastDuration:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:92"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:NSObject::popup_classMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:28"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:NSObject::popup_classMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:28"]
  T17["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S17 -->|calls| T17
  S18["method:NSObject::popup_classMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:28"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T19["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  S19 -->|calls| T19
  S20["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T21["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S21 -->|calls| T21
  S22["method:UIScrollView::popup_gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:49"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T23["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  S23 -->|calls| T23
  S24["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
