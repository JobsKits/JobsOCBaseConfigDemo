//
//  CaesarCipher.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CAESARCIPHER_609E436E8D
#define JOBS_HEADER_GUARD_CAESARCIPHER_609E436E8D

#import <Foundation/Foundation.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

/// 凯撒加密
NS_INLINE NSString *caesardDecode(NSString *string){
    NSString *originalStr = string;
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0 ;i <originalStr.length; i++){
        unichar asciiCode = [originalStr characterAtIndex:i];
        // 右偏移3个单位
       asciiCode += 3;
        // 注意：此处必须使用%C 不能用%c，否则会有乱码！
        NSString *encryptStr = [NSString stringWithFormat:@"%C", asciiCode];
        [arr addObject:encryptStr];
    }
    // 加密结果
    NSString *encodeStr = [arr componentsJoinedByString:@"".tr];
    return encodeStr;
}
/// 凯撒解密
NS_INLINE NSString *caesarEncrypt(NSString *encodeStr){
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0 ;i < encodeStr.length; i++){
        unichar asciiCode = [encodeStr characterAtIndex:i];
        // 左偏移3个单位（和加密相反即可）
        asciiCode -= 3;
        // 注意：此处必须使用%C 不能用%c，否则会有乱码！
        NSString *encryptStr = [NSString stringWithFormat:@"%C", asciiCode];
        [arr addObject:encryptStr];
    }
    // 解密结果
    NSString *decodeStr = [arr componentsJoinedByString:@"".tr];
    return decodeStr;
}

#endif /* JOBS_HEADER_GUARD_CAESARCIPHER_609E436E8D */
