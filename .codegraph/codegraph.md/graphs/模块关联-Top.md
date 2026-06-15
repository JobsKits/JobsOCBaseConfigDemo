# `模块关联 Top 图`

![Jobs倾情奉献](https://picsum.photos/1500/400 "Jobs出品，必属精品")

[toc]

---

## 🔥 <font id=前言>前言</font>

模块级关系图来自 `edges/module-coupling.tsv`，每条边的数字是聚合权重。

```mermaid
flowchart LR
  M1["App/JobsOCBaseConfigDemo"]
  M2["JobsByPods/JobsModelDSL@Pods"]
  M3["JobsByPods/ManualByOCPods@Pods"]
  M4["JobsByPods/JobsOCDefs@Pods"]
  M5["JobsByPods/JobsOCTools@Pods"]
  M6["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M7["JobsByPods/JobsClass@Pods"]
  M8["JobsByPods/JobsBaseUI@Pods"]
  M9["JobsByPods/JobsOCProtocols@Pods"]
  M10["JobsByPods/JobsModel@Pods"]
  M11["JobsByPods/JobsOCDSL@Pods"]
  M12["JobsByPods/JobsByOCPods@Pods"]
  M13["JobsByPods/JobsStringUtils@Pods"]
  M14["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M15["JobsByPods/JobsCustomView@Pods"]
  M16["JobsByPods/JobsCryptography@Pods"]
  M17["JobsByPods/MJRefreshExtra@Pods"]
  M18["JobsByPods/JobsBasePopupView@Pods"]
  M19["JobsByPods/JobsNavBar@Pods"]
  M20["JobsByPods/JobsAPIs@Pods"]
  M21["JobsByPods/JobsLinkageMenuView@Pods"]
  M22["JobsByPods/JobsBitsMonitor@Pods"]
  M23["JobsByPods/JobsFiltrationView@Pods"]
  M24["JobsByPods/JobsAppTools@Pods"]
  M25["JobsByPods/FileFolderHandleTool@Pods"]
  M26["JobsByPods/JobsDeviceInfo@Pods"]
  M27["JobsByPods/JobsUploadingProgressView@Pods"]
  M28["JobsByPods/JobsLoadingImage@Pods"]
  M29["JobsByPods/JobsDropDownListView@Pods"]
  M1 -->|calls:921| M2
  M1 -->|calls:662| M3
  M1 -->|calls:447| M4
  M5 -->|calls:362| M2
  M1 -->|calls:270| M6
  M5 -->|calls:246| M4
  M5 -->|calls:233| M3
  M3 -->|calls:188| M7
  M1 -->|calls:139| M8
  M8 -->|calls:119| M2
  M5 -->|calls:108| M6
  M9 -->|calls:102| M10
  M1 -->|calls:92| M11
  M1 -->|calls:86| M10
  M8 -->|calls:79| M3
  M1 -->|calls:67| M12
  M12 -->|calls:67| M3
  M5 -->|calls:56| M11
  M12 -->|calls:52| M2
  M12 -->|calls:49| M7
  M12 -->|calls:49| M13
  M14 -->|calls:49| M13
  M8 -->|calls:45| M13
  M15 -->|calls:45| M3
  M5 -->|calls:44| M10
  M14 -->|calls:39| M3
  M8 -->|calls:38| M11
  M15 -->|calls:38| M13
  M10 -->|calls:38| M3
  M14 -->|calls:38| M7
  M1 -->|calls:37| M13
  M16 -->|calls:37| M3
  M17 -->|calls:37| M13
  M6 -->|calls:36| M13
  M5 -->|calls:36| M7
  M18 -->|calls:35| M13
  M19 -->|calls:34| M13
  M8 -->|calls:33| M7
  M20 -->|calls:32| M13
  M8 -->|calls:31| M4
  M21 -->|calls:31| M13
  M15 -->|calls:30| M4
  M18 -->|calls:29| M3
  M3 -->|calls:29| M8
  M19 -->|calls:28| M3
  M17 -->|calls:28| M2
  M5 -->|calls:26| M12
  M1 -->|calls:25| M7
  M18 -->|calls:25| M2
  M6 -->|calls:23| M2
  M6 -->|calls:22| M3
  M19 -->|calls:22| M7
  M5 -->|calls:22| M8
  M16 -->|calls:21| M6
  M19 -->|calls:21| M2
  M17 -->|calls:21| M3
  M22 -->|calls:20| M2
  M23 -->|calls:20| M2
  M21 -->|calls:20| M3
  M8 -->|calls:19| M10
  M12 -->|calls:19| M11
  M18 -->|calls:18| M7
  M12 -->|calls:18| M8
  M11 -->|calls:18| M10
  M1 -->|calls:17| M24
  M25 -->|calls:17| M6
  M25 -->|calls:17| M12
  M26 -->|calls:17| M13
  M27 -->|calls:17| M3
  M17 -->|calls:17| M7
  M1 -->|calls:16| M28
  M5 -->|calls:16| M13
  M27 -->|calls:16| M2
  M3 -->|calls:16| M12
  M6 -->|calls:15| M7
  M16 -->|calls:15| M7
  M29 -->|calls:15| M3
  M8 -->|calls:14| M6
  M19 -->|calls:14| M4
  M11 -->|calls:14| M8
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
