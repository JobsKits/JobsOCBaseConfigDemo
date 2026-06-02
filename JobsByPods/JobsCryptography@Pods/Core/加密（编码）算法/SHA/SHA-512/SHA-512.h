//
//  SHA-512.h
//  JobsCryptography
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_SHA_512_C2E8FE30D0
#define JOBS_HEADER_GUARD_SHA_512_C2E8FE30D0

NS_INLINE NSString *SHA_512(NSString *string){
    const char *cstr = [string cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:string.length];
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(data.bytes, (CC_LONG)data.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }return output;
}
#endif /* JOBS_HEADER_GUARD_SHA_512_C2E8FE30D0 */
