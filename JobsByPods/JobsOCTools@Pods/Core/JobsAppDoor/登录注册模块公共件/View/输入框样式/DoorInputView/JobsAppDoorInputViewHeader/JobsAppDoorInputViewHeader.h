//
//  JobsAppDoorInputViewHeader.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#ifndef JobsAppDoorInputViewHeader_h
#define JobsAppDoorInputViewHeader_h

NS_INLINE CGSize inputSize(void){
    return CGSizeMake(JobsWidth(343), JobsWidth(52));
}

NS_INLINE CGSize inputSize_02(void){
    return CGSizeMake(JobsWidth(303 - 50), JobsWidth(36));
}

#import <JobsOCTools/JobsAppDoorInputViewBaseStyle.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_1.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_2.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_3.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_4.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_5.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_6.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_7.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_8.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_9.h>
#import <JobsOCTools/JobsAppDoorInputViewBaseStyle_10.h>

#endif /* JobsAppDoorInputViewHeader_h */
