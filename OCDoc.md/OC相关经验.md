# [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 相关经验

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> 本文集中整理 C 语言基础、Objective-C 对象模型、内存管理、Runtime、并发、数据持久化、网络与 UIKit 工程经验。语言规则以 Apple 的 Objective-C 文档和当前 SDK 公开声明为准；涉及具体实现细节时，不把某个编译器版本或某个 CPU 架构的行为写成跨平台永久保证。

- 官方资料：

  - [**Programming with Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)
  - [**Key-Value Coding Programming Guide**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueCoding/index.html)
  - [**Key-Value Observing Programming Guide**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html)
  - [**Blocks Programming Topics**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Blocks/Articles/00_Introduction.html)
  - [**Threading Programming Guide**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/Introduction/Introduction.html)
  - [**User Notifications**](https://developer.apple.com/documentation/usernotifications)

- 阅读约定：

  - 文中的内存布局、对象存储位置和消息发送 ABI 都带有平台、编译器与优化级别前提，不能只凭地址大小或单次实验下绝对结论。
  - `atomic` 只保证单次访问器调用的原子性，不等于对象或业务逻辑整体线程安全。
  - KVC、KVO、Block、Run Loop 与 GCD 各自解决不同问题；文中会明确它们的协作关系，不把相关性写成强依赖。

## 一、C 语言指针 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

![IMAGE 2024-09-09 23:23:08](<./assets/IMAGE 2024-09-09 23:23:08.jpg>)

![IMAGE 2024-09-09 23:23:12](<./assets/IMAGE 2024-09-09 23:23:12.jpg>)

### 1.1、`int *p = &a`

* 这行代码是在C或C++中声明了一个整数指针变量 `p`，并将其初始化为变量 `a` 的地址；
* `&a` 表示取变量 `a` 的地址，然后将这个地址赋给指针变量 `p`；
* 这样，`p` 就指向了变量 `a` 的位置，可以通过 `p` 来访问和操作变量 `a`；
* `int *p` 表示 `p` 是一个整数指针，可以用来存储整数变量的地址；
* 整数指针是指一个指针，其目标是整数类型的变量

### 1.2、数组指针与指针数组

* <font color=red>**数组指针（Pointer to Array）**</font>

  * <u>本质是指针</u>

  * 是指向整个数组的指针

  * 示例

    ```c
    #include <stdio.h>

    int main() {
        int arr[10];
        /// int 表示数组的元素类型是整数。
        /// (*p) 表示 p 是一个指针。
        /// [10] 表示数组的大小是10。
        int (*p)[10] = &arr;

        for(int i = 0; i < 10; i++) {
            (*p)[i] = i; // 使用数组指针访问数组元素
        }

        for(int i = 0; i < 10; i++) {
            printf("%d ", (*p)[i]);
        };return 0;
    }
    ```

* 指针数组（Array of Pointers）

  * <u>本质是数组</u>

  * 是一个数组，其中的每个元素都是指针

  * 示例

    ```c
    #include <stdio.h>

    int main() {
        int a = 1, b = 2, c = 3;
        /// int * 表示数组的元素是指向整数的指针。
            /// p[3] 表示数组的大小是3。
        int *p[3];

        p[0] = &a;
        p[1] = &b;
        p[2] = &c;

        for(int i = 0; i < 3; i++) {
            printf("%d ", *p[i]); // 使用指针数组访问变量的值
        };return 0;
    }
    ```

## 二、内存分布 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```lua
低地址（常见虚拟地址布局示意，并非 C 语言或所有平台的固定承诺）
+-----------------------------------------------------------------------------------------------------------+
| 代码段（Text）只读，固定大小
|         * 包括：程序代码、只读的常量（如 const 修饰的全局变量和字符串常量）。
+-----------------------------------------------------------------------------------------------------------+
| 全局区/数据段 （Data）
|         * 包括：已初始化的全局变量和已初始化的静态变量（包括全局和局部的静态变量）。
+-----------------------------------------------------------------------------------------------------------+
| 全局区/BSS 段（Block Started by Symbol）：未初始化的全局变量、未初始化的静态变量。
+-----------------------------------------------------------------------------------------------------------+
| 全局区/常量区：字符串常量（如字面量字符串）和编译期决定的只读变量（大多数实现将其归于代码段）。
|         * 注：如果常量区与代码段分开，则可以单独列出。
+-----------------------------------------------------------------------------------------------------------+
| 堆（Heap）通常向高地址增长，动态分配内存（如 malloc 或 new 分配的内存）。
|            * 堆是动态分配的内存区域，用于存储程序运行时动态分配的内存；
|         * 堆上的内存可以通过函数如 malloc()、calloc() 或者 new 来分配，并通过 free() 或者 delete 函数来进行释放；
|     * 存储动态创建的对象，生命周期不受函数作用域限制，且内存管理通常由开发者或垃圾回收机制负责；
+-----------------------------------------------------------------------------------------------------------+
| 栈（Stack）通常向低地址增长，用于保存调用帧；具体内容由 ABI、编译器和优化级别决定。
|            * 栈（Stack）用于存储函数的局部变量、函数参数、函数的返回地址等；
|       * 每次函数调用时，会在栈（Stack）上分配一块称为栈帧（Stack Frame）的内存，函数返回后，栈帧（Stack Frame）会被销毁；
|     * 栈（Stack）的大小是有限的，通常比堆的大小小得多 ；栈（Stack）<< 堆（Heap）
|     * 可以看作是一个容器；
|       * 其中元素的添加和移除都发生在同一端，通常称为栈顶；
|       * 向栈（Stack）中添加元素的操作称为“压栈”（Push），从栈中移除元素的操作称为“弹栈”（Pop）；
|       * 在栈（Stack）中，最后压入的元素首先被弹出，这就是先进后出的特性；
|     * 栈在计算机科学和软件工程中有广泛的应用，例如函数调用的过程、表达式求值、逆波兰表达式计算等场景都可以使用栈来实现。
+-----------------------------------------------------------------------------------------------------------+
```

> 💡 提示：
>
> * 上述表格按常见进程虚拟地址布局从低到高绘制，但堆、栈的方向和各段位置不是语言标准承诺，不能据此推导所有平台。
> * 全局区包含：
>   * **数据段（Data）**：包含已初始化的全局变量和已初始化的静态变量，属于全局区。
>   * **BSS段（Block Started by Symbol）**：包含未初始化的全局变量和静态变量，也属于全局区。变量在程序启动时会自动初始化为零。
>   * **常量区**：存储常量（如字面量字符串和编译期决定的只读变量）。在一些实现中，常量区也会和代码段合并，通常会归类到全局区的一部分。

## 三、内存中的数据 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* Apple 当前主流 CPU 使用小端序：多字节整数的**最低有效字节**放在最低内存地址。例如 `0x00123456` 的最低有效字节是 `0x56`。

* 在 Apple 平台上一个字节是 `8 bit`。严格按 C 语言标准编写跨平台代码时，应以 `CHAR_BIT` 为准。

* 在大多数表达式中，数组名会退化为指向首元素的指针；`arr`、`&arr[0]` 与 `&arr` 的起始地址数值通常相同，但类型和指针运算语义不同。`sizeof arr`、`&arr` 等场景不会发生数组到指针的退化。

  |  表达式   | 类型（类型不一致就导致：编译器对数据的处理方式不一致） |              含义              |
  | :-------: | :----------------------------------------------------: | :----------------------------: |
  |   `arr`   |                   `int *`（退化后）                    |        指向首元素的指针        |
  | `&arr[0]` |                        `int *`                         |        指向首元素的指针        |
  |  `&arr`   |                      `int (*)[5]`                      | 指向整个数组的指针（数组指针） |

* 内存只保存比特，类型、ABI 和指令决定如何解释这些比特。当前 Apple 平台的有符号整数使用二进制补码；同一组比特按有符号或无符号类型读取，会得到不同的数值。

* `float` 与 `double` 不是“先后升级”关系，而是两种不同精度的浮点类型。当前 Apple 64 位平台通常是：

  | 类型     | 常见大小 | IEEE 754 格式 |
  | -------- | -------- | ------------- |
  | `float`  | 4 字节   | binary32      |
  | `double` | 8 字节   | binary64      |

  跨平台代码仍应使用 `sizeof(float)`、`sizeof(double)` 获取当前实现的真实大小。

## 四、数据结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、数据结构总览

* 一维线性结构

  | 数据结构               | 中文说明                     | 常见用途                       |
  | ---------------------- | ---------------------------- | ------------------------------ |
  | **数组 (Array)**       | 连续内存的元素集合，访问快   | 快速读取、固定大小数据         |
  | **链表 (Linked List)** | 一个个节点串起来，插入删除快 | 动态数据、频繁插入删除         |
  | **栈 (Stack)**         | 后进先出（LIFO）             | 函数调用、表达式计算、撤销操作 |
  | **队列 (Queue)**       | 先进先出（FIFO）             | 排队、任务调度                 |
  | **双端队列 (Deque)**   | 两头都能进出                 | 缓存、滑动窗口                 |

* 非线性结构

  | 数据结构                 | 中文说明                    | 常见用途                 |
  | ------------------------ | --------------------------- | ------------------------ |
  | **树 (Tree)**            | 每个节点有子节点，像家谱    | 搜索、分类、XML解析      |
  | **二叉树 (Binary Tree)** | 每个节点最多两个子节点      | 排序、搜索               |
  | **堆 (Heap)**            | 一种特殊的树，最大堆/最小堆 | 优先队列、Top K 问题     |
  | **Trie 树（字典树）**    | 专门用来处理字符串前缀的树  | 自动补全、拼写检查       |
  | **B 树/B+ 树**           | 多叉平衡树                  | 数据库、文件系统索引     |
  | **图 (Graph)**           | 节点+边，可有环             | 地图、社交关系、网络拓扑 |

* 杂项 & 复合结构

  | 数据结构                      | 中文说明                               | 常见用途             |
  | ----------------------------- | -------------------------------------- | -------------------- |
  | **哈希表 (Hash Table)**       | 键值对结构，查找超快                   | 字典、缓存、键值映射 |
  | **并查集 (Union-Find)**       | 用来快速判断“两个元素是否属于同一集合” | 网络连通性、分组     |
  | **布隆过滤器 (Bloom Filter)** | 用很小空间判断“某个值是否可能存在”     | 数据库、去重、缓存   |
  | **跳表 (Skip List)**          | 类似多层链表，查找效率接近平衡树       | Redis 内部、排序结构 |
  | **位图 (BitMap)**             | 用一堆 0/1 表示状态                    | 去重、统计、压缩存储 |

### 4.2、各个数据结构的介绍

* 树（Tree）

  | 工具/功能    | 说明                                                    |
  | ------------ | ------------------------------------------------------- |
  | 文件夹结构   | 操作系统的目录结构（C盘、D盘）就是树形的                |
  | UI 层级结构  | iOS / Android 的界面控件是树形排列的                    |
  | 搜索引擎索引 | 比如字典排序、拼音联想功能，用的是“字典树（Trie Tree）” |
  | 数据库索引   | 数据库如 MySQL 用“B+树”加快查找速度                     |
  | 游戏技能树   | 技能之间有父子关系，也是树                              |
  | 决策树（AI） | 机器学习里，决策树是一种模型结构                        |

* 链表（Linked List）

  | 工具/功能            | 说明                                                 |
  | -------------------- | ---------------------------------------------------- |
  | 音乐播放器的播放队列 | 一首接一首，可以随时插入/删除某一首歌                |
  | 操作系统的任务队列   | 比如打印任务，按顺序处理，每次取一个任务             |
  | 实现“栈”和“队列”     | 比如浏览器“后退/前进”，经常用链表实现                |
  | 内存管理系统         | 操作系统分配/回收内存，常用双向链表表示内存块        |
  | Undo/Redo 功能       | 像 Word 的“撤销”功能，背后是一个链表串着每一步的记录 |

* 图（Graph）

  | 工具/功能              | 说明                                                         |
  | ---------------------- | ------------------------------------------------------------ |
  | 地图导航（高德、百度） | 城市就是“点”，道路就是“边”，用图算法找最短路径，比如 Dijkstra 算法 |
  | 社交网络               | 每个人是一个“点”，好友关系是“边”，朋友圈背后是社交图结构     |
  | 游戏地图               | 游戏中的迷宫、路径选择，也是图                               |
  | 网络拓扑               | 网络设备的连接结构（比如服务器、交换机）就是图               |
  | 项目依赖管理           | 比如编译一个程序，不同模块之间有依赖关系，用图可以管理编译顺序 |
  | 知识图谱               | AI 和搜索引擎中的知识关联就是一个超大的图结构                |

* 哈希表（Hash Table）的本质

  * 本质是通过将键（key）映射到一个确定的位置（”哈希桶”或“槽位”）来实现高效的数据存储和检索；
    * **快速查找**：哈希表可以在平均情况下以常量时间复杂度（O(1)）进行查找、插入和删除操作。这是因为哈希函数将键转换成一个固定长度的值，使得每个键都有一个确定的位置，从而可以直接在该位置进行操作；
    * **均匀分布**：良好设计的哈希函数可以使键在哈希表中均匀分布，尽量减少哈希冲突的发生。哈希冲突是指不同的键经过哈希函数后映射到了同一个桶中，解决冲突的方法通常包括链地址法和开放地址法等；
    * **灵活性**：哈希表适用于各种类型的数据，可以存储键值对、对象等各种形式的数据；
    * **空间效率**：尽管哈希表可能会消耗一定的内存空间，但在大多数情况下，哈希表的空间效率是很高的，尤其是在数据量较大时；

## 五、内存表示 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* <font color=red>内存只负责记录，实际释义是通过程序来的，通过不同的数据类型来展现其表达的真正含义</font>

* 字符和整数在内存里如何区分？

  * 内存本身不保存“这是字符还是整数”的标签。编译器生成的类型信息、指令和编码约定决定同一组比特如何解释。
  * ASCII 定义字符与 `0...127` 数值之间的映射；例如字符 `'A'` 对应十进制 `65`。如果一个字节保存 `0x41`，按 ASCII 解码得到 `'A'`，按无符号整数读取则得到 `65`。
  * Unicode 字符不能简单理解为“一个字符固定占几个字节”。UTF-8、UTF-16 等编码的码元宽度不同；一个用户可见字符还可能由多个 Unicode 标量组合而成。
  * [**Swift**](https://www.swift.org/) 的 `Character` 表示一个扩展字素簇。`MemoryLayout<Character>.size` 是当前标准库容器的实现大小，不等于该字符使用 UTF-8 编码后的字节数。

    ```swift
    let character: Character = "A"
    let asciiValue = character.asciiValue
    let utf8Bytes = String(character).utf8.count

    print(asciiValue as Any) // Optional(65)
    print(utf8Bytes)         // 1
    ```

* ASCII 码在内存里是数字，和普通整数会不会冲突？

  * 不会产生“存储冲突”，因为内存只保存比特；程序根据类型、数据宽度和编码上下文解释它们；
  * 字符 `'9'` 的 ASCII 编码值是十进制 `57`，因此它和数值 `57` 的低 8 位可以完全相同。区别不在“内存自动记住了类型”，而在读取该数据的指令和上下文；
  * 数值 `9` 的二进制值是 `00001001`，它与字符 `'9'` 的编码 `00111001` 不同。

    | 表达式 |  含义  | 内存（二进制） | 十进制 |   ASCII 字符   |
    | :----: | :----: | :------------: | :----: | :------------: |
    | `'9'`  | 字符 9 |   `00111001`   |  `57`  |     `'9'`      |
    |  `9`   | 数值 9 |   `00001001`   |  `9`   | 无（不是字符） |

* 计算机内存是怎么表示浮点数的？
  * 当前 Apple 平台的 `float` 和 `double` 采用 **IEEE 754** 二进制浮点格式；C 语言标准本身不强制所有实现都采用 IEEE 754。
  * 该标准常见格式包括单精度（32 位）和双精度（64 位）：
    * 单精度浮点数的结构存储为：1位符号位 + 8位指数部分 + 23位尾数部分
    * 双精度浮点数的存储结构为：1位符号位 + 11位指数部分 + 52位尾数部分
    * 这种存储方式允许计算机在有限的内存中表示广泛的浮点数值，并提供了一种平衡精度和存储空间的方法；
  * 浮点数通常由三部分组成：符号位、指数部分和尾数部分；
    * 符号位表示正负；
    * 指数部分用于表示数的大小；
    * 尾数部分则包含数值的有效数字；

## 六、时间复杂度与空间复杂度 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> * 时间复杂度：做事要几步？
> * 空间复杂度：占地要几张纸？

```c
for (int i = 0; i < n; i++) {
    printf("Hello\n");
}
🕒 时间复杂度是 O(n)，因为它打印了 n次，做了 n件事。
💾 空间复杂度是 O(1)，因为它没有开额外的内存（不管 n 是多少，都不需要更多空间）
```

## 七、内存对齐：结构体（struct）与联合体（union） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目         | `struct`（结构体）                                | `union`（共用体）                   |
| ------------ | ------------------------------------------------- | ----------------------------------- |
| **内存布局** | 所有成员 **并排排列**，每个成员都有自己的内存空间 | 所有成员 **共享同一块内存**（重叠） |
| **大小**     | 所有成员大小 **相加**（考虑对齐）                 | 最大成员大小（考虑对齐）            |
| **成员状态** | 成员可以 **同时使用**                             | 任一时刻**只建议访问一个成员**      |
| **应用场景** | 普通数据结构，多字段同时生效                      | 节省内存（如协议数据包中的变体）    |

* 除了由操作系统自动按数据结构分配内存外，还支持自己更改默认对齐数来修改内存。

  ```c
  #可以使用编译器特定的指令或者预处理器指令（例如#pragma pack）来改变结构体/联合体的对齐方式，但这样的改变可能会影响性能。
  通常情况下，由编译器自动进行的数据对齐足够满足大多数情况的需求。
  #pragma pack(push, 1)  // 将对齐方式设置为 1 字节
  union MyUnion {
      char c;
      int i;
      double d;
  };
  #pragma pack(pop)  // 恢复默认对齐方式

  #pragma pack(push, 1)  // 将对齐方式设置为 1 字节
  struct MyStruct {
      char c;
      int i;
      double d;
  };
  #pragma pack(pop)  // 恢复默认对齐方式
  ```

* 联合体（union）

  * **所有成员共用同一块内存**，它们不会“同时存在”。**你任意时刻只能安全地使用其中一个成员**。

  * 联合体的大小取决于他所有成员中**占用空间最大的一个成员**的大小。当最大成员大小不是最大对齐数的整数倍的时候，就要**对齐到最大对齐数类型的整数倍**。

    ```c
    union U1{
            char a[6];// 6 （最大成员）
            int b; // 4 （最大对齐数）
            char c; // 1
        }u1; // 8 = 4 * 2

    union{
            char a[9]; // 9 （最大成员）
            int b; // 4 （最大对齐数）
            union U1 uu1;// 8
        }u2; //12 = 4 * 3,如果*2 = 8 无法涵盖9，所以必须3倍

    union{
            char a[7];// 7
            int b;// 4 （最大对齐数）
            union U1 uu1;// 8 （最大成员）
        }u3; //8
    ```

* 结构体（struct）

  * 结构体的**内存布局是连续的**；
  * 结构体实例可以位于静态存储区、自动存储区、动态分配区，也可能被优化到寄存器中；它的存储位置取决于对象的存储期、分配方式、ABI 和编译器优化，不能仅凭“值传递 / 指针传递”判断；
  * 传递结构体指针只是在传地址，不会自动把结构体搬到堆上；使用 `malloc` 等动态分配函数，才明确请求动态存储；
  * 结构体的数据对齐是编译器为了提高存储和访问效率而进行的一种优化；
    * 在结构体中，各个成员的内存对齐**可能会受到硬件架构和编译器的影响**；
    * 结构体自身的对齐要求通常至少满足其最严格成员的对齐要求；成员之间和末尾都可能出现填充字节（padding），应使用 `_Alignof` / `alignof` 与 `sizeof` 获取当前实现结果。
    ```c
    struct S1{
            char a; // 1
            int b; // 4
            char c; // 1
        }s1; //12 = 4 * 3
    ```

## 八、`atomic` 与 `nonatomic` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* `atomic` / `nonatomic` 控制编译器合成访问器时是否提供**单次 getter 或 setter 调用的原子性**；未显式声明时，Objective-C 属性默认是 `atomic`。
* `atomic` 不等于“属性线程安全”，更不等于对象或业务逻辑线程安全：

  - `self.count += 1` 包含读取、计算、写入三个步骤，即使访问器是 `atomic`，多个线程仍可能丢失更新。
  - 先读取一个集合再修改集合，是跨多次调用的复合操作，仍需要串行队列、锁、Actor 或其它同步策略。
  - 不应依赖某个 Runtime 版本内部使用的具体锁类型；这是实现细节，不属于公开 API 承诺。

* `nonatomic` 不提供上述访问器级同步，开销更低，因此 UIKit 与大量业务属性通常使用 `nonatomic`；真正的共享可变状态仍需在更高层明确同步。

## 九、`strong` 与 `copy` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* `copy` 是向对象发送 `copyWithZone:`，具体复制深度由类型实现决定，不能概括为“不可变对象浅复制，其它对象深复制”：

  - 不可变 Foundation 对象执行 `copy` 时经常返回自身，这是安全的实现优化。
  - 可变 Foundation 对象执行 `copy` 时通常得到不可变副本；执行 `mutableCopy` 才得到可变副本。
  - 集合的普通 `copy` 通常只复制容器，元素仍是原对象；需要逐元素复制时必须明确实现。

* 使用 `copy` 关键字可以防止对象值的意外修改

  ```objective-c
  #import <Foundation/Foundation.h>

  @interface MyClass : NSObject

  @property (nonatomic,strong)NSString *strongString;
  @property (nonatomic,copy)NSString *copyString;

  @end

  @implementation MyClass
  @end

  int main(int argc, const char * argv[]) {
      @autoreleasepool {
          NSMutableString *mutableStr = [NSMutableString stringWithString:@"初始值"];

          MyClass *obj = [[MyClass alloc] init];
          obj.strongString = mutableStr; // 使用 strong 属性赋值
          obj.copyString = mutableStr;   // 使用 copy 属性赋值

          NSLog(@"修改前 - strongString: %@, copyString: %@", obj.strongString, obj.copyString);

          // 修改原来的 mutableStr 的值
          [mutableStr appendString:@" - 修改后"];

          NSLog(@"修改后 - strongString: %@, copyString: %@", obj.strongString, obj.copyString);
      };return 0;
  }
  ```

  ```
  修改前 - strongString: 初始值, copyString: 初始值
  修改后 - strongString: 初始值 - 修改后, copyString: 初始值

  如果用 strong，会有可能意外地共享同一个可变对象，导致外部修改影响到内部数据。
  使用 copy 则确保即使传入的是一个可变对象，属性也只会保留一个不可变的副本，从而避免了这种不确定性。
  ```

## 十、[**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) / C Block <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* ***Block* 的捕获变量：** 当一个 *Block* 被创建时，它会捕获在其内部使用的外部变量。

  * **对于局部变量，*Block* 会在创建时将其复制一份，然后在 *Block* 内部使用。**如果 *Block* 在定义时没有修改该变量，那么这个变量的值在 *Block* 内部是不可变的。这被称为值捕获（*Value Capture*），捕获的变量可以是局部变量或全局变量；

  * **`__block` 修饰符**：`__block` 变量由词法作用域与引用它的 Block 共享存储。Block 内的修改会反映到外部作用域以及同一作用域创建的其它 Block；如果相关 Block 被复制到堆，运行时会保证这份共享存储继续有效。编译器常用转发结构实现该语义，但结构布局属于实现细节。

    * <font color="red">局部变量 + `__block`（引用捕获）</font>：**当需要在 *Block* 内部修改局部变量的值时，需要使用 `__block` 修饰符来声明该变量。这样，在 *Block* 内部就可以通过引用来修改外部变量的值；**

      ```objective-c
      // 定义一个Block
      typedef void (^SimpleBlock)(void);
      int main() {
          // 定义一个局部变量
          __block int count = 0;
          // 定义一个Block，并在Block内部使用count变量
          SimpleBlock block = ^{
              NSLog(@"Count inside block: %d", count);
          };
          // 修改count的值
          count = 10;
          // 调用Block
          block(); // 这里的count值在Block内部被捕获，即使count在Block定义之后被修改，但值仍然被捕获
          return 0;
      }
      // 输出将会是：
      Count inside block: 10
      /**
      在这个例子中，使用 __block 修饰的局部变量 count 被 Block 按引用捕获，所以当外部修改 count 后，Block 中访问到的也是修改后的新值。
      */
      ```

    * <font color="red">局部变量（值捕获）</font>：

      ```objective-c
      #import <Foundation/Foundation.h>

      int main(int argc, const char * argv[]) {
          @autoreleasepool {
              int localCount = 10;
              // 定义一个 block，捕获了 localCount（值捕获）
              void (^printLocalCount)(void) = ^{
                  NSLog(@"localCount = %d", localCount);
              };
              // 修改局部变量
              localCount = 20;
              // 执行 block
              printLocalCount();  // 输出 localCount = 10（被捕获时的值）
          };return 0;
      }
      ```

  * **对于全局变量，*block* 会直接引用其内存地址，而不会复制**

    <font color="red">全局变量（引用捕获）天然就是引用访问的，因此不需要 `__block`</font>

    ```objective-c
    #import <Foundation/Foundation.h>
    // 定义一个全局变量
    int globalCount = 0;
    int main(int argc, const char * argv[]) {
        @autoreleasepool {
            // 定义一个 block，它使用了全局变量
            void (^printGlobalCount)(void) = ^{
                NSLog(@"globalCount = %d", globalCount);
            };
            // 初始输出
            printGlobalCount();  // 输出 globalCount = 0
            // 修改全局变量
            globalCount = 100;
            // 再次输出
            printGlobalCount();  // 输出 globalCount = 100
        };return 0;
    }
    ```

* ❤️**Block 的存储与逃逸**

  * Block 是 Objective-C 对象，但 Block 表达式最初位于全局区、栈还是随后被复制到堆，取决于捕获情况、ARC/MRC、优化和它是否逃逸当前作用域，不能统一写成“Block 都在堆上”。
  * 普通自动局部变量在 Block 表达式处按值捕获；`__block` 变量使用共享存储，外部作用域和所有相关 Block 观察到同一份可变状态。
  * 在 ARC 下，把捕获局部状态的 Block 保存到 `copy` 属性、强引用变量或由系统异步 API 持有时，编译器 / Runtime 会按需把它复制到堆。不要依赖私有类名或地址高低判断 Block 类型。

  * **Block 的三种形式（存储位置）** <a href="#内存分布" style="font-size:17px; color:green;"><b>⏫</b></a>

    | 常见 Runtime 形态 | 典型来源                   | 生命周期要点                                      |
    | ---------------- | -------------------------- | ------------------------------------------------- |
    | Global Block     | 不捕获自动局部状态         | 静态存储期；`copy` 通常仍返回同一对象             |
    | Stack Block      | 捕获自动局部状态的临时值   | 不能在定义作用域结束后继续以未拥有引用使用        |
    | Heap Block       | 栈 Block 被复制或自动逃逸  | 由 ARC / 所有者管理生命周期                       |

    > ✅ 建议：Block 属性使用 `copy`，明确表达“保存一份可逃逸 Block”的语义，并兼容手动引用计数代码。ARC 下 `strong` 通常也能正确持有 Block，但 `assign` 绝对不能用于拥有 Block。

* <font color="red">在 Block 内弱引用 `self`</font>

  * `__weak typeof(self) weakSelf = self;` 不增加 `self` 的强引用计数；对象释放后，弱引用会自动清零。
  * 进入异步回调后，如果一次任务执行期间需要保证对象存活，可先把 `weakSelf` 提升为局部强引用，再判空。弱引用变量究竟位于哪个物理地址不是业务代码应依赖的语义。

* <font color=red>**不可以和属性合用**</font>：因为它与**Objective-C**的内存管理和属性访问语义不兼容

  > 错误的写法（此时，应该去掉 __block）
  >
  > ```objective-c
  > @property (nonatomic,copy,nullable) __block void (^completion)(NSString *result);
  > ```
  >
  > * `__block` 关键字**只允许**修饰**局部变量**，它的作用是“允许在 block 内修改该局部变量的绑定”。
  > * `__block` 不能修饰 `@property` 声明；这不是可移植或有效的属性写法。
  > * 属性的修饰符（`copy`/`strong`/`weak`）负责对象引用计数；`__block` 是捕获规则，和属性机制不搭界。放在属性上没有意义。

  * 真正需要 `__block` 的场景：只有在**方法或函数内部**，想要在 block 内部改变一个外部局部变量时，才写 `__block`

    ```objective-c
    - (void)doSomething {
        __block BOOL finished = NO;
        self.completion = ^(NSString *r) {
            finished = YES;   // 可以改，因为用了 __block
        };
    }
    ```

    ```objective-c
    /// 在 block 内避免循环引用：
    __weak typeof(self) weakSelf = self;
    self.completion = ^(NSString *r) {
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) return;
        self.status = r;   // 正常走 setter
    };
    ```

* <font color=red>**Block 属性推荐使用 `copy`，不能使用 `assign` 持有**</font>

  * 举例：`MJRefreshConfigModel` 是通过分类挂载的，`loadBlock`是它的一个属性。当在其他地方取值的时候，如果是**assign**修饰，会崩溃

    ```objective-c
    @property(nonatomic,copy)JobsReturnIDByIDBlock loadBlock;
    ```

  * 原因：Block 可能捕获自动局部状态并逃逸出当前作用域，属性需要对它建立所有权；`assign` 既不复制也不持有，会留下悬垂引用。

    * **内存管理：** 使用 `copy` 修饰符表达“属性拥有一份可逃逸的 Block”。如果传入的是栈 Block，setter 会复制到堆；如果已经是堆 Block 或全局 Block，则按该对象的复制语义处理。

    * **生命周期管理：** 通过使用 `copy` 修饰符，可以保证 block 在被设置到属性时会被正确地复制，并且 block 的生命周期会由属性拥有。这有助于避免在 block 离开作用域后访问悬垂指针的问题。

    * ```objective-c
      /// 不捕获自动局部状态，通常会形成全局 Block。
      void (^globalBlock)(void) = ^{
          NSLog(@"我是全局 Block");
      };

      /// 捕获自动局部变量后，表达式可能先形成栈 Block；
      /// 保存到 copy 属性或交给逃逸 API 时会按需复制。
      int a = 10;
      void (^capturingBlock)(void) = ^{
          NSLog(@"a = %d", a);
      };
      ```

* `NSString *` 对象属性不应使用 `assign`。`assign` 不拥有对象，对象释放后会留下悬垂指针；字符串属性通常使用 `copy`，同时获得生命周期所有权与可变字符串隔离。

  * `copy` 本身不让多步业务访问自动线程安全；共享状态仍需单独同步。
  * 如果传入 `NSMutableString`，`copy` 会保存不可变快照，外部后续修改不会影响属性值。

      ```objective-c
      @interface MyClass : NSObject

      @property (nonatomic, copy) NSString *name;  // 推荐使用copy修饰符

      @end

      @implementation MyClass

      - (instancetype)init {
          self = [super init];
          if (self) {
              NSString *mutableName = [NSMutableString stringWithString:@"Hello"];
              self.name = mutableName;  // 使用copy修饰符后，name会保存一个不可变的NSString副本
          };return self;
      }

      @end
      ```

## 十一、固态硬盘可以替代内存进行工作吗？（不能完全替代） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* 结论
  * RAM 与 SSD 不是同一种闪存：主内存通常使用易失性的 DRAM，SSD 通常使用非易失性的 NAND Flash。
  * <font color=red>**SSD 不能替代 RAM 直接承担 CPU 的主存角色，但操作系统可以把 SSD 作为交换空间或虚拟内存的后备存储。**</font>
* 访问速度
  * **RAM（随机存取内存）**：内存是非常快的存储介质，提供<u>纳秒级</u>的访问时间，是CPU进行高速数据访问和处理的主要存储器。
  * **SSD（固态硬盘）**：固态硬盘虽然比传统机械硬盘（HDD）快得多，但其访问时间仍然在<u>微秒级</u>，比RAM慢很多。
* **介质和结构**：
  * **RAM（随机存取内存）**：使用的是 **DRAM（动态随机存取内存）**，<u>这种内存需要不断刷新以保持数据</u>。DRAM 的工作原理与 SSD 使用的 NAND 闪存不同，**主要是因为它存储的数据是通过电容存储的，而不是通过电子的存储单元**。
  * **SSD（固态硬盘）**： 使用的是 **NAND 闪存**，它是基于存储单元通过电子来保持数据，<u>并且在设备关闭时仍能保持数据</u>。NAND 闪存的特点是**块级存储**，它的数据写入是以块为单位的，这使得 SSD 适合大容量的长期存储，但读写速度比 RAM 慢。
* 其他
  * 由于SSD的速度比RAM慢得多，**使用虚拟内存会导致系统性能下降**
  * **SSD有写入寿命限制**，频繁使用虚拟内存可能会加速SSD的磨损

## 十二、常见锁 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* 互斥锁（Mutex, Mutual Exclusion Lock）：
  * 互斥锁是一种基本的锁，用于确保一次只有一个线程可以访问某资源。
  * 如果一个线程获得了锁，其他线程必须等待锁被释放。

* 读写锁（Read-Write Lock）：
  * 读写锁允许多个线程同时读取，但写操作是排他的，即在写操作进行时，其他读线程或写线程都要等待。

* 递归锁（Recursive Lock）：
  * 允许同一线程多次加锁，而不会导致死锁。
  * 递归锁对某些场景很有用，比如在递归函数中使用锁。

* 自旋锁（Spin Lock）：
  * 自旋锁是轻量级锁，如果锁被占用，线程不会立即挂起，而是会不断尝试获取锁。
  * 自旋等待会持续占用 CPU，并可能受到抢占与优先级反转影响；只有在底层、临界区极短且能证明收益的场景才可能合适。业务代码通常优先使用系统提供的互斥、`os_unfair_lock`、串行队列或更高层同步原语。

## 十三、Objective-C 中的有序去重集合 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* 在Objective-C中，没有直接类似于Java中*LinkedHashSet*的数据结构；
* 但是，你可以使用*NSOrderedSet*，它是一个有序不可变集合，保留了元素的插入顺序；
* 如果你需要可变版本，可以使用*NSMutableOrderedSet*。这不同于*LinkedHashSet*，但提供了一种有序且不包含重复元素的选择；

## 十四、属性、访问器与动态实现 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* `@dynamic` 告诉编译器不要自动合成访问器，访问器会由运行时或其它机制提供；Core Data 的动态属性是典型场景。它不是“属性没有 getter / setter”，而是 getter / setter 的实现不由当前编译单元静态生成。
* Category 可以声明属性，但不会自动合成实例变量和访问器。使用关联对象保存值时，仍必须显式实现 getter / setter，或由其它动态机制提供实现。

## 十五、Objective-C 的 `copy` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* Foundation 可变容器执行 `copy` 时通常得到不可变容器；执行 `mutableCopy` 才得到新的可变容器。自定义类型的结果仍以其 `NSCopying` / `NSMutableCopying` 实现为准。

* 暴露的属性是 `NSString`、`NSArray`、`NSDictionary` 这些不可变类型；

* 在OC里面`NSString`用`copy`修饰 还是`Strong`修饰？

  * 在Objective-C中，对于`NSString`这样的不可变对象，通常建议使用 `copy` 修饰符而不是 `strong`。

    * 这是因为`NSString`是不可变的，一旦创建就不会被修改；

    * 使用 `copy` 修饰符会执行对象的复制语义；不可变字符串可能安全地返回自身，可变字符串则会生成不可变快照；

  当使用 `strong` 修饰符时，如果将一个`NSMutableString`赋值给一个`NSString`类型的属性，那么它***实际上仍然可以被修改***，这可能会导致意外的行为。因此，为了确保不可变性，通常建议使用 `copy` 修饰符来保护`NSString`对象。

* 想防止别人传入的是 `NSMutableString`、`NSMutableArray`、`NSMutableDictionary`，避免你的对象被外部篡改。

  ```objective-c
  @property (nonatomic, copy) NSString *name; // 防止别人传 NSMutableString
  @property (nonatomic, copy) NSMutableArray *list; // ❌ 不要这么写，会变 NSArray！
  ```

* 可变数组作为关联值时，应使用 `OBJC_ASSOCIATION_RETAIN_NONATOMIC` 保持可变对象身份。使用 `OBJC_ASSOCIATION_COPY_NONATOMIC` 会按 Foundation 复制语义得到不可变 `NSArray`，后续可变操作会失败。

  ```objective-c
  - (NSMutableArray *)btns {
      NSMutableArray *Btns = objc_getAssociatedObject(self, _cmd);
      if (!Btns) {
          Btns = NSMutableArray.array;
          self.selectedIndex = 0;
          objc_setAssociatedObject(self,
                                   @selector(btns),
                                   Btns,
                                   OBJC_ASSOCIATION_RETAIN_NONATOMIC);
      };return Btns;
  }
  ```

## 十六、Objective-C 关联对象（Associated Objects） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* 关联对象是 Objective-C Runtime 能力。纯 Swift 类型没有对应的原生关联对象机制；继承自 `NSObject` 并参与 Objective-C Runtime 的 Swift 对象，可以在满足互操作边界时调用这些 C API。

* 关联对象可以给现有对象附加额外状态，但 Category 声明的属性仍需显式实现访问器；

* 依赖于 Objective-C 运行时机制；

* 可以动态地将一个对象与一个 key 关联起来，然后在运行时根据这个 key 获取或设置关联值。key 的身份按指针值比较，通常使用静态变量地址、静态常量地址或 getter 的 `_cmd`，避免与其它关联项碰撞；

* 基本数据类型，需要包装成**NSNumber**进行存储

* 关联对象***不会影响类的继承体系***，也***不会改变类的实例变量***，而是将额外的数据***存储在一个全局的关联表***中；
  * 导入 `<objc/runtime.h>` 头文件；
  * 创建一个 key，作为关联对象的唯一标识符。这个 key 是一个静态变量，通常是一个唯一的地址，你可以使用 `static` 关键字来定义；
  * 使用 `objc_setAssociatedObject` 函数将对象与 key 关联起来，并设置关联的策略（如 `OBJC_ASSOCIATION_RETAIN` 或 `OBJC_ASSOCIATION_ASSIGN`）以及要关联的对象；
  * 使用 `objc_getAssociatedObject` 函数根据 key 获取关联的对象；
  * 清理单个关联值时，优先对同一个 key 传入 `nil`。`objc_removeAssociatedObjects` 会移除该对象的**全部**关联值，公共库或 Category 不应随意调用，以免清掉其它模块的数据；
  * `OBJC_ASSOCIATION_RETAIN_NONATOMIC` / `COPY_NONATOMIC` 中的 `NONATOMIC` 不提供跨多步业务操作的同步保证。

* ***对Block*** <font color="red">存取策略：`OBJC_ASSOCIATION_COPY_NONATOMIC`</font>

  ```objective-c
  #import <Foundation/Foundation.h>
  #import <objc/runtime.h>

  @interface NSNotificationCenter (JobsBlock)
  @property(nonatomic,copy)void (^jobsNotificationBlock)(NSNotification *notification);
  @end

@implementation NSNotificationCenter (JobsBlock)

static void *JobsNotificationBlockKey = &JobsNotificationBlockKey;

-(void (^)(NSNotification *))jobsNotificationBlock {
    return objc_getAssociatedObject(self, JobsNotificationBlockKey);
}

-(void)setJobsNotificationBlock:(void (^)(NSNotification *))jobsNotificationBlock {
    objc_setAssociatedObject(self,
                             JobsNotificationBlockKey,
                             jobsNotificationBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

  @end
  ```

* ***对 Selector***：关联对象的 value 参数必须是 Objective-C 对象，因此可用 `NSStringFromSelector` 转成字符串保存，读取时再用 `NSSelectorFromString` 还原。<font color="red">存取策略：`OBJC_ASSOCIATION_COPY_NONATOMIC`</font>

  ```objective-c
  #import <Foundation/Foundation.h>
  #import <objc/runtime.h>

  @interface UIViewController (BaseVC)
  @property(nonatomic,assign)SEL selector;
  @end

  @implementation UIViewController (BaseVC)

  static void *UIViewController_BaseVC_selector = &UIViewController_BaseVC_selector;

  - (SEL)selector {
      NSString *selectorName = objc_getAssociatedObject(self, UIViewController_BaseVC_selector);
      return selectorName.length > 0 ? NSSelectorFromString(selectorName) : NULL;
  }

  - (void)setSelector:(SEL)selector {
      NSString *selectorName = selector ? NSStringFromSelector(selector) : nil;
      objc_setAssociatedObject(self,
                               UIViewController_BaseVC_selector,
                               selectorName,
                               OBJC_ASSOCIATION_COPY_NONATOMIC);
  }

  @end
  ```

* ***对基本数据类型*** *需要封装成NSNumber对象进行存取* <font color="red">存取策略：`OBJC_ASSOCIATION_RETAIN_NONATOMIC`</font>

  ```objective-c
  #import <Foundation/Foundation.h>
  #import <objc/runtime.h>

  @interface UIViewController (BaseVC)
  @property(nonatomic,assign)BOOL setupNavigationBarHidden;
  @end

  @implementation UIViewController (BaseVC)

static char UIViewController_BaseVC_setupNavigationBarHiddenKey;
  @dynamic setupNavigationBarHidden;
  #pragma mark —— @property(nonatomic,assign)BOOL setupNavigationBarHidden;
  -(BOOL)setupNavigationBarHidden{
      BOOL SetupNavigationBarHidden = [objc_getAssociatedObject(self, &UIViewController_BaseVC_setupNavigationBarHiddenKey) boolValue];
      return SetupNavigationBarHidden;
  }

  -(void)setSetupNavigationBarHidden:(BOOL)setupNavigationBarHidden{
      objc_setAssociatedObject(self,
                                 &UIViewController_BaseVC_setupNavigationBarHiddenKey,
                               [NSNumber numberWithBool:setupNavigationBarHidden],
                               OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }

  @end
  ```

* ***对结构体属性*** *需要`NSValue`来进行包装* <font color="red">存取策略：`OBJC_ASSOCIATION_RETAIN_NONATOMIC`</font>

  ```objective-c
  #import <Foundation/Foundation.h>
  #import <objc/runtime.h>

  @interface UIViewController (BaseVC)
  @property(nonatomic,assign)CGRect rect;
  @property(nonatomic,assign)CGPoint point;
  @end

  @implementation UIViewController (BaseVC)

static char UIViewController_BaseVC_rectKey;
static char UIViewController_BaseVC_pointKey;

  - (CGRect)rect {
      NSValue *value = objc_getAssociatedObject(self, &UIViewController_BaseVC_rectKey);
      return [value CGRectValue];
  }

  - (void)setRect:(CGRect)rect {
      NSValue *value = [NSValue valueWithCGRect:rect];
      objc_setAssociatedObject(self, &UIViewController_BaseVC_rectKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }

  - (CGPoint)point {
      NSValue *value = objc_getAssociatedObject(self, &UIViewController_BaseVC_pointKey);
      return [value CGPointValue];
  }

  - (void)setPoint:(CGPoint)point {
      NSValue *value = [NSValue valueWithCGPoint:point];
      objc_setAssociatedObject(self, &UIViewController_BaseVC_pointKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }

  @end
  ```

* ***对一般的对象*** <font color="red">存取策略：`OBJC_ASSOCIATION_RETAIN_NONATOMIC`</font>

  ```objective-c
  #import <Foundation/Foundation.h>
  #import <objc/runtime.h>

  @interface UIViewController (BaseVC)
  @property(nonatomic,strong)UIBarButtonItem *backBtnCategoryItem;
  @end

  @implementation UIViewController (BaseVC)

static char BaseVC_BackBtn_backBtnCategoryItemKey;
  @dynamic backBtnCategoryItem;
  #pragma mark —— @property(nonatomic,strong)UIBarButtonItem *backBtnCategoryItem;
  -(UIBarButtonItem *)backBtnCategoryItem{
      UIBarButtonItem *BackBtnCategoryItem = objc_getAssociatedObject(self, &BaseVC_BackBtn_backBtnCategoryItemKey);
      if (!BackBtnCategoryItem) {
          BackBtnCategoryItem = [UIBarButtonItem.alloc initWithCustomView:self.backBtnCategory];
          [self setBackBtnCategoryItem:BackBtnCategoryItem];
      };return BackBtnCategoryItem;
  }

  -(void)setBackBtnCategoryItem:(UIBarButtonItem *)backBtnCategoryItem{
      objc_setAssociatedObject(self,
                                 &BaseVC_BackBtn_backBtnCategoryItemKey,
                               backBtnCategoryItem,
                               OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }

  @end
  ```

## 十七、`UIViewController` 视图生命周期 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 这不是固定“11 步、只执行一次”的线性流程。初始化路径取决于代码、Storyboard / Nib 和状态恢复；约束与布局回调可以在一次展示期间重复多次。

* 创建与加载：

  - `initWithNibName:bundle:`：常见的代码 / Nib 初始化入口。
  - `initWithCoder:`：通过 Storyboard、Nib 或归档解码创建时调用。
  - `awakeFromNib`：对象图从 Nib / Storyboard 解码完成后收到，不适用于所有代码创建路径。
  - `loadView`：控制器首次需要 `view` 且尚未加载时创建根视图；自定义实现时不能再访问 `self.view` 造成递归。
  - `viewDidLoad`：根视图加载完成后调用，适合一次性视图配置；视图被卸载后重新加载时仍可能再次调用。

* 展示与消失的典型顺序：

  - `viewWillAppear:` → `viewIsAppearing:` → `viewDidAppear:`
  - `viewWillDisappear:` → `viewDidDisappear:`

* 约束与布局：

  - `updateViewConstraints`、`viewWillLayoutSubviews`、`viewDidLayoutSubviews` 属于布局更新周期，可能因尺寸、约束、内容或安全区变化反复调用。
  - 不应假设它们只夹在某一次 `viewWillAppear:` 与 `viewDidAppear:` 之间，也不要在重复回调中不断叠加同一组约束。

## 十八、序列化 VS 反序列化 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* 序列化：将对象（如数组、字典、模型等）**转换为字节流（如 JSON、二进制、XML）**，用于持久化（保存到文件、磁盘）或传输（如网络）。
* 反序列化：将字节流（JSON、XML、二进制等）**还原成原始对象（如数组、字典、模型）**。

## 十九、Objective-C 泛型与 KVC / KVO <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 1、KVO 和 KVC 在实际开发中经常一起结合使用，以实现对对象属性的动态访问和监听；
> 2、这两个特性能够使得代码更加灵活，同时也方便了数据模型和视图之间的通信；
> 3、在实际应用中，需要注意使用 KVO 和 KVC 时的内存管理和性能问题，以确保应用的稳定性和性能优化；

### 19.1、`__covariant` 与 `__contravariant`

> * 在 Objective-C 中，`__covariant` 和 `__contravariant` 是用于 **泛型类型参数协变性（covariance）与逆变性（contravariance）** 的关键字。它们出现在泛型类的声明中，目的是为编译器提供**类型安全的协变/逆变检查**，尤其是在泛型和容器类型传递之间转换时更有用。
> * 不使用时默认是**不变（invariant）**：默认情况下，泛型是**不变的**：`MyArray<NSString *>` 和 `MyArray<NSObject *>` 之间互相赋值会编译报错。
> * 一般写代码用不到，除非封装框架

| 关键字            | 中文含义 | 作用                            | 示例含义                                                   |
| ----------------- | -------- | ------------------------------- | ---------------------------------------------------------- |
| `__covariant`     | 协变     | 允许**子类向上转型**（子 ➜ 父） | `NSArray<NSString *>` 可以赋值给 `NSArray<NSObject *>`     |
| `__contravariant` | 逆变     | 允许**父类向下转型**（父 ➜ 子） | `MyHandler<NSObject *>` 可以赋值给 `MyHandler<NSString *>` |

* 协变（`__covariant`）—— 常用于只读容器，如 `NSArray`

  ```objective-c
  @interface MyArray<__covariant ObjectType> : NSObject
  @property (nonatomic, strong, readonly) ObjectType object;
  @end

  MyArray<NSString *> *strArray = [MyArray new];
  MyArray<NSObject *> *objArray = strArray; // ✅ 合法
  ```

  ```objective-c
  /// 允许 NSArray<NSString *> * 赋值给 NSArray<NSObject *> *
  @interface NSArray<__covariant ObjectType> : NSObject <NSCopying, NSMutableCopying, NSSecureCoding, NSFastEnumeration>

  @end
  ```

* 逆变（`__contravariant`）—— 常用于处理器/回调类，表示只写行为

  > * 苹果的 API 中 **几乎没有使用 `__contravariant`**
  >   * Apple 很少封装“只写”的泛型类，比如“只接收对象”的处理器或回调类型。
  >   * Apple 大多通过 `id`、`SEL`、`delegate`、`target-action` 模式实现动态分发，不依赖泛型逆变。
  >   * Apple 更注重稳定和兼容，不使用容易让开发者困惑的语言特性，尤其是在泛型不参与运行时的 Objective-C 中。

  ```objective-c
  @interface MyHandler<__contravariant ObjectType> : NSObject
  - (void)handle:(ObjectType)obj;
  @end

  MyHandler<NSObject *> *objHandler = [MyHandler new];
  MyHandler<NSString *> *strHandler = objHandler; // ✅ 合法
  ```

### 19.2、KVC（Key-Value Coding）：键值编码

* KVC 是通过字符串 key / key path **间接访问对象属性**的机制，不是“绕过 getter / setter 直接读写”：

  - `valueForKey:` 会先按 `get<Key>`、`<key>`、`is<Key>`、`_<key>` 等访问器模式查找。
  - `setValue:forKey:` 会先查找 `set<Key>:`、`_set<Key>:`。
  - 未找到访问器且 `+accessInstanceVariablesDirectly` 返回 `YES` 时，才按规定顺序查找实例变量；并非查找一个名为“属性 key”的独立运行时实体。
  - 最终仍未找到时，分别调用 `valueForUndefinedKey:` 或 `setValue:forUndefinedKey:`；默认实现抛出 `NSUndefinedKeyException`。

* key path 是由点分隔的一串 key，例如 `owner.address.street`。路径中的每一级对象都必须对对应 key 保持 KVC 合规。
* 标量和常见结构体可通过 KVC 访问，Foundation 会使用 `NSNumber` / `NSValue` 装箱或拆箱；给非对象标量设置 `nil` 时会进入 `setNilValueForKey:`。
* KVC 常用于 Cocoa Bindings、Core Data、KVO 和动态映射，但字符串 key 缺少普通属性访问的编译期检查，应集中管理并避免拼写错误。

### 19.3、KVO（Key-Value Observing）：属性观察

* KVO 是一种**观察者模式**的实现，它允许观察者监听另一个对象的 KVO 合规属性；
* KVO 不只由 `setValue:forKey:` 触发。使用合规 setter（包括点语法）或 KVC setter 时，`NSObject` 默认提供自动变更通知；也可以通过 `willChangeValueForKey:` / `didChangeValueForKey:` 手动发送通知；
* <font color=red>**不是所有的类都支持KVO**</font>
  * 传统 Objective-C KVO 由 `NSObject` 提供基础实现；自定义对象通常通过继承 `NSObject` 并保持属性 KVC / KVO 合规来使用；
  * 一个常见的反例是 Core Graphics（Quartz）框架中的许多类型，如 CGPoint、CGSize、CGRect 等。这些类型是 C 语言结构体，而不是 OC 对象，因此它们不继承自 NSObject，并且不支持 KVO；
  * KVO 支持 KVC 支持的对象、标量和常见结构体类型，变化字典中的非对象值会被装箱；
  * 自动 KVO 依赖合规访问器。直接写实例变量通常绕过自动通知，除非调用方显式发送手动通知；
  * Apple 框架对象的某个属性是否支持 KVO，应以该属性文档明确说明为准，不能仅凭它继承自 `NSObject` 推断；
* 当被监听对象的某个属性发生变化时，注册了观察者的对象会收到通知，从而可以采取相应的操作；
* KVO的使用步骤：
  * 先注册观察者
  * 实现相应的观察方法
  * 当被观察的属性值变化时，观察者对象的观察方法会被调用
* 对于自定义类，按 Cocoa 命名约定声明并合成的普通属性通常自动 KVO 合规；依赖属性还需注册 dependent keys。

### 19.4、[RAC](https://github.com/ReactiveCocoa/ReactiveObjC)

#### 19.4.1、🧊冷信号

* 特点：每个订阅都会独立触发一次 → “点播”

  - 每个订阅者都会触发一次“放电影”的动作（副作用）
  - 每个人看到的内容是完整的，但互相独立

* `createSignal:` 的订阅 Block 每次订阅都会重新执行，因此是典型冷信号。网络请求是否每次重建、是否共享结果，则取决于信号构造和 `publish` / `replay` 等操作符，不能仅凭“网络请求”四个字判断。

  ```objective-c
  RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> sub) {
      NSLog(@"🎬 播放一次电影");
      [sub sendNext:@"片段1"];
      [sub sendCompleted];
      return nil;
  }];

  [signal subscribeNext:...]; // 播放一次电影
  [signal subscribeNext:...]; // 再播放一次
  ```

#### 19.4.2、🔥 热信号

* 特点：所有订阅共享一个事件源 → “直播”。

  - 数据源本身一直在发生，不会因为“你订阅了”才重新开始
  - 多个订阅者共享同一个事件源

* `RACSubject`、`RACReplaySubject` 或经 `publish` / `multicast` 连接后的共享事件源是典型热信号。
* `rac_textSignal`、KVO、通知和按钮事件都包装了外部事件源，但每次订阅是否建立独立观察、是否共享副作用，取决于具体实现和操作符组合，不应一概标成热信号。

  ```objective-c
  [[self.textField rac_textSignal] subscribeNext:^(NSString *t) {
      NSLog(@"观众A 收到: %@", t);
  }];

  [[self.textField rac_textSignal] subscribeNext:^(NSString *t) {
      NSLog(@"观众B 收到: %@", t);
  }];
  // A 和 B 收到的事件完全相同，来自同一个输入框
  ```

### 19.5、KVO相应的观察方法

> **`observeValueForKeyPath:ofObject:change:context:`**

- 使用传统 `addObserver:forKeyPath:options:context:` 注册观察时，观察者通过该方法接收变更；使用基于 Block 的观察 API 时不需要实现它；
- 当被观察对象的属性值发生变化时，系统会调用这个方法，并传递一些参数，包括被观察的属性的键路径、被观察的对象、属性的改变信息以及上下文信息；
- 观察者对象在实现这个方法时，可以根据传递的信息执行相应的操作，比如更新 UI、处理数据等；
- 观察者对象应该在不需要监听属性变化时取消观察，以防止悬挂指针或野指针的问题；
  * 在观察者对象的 `dealloc` 方法中，需要调用 `removeObserver:forKeyPath:` 或 `removeObserver:forKeyPath:context:` 方法来移除观察者
```objective-c
#import <Foundation/Foundation.h>

@interface MyObject : NSObject
@property (nonatomic, copy) NSString *name;
@end

@implementation MyObject
@end

@interface Observer : NSObject
@property (nonatomic, strong) MyObject *obj;
@end

@implementation Observer

- (instancetype)init {
    if (self = [super init]) {
        self.obj = [MyObject new];
        // 添加观察者
        [self.obj addObserver:self
                   forKeyPath:@"name"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];

        // 触发观察
        self.obj.name = @"New Name";
    };return self;
}
// KVO 回调方法
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"🔍 属性 name 发生变化: %@ → %@",
              change[NSKeyValueChangeOldKey],
              change[NSKeyValueChangeNewKey]);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
// 记得移除观察者（dealloc 中）
- (void)dealloc {
    [self.obj removeObserver:self forKeyPath:@"name"];
    NSLog(@"✅ 已移除观察者");
}

@end
// 测试主函数
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Observer *observer = [[Observer alloc] init];
        // 稍作停留，确保观察触发
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    };return 0;
}
```

### 19.6、KVC 与 KVO 的协作关系

#### 19.6.1、使用 KVC 会触发 KVO 吗？

* **可能触发，取决于该 key 是否启用自动通知。** `setValue:forKey:` 对 KVO 合规属性赋值时，默认会发出自动 KVO 通知；普通 setter / 点语法也同样可以触发。
* 直接写实例变量通常不会触发自动 KVO；关闭 `+automaticallyNotifiesObserversForKey:` 后，也必须由实现方手动配对调用 `willChangeValueForKey:` / `didChangeValueForKey:`。
* 读取操作 `valueForKey:` 本身不会产生“值已变化”的通知。

#### 19.6.2、使用 KVO 必须主动调用 KVC 吗？

* **不需要。** KVO 要求被观察属性保持 KVC 合规，并使用 key path 标识属性，但调用方可以通过普通 setter 改值，观察者也可以直接使用回调 `change` 字典中的新旧值。
* KVC 是间接访问机制，KVO 是变更通知机制；二者共享 key / key path 约定并能协作，但不是“使用一个就必须显式调用另一个”。

  ```objective-c
  [object addObserver:self
           forKeyPath:@"propertyName"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:PropertyNameContext];

  object.propertyName = @"Jobs"; // 合规 setter 默认触发 KVO，无需调用 setValue:forKey:
  ```

## 二十、MVP <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* MVP（**M**odel-**V**iew-**P**resenter）模式是一种软件架构模式，用于设计和组织用户界面（UI）代码；
* 它是**基于MVC**（**M**odel-**V**iew-**C**ontroller）模式的变种，***旨在解决 MVC 模式中 Controller 过于臃肿和难以测试的问题***；
* 在 MVP 模式中，UI 层被分为三个主要组件：
  * **Model（模型）**：Model 表示应用程序的数据和业务逻辑。它独立于 UI 和 Presenter，并**负责处理数据的获取、存储和处理**；
  * **View（视图）**：View 是用户界面的可视化部分，负责呈现数据给用户并接收用户的输入操作。View 应该尽量减少业务逻辑，并且**只负责 UI 的展示**；
  * **Presenter（呈现者）**：Presenter 充当了*** View 和 Model 之间的中介***，负责协调用户界面和数据之间的交互。它接收来自 View 的用户输入，并根据需要更新 Model。同时，它也监听 Model 的变化，并相应地更新 View。**Presenter 通常包含了大部分业务逻辑**；
* MVP 模式的主要思想是***将 UI 逻辑从 View 中抽离出来，并将其交给 Presenter 处理***；
  * 这样可以使得 UI 更加简洁；
  * 可测试性更强；
  * 同时也降低了代码的耦合度，使得代码更易于维护和扩展；
* MVP 缺点：
  * **视图和 Presenter 之间的绑定**：视图和 Presenter 之间的交互通常需要通过接口或回调来实现，这会增加一些额外的代码和复杂性；
  * **繁琐**：相比于 MVVM，MVP 中需要手动进行数据绑定，因此可能会显得更加繁琐；
```
UserModel.h/.m         // 模型（Model）
UserView.h/.m          // 视图（View）
UserPresenter.h/.m     // 主持人（Presenter）
ViewController.m       // 控制器，组合 View 和 Presenter
```

**Model（模型层）**

```objective-c
// UserModel.h
@interface UserModel : NSObject
@property (nonatomic, copy) NSString *name;
@end

// UserModel.m
@implementation UserModel
@end
```

**View（视图层）**

```objective-c
// UserView.h
@class UserView;
@protocol UserViewDelegate <NSObject>
- (void)userViewDidTapChangeName:(UserView *)view;
@end

@interface UserView : UIView
@property (nonatomic, weak) id<UserViewDelegate> delegate;
- (void)updateWithUserName:(NSString *)name;
@end

// UserView.m
@interface UserView ()
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *changeButton;
@end

@implementation UserView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
        [self addSubview:_nameLabel];

        _changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _changeButton.frame = CGRectMake(20, 150, 100, 40);
        [_changeButton setTitle:@"改名" forState:UIControlStateNormal];
        [_changeButton addTarget:self action:@selector(changeNameTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_changeButton];
    };return self;
}

- (void)updateWithUserName:(NSString *)name {
    self.nameLabel.text = [NSString stringWithFormat:@"用户名：%@", name];
}

- (void)changeNameTapped {
    if ([self.delegate respondsToSelector:@selector(userViewDidTapChangeName:)]) {
        [self.delegate userViewDidTapChangeName:self];
    }
}

@end
```

**Presenter（业务逻辑层）**

```objective-c
// UserPresenter.h
#import "UserView.h"
#import "UserModel.h"

@interface UserPresenter : NSObject <UserViewDelegate>
@property (nonatomic, strong) UserModel *model;
@property (nonatomic, weak) UserView *view;
- (instancetype)initWithView:(UserView *)view;
- (void)loadUser;
@end

// UserPresenter.m
@implementation UserPresenter

- (instancetype)initWithView:(UserView *)view {
    if (self = [super init]) {
        self.view = view;
        self.view.delegate = self;
        self.model = [UserModel new];
    };return self;
}

- (void)loadUser {
    self.model.name = @"Tom";
    [self.view updateWithUserName:self.model.name];
}

- (void)userViewDidTapChangeName:(UserView *)view {
    self.model.name = @"Jerry";
    [self.view updateWithUserName:self.model.name];
}

@end
```

**组合：ViewController**

```objective-c
// ViewController.m
#import "UserPresenter.h"
#import "UserView.h"

@interface ViewController ()
@property (nonatomic, strong) UserView *userView;
@property (nonatomic, strong) UserPresenter *presenter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.userView = [[UserView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.userView];

    self.presenter = [[UserPresenter alloc] initWithView:self.userView];
    [self.presenter loadUser];
}

@end
```

## 二十一、雪花算法 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* 雪花算法（Snowflake）是一种分布式唯一ID生成算法；
* 最初**由Twitter开发**用于**生成全局唯一的ID**；
* 它的设计目标是在分布式系统中生成趋势递增且具有唯一性的ID，以便于在分布式环境下准确地排序和定位数据；
* 雪花算法的核心思想是***将64位的ID按照一定规则进行拆分，使得每一部分都可以确保唯一性和递增性，从而保证生成的ID在分布式环境中不会发生冲突，并且能够按照时间顺序进行排序***；
* 雪花算法（Snowflake）的 ID 通常包含以下几个部分：
  * **符号位 / 保留位**：经典 64 位有符号整数实现通常保留最高位为 `0`；
  * **时间戳（Timestamp）**：经典实现使用相对自定义纪元的毫秒时间戳；
  * **机器ID**：用来标识不同的机器，确保不同机器生成的ID不会发生冲突。在一些实现中，这个部分通常包括了数据中心ID和机器ID；
  * **序列号（Sequence Number）**：用来解决同一毫秒内生成多个ID时的冲突问题。序列号占用了一定的位数，可以确保在同一毫秒内生成的ID在机器ID相同的情况下是唯一的；
* 经典 Twitter 方案常见分配是 `1 + 41 + 10 + 12` 位，因此 10 位节点字段最多表示 1024 个节点、12 位序列号每毫秒最多表示 4096 个序号。Snowflake 是一类方案，不同实现可以重新分配位宽，不能把 1024 写成所有实现的固定上限；
* 工程实现必须处理机器 ID 分配冲突、时钟回拨、同毫秒序列耗尽和纪元溢出，否则仍可能重复或阻塞；

## 二十二、IPv6 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* IPv6地址空间更大，为128位，这使得有更多的地址组合。
* IPv6中的端口号仍然是16位，因此有2^16（65536）个可能的端口号。
* IPv6 同样存在不同作用域和保留范围，例如链路本地地址 `fe80::/10`、唯一本地地址 `fc00::/7`、组播地址和文档示例地址；“地址空间大”不等于所有地址都可全球路由，也不等于每台设备必然拥有稳定的全球唯一地址。
* 理论上的 128 位地址空间乘以 16 位端口字段可以写成 2<sup>144</sup> 种比特组合，但其中包含保留地址、不可用端口及不同传输协议，不能当作实际可建立连接数量。

## 二十三、一个IP能有多少个端口（65,536） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* TCP / UDP 端口字段是 16 位，端口号范围是 `0...65535`，共有 **65,536 个编号**。端口 `0` 有保留 / 特殊语义，应用通常不把它当作普通监听端口；TCP 与 UDP 各自拥有独立端口空间。
  | 范围          | 个数  | 2 的次方表示   | 名称          |
  | ------------- | ----- | -------------- | ------------- |
  | 0 ~ 1023      | 1024  | 2¹⁰            | 系统 / 知名端口 |
  | 1024 ~ 49151  | 48128 | 2¹⁵ + 2¹⁴ - 2¹⁰ | 注册端口      |
  | 49152 ~ 65535 | 16384 | 2¹⁴            | 动态/私有端口 |
  | **总计**      | 65536 | 2¹⁶            | 全部端口空间  |
* 端口的使用是通过网络协议来管理的。典型的例子是TCP和UDP；

## 二十四、Objective-C 非正式协议 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 非正式协议是早期 Objective-C 的历史做法：通常在 `NSObject` Category 中集中声明一组可选方法，但没有 `@protocol` 带来的编译期类型检查和运行时协议对象。现代代码通常优先使用带 `@optional` 方法的正式协议。

**非正式协议的特点包括**👇🏻

* 没有明确的接口：与正式协议不同，非正式协议没有明确定义的接口或者协议声明。它仅仅是一组方法的约定。

* 通过 Category 声明方法集合：非正式协议通常只声明约定，不提供对应 Category 实现；真正采用约定的类自行实现这些方法。

* 提供功能性约定：非正式协议提供了一种方式，允许多个类共享相同的方法集合，以实现类似的功能，而无需继承自同一个基类或者实现同一个正式协议。

* 灵活性和简洁性：非正式协议具有很高的灵活性，可以根据需要随时添加新的方法。它们通常用于描述一组相关的行为，而不是完整的类接口。

* `UITableViewDelegate` 与 `UITableViewDataSource` 都是用 `@protocol` 声明的**正式协议**，不能作为非正式协议示例。

  ```objective-c
  /// 历史式非正式协议：只有 Category 方法声明，没有 @protocol 类型。
  @interface NSObject (JobsLegacyDataSource)

  - (NSInteger)jobs_numberOfItems;
  - (id)jobs_itemAtIndex:(NSInteger)index;

  @end
  ```

* 新代码优先改成正式协议，获得 `id<ProtocolName>` 类型约束、`conformsToProtocol:` 检查以及 `@required` / `@optional` 语义。

## 二十五、Objective-C 与 JavaScript 交互 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* `WKWebView` 消息体可以是可桥接的 JSON 值（字符串、数字、数组、字典等），不只限于字符串。跨边界数据应保持可序列化，并对来源、结构和长度做校验。

* **JavaScriptCore 框架:**允许在 *OC* 或 *Swift* 代码中执行 *JavaScript* 代码，**并且还可以在 *JavaScript* 和 *OC/Swift*之间进行对象的相互转换。**

  ```objective-c
  // 引入 JavaScriptCore 框架
  #import <JavaScriptCore/JavaScriptCore.h>
  // 创建一个 JavaScriptContext 对象
  JSContext *context = JSContext.new;
  // 定义 JavaScript 函数
  NSString *jsCode = @"function add(x, y) { return x + y; }";
  [context evaluateScript:jsCode];
  // 调用 JavaScript 函数
  JSValue *addFunction = context[@"add"];
  JSValue *result = [addFunction callWithArguments:@[@10, @20]];
  // 获取结果
  NSInteger sum = [result toInt32];
  NSLog(@"Sum: %ld", (long)sum); // 输出: Sum: 30
  ```

  ```objective-c
  // ViewController.m

  #import "ViewController.h"
  #import <WebKit/WebKit.h>

  @interface ViewController () <WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
  @property (nonatomic, strong) WKWebView *webView;
  @end

  @implementation ViewController

  - (void)viewDidLoad {
      [super viewDidLoad];
      // 创建 WKWebView
      WKWebViewConfiguration *configuration = WKWebViewConfiguration.new;

      self.webView = [WKWebView.alloc initWithFrame:self.view.bounds configuration:configuration];
      self.webView.navigationDelegate = self;
      self.webView.UIDelegate = self;
      [self.view addSubview:self.webView];

      NSString *htmlPath = [NSBundle.mainBundle pathForResource:@"index" ofType:@"html"];
      NSString *htmlString = [NSString stringWithContentsOfFile:htmlPath
                                                       encoding:NSUTF8StringEncoding
                                                          error:nil];
      [self.webView loadHTMLString:htmlString baseURL:nil];
  }

  - (void)viewWillAppear:(BOOL)animated {
      [super viewWillAppear:animated];
      [self.webView.configuration.userContentController
          removeScriptMessageHandlerForName:@"myHandler"];
      [self.webView.configuration.userContentController
          addScriptMessageHandler:self name:@"myHandler"];
  }

  - (void)viewWillDisappear:(BOOL)animated {
      [super viewWillDisappear:animated];
      // WKUserContentController 会强持有 message handler，离开页面前解除注册。
      [self.webView.configuration.userContentController
          removeScriptMessageHandlerForName:@"myHandler"];
  }

  - (void)webView:(WKWebView *)webView
  didFinishNavigation:(WKNavigation *)navigation {
      // 页面加载完成后再调用页面中已经定义的 JavaScript。
      [self.webView evaluateJavaScript:@"add(10, 20)"
                     completionHandler:^(id result, NSError *error) {
          NSLog(@"result = %@, error = %@", result, error);
      }];
  }

  - (void)dealloc {
      // 防御性清理；真正打破强引用环依赖上面的消失回调或弱代理。
      [self.webView.configuration.userContentController
          removeScriptMessageHandlerForName:@"myHandler"];
  }

  // JS 调用 OC
  - (void)userContentController:(WKUserContentController *)userContentController
        didReceiveScriptMessage:(WKScriptMessage *)message{
      id messageBody = message.body;
      NSLog(@"Received message from JavaScript: %@", messageBody);
  }

  @end
  ```

  ```html
  <!-- index.html -->

  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>JavaScript Objective-C Interactions</title>
  </head>
  <body>
      <h1>JavaScript Objective-C Interactions</h1>

      <button onclick="sendMessageToObjC()">Send Message to Objective-C</button>

      <script>
          function add(x, y) {
              return x + y;
          }

          function sendMessageToObjC() {
              var message = "Hello from JavaScript!";
              window.webkit.messageHandlers.myHandler.postMessage(message); // 向 Objective-C 发送消息
          }
      </script>
  </body>
  </html>
  ```

* 带导航栏的`WebView`控制器

  ```objective-c
  @interface JobsNavBarWebVC : JobsBaseWebVC
  <
  WKNavigationDelegate
  ,WKScriptMessageHandler
  >

  @end
  ```

  ```objective-c
  @implementation JobsNavBarWebVC

  - (void)viewDidLoad {
      [super viewDidLoad];
      self.view.backgroundColor = JobsWhiteColor;
      self.makeGKNavByConfig(self.makeNav0ByTitle(self.viewModel.textModel.text));
  }

  #pragma mark —— BaseViewProtocol
  /// makeNormaleWebView
  /// self.webView.loadRequest(self.urlString.URLRequest);
  +(JobsRetVCByWebViewBlock _Nonnull)initByWebView{
      @jobs_weakify(self)
      return ^__kindof UIViewController <BaseViewControllerProtocol>*_Nullable(__kindof WKWebView *_Nonnull webView){
          @jobs_strongify(self)
          UIViewController <BaseViewControllerProtocol>*vc = (UIViewController *)self.class.new;
          vc.webView = webView;
          vc.view.addSubview(webView)
              .byRemake(^(MASConstraintMaker *_Nonnull make){
                  make.top.equalTo(vc.gk_navigationBar.mas_bottom);
                  make.left.right.bottom.equalTo(vc.view);
          });
          webView.loadRequest(webView.url.URLRequest);/// 创建即加载
          return vc;
      };
  }
  #pragma mark —— WKScriptMessageHandler
  /// JS 回调 Objective-C 方法
  - (void)userContentController:(WKUserContentController *)userContentController
        didReceiveScriptMessage:(WKScriptMessage *)message {
      if(self.objBlock) self.objBlock(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
          data.byUserContentCtrl(userContentController)
              .byScriptMsg(message);
      }));
  }
  #pragma mark —— WKNavigationDelegate
  /// 决定是否允许一个导航行为（例如：用户点击链接、JS 跳转等）
  -(void)webView:(WKWebView *)webView
  decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
  decisionHandler:(WKNavigationDelegateBlock2 _Nonnull)decisionHandler{
      decisionHandler(WKNavigationActionPolicyAllow);
  }
  /// 同上，但支持根据网页偏好设置返回更详细的控制选项（iOS 14+）
  -(void)webView:(WKWebView *)webView
  decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
     preferences:(WKWebpagePreferences *)preferences
  decisionHandler:(WKNavigationDelegateBlock3 _Nonnull)decisionHandler{
      decisionHandler(WKNavigationActionPolicyAllow, preferences);
  }
  /// 决定是否允许一个响应（如页面返回的数据）继续导航
  -(void)webView:(WKWebView *)webView
  decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse
  decisionHandler:(WKNavigationDelegateBlock1 _Nonnull)decisionHandler{
      decisionHandler(WKNavigationResponsePolicyAllow);
  }
  /// 开始加载网页时调用（刚开始请求）
  -(void)webView:(WKWebView *)webView
  didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {

  }
  /// 收到服务器跳转请求时调用（如 302 重定向）
  -(void)webView:(WKWebView *)webView
  didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation {

  }
  /// 加载网页失败（如无法连接、找不到页面）
  -(void)webView:(WKWebView *)webView
  didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation
       withError:(NSError *)error {

  }
  /// Web 内容进程开始接收主文档内容；不等于 DOM 已经完成加载
  -(void)webView:(WKWebView *)webView
  didCommitNavigation:(null_unspecified WKNavigation *)navigation {

  }
  /// 网页加载完成
  -(void)webView:(WKWebView *)webView
  didFinishNavigation:(null_unspecified WKNavigation *)navigation {

  }
  /// 已提交的导航在后续加载阶段失败；普通 JavaScript 异常不会自动进入此回调
  -(void)webView:(WKWebView *)webView
  didFailNavigation:(null_unspecified WKNavigation *)navigation
       withError:(NSError *)error {

  }
  /// 处理身份验证（如 HTTPS 证书验证）
  -(void)webView:(WKWebView *)webView
  didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
  completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
      completionHandler(NSURLSessionAuthChallengePerformDefaultHandling, nil);
  }
  /// web 内容进程被系统终止（崩溃或内存压力）
  -(void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {

  }
  /// 是否允许继续使用过时的 TLS 协议（iOS 14+，安全性相关）
  -(void)webView:(WKWebView *)webView
  authenticationChallenge:(NSURLAuthenticationChallenge *)challenge
  shouldAllowDeprecatedTLS:(jobsByBOOLBlock _Nonnull)decisionHandler {
      decisionHandler(NO);
  }
  /// 某个导航行为变成了下载操作（例如：点击了文件链接）
  -(void)webView:(WKWebView *)webView
  navigationAction:(WKNavigationAction *)navigationAction
  didBecomeDownload:(WKDownload *)download {

  }
  /// 某个响应变成了下载（如服务器返回了文件类型）
  -(void)webView:(WKWebView *)webView
  navigationResponse:(WKNavigationResponse *)navigationResponse
  didBecomeDownload:(WKDownload *)download {

  }
  /// 是否跳转到某个历史记录项（支持即时返回）
  -(void)webView:(WKWebView *)webView
  shouldGoToBackForwardListItem:(WKBackForwardListItem *)backForwardListItem
  willUseInstantBack:(BOOL)willUseInstantBack
  completionHandler:(jobsByBOOLBlock _Nonnull)completionHandler {
      completionHandler(YES);
  }

  @end
  ```

* 平铺的`WebView`控制器

  ```objective-c
  @interface JobsBaseWebVC : BaseViewController
  <
  WKNavigationDelegate
  ,WKScriptMessageHandler
  >
  /// makeNormaleWebView
  /// self.webView.loadRequest(self.urlString.URLRequest);
  +(JobsRetVCByWebViewBlock _Nonnull)initByWebView;

  @end
  ```

  ```objective-c
  @implementation JobsBaseWebVC

  - (void)viewDidLoad {
      [super viewDidLoad];
      self.view.backgroundColor = JobsCor(@"#FF0000");
      self.makeNavByConfig(self.makeNav0ByTitle(self.viewModel.textModel.text));
  }
  #pragma mark —— 一些公共方法
  /// TODO
  #pragma mark —— BaseViewProtocol
  /// makeNormaleWebView
  /// self.webView.loadRequest(self.urlString.URLRequest);
  +(JobsRetVCByWebViewBlock _Nonnull)initByWebView{
      @jobs_weakify(self)
      return ^__kindof UIViewController <BaseViewControllerProtocol>*_Nullable(__kindof WKWebView *_Nonnull webView){
          @jobs_strongify(self)
          UIViewController <BaseViewControllerProtocol>*vc = (UIViewController *)self.class.new;
          @jobs_weakify(vc)
          vc.webView = webView;
          vc.view.addSubview(webView)
              .setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                  @jobs_strongify(vc)
                  make.edges.equalTo(vc.view);
          }).on();
          webView.loadRequest(webView.url.URLRequest);/// 创建即加载
          return vc;
      };
  }
  #pragma mark —— WKScriptMessageHandler
  /// JS 回调 Objective-C 方法
  - (void)userContentController:(WKUserContentController *)userContentController
        didReceiveScriptMessage:(WKScriptMessage *)message {
      if(self.objBlock) self.objBlock(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
          data.byUserContentCtrl(userContentController)
              .byScriptMsg(message);
      }));
  }
  #pragma mark —— WKNavigationDelegate
  /// 网页开始加载
  - (void)webView:(WKWebView *)webView
  didStartProvisionalNavigation:(WKNavigation *)navigation {
      [self.activityIndicatorView startAnimating];
  }
  /// 网页加载完成
  - (void)webView:(WKWebView *)webView
  didFinishNavigation:(WKNavigation *)navigation {
      @jobs_weakify(self)
      [UIView animateWithDuration:0.5 animations:^{
  //        @jobs_strongify(self)
      } completion:^(BOOL finished) {
          @jobs_strongify(self)
          [self.activityIndicatorView stopAnimating];
          [self.activityIndicatorView removeFromSuperview];
      }];
  }
  /// 加载网页失败（如无法连接、找不到页面）
  - (void)webView:(WKWebView *)webView
  didFailProvisionalNavigation:(WKNavigation *)navigation
        withError:(NSError *)error {
      NSLog(@"网页加载失败: %@", error.localizedDescription);
      [self.activityIndicatorView stopAnimating];
  }
  #pragma mark —— LazyLoad
  @synthesize activityIndicatorView = _activityIndicatorView;
  -(UIActivityIndicatorView *)activityIndicatorView{
      if(!_activityIndicatorView){
          _activityIndicatorView = self.view.addSubview(UIActivityIndicatorView.initBy(UIActivityIndicatorViewStyleLarge));
          _activityIndicatorView.center = self.view.center;
      };return _activityIndicatorView;
  }

  @end
  ```

## 二十六、Objective-C 依赖注入 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* <font color="red">**Objective-C 语言和 Cocoa 本身没有内置依赖注入容器，但可以通过构造器、属性或方法参数直接实现依赖注入；第三方容器只是可选的装配工具。**</font>

  > <span style="color:Blue; font-weight:bold;">**在这个示例中，`UserService` 类在构造函数中接受一个 `Logger` 对象作为参数，然后将其存储在实例变量中。这样，调用 `UserService` 的代码可以提供自己的 `Logger` 实例，从而实现了依赖注入。**</span>

  * ***Logger.h：***

    ```objective-c
    #import <Foundation/Foundation.h>

    @interface Logger : NSObject
    - (void)log:(NSString *)message;
    @end
    ```

  * ***Logger.m：***

    ```objective-c
    #import "Logger.h"

    @implementation Logger
    - (void)log:(NSString *)message {
        NSLog(@"%@", message);
    }
    @end
    ```

  * ***UserService.h：***

    ```objective-c
    #import <Foundation/Foundation.h>
    #import "Logger.h"

    @interface UserService : NSObject

    @property(nonatomic, strong) Logger *logger;
    - (instancetype)initWithLogger:(Logger *)logger;
    - (void)doSomething;

    @end
    ```

  * ***UserService.m：***

    ```objective-c
    #import "UserService.h"

    @implementation UserService
    - (instancetype)initWithLogger:(Logger *)logger {
        if (self = [super init]) {
            self.logger = logger;
        };return self;
    }

    - (void)doSomething {
        // 使用依赖注入的 Logger 对象记录日志
        [self.logger log:@"Something is done in UserService"];
    }

    @end
    ```

## 二十七、函数（方法）签名 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

“签名”在不同语言里的含义并不完全相同，不能统一理解成“名称 + 参数名 + 返回值”：

- **C 函数类型**：由返回类型与有序参数类型列表共同决定；函数名和形参变量名不属于函数类型；
- **Objective-C 方法**：运行时派发身份是 `SEL`，也就是完整 Selector（包含每一段名称和冒号）。返回类型、参数类型和形参变量名都不属于 Selector；
- **Swift 函数 / 方法**：重载解析会综合基名、实参标签以及按顺序排列的参数类型。返回类型在部分上下文中也能参与解析，但不应只靠返回类型制造难以阅读的重载。

```objective-c
- (void)updateUserWithName:(NSString *)name age:(NSInteger)age;
```

上例的 Selector 是 `updateUserWithName:age:`。把 `name`、`age` 这两个局部形参改名，不会改变 Selector；调整 Selector 片段、冒号数量或顺序，则会得到另一个方法。

## 二十八、函数重载与 Objective-C Selector <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 方法重载（Overloading）通常是指：在同一作用域中声明多个同名方法，由编译器根据有序参数列表等信息选择具体实现。

- **Swift 支持重载**：实参标签、参数数量和按顺序排列的参数类型都可能区分重载。若两个参数类型完全相同且都省略实参标签，只交换局部形参名并不能形成新重载；

  ```swift
  class MathFunctions {
      // 方法重载：参数为两个整数
      func add(_ a: Int, _ b: Int) -> Int {
          return a + b
      }

      // 方法重载：参数为三个整数
      func add(_ a: Int, _ b: Int, _ c: Int) -> Int {
          return a + b + c
      }

      // 方法重载：参数为两个浮点数
      func add(_ a: Double, _ b: Double) -> Double {
          return a + b
      }
  }

  let math = MathFunctions()

  // 调用不同的重载方法
  print("Sum of 2 and 3 is: \(math.add(2, 3))")
  print("Sum of 2, 3 and 4 is: \(math.add(2, 3, 4))")
  print("Sum of 2.5 and 3.5 is: \(math.add(2.5, 3.5))")
  ```
- **Objective-C 不支持按参数类型或返回类型重载同一个 Selector**：可以通过设计不同的 Selector 片段表达不同语义，例如 `insertObject:atIndex:` 与 `insertObjects:atIndexes:`；
- **Dart 没有传统的同名参数重载**：通常使用可选参数、命名参数或不同方法名表达不同调用方式；
- **Java 支持重载**：按参数数量和有序参数类型列表区分；形参名和返回类型不能单独区分重载。只有交换后类型顺序真的发生变化时，才会形成不同签名，例如 `(String, int)` 与 `(int, String)`。

  ```java
  public class OverloadExample {
      // 方法重载：参数为两个整数
      public int add(int a, int b) {
          return a + b;
      }

      // 方法重载：参数为三个整数
      public int add(int a, int b, int c) {
          return a + b + c;
      }

      // 方法重载：参数为两个浮点数
      public double add(double a, double b) {
          return a + b;
      }

      public static void main(String[] args) {
          OverloadExample example = new OverloadExample();

          // 调用不同的重载方法
          System.out.println("Sum of 2 and 3 is: " + example.add(2, 3));
          System.out.println("Sum of 2, 3 and 4 is: " + example.add(2, 3, 4));
          System.out.println("Sum of 2.5 and 3.5 is: " + example.add(2.5, 3.5));
      }
  }
  ```

## 二十九、Objective-C 定时器 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 29.1、GCD

* **优势：**
  * **简单易用：** GCD 提供了简单易用的 API，使得在应用程序中执行并发任务变得非常容易。你只需使用几行代码就可以实现任务的并行执行。
  * **性能优化：** GCD 使用底层系统资源来管理任务的执行，可以根据系统的资源状况来动态调整任务的执行顺序和优先级，从而优化应用程序的性能。
  * **多核支持：** GCD 可以利用多核处理器来并行执行任务，从而提高应用程序的性能和响应速度。
  * **自动管理：** GCD 可以自动管理线程的生命周期和资源，你不需要手动创建和管理线程，从而减少了代码的复杂性和出错的可能性。
  * **灵活性：** GCD 提供了多种不同类型的队列和调度方式，可以满足不同类型任务的需求，例如串行队列、并行队列、同步执行、异步执行等。
* **劣势：**
  * **学习曲线：** 对于初学者来说，GCD 的概念可能比较抽象，需要一定的学习成本才能掌握其使用方法和最佳实践。
  * **调试困难：** 由于 GCD 是基于异步执行的，并且任务的执行顺序和时间不确定，因此在调试时可能会遇到一些困难，特别是涉及到多个并发任务时。
  * **竞争条件：** 如果不正确地使用 GCD，可能会导致竞争条件和死锁等并发问题，因此在编写并发代码时需要特别小心。
  * **不适合所有场景：** 虽然 GCD 可以满足大多数应用程序的并发需求，但并不适用于所有类型的并发任务，特别是涉及到复杂的同步和通信问题时可能需要使用其他并发技术。

### 29.2、[**NSTimer**](https://developer.apple.com/documentation/foundation/nstimer)

- `NSTimer`（Swift 中桥接为 `Timer`）依赖 Run Loop，可以执行一次或持续重复；`repeats` 只决定是否重复，不直接提供“重复 N 次”，计数需求应在回调中自行维护；
- 定时器不是实时机制。Run Loop 被阻塞时触发会延后，不会为了补齐错过的每个周期而连续回放；
- 定时器可以被加入创建它的 Run Loop；涉及创建、添加、失效和共享状态时，仍要遵守线程与 Run Loop 约束，不能把它概括成“无需同步的线程安全对象”；
- target-selector 形式会持有 target。持有定时器的对象若又被定时器持有，需要在合适生命周期中 `invalidate`，或改用避免强引用环的设计；
- 高频逐帧动画优先考虑 `CADisplayLink`；对精确时序敏感的工作不应依赖 `NSTimer`。

### 29.3、CADisplayLink

`CADisplayLink` 是与显示刷新节奏协作的定时回调源，适合逐帧更新动画或渲染状态。

* **优势：**
  * **同屏幕刷新协作：** 回调跟随显示系统的刷新节奏，适合按帧推进状态；
  * **时间信息完整：** 可通过时间戳、目标时间戳和首选帧率计算动画进度；
  * **简单易用：** CADisplayLink 的使用非常简单，只需创建一个实例并指定一个目标方法，然后将其添加到主运行循环中即可。

* **劣势：**
  * **主线程阻塞：** 使用 CADisplayLink 进行动画更新时，相关的方法会在主线程中执行，如果动画逻辑复杂或者处理时间过长，可能会导致主线程阻塞，影响应用的响应性能。
  * **不适合所有场景：** CADisplayLink 适用于实现基于帧率的动画效果，但并不适用于所有类型的动画，例如复杂的过渡效果或基于物理引擎的动画。
  * **回调并非绝不丢帧：** 主线程繁忙或系统调度变化时仍可能跳帧，应按时间推进动画，而不是假定每次回调间隔固定。

## 三十、Objective-C 多线程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 30.1、pthread

> *pthread（**P**OSIX **Thread**s）*是一套<font color="red">***C语言编写***</font>的**跨平台多线程API**，**使用难度大**，需要**手动管理线程生命周期**。（需要更加谨慎地处理线程的同步和互斥操作，以避免出现死锁、数据竞争等问题）
>
> * **线程创建和管理**： pthread 库允许程序员创建、销毁、等待和控制线程的执行。通过调用 pthread_create 函数，程序可以创建新的线程并指定线程执行的函数。程序还可以使用 pthread_join 函数等待线程的结束，并使用 pthread_exit 函数退出当前线程；
> * **线程同步**： pthread 提供了一系列的同步机制，如互斥锁（Mutex）、条件变量（Condition Variable）、信号量（Semaphore）等，可以用于多线程之间的同步和互斥操作。这些同步机制可以帮助程序员避免多个线程同时访问共享资源导致的竞态条件和数据不一致性问题；
> * **线程调度和优先级**： pthread 允许程序员设置线程的调度策略和优先级，以及控制线程的调度行为。程序员可以通过设置线程的属性来指定线程的调度策略和优先级，以及其他相关的属性；
> * **线程取消和退出**： pthread 允许程序员取消线程的执行，并在需要时优雅地退出线程。程序员可以使用 pthread_cancel 函数取消指定线程的执行，并使用 pthread_exit 函数主动退出当前线程；
> * **线程局部存储**： pthread 提供了线程局部存储（Thread-Specific Data，TSD）的机制，允许程序员为每个线程分配独立的存储空间。这些存储空间对于每个线程是私有的，可以用于存储线程特定的数据；

```c
/// main.c
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>   // strerror
#include <unistd.h>

static void *print_message(void *arg) {
    const char *message = (const char *)arg;  // 传入的是字符串字面量，静态存储期，安全
    printf("子线程：%s\n", message);
    return NULL;
}

int main(void) {
    pthread_t thread1, thread2;

    const char *msg1 = "线程1正在运行...";
    const char *msg2 = "线程2正在运行...";

    int rc;

    rc = pthread_create(&thread1, NULL, print_message, (void *)msg1);
    if (rc != 0) {
        fprintf(stderr, "创建线程1失败: %s\n", strerror(rc)); // pthread_* 返回错误码，不一定设置 errno
        exit(EXIT_FAILURE);
    }

    rc = pthread_create(&thread2, NULL, print_message, (void *)msg2);
    if (rc != 0) {
        fprintf(stderr, "创建线程2失败: %s\n", strerror(rc));
        exit(EXIT_FAILURE);
    }

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    puts("主线程：所有子线程执行完毕。");
    return 0;
}
```

```c
gcc main.c -pthread -o demo
```

### 30.2、NSThread

> Cocoa 框架中的一部分<font color="red">***（较为底层）***</font>。面向对象操作线程，使用相对简单，需要手动管理线程生命周期；
>
> * **线程创建和管理**： 使用 `NSThread` 类，您可以创建新的线程，并通过调用 `start` 方法来启动线程的执行。您可以在创建线程时指定线程执行的方法，并传递参数给该方法。通过 `isExecuting` 和 `isFinished` 等属性，您可以查询线程的执行状态；
> * **线程调度和优先级**： 可以通过 `qualityOfService` 表达任务意图；优先级最终仍由系统调度，不能用来保证执行顺序。`sleepForTimeInterval:` 只会让当前线程休眠；
> * **线程同步**： `NSThread` 并**没有提供专门的同步机制**，但您可以使用其他的同步机制，如互斥锁（`NSLock`）、条件变量（`NSCondition`）等，来确保多个线程之间的同步和互斥操作。您可以在不同的线程中使用这些同步机制来避免竞态条件和数据不一致性问题；
> * **线程退出**： 线程入口方法自然返回后即可结束。`+[NSThread exit]` 能终止当前线程，但会绕过常规调用栈返回路径，通常优先设计可协作退出的任务；
> * **线程局部存储**： 每个 `NSThread` 对象都提供 `threadDictionary`，可存放当前线程专属的数据。

```objective-c
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyThreadTask *task = [[MyThreadTask alloc] init];
        // 创建并启动线程
        NSThread *thread = [[NSThread alloc] initWithTarget:task selector:@selector(runTask:) object:@"Hello from thread!"];
        [thread start];
        // 主线程日志
        NSLog(@"🌍 主线程：%@", [NSThread currentThread]);
        // 仅为命令行演示保留进程；sleep 不是可靠的线程 join。
        [NSThread sleepForTimeInterval:1.0];
    };return 0;
}

- (void)runTask:(NSString *)message {
    NSLog(@"👤 子线程：%@，线程：%@", message, [NSThread currentThread]);
}
```

### 30.3、GCD

* GCD（***G***rand ***C***entral ***D***ispatch）是苹果（Apple.Inc）多核编程解决方案（多线程处理技术），使用起来非常方便。需要自己实现如：限制并发数，任务间的依赖等功能。自动管理线程生命周期。
  * **队列（Dispatch Queues）**： GCD 使用队列来管理任务的执行。队列可以是串行队列（Serial Queue）或并发队列（Concurrent Queue）。串行队列中的任务按照 FIFO（先进先出）的顺序依次执行，而并发队列中的任务可以同时执行；
  * **任务（Blocks）**： 在 GCD 中，任务以块（Blocks）的形式表示。块是一段代码，可以在队列中异步或同步执行。您可以使用 GCD 提供的函数来创建并提交任务到队列中执行；
  * **同步和异步执行（Sync vs Async）**： 同步提交会等待任务完成；异步提交会尽快返回。异步只描述提交行为，任务最终在哪个线程执行取决于目标队列，提交到主队列的任务仍在主线程执行；
  * **主队列和全局队列（Main and Global Queues）**： 主队列是运行于主线程的串行队列；系统全局队列是并发队列，现代代码应通过 QoS 表达任务的重要性与响应需求；
  * **信号量（Dispatch Semaphores）**： GCD 提供了***信号量机制***，可以控制并发任务的数量。通过信号量，您可以限制同时执行的任务数量，避免过多的并发导致资源竞争或性能问题；
  * **调度组（Dispatch Groups）**： 调度组是一种用于管理多个任务的机制，它可以让您监视一组任务的完成状态。您可以使用调度组来等待一组任务全部完成后再执行其他操作，或者在一组任务完成时执行特定的处理；

* 线程组：`dispatch_group_t`
  * 允许等待一组任务完成后再执行其他操作；

  * 可以向线程组添加任务，并使用`dispatch_group_notify`方法来设置一个回调，该回调将在所有任务完成后被调用；

    ```objective-c
    // 导入必要的头文件
    #import <Foundation/Foundation.h>

    int main(int argc, const char * argv[]) {
        @autoreleasepool {
            // 创建一个串行队列
            dispatch_queue_t queue = dispatch_queue_create("com.example.queue", DISPATCH_QUEUE_SERIAL);
            // 创建一个线程组
            dispatch_group_t group = dispatch_group_create();
            // 向线程组中添加任务
            dispatch_group_async(group, queue, ^{
                // 第一个异步任务
                NSLog(@"Task 1 started");
                sleep(2); // 模拟耗时操作
                NSLog(@"Task 1 completed");
            });
            dispatch_group_async(group, queue, ^{
                // 第二个异步任务
                NSLog(@"Task 2 started");
                sleep(3); // 模拟耗时操作
                NSLog(@"Task 2 completed");
            });
            // 设置一个回调，在所有任务完成后执行
            dispatch_group_notify(group, queue, ^{
                NSLog(@"All tasks completed");
            });
            // 等待线程组中的任务完成
            dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
            NSLog(@"Main thread continues after all tasks completed");
        };return 0;
    }
    /**
    创建了一个串行队列和一个线程组。
    然后，向线程组中添加了两个异步任务，并设置了一个回调，以便在所有任务完成后执行。
    最后，调用了dispatch_group_wait函数，使当前线程等待线程组中的任务完成。
    */
    ```

* GCD的定时器

  > 创建了一个定时器，每隔1秒执行一次任务。定时器在10秒后被取消，然后程序退出。可以根据需要调整定时器的间隔时间。

  * **OC.GCD.Timer**

    ```objective-c
    #import <Foundation/Foundation.h>

    int main(int argc, const char * argv[]) {
        @autoreleasepool {
            // 创建DispatchSourceTimer对象
            dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,
                                                             0,
                                                             0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
            // 设置定时器的初始时间、间隔时间和精度
            dispatch_source_set_timer(timer,
                                      dispatch_time(DISPATCH_TIME_NOW, 0),
                                      1ull * NSEC_PER_SEC,
                                      100ull * NSEC_PER_MSEC);
            // 设定定时器的执行任务
            dispatch_source_set_event_handler(timer, ^{
                // 这里是定时器触发时执行的任务
                NSLog(@"Timer fired!");
            });
            // 启动定时器
            dispatch_resume(timer);
            // 为了让程序不立即结束，可以让主线程等待一段时间
            // 这里只是为了演示目的，实际中你可能会有其他的需要
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                         (int64_t)(10.0 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                // 取消定时器
                dispatch_source_cancel(timer);
                NSLog(@"Timer canceled!");
                // 退出程序
                exit(EXIT_SUCCESS);
            });
            // 让主线程开始运行RunLoop，以便定时器能够工作
            NSRunLoop.mainRunLoop.run;
        };return 0;
    }
    ```

  * **Swift.GCD.Timer**

    ```swift
    import Foundation

    let timerQueue = DispatchQueue(label: "com.jobs.demo.timer")
    let timer = DispatchSource.makeTimerSource(queue: timerQueue)
    timer.schedule(deadline: .now(),
                   repeating: .seconds(1),
                   leeway: .milliseconds(100))
    timer.setEventHandler {
        print("Timer fired!")
    }
    timer.activate()

    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
        timer.cancel()
        print("Timer canceled!")
        exit(EXIT_SUCCESS)
    }

    // 仅供命令行 Demo 保持进程存活；App 中不要手动运行主 Run Loop。
    RunLoop.main.run()
    ```

### 30.4、[**NSOperation**](https://developer.apple.com/documentation/foundation/nsoperation)

> `NSOperation`（Swift 中为 `Operation`）把工作单元建模为对象，支持依赖、取消、优先级和状态观察；`NSOperationQueue` 负责调度这些工作。实现细节可能使用线程或系统并发设施，不应简单等同为“GCD 的面向对象封装”。
>
> `NSOperation` 是抽象基类。简单任务通常使用 `NSBlockOperation`，只有需要自定义执行、异步状态或取消逻辑时才子类化。
>
>   * **任务管理**： *NSOperation* 封装了一个执行任务的对象，可以用于执行各种类型的任务。您可以通过子类化 *NSOperation* 类，实现自定义的任务逻辑，并在其中执行所需的操作。
>   * **任务依赖**： *NSOperation* 提供了任务依赖的机制，允许您指定任务之间的依赖关系。这样，您可以确保某个任务在其依赖的所有任务完成后才开始执行。通过 `addDependency:` 方法，您可以为一个操作添加一个或多个依赖。
>   * **任务队列**： *NSOperationQueue* 负责调度和执行操作。`maxConcurrentOperationCount = 1` 可以限制同一时间只执行一个操作，但任务依赖仍应显式表达；
>   * **取消和暂停**： `cancel` 只设置取消状态，操作必须主动检查 `isCancelled` 并尽快结束；暂停队列只阻止尚未开始的操作继续调度，不会暂停已经运行的操作；
>   * **状态观察**： `isReady`、`isExecuting`、`isFinished` 和 `isCancelled` 等状态符合 KVO。自定义并发操作时必须正确维护这些状态。

* 使用 `NSBlockOperation`

  ```objective-c
  #import <Foundation/Foundation.h>

  int main(int argc, const char * argv[]) {
      @autoreleasepool {
          NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
              NSLog(@"🧵 执行任务，线程：%@", [NSThread currentThread]);
          }];
          // 也可以添加多个 block（并发执行）
          [operation addExecutionBlock:^{
              NSLog(@"📌 附加任务1，线程：%@", [NSThread currentThread]);
          }];
          [operation addExecutionBlock:^{
              NSLog(@"📌 附加任务2，线程：%@", [NSThread currentThread]);
          }];
          [operation start]; // 调用方会同步等待操作完成；不要假定所有 execution block 都固定在当前线程。
      };return 0;
  }
  ```

* 配合 `NSOperationQueue` 异步执行

  ```objective-c
  #import <Foundation/Foundation.h>

  int main(int argc, const char * argv[]) {
      @autoreleasepool {
          NSOperationQueue *queue = [[NSOperationQueue alloc] init];
          NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
              NSLog(@"任务1 - %@", [NSThread currentThread]);
          }];
          NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
              NSLog(@"任务2 - %@", [NSThread currentThread]);
          }];
          [queue addOperation:op1];
          [queue addOperation:op2];
          // 主线程等待一会以观察子线程输出
          [NSThread sleepForTimeInterval:1.0];
      };return 0;
  }
  ```


* 添加任务依赖关系

  ```objective-c
  NSBlockOperation *downloadOp = [NSBlockOperation blockOperationWithBlock:^{
      NSLog(@"📥 下载完成");
  }];

  NSBlockOperation *processOp = [NSBlockOperation blockOperationWithBlock:^{
      NSLog(@"📦 处理完成");
  }];

  [processOp addDependency:downloadOp];

  NSOperationQueue *queue = [[NSOperationQueue alloc] init];
  [queue addOperations:@[downloadOp, processOp] waitUntilFinished:NO];
  ```

* 自定义 NSOperation 子类（用于复杂任务）

  ```objective-c
  @interface MyOperation : NSOperation
  @end

  @implementation MyOperation

  - (void)main {
      if (self.isCancelled) return;
      NSLog(@"🔧 自定义任务运行中：%@", [NSThread currentThread]);
  }

  @end
  ```

## 三十一、Objective-C Runtime 消息转发机制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> Objective-C 中的消息转发机制是一种在***运行时动态处理未知消息***的机制：<font color="red">***当一个对象接收到一个它无法识别的消息时，Objective-C 运行时系统会通过一系列的步骤来处理这个未知消息，并尝试找到合适的接收者来处理该消息***</font>。

消息转发机制一般分为三个阶段：

1. **动态方法解析（Dynamic Method Resolution）**：
   在这个阶段，Objective-C 运行时会调用类方法 `+resolveInstanceMethod:` 或 `+resolveClassMethod:`。通过这些方法，类有机会动态添加方法实现，从而使得接收到的消息可以被处理。如果方法解析成功，消息将被重发，重新执行；
2. **备用接收者（Fallback Recipients）**：
   如果动态方法解析失败，Objective-C 运行时会调用 `-forwardingTargetForSelector:` 方法，以寻找备用接收者来处理消息。在这个方法中，对象有机会返回另一个对象来处理该消息。如果返回了一个非空的对象，则消息将被转发到这个对象，而不再继续后续的步骤；
3. **完整消息转发（Complete Message Forwarding）**：
   如果备用接收者也无法处理消息，运行时会先通过 `-methodSignatureForSelector:` 获取方法签名。只有返回了有效签名，才会创建 `NSInvocation` 并调用 `-forwardInvocation:`。对象可以转发调用或自行处理；没有提供签名或最终没有处理消息时，通常会走到 `doesNotRecognizeSelector:` 并抛出异常。
   通过这三个阶段，Objective-C 运行时可以实现动态消息处理的能力，使得对象能够在运行时动态地处理未知消息，从而增强了语言的灵活性和动态性；

## 三十二、`dylib` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Windows 常见动态库扩展名为 `.dll`，Linux 常见为 `.so`，Apple 平台常见为 `.dylib` 或由 Framework 承载的动态 Mach-O；
- `.dylib` 是动态库文件，`dyld` 才是 Apple 平台的动态链接加载器；不能把二者都称作“开源组件”。Apple 发布过 dyld 的开源代码，但系统中具体版本与实现仍以对应 OS 为准；
- 动态 Mach-O 通常使用 `MH_DYLIB` 文件类型，不能作为普通应用入口直接运行，需要由进程在启动或运行期间装载；
- Mach-O 的 load commands 记录依赖项和装载路径；实际装载顺序受依赖图、镜像初始化与系统实现影响，不能用 Xcode 的 `Link Binary With Libraries` 列表顺序作为稳定的运行时顺序保证；
- 系统库可能由 dyld shared cache 统一承载。缓存路径和内部布局属于系统实现细节，不应在业务代码或文档中依赖固定目录。

## 三十三、`+load` 和 `+initialize` 的区别 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 对比项 | `+load` | `+initialize` |
| :--- | :--- | :--- |
| 触发时机 | 包含该类或分类的镜像被 Runtime 装载时 | 类第一次接收消息前按需触发 |
| 调用对象 | 只自动调用直接实现 `+load` 的类或分类 | 类可以继承 `+initialize` 的实现，因此父类实现可能以不同子类作为 `self` 被调用 |
| 顺序保证 | 父类早于子类；分类在其所属类之后。不要依赖多个同级类或多个分类之间的私有顺序 | 先保证父类完成初始化，再初始化当前类 |
| 调用特性 | Runtime 直接调用已登记的实现，不走常规继承查找 | 通过消息机制触发，并由 Runtime 做线程同步 |
| 使用建议 | 只做必须且极轻量的装载期工作，避免 I/O、锁等待和复杂依赖 | 用 `if (self == SomeClass.class)` 限定当前类的一次性初始化；现代业务单例通常优先 `dispatch_once` |

系统自动调用 `+load` 与业务代码主动发送 `load` 消息不是同一件事。也不要通过 Runtime 私有源码函数名或分类编译顺序建立业务约束，这些并非稳定 API。

## 三十四、`objc_msgSend` 方法调用流程 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- Objective-C 消息表达式由编译器按目标架构 ABI 生成调用序列。普通消息的核心入口可以理解为 `objc_msgSend(receiver, selector, ...)`；
- `super` 不是另一个接收者，而是要求从父类的方法列表开始查找；编译器会生成对应的 super 派发入口；
- 结构体返回是否需要专用 `stret` 入口取决于架构和 ABI。现代代码应由编译器选择，不能写成“所有结构体返回都调用 `objc_msgSend_stret`”，更不应在业务代码里直接硬调这些底层入口；
- 快速路径会根据对象的类、Selector 与方法缓存查找 IMP；找不到时才进入较慢的方法查找、动态解析和消息转发流程；
- 直接把 `objc_msgSend` 当函数指针使用时，必须严格匹配真实方法 ABI；除 Runtime 工具代码外，优先使用正常 Objective-C 消息语法。

## 三十五、Objective-C 数据持久化 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 35.1、[**SQLite**](https://sqlite.org/)

> - 零配置、嵌入式的关系型数据库引擎；
> - 提供 C API，跨平台，适用于移动端、本地缓存与中小型业务；
> - 数据量本身不是唯一瓶颈。索引、SQL、事务批处理、页大小和并发模型都会直接影响性能。

* **需要在Xcode项目中添加`libsqlite3.tbd`库**

  ```objective-c
  #import <sqlite3.h>
  // 打开数据库连接
  sqlite3 *database;
  NSString *databasePath;

  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  databasePath = [documentsDirectory stringByAppendingPathComponent:@"test.db"];

  if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK) {
      NSLog(@"数据库打开成功！");
      // 创建表格
      const char *sqlStatement = "CREATE TABLE IF NOT EXISTS contacts (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)";
      char *errorMessage = NULL;
      if (sqlite3_exec(database, sqlStatement, NULL, NULL, &errorMessage) != SQLITE_OK) {
          NSLog(@"创建表格失败: %s", errorMessage);
          sqlite3_free(errorMessage);
      }
      // 插入数据
      const char *insertStatement = "INSERT INTO contacts (name, age) VALUES (?, ?)";
      sqlite3_stmt *compiledStatement = NULL;
      if (sqlite3_prepare_v2(database, insertStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
          sqlite3_bind_text(compiledStatement, 1, [@"John Doe" UTF8String], -1, SQLITE_TRANSIENT);
          sqlite3_bind_int(compiledStatement, 2, 30);

          if (sqlite3_step(compiledStatement) != SQLITE_DONE) {
              NSLog(@"插入数据失败！");
          }
      }
      sqlite3_finalize(compiledStatement);
      compiledStatement = NULL;
      // 查询数据
      const char *selectStatement = "SELECT * FROM contacts";
      if (sqlite3_prepare_v2(database, selectStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
          while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
              int contactID = sqlite3_column_int(compiledStatement, 0);
              NSString *name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
              int age = sqlite3_column_int(compiledStatement, 2);
              NSLog(@"ID: %d, Name: %@, Age: %d", contactID, name, age);
          }
      }
      sqlite3_finalize(compiledStatement);
      // 关闭数据库连接
      sqlite3_close(database);
  } else {
      NSLog(@"数据库打开失败！");
  }
  ```

### 35.2、[**FMDB**](https://github.com/ccgus/fmdb)

> - FMDB 是 SQLite 的 Objective-C 封装，仍然需要理解 SQL、事务和索引；
> - FMDB 不负责云端实时同步；同步协议、冲突处理和离线策略需要由业务或其他服务实现；
> - 不要跨线程随意共享同一个 `FMDatabase`。需要串行化数据库访问时使用 `FMDatabaseQueue`，并在队列内执行操作。

```objective-c
// ViewController.m
#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()
@property (nonatomic, strong) FMDatabase *database;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取沙盒中数据库文件路径
    NSString *docsDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *databasePath = [docsDir stringByAppendingPathComponent:@"test.db"];
    // 初始化数据库
    self.database = [FMDatabase databaseWithPath:databasePath];
    if (!self.database.open) {
        NSLog(@"Could not open database.");
        return;
    }
    // 创建表格
    BOOL success = [self.database executeUpdate:@"CREATE TABLE IF NOT EXISTS contacts (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)"];
    if (!success) {
        NSLog(@"Error creating table: %@", self.database.lastErrorMessage);
    }
    // 插入数据
    success = [self.database executeUpdate:@"INSERT INTO contacts (name, age) VALUES (?, ?)", @"John Doe", @(30)];
    if (!success) {
        NSLog(@"Error inserting data: %@", self.database.lastErrorMessage);
    }
    // 查询数据
    FMResultSet *resultSet = [self.database executeQuery:@"SELECT * FROM contacts"];
    while (resultSet.next) {
        NSString *name = [resultSet stringForColumn:@"name"];
        NSInteger age = [resultSet intForColumn:@"age"];
        NSLog(@"Name: %@, Age: %ld", name, (long)age);
    }
    [resultSet close];
    // 更新数据
    success = [self.database executeUpdate:@"UPDATE contacts SET age = ? WHERE name = ?", @(35), @"John Doe"];
    if (!success) {
        NSLog(@"Error updating data: %@", self.database.lastErrorMessage);
    }
    // 删除数据
    success = [self.database executeUpdate:@"DELETE FROM contacts WHERE name = ?", @"John Doe"];
    if (!success) {
        NSLog(@"Error deleting data: %@", self.database.lastErrorMessage);
    }

    [self.database close];
}

@end
```

### 35.3、[**Realm**](https://github.com/realm)

> - Realm 是对象数据库，常规 CRUD 不直接使用 SQL，但仍需理解数据建模、迁移、线程隔离和事务；
> - Realm SDK 可用于本地持久化。原 [**Atlas Device Sync / App Services**](https://www.mongodb.com/docs/atlas/app-services/sync/configure/enable-sync/) 能力已进入停止服务流程，不能再把“内置实时同步”作为新项目选型结论；
> - 数据库选型应结合维护状态、团队经验、迁移成本、数据规模和查询模型评估，不宜写成无条件“强烈推荐”。

```objective-c
#import <Realm/Realm.h>

// 定义数据模型
@interface Person : RLMObject
@property NSString *name;
@property NSInteger age;
@end

@implementation Person
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建 Realm 数据库实例
        RLMRealm *realm = [RLMRealm defaultRealm];

        // 执行数据库操作
        [realm transactionWithBlock:^{
            // 增加数据
            Person *person = Person.new;
            person.name = @"John";
            person.age = 30;
            [realm addObject:person];
            // 查询数据
            RLMResults<Person *> *persons = Person.allObjects;
            NSLog(@"Number of persons: %lu", (unsigned long)persons.count);
            for (Person *person in persons) {
                NSLog(@"Name: %@, Age: %ld", person.name, (long)person.age);
            }
            // 修改数据
            Person *firstPerson = persons.firstObject;
            if (firstPerson) {
                firstPerson.age = 31;
                [realm deleteObject:firstPerson];
            }
        }];
    };return 0;
}
```

## 三十六、FAQ <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

* <font color=red>**如何用`UITableView`来处理大数据灌入的业务场景**</font>

  * 懒加载 + 分页机制

  * 复用`UITableViewCell`

  * 高度策略按复杂度选择：简单 Cell 可使用 self-sizing；复杂内容可缓存测量结果。不要把“全部提前计算高度”当成通用优化，先用 Instruments 确认瓶颈；

  * 分页 + 服务端下发数据摘要（点击进入详情页时，再请求完整数据）

      > **数据摘要**是一种让列表页展示内容**更快、更轻、更流畅**的后端策略。只返回必要信息，延迟加载重内容，是大数据 App 的核心优化技巧。

        | 模式       | 说明                                                         |
        | ---------- | ------------------------------------------------------------ |
        | ✅ 数据摘要 | 服务端只返回 ID、标题、缩略图、时间等基础字段，列表中快速展示 |
        | ❌ 数据全量 | 服务端返回完整详情（大图、多段文本、评论等），浪费带宽和内存 |

        | 客户端功能         | 后端返回字段设计建议               |
        | ------------------ | ---------------------------------- |
        | 快速显示缩略图     | 提供压缩图 URL（如 `thumbUrl`）    |
        | 快速显示摘要文本   | `summary` 字段提前拼接好           |
        | 页面优化滚动       | 每页数据量和字段长度限制在合理范围 |
        | 支持下拉刷新和续载 | 后端支持分页参数 `page`, `size`    |

  * 避免频繁 **`reloadData`**

    * 不要每次数据变动都 **`reloadData`**，优先使用：

      ```objective-c
      [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationNone];
      ```

    * 数据源与 UI 更新应在主线程保持一致；切到主线程只保证线程正确，并不会降低 `reloadData` 本身的计算与布局成本；

  * 使用轻量 Model，避免大对象

    * 数据模型应只包含展示所需字段，避免将图片、富文本、数据库连接等塞入模型

  * 异步处理耗时任务

  * 预加载（可选）

    ```objective-c
    - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
        NSIndexPath *lastVisibleIndexPath = [[self.tableView indexPathsForVisibleRows] lastObject];
        if (lastVisibleIndexPath.row > self.dataSource.count - 10) {
            [self loadMoreData];
        }
    }
    ```

  * 💥考虑使用 Diffable DataSource（iOS 13+）

    * iOS 13+ 可使用 `UITableViewDiffableDataSource` 统一快照与增量更新。它主要改善状态一致性和更新表达，实际性能仍取决于 diff 规模、Cell 成本和更新频率；

  * 💥替代方案（极大数据）如果数据量达到几万条甚至几十万条，可以考虑：

    * `UICollectionView` + `UICollectionViewCompositionalLayout`（适合多 Section、混合布局；数据分页仍由业务实现）

      > * 在 `UICollectionView` 中，**UICollectionViewCompositionalLayout** 是 Apple 从 **iOS 13** 引入的一种 **全新的布局系统**，全名是：**UICollectionViewCompositionalLayout**
      >
      > * **UICollectionViewCompositionalLayout**是一种模块化构建**UICollectionView**布局的`积木式`方式，让你用少量代码实现复杂结构，性能更好，灵活性极高。
      >
      > * ```objective-c
      >   UICollectionViewCompositionalLayout
      >    └── Section（NSCollectionLayoutSection）
      >         └── Group（NSCollectionLayoutGroup）
      >              └── Item（NSCollectionLayoutItem）
      >   ```
      >
      > * ```objective-c
      >   /// 必须使用 UICollectionViewCompositionalLayout 初始化
      >   /// 建议使用 UICollectionViewDiffableDataSource 配合使用（管理数据更方便）
      >   UICollectionViewCompositionalLayout *layout =
      >       [[UICollectionViewCompositionalLayout alloc] initWithSectionProvider:^NSCollectionLayoutSection *(NSInteger sectionIndex, id<NSCollectionLayoutEnvironment> layoutEnvironment) {
      >       // 1. 定义每个 item 大小（宽占满，高为 44）
      >       NSCollectionLayoutSize *itemSize = [NSCollectionLayoutSize sizeWithWidthDimension:[NSCollectionLayoutDimension fractionalWidthDimension:1.0]
      >                                                                          heightDimension:[NSCollectionLayoutDimension absoluteDimension:44]];
      >       NSCollectionLayoutItem *item = [NSCollectionLayoutItem itemWithLayoutSize:itemSize];
      >       // 2. 定义 group（一行一个 item）
      >       NSCollectionLayoutSize *groupSize = [NSCollectionLayoutSize sizeWithWidthDimension:[NSCollectionLayoutDimension fractionalWidthDimension:1.0]
      >                                                                           heightDimension:[NSCollectionLayoutDimension absoluteDimension:44]];
      >       NSCollectionLayoutGroup *group = [NSCollectionLayoutGroup horizontalGroupWithLayoutSize:groupSize subitems:@[item]];
      >       // 3. 定义 section（一个 group 组成一个 section）
      >       NSCollectionLayoutSection *section = [NSCollectionLayoutSection sectionWithGroup:group];
      >       return section;
      >   }];
      >   ```
      >
      > * | 优点     | 说明                                   |
      >   | -------- | -------------------------------------- |
      >   | 灵活     | 横向滚动、瀑布流、嵌套布局都能轻松实现 |
      >   | 性能     | 系统原生布局方案；实际性能取决于层级、估算与 Cell 成本 |
      >   | 模块化   | Section 可以单独配置，多个样式共存     |
      >   | 简洁     | 少量代码即可定义复杂布局               |
      >   | iOS 原生 | 不需要三方库                           |

  * <font color=red>**Facebook**.`AsyncDisplayKit`（后改名为[**Texture**](https://github.com/TextureGroup/Texture)框架、开源、**高性能 iOS.UI 框架**）</font>

      > * 核心目标是把可并行的测量与绘制工作移出主线程，降低复杂列表的主线程压力；它不能保证所有场景都不掉帧。
      >
      > * [**Texture**](https://github.com/TextureGroup/Texture)和 **UIKit** 可以互相嵌套、协同使用。你可以把 **Node** 嵌入 **UIKit** 视图中，也可以把 **UIView** 添加进 **Node** 树中。
      >
      >   ```objective-c
      >   /// Node 嵌入 UIKit（常用）
      >
      >   /// node.view 是延迟生成的 UIView，只有访问时才真正创建。
      >   ASDisplayNode *node = [[ASDisplayNode alloc] init];
      >   node.frame = CGRectMake(10, 100, 200, 50);
      >   node.backgroundColor = UIColor.redColor;
      >
      >   [self.view addSubview:node.view]; // ✅ node.view 就是实际的 UIView
      >   ```
      >
      >   ```objective-c
      >   /// UIView 嵌入 Node（不推荐。如需）
      >
      >   UILabel *label = [[UILabel alloc] init];
      >   label.text = @"传统 UILabel";
      >   /// initWithViewBlock: 的机制允许将任何 UIKit 控件包装成一个 Node
      >   ASDisplayNode *node = [[ASDisplayNode alloc] initWithViewBlock:^UIView * _Nonnull{
      >       return label;
      >   }];
      >   ```
      >
      >   ```objective-c
      >   /// 控制器级别互相嵌套
      >   /// ASViewController 是 UIViewController 的子类，可以当成普通 VC 使用
      >   ASViewController *vc = [[ASViewController alloc] initWithNode:rootNode];
      >   [self.navigationController pushViewController:vc animated:YES];
      >   ```
      >
      > * Texture 以 **Node** 作为主要抽象，并提供常见 UIKit 控件的对应节点；不是所有 UIKit 类型都存在一一等价替代。
      >
      >   | UIKit 类             | Texture 对应类（Node）                        | 说明                                |
      >   | -------------------- | --------------------------------------------- | ----------------------------------- |
      >   | `UIView`             | `ASDisplayNode`                               | 所有 Node 的基类，代表可渲染视图    |
      >   | `UILabel`            | `ASTextNode`                                  | 异步文本节点，支持富文本，异步绘制  |
      >   | `UITextView`         | `ASTextNode` + `userInteractionEnabled = YES` | 支持文本交互                        |
      >   | `UIButton`           | `ASButtonNode`                                | 支持异步文本、图片的按钮            |
      >   | `UIImageView`        | `ASImageNode`                                 | 异步图片节点，支持本地和网络图片    |
      >   | `UITableView`        | `ASTableNode`                                 | 异步表格列表，内部是 UITableView    |
      >   | `UICollectionView`   | `ASCollectionNode`                            | 异步瀑布流，内部是 UICollectionView |
      >   | `UIScrollView`       | `ASScrollNode`                                | 异步滚动容器，可横纵方向配置        |
      >   | `UITextField`        | `ASEditableTextNode`                          | 可编辑文本输入节点                  |
      >   | `UIStackView`        | `ASStackLayoutSpec`                           | 异步布局容器（Flexbox 风格）        |
      >   | `UILayoutConstraint` | `ASLayoutSpec` 系列（Inset、Ratio 等）        | 替代 AutoLayout 的布局工具          |
      >   | `UIViewController`   | `ASViewController`                            | 与 Node 配合使用的控制器            |
      >
      > * 生命周期与 UIKit 差异点
      >
      >   | 点                | 说明                                                         |
      >   | ----------------- | ------------------------------------------------------------ |
      >   | View 不立即生成   | 所有 Node 默认 **不会立刻生成 UIView/CALayer**，直到真正需要展示 |
      >   | 不推荐 addSubview | 推荐使用 `layoutSpecThatFits:` 来描述布局，而不是直接 add    |
      >   | 支持异步构建 UI   | 可以在 `ASCellNode` 的 `init` 中构建复杂 UI，无需触发主线程  |
      >
      > * 图片加载与解码
      >
      >   > 1、`ASNetworkImageNode` 的网络加载与缓存能力依赖配置的数据源、下载器和缓存实现，不能笼统写成框架无条件自动缓存
      >   >
      >   > 2、支持网络图片和本地图片
      >
      > * **布局系统灵活**
      >
      >   > 1、内建 Flexbox（类似 CSS）
      >   >
      >   > 2、支持自动布局、手动布局
      >   >
      >   > 3、不依赖 AutoLayout，性能更高
      >
      > * | 特性        | 传统 UIKit                       | AsyncDisplayKit（Texture）                                   |
      >   | ----------- | -------------------------------- | ------------------------------------------------------------ |
      >   | 绘制线程    | UIKit 视图更新必须在主线程       | 支持把部分测量与显示任务放到后台                             |
      >   | UI 更新方式 | 主线程操作 View 层级             | 后台准备可并行内容，最终视图提交仍遵守主线程规则             |
      >   | 滚动性能    | 取决于布局、绘制和数据处理成本   | 可降低复杂列表的主线程负担，但不保证固定 60 FPS              |
      >   | 卡顿原因    | 主线程工作超出帧预算会掉帧       | 仍需控制图片、数据、节点层级和主线程提交成本                 |
      >   | 渲染机制    | `UIView.drawRect:`               | `ASDisplayNode.display`                                      |
      >   | 节点模型    | UIKit 中的 `UIView`/`UILabel` 等 | 使用 `ASDisplayNode` 统一管理显示内容                        |
      >   | 是否懒加载  | UIKit 本身不统一保证             | Node 的 View / Layer 可延迟创建；数据源是否全量创建取决于实现 |
      >   | 线程规则    | UIKit 视图操作在主线程           | 仅明确标注可并行的 Node 工作可离开主线程                     |
      >   | 使用复杂度  | 简单直接                         | 相对复杂，但性能优越                                         |
      >   | 适合场景    | 小量静态 UI                      | **大量数据、高性能滚动列表**（如朋友圈、Feed）               |
      >
      > * Demo：实现一个支持异步加载的 `ASTableView`，每个 cell 展示：一张图片（网络异步加载）+ 一段标题文字（ASTextNode）
      >
      >   ```ruby
      >   platform :ios, '11.0'
      >   use_frameworks!
      >
      >   target 'AsyncTableDemo' do
      >     pod 'Texture'
      >   end
      >   ```
      >
      >   ```objective-c
      >   #import <AsyncDisplayKit/AsyncDisplayKit.h>
      >
      >   @interface MyCellNode : ASCellNode
      >
      >   - (instancetype)initWithTitle:(NSString *)title imageURL:(NSURL *)url;
      >
      >   @end
      >   ```
      >
      >   ```objective-c
      >   #import "MyCellNode.h"
      >
      >   @interface MyCellNode ()
      >   @property (nonatomic, strong) ASTextNode *titleNode;
      >   @property (nonatomic, strong) ASNetworkImageNode *imageNode;
      >   @end
      >
      >   @implementation MyCellNode
      >
      >   - (instancetype)initWithTitle:(NSString *)title imageURL:(NSURL *)url {
      >       self = [super init];
      >       if (self) {
      >           self.automaticallyManagesSubnodes = YES;
      >
      >           _titleNode = [[ASTextNode alloc] init];
      >           _titleNode.attributedText = [[NSAttributedString alloc] initWithString:title
      >                                                                        attributes:@{
      >               NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
      >               NSForegroundColorAttributeName: UIColor.darkTextColor
      >           }];
      >
      >           _imageNode = [[ASNetworkImageNode alloc] init];
      >           _imageNode.URL = url;
      >           _imageNode.style.preferredSize = CGSizeMake(60, 60);
      >           _imageNode.cornerRadius = 8;
      >           _imageNode.clipsToBounds = YES;
      >
      >           [self setSelectionStyle:ASTableViewCellSelectionStyleNone];
      >       }
      >       return self;
      >   }
      >
      >   - (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
      >       _titleNode.style.flexShrink = 1.0;
      >
      >       ASStackLayoutSpec *horizontalStack = [ASStackLayoutSpec
      >           stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
      >           spacing:10
      >           justifyContent:ASStackLayoutJustifyContentStart
      >           alignItems:ASStackLayoutAlignItemsCenter
      >           children:@[_imageNode, _titleNode]];
      >
      >       UIEdgeInsets insets = UIEdgeInsetsMake(10, 15, 10, 15);
      >       return [ASInsetLayoutSpec insetLayoutSpecWithInsets:insets child:horizontalStack];
      >   }
      >
      >   @end
      >   ```
      >
      >   ```objective-c
      >   #import <AsyncDisplayKit/AsyncDisplayKit.h>
      >   #import "MyCellNode.h"
      >
      >   @interface AsyncTableVC : ASViewController<ASTableNode *><ASTableDataSource, ASTableDelegate>
      >   @property (nonatomic, strong) ASTableNode *tableNode;
      >   @property (nonatomic, strong) NSArray<NSDictionary *> *dataSource;
      >   @end
      >
      >   @implementation AsyncTableVC
      >
      >   - (instancetype)init {
      >       _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
      >       self = [super initWithNode:_tableNode];
      >       if (self) {
      >           _tableNode.delegate = self;
      >           _tableNode.dataSource = self;
      >           self.title = @"Async Table";
      >           self.dataSource = [self fakeData];
      >       }
      >       return self;
      >   }
      >
      >   - (NSArray *)fakeData {
      >       NSMutableArray *arr = @[].mutableCopy;
      >       for (int i = 0; i < 100; i++) {
      >           [arr addObject:@{
      >               @"title": [NSString stringWithFormat:@"第 %d 条内容：异步加载 Cell", i+1],
      >               @"image": @"https://picsum.photos/60"
      >           }];
      >       }
      >       return arr;
      >   }
      >
      >   #pragma mark - ASTableDataSource
      >
      >   - (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
      >       return self.dataSource.count;
      >   }
      >
      >   - (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
      >       NSDictionary *dict = self.dataSource[indexPath.row];
      >       NSString *title = dict[@"title"];
      >       NSURL *imgURL = [NSURL URLWithString:dict[@"image"]];
      >
      >       return ^ASCellNode *{
      >           return [[MyCellNode alloc] initWithTitle:title imageURL:imgURL];
      >       };
      >   }
      >
      >   @end
      >   ```
      >
      >   ```objective-c
      >   #import "AppDelegate.h"
      >   #import "AsyncTableVC.h"
      >
      >   @implementation AppDelegate
      >   /// 设置为根控制器
      >   - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
      >       self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
      >       self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[AsyncTableVC alloc] init]];
      >       [self.window makeKeyAndVisible];
      >       return YES;
      >   }
      >
      >   @end
      >   ```
      >
      > * ## ❗注意事项
      >
      >   1、 `ASDisplayNode.view` 不能过早访问，否则失去异步构建优势（建议在 `didLoad` 或之后访问）
      >   2、 `ASCellNode` 中不要强行访问 UIKit，否则会阻塞异步布局
      >   3、 嵌套使用时注意线程：Node 可在子线程布局，UIKit 只能在主线程操作

  * 💥**Instagram**.[**IGListKit**](https://github.com/Instagram/IGListKit)

    > * **Instagram（Meta）团队开源** 的一个高性能列表框架，专门用来解决 UIKit 中 `UICollectionView` 在处理**复杂数据结构和动态列表更新**时性能低下、代码臃肿的问题。
    >
    > * | 项目     | 内容                                                         |
    >   | -------- | ------------------------------------------------------------ |
    >   | 名称     | [**IGListKit**](https://github.com/Instagram/IGListKit)      |
    >   | 作者     | Instagram（Meta）开源                                        |
    >   | 语言     | Objective-C / Swift（桥接）                                  |
    >   | 基于     | UICollectionView                                             |
    >   | 核心概念 | Section Controller                                           |
    >   | 适用场景 | **动态 Cell 高度、多个 Cell 类型混排、数据频繁刷新等复杂场景** |
    >
    >   ✅ [**IGListKit**](https://github.com/Instagram/IGListKit) 的优势
    >
    >   | 优势             | 描述                                                         |
    >   | ---------------- | ------------------------------------------------------------ |
    >   | 🚀 差异更新       | 通过 diffing 生成增量更新，减少不必要的全量刷新；仍需控制 Cell 与数据处理成本 |
    >   | 🔄 数据驱动       | 每条数据和 UI 完全解耦，自动计算哪些 Cell 改变               |
    >   | 🔗 松耦合结构     | 数据 <-> SectionController 分离，易于维护与复用              |
    >   | 📦 支持 Cell 嵌套 | 支持嵌套列表，如：Feed + 评论结构                            |
    >   | 🧠 Diff 算法      | 使用 `IGListDiffable` 协议对比旧数据与新数据，高效更新 UI    |
    >
    > * Demo：
    >
    >   ```ruby
    >   pod 'IGListKit'
    >   ```
    >
    >   ```objective-c
    >   #import <IGListKit/IGListDiffable.h>
    >
    >   @interface FruitModel : NSObject <IGListDiffable>
    >   @property (nonatomic, copy) NSString *name;
    >   @end
    >
    >   @implementation FruitModel
    >
    >   - (id<NSObject>)diffIdentifier {
    >       return self.name;
    >   }
    >
    >   - (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    >       return [self.name isEqualToString:((FruitModel *)object).name];
    >   }
    >
    >   @end
    >   ```
    >
    >   ```objective-c
    >   #import <IGListKit/IGListSectionController.h>
    >
    >   @interface FruitSectionController : IGListSectionController
    >   @property (nonatomic, strong) FruitModel *model;
    >   @end
    >
    >   @implementation FruitSectionController
    >
    >   - (NSInteger)numberOfItems {
    >       return 1;
    >   }
    >
    >   - (CGSize)sizeForItemAtIndex:(NSInteger)index {
    >       return CGSizeMake(self.collectionContext.containerSize.width, 44);
    >   }
    >
    >   - (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    >       UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:UICollectionViewCell.class
    >                                                                 forSectionController:self
    >                                                                              atIndex:index];
    >
    >       // 清除旧内容
    >       for (UIView *subview in cell.contentView.subviews) [subview removeFromSuperview];
    >
    >       UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
    >       label.text = self.model.name;
    >       [cell.contentView addSubview:label];
    >       return cell;
    >   }
    >
    >   - (void)didUpdateToObject:(id)object {
    >       self.model = object;
    >   }
    >   @end
    >   ```
    >
    >   ```objective-c
    >   #import <IGListKit/IGListKit.h>
    >   /// 控制器中绑定 IGListAdapter
    >   @interface ViewController () <IGListAdapterDataSource>
    >   @property (nonatomic, strong) IGListAdapter *adapter;
    >   @property (nonatomic, strong) UICollectionView *collectionView;
    >   @property (nonatomic, strong) NSArray<FruitModel *> *data;
    >   @end
    >
    >   @implementation ViewController
    >
    >   - (void)viewDidLoad {
    >       [super viewDidLoad];
    >
    >       self.data = @[
    >           [self fruit:@"苹果"],
    >           [self fruit:@"香蕉"],
    >           [self fruit:@"橘子"]
    >       ];
    >
    >       UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    >       self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    >       [self.view addSubview:self.collectionView];
    >
    >       self.adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new]
    >                                              viewController:self];
    >       self.adapter.collectionView = self.collectionView;
    >       self.adapter.dataSource = self;
    >   }
    >
    >   - (FruitModel *)fruit:(NSString *)name {
    >       FruitModel *m = [FruitModel new];
    >       m.name = name;
    >       return m;
    >   }
    >
    >   // IGListAdapterDataSource
    >   - (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    >       return self.data;
    >   }
    >
    >   - (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    >       return [FruitSectionController new];
    >   }
    >
    >   - (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    >       return nil;
    >   }
    >   @end
    >   ```
    >
    > * ⚠️ 注意
    >
    >   1、对初学者不算轻量，学习曲线略高
    >   2、不适合简单列表，适合复杂业务模块化

* **服务端可以把多种操作都放进 `POST`，为什么仍要使用 `PUT`、`PATCH`、`DELETE`？**

  * 语义明确（语义化 API）➡️ 使用不同的 HTTP 方法，能让人一眼看懂接口的**用途**，代码更清晰、逻辑更规范。

    | 方法     | 语义说明                                   |
    | -------- | ------------------------------------------ |
    | `POST`   | 让目标资源按自身语义处理请求，常用于创建或非幂等动作 |
    | `PUT`    | 更新整个资源（或者新增一个已知地址的资源） |
    | `PATCH`  | 部分更新资源                               |
    | `DELETE` | 删除资源                                   |

  * 符合 RESTful 规范

    > REST 设计理念强调：**不同操作使用不同的动词来表达意图**，这样系统更统一、可扩展性更强。

    ```http
    GET    /users/123       -> 获取用户信息
    POST   /users           -> 新建用户
    PUT    /users/123       -> 替换用户信息
    PATCH  /users/123       -> 更新部分字段
    DELETE /users/123       -> 删除用户
    ```

  * 幂等性（Idempotency）区别

    ➡️ 幂等指多次相同请求对服务器“预期最终状态”的影响与一次相同，不要求每次响应码或响应体完全一致。例如重复 `DELETE` 后资源仍保持不存在，后续响应可能从成功变为 `404`。

    | 方法     | 幂等性   | 说明                           |
    | -------- | -------- | ------------------------------ |
    | `POST`   | ❌ 通常否 | 语义不保证幂等；业务可额外设计幂等键 |
    | `PUT`    | ✅ 是     | 重复提交应得到相同的预期资源状态 |
    | `PATCH`  | ⚠️ 不一定 | 取决于实现                     |
    | `DELETE` | ✅ 是     | 重复请求后资源都处于已删除状态 |

  * ✅ 4. **便于中间件、缓存、API 网关优化**

    > 很多 **代理服务器 / 网关 / 缓存系统** 会根据 HTTP 方法来决定是否缓存或转发请求。例如：
    >
    > - `GET`、`HEAD` 的缓存语义最常见；
    > - `POST` 响应在提供明确的新鲜度信息等条件时也可以被缓存，只是通用缓存支持较少；
    > - `PUT`、`PATCH`、`DELETE` 会影响相关缓存条目的有效性，具体行为由 HTTP 缓存规范和实现决定。

## 三十七、其他 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 动态库的基本概念见本文“`dylib`”章节；具体工程应以 Mach-O、签名、嵌入方式与 App Store 规则为准，不依赖非官方教程中的固定目录或装载顺序；

- 两个类相互引用不因为“共同继承协议”而必然编译失败。头文件中应通过 `@class` 前向声明减少循环导入，并在 `.m` 中导入完整头文件；双方属性都为 `strong` 时还要额外处理引用环。

* <span style="color:purple; font-weight:bold;">**OC热更新**</span>

  * App 可以下载图片、文案、配置和服务端数据，并在审核通过的既有能力范围内改变展示或开关；
  * [**App Store Review Guidelines 2.5.2**](https://developer.apple.com/app-store/review/guidelines/) 原则上禁止下载、安装或执行会引入或改变 App 功能的代码。把远程 JavaScript、JSPatch 等用于替换原生业务逻辑存在明确审核风险，不能作为通用方案推荐；
  * JavaScriptCore / WebView 可以承载应用自身已审核功能所需的脚本，但“能执行脚本”不等于“允许绕过审核动态下发新功能”；
  * 所有远程配置都应具备签名或可信传输、版本兼容、灰度、回滚、超时与安全默认值，且最终行为仍需符合 Apple 审核规则。

* <span style="color:purple; font-weight:bold;">**为什么有些文件没有后缀名，却依然可以被识别成图片并成功读取**</span>

  * 这通常是因为文件系统和操作系统依赖于文件的“魔术数字”（Magic Number）来确定文件类型，而**不仅仅是依赖于文件扩展名**；
  * 魔术数字是文件头的一部分，它是一个固定的字节序列，用于标识文件的类型；
  * 对于图像文件来说，它们的文件头通常包含特定的标识符或字节序列，这些信息告诉操作系统或应用程序这是一个图像文件，以及它的格式是什么（如JPEG、PNG、GIF等）；
  * 因此，即使一个文件没有文件扩展名，只要它的文件头包含了与某种图像格式对应的魔术数字，操作系统或应用程序就能够识别它为图像文件，并相应地进行处理。这使得即使文件名被更改或者缺失，文件仍然可以正确地被识别和处理；
  *
    以下是几种常见图像格式的典型魔术数字：

    * **JPEG/JFIF**：JPEG 文件的典型魔术数字是 `FF D8 FF`。

    * **PNG**：PNG 文件的典型魔术数字是 `89 50 4E 47 0D 0A 1A 0A`。

    * **GIF**：GIF 文件的典型魔术数字是 `47 49 46 38`（以及后面的 `39` 或 `37`）。

    * **BMP**：BMP 文件的典型魔术数字是 `42 4D`。

    * **TIFF**：TIFF 文件的典型魔术数字有多种，常见的是 `49 49 2A 00` 或 `4D 4D 00 2A`。

    这些魔术数字通常是文件头的开头几个字节，用于识别文件的类型和格式。当操作系统或应用程序读取文件时，它们会检查这些字节序列，以确定文件的类型，并相应地进行处理。

* <span style="color:purple; font-weight:bold;">**打开 VPN 后 Charles 可能无法抓包，但不是必然失效**</span>

  VPN 可能接管系统路由、DNS 或代理设置，也可能只代理部分流量；Charles 则依赖系统代理、证书信任和 App 是否允许被代理。应依次检查系统代理是否被 VPN 覆盖、流量路由、HTTPS 证书信任、证书固定（Certificate Pinning）及目标 App 的网络栈。

* <span style="color:purple; font-weight:bold;">**Git 可以在目录中出现嵌套仓库，但外层仓库不会递归管理内层仓库内容**。</span>

  > 直接 `git add` 一个带 `.git` 元数据的内层仓库时，Git 通常会警告这是 embedded repository；外层提交记录的不是内层完整历史和文件内容。需要稳定协作时，应明确选择子模块、子树、单一仓库或相互独立的仓库。

  在你的情况下，有几个备选的解决方案：

  * **子模块（Submodule）：**
    使用 Git 的子模块是一个常见的方法，可以将一个仓库嵌套到另一个仓库中。你可以将每个子文件夹作为一个独立的子模块。子模块允许你将其他Git仓库嵌套到你的项目中，每个子模块有自己的`.git`目录。
    在你的主项目目录中运行：

    ```bash
    git submodule add <repository-url> <path-to-submodule>
    ```

  其中，`<repository-url>` 是子模块的Git仓库地址，`<path-to-submodule>` 是子模块存储的目录路径。
  * **单一仓库：**
    如果你希望这三个子文件夹共享同一个Git仓库，而不是各自有独立的仓库，那么可以将它们合并为一个单一的Git仓库。将这三个子文件夹的内容复制到主项目目录下，然后使用一次性的 `git init` 进行初始化。

    ```bash
    cd <path-to>/main/project
    git init
    git add .
    git commit -m "Initial commit"
    ```

  这样，你的整个项目都在同一个仓库中了。
  * **多个独立仓库：**
  如果你希望保持这三个子文件夹的独立性，而且不希望使用子模块，你可以维护这四个仓库（主项目和三个子项目）作为独立的Git仓库。这样，你需要在每个子文件夹中独立进行版本控制。
  选择哪种方法取决于你的具体需求，每个方法都有其优劣之处。子模块通常用于处理外部依赖，而将所有内容放在一个仓库中可能更容易管理，但这也取决于你的项目结构和开发流程。

* <span style="color:purple; font-weight:bold;">**`ping`命令不应该包含协议（如HTTP）或端口号**。</span>因为它是一个基于网络层的命令，主要用于测试主机之间的连接。正确的`ping`命令格式是：

  ```bash
  ping 192.0.2.10
  ```
  如果要测试某个 TCP 端口是否能建立连接，可使用 macOS 自带的 `nc`：

  ```bash
  nc -vz 192.0.2.10 8070
  ```

* <span style="color:purple; font-weight:bold;">**浏览器访问 IP 地址时建议明确写出 URL Scheme**</span>

  现代浏览器可能优先尝试 HTTPS，也可能根据历史记录或安全策略升级协议，不能依赖“省略后一定默认 HTTP”。另外，HTTPS 证书通常按域名签发，直接访问 IP 时必须保证该 IP 位于证书的 Subject Alternative Name 中。

  ```text
  http://192.0.2.10
  https://192.0.2.10
  ```

* <span style="color:purple; font-weight:bold;">**配置 [GitHub SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) 可以通过 SSH 认证访问 GitHub 仓库。**</span>以下是配置步骤：

  * **生成SSH密钥：**
    打开终端（在Linux或macOS上）或Git Bash（在Windows上），然后运行以下命令生成SSH密钥：

    ```bash
    ssh-keygen -t ed25519 -C "your_email@example.com"
    ```

    替换`your_email@example.com`为您在GitHub上注册的电子邮件地址。

    按照提示，您可以选择性地输入文件名和密码。

    默认文件通常为 `id_ed25519` 和 `id_ed25519.pub`。旧环境不支持 Ed25519 时，再按 GitHub 官方建议使用 RSA 4096。
  * **将SSH密钥添加到ssh-agent（仅适用于Linux和macOS）：**如果您使用Linux或macOS，可以通过以下命令将SSH密钥添加到`ssh-agent`：

    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```

    如果生成密钥时选择了不同文件名，请使用对应路径。
  * **将SSH密钥添加到GitHub帐户：**复制SSH密钥的内容：

    ```bash
    cat ~/.ssh/id_ed25519.pub
    ```

    然后，将输出的公钥复制到GitHub上。
    登录GitHub，转到`Settings` > `SSH and GPG keys` > `New SSH key`，将公钥粘贴到"Key"字段中，并为密钥命名。
  * **测试SSH连接:**运行以下命令测试SSH连接：

    ```bash
    ssh -T git@github.com
    ```

  如果一切设置正确，您将看到一条欢迎消息，并确认连接成功；
  这样，您就成功配置了GitHub的SSH，可以通过SSH安全地与GitHub仓库通信，**而无需每次都输入用户名和密码**；
  请记住，安全性是关键，因此请**妥善保存私钥**，并避免在不受信任的地方使用私钥。

  * 受限网络可参考 GitHub 官方文档：[**Using SSH over the HTTPS port**](https://docs.github.com/en/authentication/troubleshooting-ssh/using-ssh-over-the-https-port)。

* <span style="color:purple; font-weight:bold;">**文件可以通过 `multipart/form-data` 编码放入 HTTP 请求体**</span>

  最常见的是 `POST`，但协议层并不限定只能与 `POST` 搭配；服务端接口也可以约定 `PUT` 或 `PATCH`。客户端必须使用正确的 `Content-Type` 与 boundary，并按接口约定处理字段名、文件名和 MIME Type。

* <span style="color:purple; font-weight:bold;">***iOS*推送通知：**</span>**向用户设备发送消息的机制，允许开发者在用户设备上显示提醒、声音和标志等通知**

  * **推送通知类型**：
    - **本地通知**：***由应用程序本身发出，无需连接到远程服务器***。本地通知可以在特定时间触发或在用户进入或退出特定地理位置时触发；

      调度前必须先通过 `UNUserNotificationCenter` 请求用户授权；下面的按钮方法假设授权流程已经完成。

      ```objective-c
      #import "ViewController.h"
      #import <UserNotifications/UserNotifications.h>

      @implementation ViewController

      - (void)viewDidLoad {
          [super viewDidLoad];
      }
      /**
          用户点击按钮时，将触发一个本地通知。
          本地通知的标题和正文内容已经设置，并且在 5 秒后触发。
          当用户收到通知时，设备将会播放默认提示音
      */
      - (IBAction)scheduleLocalNotification:(UIButton *)sender {
          UNMutableNotificationContent *content = UNMutableNotificationContent.new;
          content.title = @"本地通知标题";
          content.body = @"这是一个本地通知示例";
          content.sound = UNNotificationSound.defaultSound;
          // 触发时间为 5 秒后
          UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
          // 创建通知请求
          UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"localNotification"
                                                                                content:content
                                                                                trigger:trigger];
          // 将通知请求添加到用户通知中心
          [UNUserNotificationCenter.currentNotificationCenter addNotificationRequest:request
                                                               withCompletionHandler:^(NSError * _Nullable error) {
                      if (error) {
                  NSLog(@"添加本地通知请求出错：%@", error.localizedDescription);
              } else {
                  NSLog(@"本地通知请求已添加成功");
              }
          }];
      }

      @end
      ```

      ```swift
      import UIKit
      import UserNotifications

      @UIApplicationMain
      class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

          func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
              // 请求通知权限
              UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
                  if granted {
                      print("用户已授权通知权限")
                  } else {
                      print("用户未授权通知权限")
                  }
              }
              // 注册远程通知
              application.registerForRemoteNotifications()
              // 设置 UNUserNotificationCenterDelegate
              UNUserNotificationCenter.current().delegate = self
              return true
          }
          // 处理远程通知注册成功
          func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
              print("远程通知注册成功，设备令牌：\(deviceToken)")
              // 将设备令牌发送给后端服务器
          }
          // 处理远程通知注册失败
          func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
              print("远程通知注册失败：\(error.localizedDescription)")
          }
          // 接收远程通知
          func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
              print("接收到远程通知：\(notification.request.content.userInfo)")
              // 在此处理接收到的通知
              // 播放提示音
              completionHandler([.alert, .sound])
          }
          // iOS 10 及以上版本的接收远程通知的方法
          func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
              print("接收到远程通知响应：\(response.notification.request.content.userInfo)")
              // 在此处理接收到的通知响应
              completionHandler()
          }
      }
      ```

      通知授权不需要添加 `NSUserNotificationAlertStyle`，也与 `UIUserInterfaceStyle` 无关。权限请求应由代码在合适的业务时机触发，并先向用户解释用途。

      *在 **AppDelegate.m***中的`didFinishLaunchingWithOptions`方法内，添加如下代码：*

      ```objective-c
      [UNUserNotificationCenter.currentNotificationCenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
          if (granted) {
              NSLog(@"用户已授权通知权限");
          } else {
              NSLog(@"用户未授权通知权限");
          }
      }];
      ```

    - **远程通知**：***由远程服务器发出，通过苹果的 APNs 服务将通知发送到用户设备上***。远程通知允许开发者在应用程序不在前台时向用户发送消息；

  * **APNs 服务:** ***A***pple ***P***ush ***N***otification ***s***ervice

    > * 开发者需要为对应 Bundle ID 启用 Push Notifications，并在服务端使用 APNs Token Signing Key 或证书建立认证；Token 方案可服务多个 App，证书则与具体配置和有效期相关；
    > * 通过 **APNs** 服务，开发者可以向用户设备发送远程通知，并指定通知的内容、声音、标志等参数；

    ```json
    {
      "aps": {
        "alert": {
          "title": "远程通知标题",
          "body": "这是一个远程通知示例"
        },
        "badge": 1,
        "sound": "default"
      }
    }
    ```

    自定义声音时，把 `sound` 的值替换为 App 包内的声音文件名；同一个 JSON 对象中不能重复声明两个 `sound` 键，也不能写注释。

  * **推送通知的实现**：

    > * 在应用程序中配置推送通知的权限，并请求用户允许发送通知；
    > * 使用 Apple 提供的 ***UNUserNotificationCenter*** API 来请求用户的推送通知权限，并处理用户对通知的响应；
    > * 配置应用程序的通知设置，包括通知内容、声音、标志等；
    > * 在应用程序的远程服务器端生成和发送推送通知。服务器端通常使用推送通知服务商提供的 API 来与 APNs 服务器通信，如 ***F***irebase ***C***loud ***M***essaging（FCM）、***OneSignal*** 等；
    > * 接收到推送通知后，应用程序可以在前台或后台执行一些自定义逻辑，如更新界面、处理数据等；

    ```objective-c
    #import "AppDelegate.h"
    #import <UserNotifications/UserNotifications.h>

    @interface AppDelegate () <UNUserNotificationCenterDelegate>

    @end

    @implementation AppDelegate

    - (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
        // 请求通知权限
        [UNUserNotificationCenter.currentNotificationCenter requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge)
         completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                NSLog(@"用户已授权通知权限");
            } else {
                NSLog(@"用户未授权通知权限");
            }
        }];
        // 注册远程通知
        [UIApplication.sharedApplication registerForRemoteNotifications];
        // 设置 UNUserNotificationCenterDelegate
        UNUserNotificationCenter.currentNotificationCenter.delegate = self;
        return YES;
    }
    // 处理远程通知注册成功
    - (void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
        NSLog(@"远程通知注册成功，设备令牌：%@", deviceToken);
        // 将设备令牌发送给后端服务器
    }
    // 处理远程通知注册失败
    - (void)application:(UIApplication *)application
    didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
        NSLog(@"远程通知注册失败：%@", error.localizedDescription);
    }
    // 接收远程通知
    - (void)application:(UIApplication *)application
    didReceiveRemoteNotification:(NSDictionary *)userInfo
    fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
        NSLog(@"接收到远程通知：%@", userInfo);
        // 在此处理接收到的通知
        completionHandler(UIBackgroundFetchResultNewData);
    }
    // iOS 10 及以上版本的接收远程通知的方法
    - (void)userNotificationCenter:(UNUserNotificationCenter *)center
    didReceiveNotificationResponse:(UNNotificationResponse *)response
    withCompletionHandler:(void (^)(void))completionHandler {
        NSLog(@"接收到远程通知响应：%@", response.notification.request.content.userInfo);
        // 在此处理接收到的通知响应
        completionHandler();
    }

    @end
    ```

  * **推送通知的处理**：
    - 当用户收到推送通知时，通知会显示在设备的通知中心，并发出声音和/或振动。用户可以点击通知来打开应用程序或执行其他操作；
    - 应用程序可以在接收到推送通知时执行自定义操作，如展示特定界面、更新数据等；
  * **注意事项**：
    - 推送通知的发送需要注意用户隐私和数据保护法规，确保用户的个人数据不被滥用；
    - 在发送推送通知时，需要考虑用户体验，避免发送过多或无关紧要的通知，以免打扰用户；


<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
