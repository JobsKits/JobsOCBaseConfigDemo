//
//  JobsOCPatchMgr.h
//  JobsOCPatch
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "JobsOCPatchModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCPatchMgr : NSObject

+(instancetype)shared;

-(BOOL)installPayloadPatch:(JobsOCPatchModel *)patch;
-(BOOL)rollbackPatchByIdentifier:(NSString *)identifier;
-(void)rollbackAllPatches;
-(BOOL)containsPatchByIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
