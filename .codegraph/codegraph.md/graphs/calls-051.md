# `calls 符号关系 - 051`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T1["method:JXCategoryTitleBackgroundCellModel::byNormalBorderColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:71"]
  S1 -->|calls| T1
  S2["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T2["method:JXCategoryTitleBackgroundCellModel::bySelectedBackgroundColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:80"]
  S2 -->|calls| T2
  S3["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T3["method:JXCategoryTitleBackgroundCellModel::bySelectedBorderColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:89"]
  S3 -->|calls| T3
  S4["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T4["method:JXCategoryTitleBackgroundCellModel::byBorderLineWidth<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:53"]
  S4 -->|calls| T4
  S5["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T5["method:JXCategoryTitleBackgroundCellModel::byBackgroundCornerRadius<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:26"]
  S5 -->|calls| T5
  S6["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T6["method:JXCategoryTitleBackgroundCellModel::byBackgroundWidth<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:44"]
  S6 -->|calls| T6
  S7["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T7["method:JXCategoryTitleBackgroundCellModel::byBackgroundHeight<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:35"]
  S7 -->|calls| T7
  S8["function:jobsMakeCategoryTitleView<br/>JobsByPods/JXCategoryViewExtra@Pods/JXCategoryViewExtra.h:54"]
  T8["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S8 -->|calls| T8
  S9["function:jobsMakeCategoryImageView<br/>JobsByPods/JXCategoryViewExtra@Pods/JXCategoryViewExtra.h:60"]
  T9["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S9 -->|calls| T9
  S10["function:jobsMakeCategoryDotView<br/>JobsByPods/JXCategoryViewExtra@Pods/JXCategoryViewExtra.h:66"]
  T10["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S10 -->|calls| T10
  S11["function:jobsMakeCategoryNumberView<br/>JobsByPods/JXCategoryViewExtra@Pods/JXCategoryViewExtra.h:72"]
  T11["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S11 -->|calls| T11
  S12["function:jobsMakeCategoryIndicatorBackgroundView<br/>JobsByPods/JXCategoryViewExtra@Pods/JXCategoryViewExtra.h:78"]
  T12["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S12 -->|calls| T12
  S13["function:jobsMakeCategoryIndicatorLineView<br/>JobsByPods/JXCategoryViewExtra@Pods/JXCategoryViewExtra.h:84"]
  T13["function:block<br/>JobsByPods/JobsOCDSL@Pods/Support/UIKit/UIGestureRecognizer/UIGestureRecognizer+Extra/UIGestureRecognizer+Extra.m:45"]
  S13 -->|calls| T13
  S14["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:277"]
  T14["method:JobsPodspecKitForJXCategoryViewExtra::standard_user_target_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:266"]
  S14 -->|calls| T14
  S15["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:281"]
  T15["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:273"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:281"]
  T16["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:277"]
  S16 -->|calls| T16
  S17["method:JobsBaseApi::buildCustomUrlRequest<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:30"]
  T17["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S17 -->|calls| T17
  S18["method:JobsBaseApi::requestArgument<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:50"]
  T18["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S18 -->|calls| T18
  S19["method:JobsBaseApi::jsonValidator<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:64"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:JobsBaseApi::cacheTimeInSeconds<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:78"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:JobsBaseApi::requestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:93"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:JobsBaseApi::requestMethod<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:107"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:RegisterApi::requestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/RegisterApi/RegisterApi.m:12"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:RegisterApi::requestMethod<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/RegisterApi/RegisterApi.m:26"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:UploadImageApi::initByImage<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.m:20"]
  T25["method:UploadImageApi::byImage<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/UploadImageApi/UploadImageApi.m:29"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
