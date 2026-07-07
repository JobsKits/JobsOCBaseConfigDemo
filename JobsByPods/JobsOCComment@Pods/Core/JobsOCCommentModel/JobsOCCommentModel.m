//
//  JobsOCCommentModel.m
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCCommentModel.h"

@implementation JobsOCCommentModel

+(instancetype)commentWithMessageID:(NSString *)messageID
                         userAvatar:(NSString *)userAvatar
                           nickname:(NSString *)nickname
                             replyID:(NSString *)replyID
                       replyUserName:(NSString *)replyUserName
                         publishTime:(NSString *)publishTime
                             content:(NSString *)content
                              device:(NSString *)device
                            location:(NSString *)location
                            children:(NSArray<JobsOCCommentModel *> *)children{
    JobsOCCommentModel *model = JobsOCCommentModel.new;
    model.messageID = [self jobs_normalizedStringBy:messageID];
    model.userAvatar = [self jobs_normalizedStringBy:userAvatar];
    model.nickname = [self jobs_normalizedStringBy:nickname];
    model.replyID = [self jobs_normalizedStringBy:replyID];
    model.replyUserName = [self jobs_normalizedStringBy:replyUserName];
    model.publishTime = [self jobs_normalizedStringBy:publishTime];
    model.content = [self jobs_normalizedStringBy:content];
    model.device = [self jobs_normalizedStringBy:device];
    model.location = [self jobs_normalizedStringBy:location];
    model.children = [self jobs_validChildrenBy:children];
    return model;
}

+(NSString *)jobs_normalizedStringBy:(id)data{
    if (![data isKindOfClass:NSString.class]) return @"";
    return [(NSString *)data stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
}

+(NSArray <JobsOCCommentModel *>*)jobs_validChildrenBy:(NSArray *)children{
    if (![children isKindOfClass:NSArray.class]) return @[];
    NSMutableArray <JobsOCCommentModel *>*result = NSMutableArray.array;
    for (id child in children) {
        if (![child isKindOfClass:JobsOCCommentModel.class]) continue;
        [result addObject:child];
    };return result.copy;
}

-(NSArray<JobsOCCommentModel *> *)children{
    return _children ? : @[];
}

-(BOOL)hasChildComments{
    return self.children.count > 0;
}

@end
