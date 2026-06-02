//
//  ASDisplayNodeTestsHelper.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/ASDimension.h>

@class ASCATransactionQueue, ASDisplayNode;

typedef BOOL (^as_condition_block_t)(void);

ASDK_EXTERN BOOL ASDisplayNodeRunRunLoopUntilBlockIsTrue(as_condition_block_t block);

ASDK_EXTERN void ASDisplayNodeSizeToFitSize(ASDisplayNode *node, CGSize size);
ASDK_EXTERN void ASDisplayNodeSizeToFitSizeRange(ASDisplayNode *node, ASSizeRange sizeRange);
ASDK_EXTERN void ASCATransactionQueueWait(ASCATransactionQueue *q); // nil means shared queue
