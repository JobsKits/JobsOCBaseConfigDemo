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
    return JobsOCCommentModel.new
        .byMessageID(self.jobs_normalizedStringBy(messageID))
        .byUserAvatar(self.jobs_normalizedStringBy(userAvatar))
        .byNickname(self.jobs_normalizedStringBy(nickname))
        .byReplyID(self.jobs_normalizedStringBy(replyID))
        .byReplyUserName(self.jobs_normalizedStringBy(replyUserName))
        .byPublishTime(self.jobs_normalizedStringBy(publishTime))
        .byContent(self.jobs_normalizedStringBy(content))
        .byDevice(self.jobs_normalizedStringBy(device))
        .byLocation(self.jobs_normalizedStringBy(location))
        .byChildren(self.jobs_validChildrenBy(children));
}

#define JobsOCCommentModelStringDSL(_name_, _property_) \
-(JobsRetJobsOCCommentModelByStrBlock _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCCommentModel *_Nullable(NSString *_Nullable data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JobsOCCommentModelStringDSL(MessageID, messageID)
JobsOCCommentModelStringDSL(UserAvatar, userAvatar)
JobsOCCommentModelStringDSL(Nickname, nickname)
JobsOCCommentModelStringDSL(ReplyID, replyID)
JobsOCCommentModelStringDSL(ReplyUserName, replyUserName)
JobsOCCommentModelStringDSL(PublishTime, publishTime)
JobsOCCommentModelStringDSL(Content, content)
JobsOCCommentModelStringDSL(Device, device)
JobsOCCommentModelStringDSL(Location, location)

#undef JobsOCCommentModelStringDSL

-(JobsRetJobsOCCommentModelByArrBlock _Nonnull)byChildren{
    @jobs_weakify(self)
    return ^__kindof JobsOCCommentModel *_Nullable(NSArray<JobsOCCommentModel *> *_Nullable data){
        @jobs_strongify(self)
        self.children = data;
        return self;
    };
}

+(JobsRetStrByIDBlock _Nonnull)jobs_normalizedStringBy{
    return ^NSString *(id data){
        if (![data isKindOfClass:NSString.class]) return @"";
        return [(NSString *)data stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet] ? : @"";
    };
}

+(JobsRetNSArrayJobsOCCommentModelByNSArrayBlock _Nonnull)jobs_validChildrenBy{
    return ^NSArray <JobsOCCommentModel *>*(NSArray * children){
        if (![children isKindOfClass:NSArray.class]) return @[];
        NSMutableArray <JobsOCCommentModel *>*result = NSMutableArray.array;
        for (id child in children) {
            if (![child isKindOfClass:JobsOCCommentModel.class]) continue;
            [result addObject:child];
        };return result.copy;
    };
}

-(NSArray<JobsOCCommentModel *> *)children{
    return _children ? : @[];
}

-(JobsRetBOOLByVoidBlock _Nonnull)hasChildComments{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.children.count > 0;
    };
}

@end
