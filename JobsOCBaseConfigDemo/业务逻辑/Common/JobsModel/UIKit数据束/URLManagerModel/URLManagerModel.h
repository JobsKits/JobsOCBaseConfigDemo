//
//  URLManagerModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN
/// 建立此类的目的：防止外层调用funcName的时候因为手滑出错不易检查，导致崩溃
@interface URLManagerModel : BaseModel

Prop_copy()NSString *url;
Prop_copy()NSString *funcName;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof URLManagerModel *_Nonnull jobsMakeURLManagerModel(jobsByURLManagerModelBlock _Nonnull block){
    URLManagerModel *data = URLManagerModel.alloc.init;
    if (block) block(data);
    return data;
}
