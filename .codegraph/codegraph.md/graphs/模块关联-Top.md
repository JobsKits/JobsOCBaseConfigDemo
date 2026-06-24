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
  M12["JobsByPods/JobsOCDSL@Pods"]
  M13["JobsByPods/JobsStringUtils@Pods"]
  M14["JobsByPods/JobsNavBar@Pods"]
  M15["JobsByPods/JobsNavigationTransitionMgr@Pods"]
  M16["JobsByPods/JobsBasePopupView@Pods"]
  M17["JobsByPods/JobsCustomView@Pods"]
  M18["JobsByPods/MJRefreshExtra@Pods"]
  M19["JobsByPods/JobsAPIs@Pods"]
  M20["JobsByPods/JobsCryptography@Pods"]
  M21["JobsByPods/JobsLinkageMenuView@Pods"]
  M22["JobsByPods/JobsAppTools@Pods"]
  M23["JobsByPods/JobsLoadingImage@Pods"]
  M24["JobsByPods/JobsBitsMonitor@Pods"]
  M25["JobsByPods/JobsFiltrationView@Pods"]
  M26["JobsByPods/JobsHotLabel@Pods"]
  M27["JobsByPods/FileFolderHandleTool@Pods"]
  M28["JobsByPods/JobsDeviceInfo@Pods"]
  M29["JobsByPods/JobsUploadingProgressView@Pods"]
  M30["JobsByPods/JobsDropDownListView@Pods"]
  M1 -->|calls:1196| M2
  M1 -->|calls:656| M3
  M1 -->|calls:511| M4
  M1 -->|calls:317| M5
  M6 -->|calls:224| M2
  M3 -->|calls:188| M7
  M1 -->|calls:185| M8
  M8 -->|calls:134| M2
  M9 -->|calls:102| M10
  M8 -->|calls:98| M3
  M6 -->|calls:98| M4
  M1 -->|calls:94| M11
  M1 -->|calls:79| M12
  M6 -->|calls:78| M3
  M11 -->|calls:70| M3
  M8 -->|calls:65| M4
  M11 -->|calls:60| M13
  M1 -->|calls:59| M10
  M11 -->|calls:59| M2
  M1 -->|calls:57| M13
  M8 -->|calls:49| M13
  M11 -->|calls:48| M7
  M14 -->|calls:41| M13
  M15 -->|calls:41| M13
  M6 -->|calls:40| M5
  M16 -->|calls:39| M13
  M15 -->|calls:39| M3
  M5 -->|calls:37| M13
  M10 -->|calls:36| M3
  M17 -->|calls:35| M13
  M18 -->|calls:35| M13
  M19 -->|calls:33| M13
  M20 -->|calls:33| M3
  M21 -->|calls:33| M13
  M15 -->|calls:33| M7
  M6 -->|calls:33| M7
  M8 -->|calls:32| M7
  M8 -->|calls:29| M12
  M3 -->|calls:29| M8
  M14 -->|calls:28| M3
  M16 -->|calls:26| M3
  M1 -->|calls:24| M7
  M5 -->|calls:23| M3
  M14 -->|calls:23| M2
  M1 -->|calls:22| M22
  M1 -->|calls:22| M23
  M11 -->|calls:22| M8
  M17 -->|calls:22| M3
  M14 -->|calls:22| M7
  M20 -->|calls:21| M5
  M21 -->|calls:21| M3
  M18 -->|calls:21| M3
  M16 -->|calls:20| M2
  M24 -->|calls:20| M2
  M25 -->|calls:20| M2
  M11 -->|calls:19| M5
  M26 -->|calls:19| M2
  M11 -->|calls:18| M4
  M12 -->|calls:18| M10
  M12 -->|calls:18| M3
  M27 -->|calls:17| M5
  M27 -->|calls:17| M11
  M11 -->|calls:17| M10
  M28 -->|calls:17| M13
  M29 -->|calls:17| M3
  M1 -->|calls:16| M16
  M6 -->|calls:16| M11
  M29 -->|calls:16| M2
  M3 -->|calls:16| M11
  M20 -->|calls:15| M7
  M30 -->|calls:15| M3
  M12 -->|calls:15| M6
  M11 -->|calls:14| M12
  M10 -->|calls:14| M13
  M14 -->|calls:14| M4
  M24 -->|calls:13| M5
  M30 -->|calls:13| M2
  M26 -->|calls:13| M4
  M16 -->|calls:12| M7
  M8 -->|calls:12| M5
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
