//
//  JobsResponseModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "NetworkingConstant.h"
#import "NSObject+Data.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
/// 后端按照标准格式返回的最外层的数据。通常我们锚定data进行解析
@interface JobsResponseModel : NSObject

Prop_assign()HTTPResponseCode code;
Prop_copy()NSString *msg;
Prop_strong()id data;

@end

NS_ASSUME_NONNULL_END
