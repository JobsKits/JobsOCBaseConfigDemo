//
//  JobsDefineStructs.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineStructs_h
#define JobsDefineStructs_h
/// 这样写的话，外面可以JobsIndexPath.section 进行调用
#ifndef JOBS_INDEX_PATH_STRUCT_DEFINED
#define JOBS_INDEX_PATH_STRUCT_DEFINED
typedef struct {
    NSInteger section;
    NSInteger rowOrItem;
} JobsIndexPath;
#endif /* JOBS_INDEX_PATH_STRUCT_DEFINED */
/// 网络数据
#ifndef JOBS_NETWORK_BYTES_DEFINED
#define JOBS_NETWORK_BYTES_DEFINED
typedef struct {
    uint64_t download;   // 下行总字节
    uint64_t upload;     // 上行总字节
} JobsNetworkBytes;
#endif /* JOBS_NETWORK_BYTES_DEFINED */

#endif /* JobsDefineStructs_h */
