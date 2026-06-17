//
//  UITextFieldModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextFieldModel : BaseModel <UITextFieldProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UITextFieldModel *_Nonnull jobsMakeTextFieldModel(jobsByTextFieldModelBlock _Nonnull block){
    UITextFieldModel *data = UITextFieldModel.alloc.init;
    if (block) block(data);
    return data;
}
