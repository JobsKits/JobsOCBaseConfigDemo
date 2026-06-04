# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["App/JobsOCBaseConfigDemo"]
  M2["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M3["JobsByPods/ManualByOCPods@Pods"]
  M4["JobsByPods/JobsBaseUI@Pods"]
  M5["JobsByPods/JobsOCDefs@Pods"]
  M6["JobsByPods/JobsClass@Pods"]
  M7["JobsByPods/JobsStringUtils@Pods"]
  M8["JobsByPods/JobsByOCPods@Pods"]
  M9["JobsByPods/JobsAPIs@Pods"]
  M10["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M11["JobsByPods/JobsLinkageMenuView@Pods"]
  M12["JobsByPods/JobsNavBar@Pods"]
  M13["JobsByPods/MJRefreshExtra@Pods"]
  M14["JobsByPods/JobsOCProtocols@Pods"]
  M15["JobsByPods/JobsModel@Pods"]
  M16["JobsByPods/JobsOCTools@Pods"]
  M17["JobsByPods/JobsCustomView@Pods"]
  M18["JobsByPods/JobsBasePopupView@Pods"]
  M19["JobsByPods/JobsCryptography@Pods"]
  M20["JobsByPods/JobsSuspend@Pods"]
  M21["JobsByPods/JobsDropDownListView@Pods"]
  M22["JobsByPods/JobsLoadingImage@Pods"]
  M23["JobsByPods/JobsOCRuntimeKits@Pods"]
  M24["JobsByPods/JobsTimeUtils@Pods"]
  M1 -->|calls:371| M2
  M3 -->|calls:356| M4
  M1 -->|calls:330| M5
  M1 -->|calls:224| M4
  M3 -->|calls:188| M6
  M4 -->|calls:171| M2
  M1 -->|calls:134| M7
  M1 -->|calls:133| M3
  M8 -->|calls:130| M2
  M3 -->|calls:123| M9
  M10 -->|calls:119| M2
  M3 -->|calls:114| M2
  M8 -->|calls:108| M6
  M1 -->|calls:104| M8
  M11 -->|calls:103| M2
  M12 -->|calls:102| M2
  M13 -->|calls:98| M2
  M14 -->|calls:95| M15
  M10 -->|calls:87| M6
  M4 -->|calls:82| M6
  M8 -->|calls:81| M7
  M16 -->|calls:78| M2
  M4 -->|calls:73| M7
  M10 -->|calls:65| M7
  M4 -->|calls:63| M3
  M8 -->|calls:62| M15
  M17 -->|calls:59| M2
  M18 -->|calls:56| M7
  M12 -->|calls:55| M6
  M4 -->|calls:53| M5
  M1 -->|calls:52| M6
  M3 -->|calls:52| M18
  M18 -->|calls:50| M2
  M12 -->|calls:50| M7
  M2 -->|calls:48| M7
  M17 -->|calls:45| M7
  M13 -->|calls:44| M7
  M18 -->|calls:42| M6
  M8 -->|calls:41| M3
  M9 -->|calls:40| M7
  M11 -->|calls:38| M7
  M13 -->|calls:38| M6
  M19 -->|calls:36| M3
  M2 -->|calls:35| M6
  M3 -->|calls:35| M8
  M17 -->|calls:34| M6
  M11 -->|calls:34| M6
  M17 -->|calls:33| M3
  M10 -->|calls:33| M15
  M8 -->|calls:32| M4
  M17 -->|calls:31| M15
  M18 -->|calls:30| M3
  M16 -->|calls:30| M6
  M16 -->|calls:30| M3
  M20 -->|calls:29| M2
  M16 -->|calls:28| M5
  M21 -->|calls:27| M6
  M2 -->|calls:26| M15
  M11 -->|calls:26| M15
  M12 -->|calls:26| M15
  M13 -->|calls:26| M15
  M15 -->|calls:25| M3
  M1 -->|calls:23| M22
  M2 -->|calls:23| M3
  M17 -->|calls:23| M5
  M10 -->|calls:23| M3
  M16 -->|calls:23| M8
  M3 -->|calls:23| M23
  M15 -->|calls:22| M7
  M12 -->|calls:22| M3
  M1 -->|calls:21| M16
  M8 -->|calls:21| M5
  M13 -->|calls:21| M3
  M4 -->|calls:20| M8
  M8 -->|calls:20| M16
  M16 -->|calls:20| M23
  M24 -->|calls:20| M7
  M1 -->|calls:19| M15
  M4 -->|calls:19| M15
  M11 -->|calls:18| M3
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
