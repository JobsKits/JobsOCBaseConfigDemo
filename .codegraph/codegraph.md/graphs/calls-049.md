# `calls 符号关系 - 049`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

这张图只展示一个分片，避免所有关系塞进一张图导致看不清。

```mermaid
flowchart LR
  S1["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T1["method:JXCategoryTitleBackgroundView::byBackgroundCornerRadius<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:116"]
  S1 -->|calls| T1
  S2["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T2["method:JXCategoryTitleBackgroundView::byBackgroundWidth<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:134"]
  S2 -->|calls| T2
  S3["method:JXCategoryTitleBackgroundView::jobsInitializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:41"]
  T3["method:JXCategoryTitleBackgroundView::byBackgroundHeight<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:125"]
  S3 -->|calls| T3
  S4["method:JXCategoryTitleBackgroundView::initializeData<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:59"]
  T4["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S4 -->|calls| T4
  S5["method:JXCategoryTitleBackgroundView::preferredCellClass<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:73"]
  T5["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S5 -->|calls| T5
  S6["method:JXCategoryTitleBackgroundView::jobsRefreshDataSource<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:78"]
  T6["method:JXCategoryTitleBackgroundView::byDataSource<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:32"]
  S6 -->|calls| T6
  S7["method:JXCategoryTitleBackgroundView::refreshDataSource<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:87"]
  T7["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S7 -->|calls| T7
  S8["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T8["method:JXCategoryTitleBackgroundCellModel::byNormalBackgroundColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:62"]
  S8 -->|calls| T8
  S9["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T9["method:JXCategoryTitleBackgroundCellModel::byNormalBorderColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:71"]
  S9 -->|calls| T9
  S10["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T10["method:JXCategoryTitleBackgroundCellModel::bySelectedBackgroundColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:80"]
  S10 -->|calls| T10
  S11["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T11["method:JXCategoryTitleBackgroundCellModel::bySelectedBorderColor<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:89"]
  S11 -->|calls| T11
  S12["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T12["method:JXCategoryTitleBackgroundCellModel::byBorderLineWidth<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:53"]
  S12 -->|calls| T12
  S13["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T13["method:JXCategoryTitleBackgroundCellModel::byBackgroundCornerRadius<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:26"]
  S13 -->|calls| T13
  S14["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T14["method:JXCategoryTitleBackgroundCellModel::byBackgroundWidth<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:44"]
  S14 -->|calls| T14
  S15["method:JXCategoryTitleBackgroundView::refreshCellModel:index:<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundView/JXCategoryTitleBackgroundView.m:92"]
  T15["method:JXCategoryTitleBackgroundCellModel::byBackgroundHeight<br/>JobsByPods/JXCategoryViewExtra@Pods/Core/JXCategoryTitleBackgroundViews/JXCategoryTitleBackgroundCellModel/JXCategoryTitleBackgroundCellModel.m:35"]
  S15 -->|calls| T15
  S16["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:277"]
  T16["method:JobsPodspecKitForJXCategoryViewExtra::standard_user_target_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:266"]
  S16 -->|calls| T16
  S17["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:281"]
  T17["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_pod_target_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:273"]
  S17 -->|calls| T17
  S18["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:281"]
  T18["method:JobsPodspecKitForJXCategoryViewExtra::apply_standard_user_target_xcconfig<br/>JobsByPods/JXCategoryViewExtra@Pods/JobsPodspecKit.rb:277"]
  S18 -->|calls| T18
  S19["method:JobsBaseApi::buildCustomUrlRequest<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:30"]
  T19["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S19 -->|calls| T19
  S20["method:JobsBaseApi::requestArgument<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:50"]
  T20["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S20 -->|calls| T20
  S21["method:JobsBaseApi::jsonValidator<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:64"]
  T21["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S21 -->|calls| T21
  S22["method:JobsBaseApi::cacheTimeInSeconds<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:78"]
  T22["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S22 -->|calls| T22
  S23["method:JobsBaseApi::requestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:93"]
  T23["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S23 -->|calls| T23
  S24["method:JobsBaseApi::requestMethod<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/JobsBaseApi/JobsBaseApi.m:107"]
  T24["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S24 -->|calls| T24
  S25["method:RegisterApi::requestUrl<br/>JobsByPods/JobsAPIs@Pods/Core/APIs/RegisterApi/RegisterApi.m:12"]
  T25["function:JobsBlockInstanceMethodIMP<br/>JobsByPods/JobsBlock@Pods/JobsBlockDef.h:15"]
  S25 -->|calls| T25
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
