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
  M9["JobsByPods/JobsOCProtocols@Pods"]
  M10["JobsByPods/JobsModel@Pods"]
  M11["JobsByPods/JobsByOCPods@Pods"]
  M12["JobsByPods/JobsStringUtils@Pods"]
  M13["JobsByPods/JobsBasePopupView@Pods"]
  M14["JobsByPods/JobsNavBar@Pods"]
  M15["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M16["JobsByPods/JobsAPIs@Pods"]
  M17["JobsByPods/MJRefreshExtra@Pods"]
  M18["JobsByPods/JobsCustomView@Pods"]
  M19["JobsByPods/JobsCryptography@Pods"]
  M20["JobsByPods/JobsLinkageMenuView@Pods"]
  M21["JobsByPods/JobsBitsMonitor@Pods"]
  M22["JobsByPods/JobsFiltrationView@Pods"]
  M23["JobsByPods/JobsAppTools@Pods"]
  M24["JobsByPods/JobsHotLabel@Pods"]
  M25["JobsByPods/JobsOCDSL@Pods"]
  M26["JobsByPods/FileFolderHandleTool@Pods"]
  M27["JobsByPods/JobsDeviceInfo@Pods"]
  M28["JobsByPods/JobsUploadingProgressView@Pods"]
  M29["JobsByPods/JobsDropDownListView@Pods"]
  M1 -->|calls:1160| M2
  M1 -->|calls:595| M3
  M1 -->|calls:464| M4
  M1 -->|calls:279| M5
  M6 -->|calls:222| M2
  M3 -->|calls:188| M7
  M8 -->|calls:184| M2
  M1 -->|calls:159| M8
  M8 -->|calls:119| M3
  M9 -->|calls:102| M10
  M6 -->|calls:98| M4
  M8 -->|calls:87| M4
  M1 -->|calls:84| M11
  M11 -->|calls:83| M2
  M6 -->|calls:78| M3
  M11 -->|calls:65| M3
  M11 -->|calls:63| M12
  M8 -->|calls:60| M5
  M1 -->|calls:59| M12
  M5 -->|calls:52| M2
  M8 -->|calls:52| M12
  M11 -->|calls:51| M7
  M1 -->|calls:49| M10
  M13 -->|calls:47| M2
  M13 -->|calls:45| M12
  M5 -->|calls:43| M12
  M14 -->|calls:41| M12
  M15 -->|calls:41| M12
  M16 -->|calls:40| M12
  M6 -->|calls:40| M5
  M5 -->|calls:39| M17
  M8 -->|calls:39| M17
  M5 -->|calls:36| M3
  M10 -->|calls:36| M3
  M18 -->|calls:35| M12
  M17 -->|calls:35| M12
  M19 -->|calls:33| M3
  M20 -->|calls:33| M12
  M15 -->|calls:33| M7
  M6 -->|calls:33| M7
  M8 -->|calls:32| M7
  M15 -->|calls:31| M3
  M5 -->|calls:29| M4
  M3 -->|calls:29| M8
  M13 -->|calls:28| M3
  M8 -->|calls:27| M10
  M11 -->|calls:23| M8
  M11 -->|calls:23| M4
  M14 -->|calls:23| M2
  M14 -->|calls:22| M7
  M11 -->|calls:21| M10
  M19 -->|calls:21| M5
  M21 -->|calls:20| M2
  M11 -->|calls:20| M5
  M22 -->|calls:20| M2
  M14 -->|calls:20| M3
  M1 -->|calls:19| M23
  M1 -->|calls:19| M7
  M24 -->|calls:19| M2
  M25 -->|calls:18| M10
  M26 -->|calls:17| M5
  M26 -->|calls:17| M11
  M27 -->|calls:17| M12
  M25 -->|calls:17| M3
  M28 -->|calls:17| M3
  M5 -->|calls:16| M10
  M13 -->|calls:16| M5
  M6 -->|calls:16| M11
  M28 -->|calls:16| M2
  M3 -->|calls:16| M11
  M13 -->|calls:15| M4
  M19 -->|calls:15| M7
  M29 -->|calls:15| M3
  M25 -->|calls:15| M6
  M1 -->|calls:14| M13
  M5 -->|calls:14| M23
  M16 -->|calls:14| M2
  M13 -->|calls:14| M23
  M8 -->|calls:14| M23
  M8 -->|calls:14| M11
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
