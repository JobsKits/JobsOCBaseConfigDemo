# `calls 符号关系 - 071`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:TFPopupLoading::tf_show:msg:offset:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:37"]
  T1["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S1 -->|calls| T1
  S2["method:TFPopupLoading::tf_show:msg:offset:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:37"]
  T2["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S2 -->|calls| T2
  S3["method:TFPopupLoading::tf_hide:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:69"]
  T3["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S3 -->|calls| T3
  S4["method:TFPopupLoading::tf_hide:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:69"]
  T4["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S4 -->|calls| T4
  S5["method:TFPopupLoading::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:98"]
  T5["method:TFPopupLoading::layoutSubviews<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupLoading/TFPopupLoading.m:98"]
  S5 -->|calls| T5
  S6["method:TFPopupToast::tf_show:msg:offset:dissmissDuration:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:35"]
  T6["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S6 -->|calls| T6
  S7["method:TFPopupToast::tf_show:msg:offset:dissmissDuration:animationType:customBlock:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:35"]
  T7["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S7 -->|calls| T7
  S8["method:TFPopupToast::setMsg:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:84"]
  T8["method:TFPopupToast::toastFrame<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:105"]
  S8 -->|calls| T8
  S9["method:TFPopupToast::setMsg:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:84"]
  T9["method:TFPopupToast::toastLabelFrame<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:123"]
  S9 -->|calls| T9
  S10["method:TFPopupToast::toastDuration:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:92"]
  T10["method:NSObject::isKindOfClass<br/>JobsByPods/JobsClass@Pods/Core/NSObject+Class/NSObject+Class.m:77"]
  S10 -->|calls| T10
  S11["method:TFPopupToast::toastDuration:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Core/TFPopupToast/TFPopupToast.m:92"]
  T11["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S11 -->|calls| T11
  S12["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  T12["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S12 -->|calls| T12
  S13["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  T13["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S13 -->|calls| T13
  S14["method:NSObject::popup_classMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:28"]
  T14["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S14 -->|calls| T14
  S15["method:NSObject::popup_classMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:28"]
  T15["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S15 -->|calls| T15
  S16["method:NSObject::popup_classMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:28"]
  T16["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S16 -->|calls| T16
  S17["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T17["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  S17 -->|calls| T17
  S18["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T18["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S18 -->|calls| T18
  S19["method:UIScrollView::popExchangeGestureRecognizerShouldBegin<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:40"]
  T19["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S19 -->|calls| T19
  S20["method:UIScrollView::popup_gestureRecognizerShouldBegin:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:49"]
  T20["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S20 -->|calls| T20
  S21["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T21["method:NSObject::popup_instanceMethodExchange:toClass:toSel:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/NSObject/NSObject+TFPopupMethodExchange/NSObject+TFPopupMethodExchange.m:12"]
  S21 -->|calls| T21
  S22["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T22["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S22 -->|calls| T22
  S23["method:UIScrollView::popExchangeShouldRecognizeSimultaneouslyWithGestureRecognizer<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:58"]
  T23["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S23 -->|calls| T23
  S24["method:UIScrollView::popup_gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:67"]
  T24["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S24 -->|calls| T24
  S25["method:UIScrollView::popup_gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:<br/>JobsByPods/ManualByOCPods@Pods/TFPopup/Support/UIKit/UIScrollView/UIScrollView+TFPopup/UIScrollView+TFPopup.m:67"]
  T25["method:YYWeakProxy::class<br/>JobsByPods/ManualByOCPods@Pods/YYKits/Core/YYWeakProxy/YYWeakProxy.m:49"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
