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
  M5["JobsByPods/GKCustomNavigationBarExtra@Pods"]
  M6["JobsByPods/JobsOCTools@Pods"]
  M7["JobsByPods/JobsClass@Pods"]
  M8["JobsByPods/JobsBaseUI@Pods"]
  M9["JobsByPods/JobsOCDSL@Pods"]
  M10["JobsByPods/JobsOCProtocols@Pods"]
  M11["JobsByPods/JobsModel@Pods"]
  M12["JobsByPods/JobsByOCPods@Pods"]
  M13["JobsByPods/JobsStringUtils@Pods"]
  M14["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M15["JobsByPods/JobsCustomView@Pods"]
  M16["JobsByPods/JobsCryptography@Pods"]
  M17["JobsByPods/MJRefreshExtra@Pods"]
  M18["JobsByPods/JobsLinkageMenuView@Pods"]
  M19["JobsByPods/JobsBasePopupView@Pods"]
  M20["JobsByPods/JobsNavBar@Pods"]
  M21["JobsByPods/JobsAPIs@Pods"]
  M22["JobsByPods/JobsLoadingImage@Pods"]
  M23["JobsByPods/JobsBitsMonitor@Pods"]
  M24["JobsByPods/JobsFiltrationView@Pods"]
  M25["JobsByPods/JobsAppTools@Pods"]
  M26["JobsByPods/FileFolderHandleTool@Pods"]
  M27["JobsByPods/JobsDeviceInfo@Pods"]
  M28["JobsByPods/JobsUploadingProgressView@Pods"]
  M29["JobsByPods/JobsDropDownListView@Pods"]
  M1 -->|calls:1065| M2
  M1 -->|calls:655| M3
  M1 -->|calls:487| M4
  M1 -->|calls:336| M5
  M6 -->|calls:206| M2
  M3 -->|calls:188| M7
  M1 -->|calls:178| M8
  M8 -->|calls:141| M2
  M1 -->|calls:134| M9
  M6 -->|calls:120| M3
  M10 -->|calls:102| M11
  M6 -->|calls:101| M4
  M6 -->|calls:96| M5
  M8 -->|calls:92| M3
  M1 -->|calls:82| M12
  M12 -->|calls:80| M3
  M12 -->|calls:64| M13
  M8 -->|calls:56| M13
  M12 -->|calls:54| M7
  M12 -->|calls:51| M2
  M14 -->|calls:47| M13
  M15 -->|calls:45| M3
  M1 -->|calls:42| M11
  M1 -->|calls:41| M13
  M8 -->|calls:41| M9
  M14 -->|calls:39| M3
  M15 -->|calls:38| M13
  M14 -->|calls:38| M7
  M8 -->|calls:37| M7
  M16 -->|calls:37| M3
  M17 -->|calls:37| M13
  M5 -->|calls:36| M13
  M18 -->|calls:36| M13
  M11 -->|calls:36| M3
  M6 -->|calls:36| M9
  M19 -->|calls:35| M13
  M20 -->|calls:34| M13
  M21 -->|calls:33| M13
  M8 -->|calls:33| M4
  M6 -->|calls:32| M7
  M15 -->|calls:30| M4
  M19 -->|calls:29| M3
  M3 -->|calls:29| M8
  M20 -->|calls:28| M3
  M17 -->|calls:28| M2
  M12 -->|calls:27| M9
  M1 -->|calls:25| M7
  M19 -->|calls:25| M2
  M12 -->|calls:24| M8
  M5 -->|calls:23| M2
  M1 -->|calls:22| M22
  M5 -->|calls:22| M3
  M20 -->|calls:22| M7
  M12 -->|calls:21| M4
  M16 -->|calls:21| M5
  M20 -->|calls:21| M2
  M17 -->|calls:21| M3
  M23 -->|calls:20| M2
  M24 -->|calls:20| M2
  M18 -->|calls:20| M3
  M1 -->|calls:19| M25
  M19 -->|calls:18| M7
  M9 -->|calls:18| M11
  M26 -->|calls:17| M5
  M26 -->|calls:17| M12
  M27 -->|calls:17| M13
  M28 -->|calls:17| M3
  M17 -->|calls:17| M7
  M12 -->|calls:16| M5
  M6 -->|calls:16| M12
  M28 -->|calls:16| M2
  M3 -->|calls:16| M12
  M1 -->|calls:15| M19
  M5 -->|calls:15| M7
  M16 -->|calls:15| M7
  M29 -->|calls:15| M3
  M1 -->|calls:14| M6
  M8 -->|calls:14| M5
  M8 -->|calls:14| M11
  M20 -->|calls:14| M4
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
