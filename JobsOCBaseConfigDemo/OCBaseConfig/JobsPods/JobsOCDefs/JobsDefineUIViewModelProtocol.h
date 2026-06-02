//
//  JobsDefineUIViewModelProtocol.h
//  JobsOCDefs
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineUIViewModelProtocol_h
#define JobsDefineUIViewModelProtocol_h

#ifndef UIViewModelProtocol_synthesize_part1
#define UIViewModelProtocol_synthesize_part1 \
\
@synthesize jobsBlock = _jobsBlock; \
@synthesize jobsBlockMutArr = _jobsBlockMutArr; \
@synthesize normalImageURLString = _normalImageURLString; \
@synthesize normalImageURL = _normalImageURL; \
@synthesize normalBgImageURLString = _normalBgImageURLString; \
@synthesize normalBgImageURL = _normalBgImageURL; \
@synthesize titleImage = _titleImage; \
@synthesize masonryBlock = _masonryBlock; \
@synthesize imageViewFrame = _imageViewFrame; \

#endif /* UIViewModelProtocol_synthesize_part1 */
/// 继承的属性（避免冲突）
#ifndef UIViewModelProtocol_synthesize_part2
#define UIViewModelProtocol_synthesize_part2 \
\
UIViewModelOthersProtocol_synthesize \
UIPictureAndBackGroundCorProtocol_synthesize \
UILocationProtocol_synthesize \
UIMarkProtocol_synthesize_part1 \
UITextModelProtocol_synthesize_part3 \
BaseLayerProtocol_synthesize_part2 \
UITextFieldProtocol_synthesize_part2 \

#endif /* UIViewModelProtocol_synthesize_part2 */

#ifndef UIViewModelProtocol_synthesize_part3
#define UIViewModelProtocol_synthesize_part3 \
\
@synthesize layerBorderCor = _layerBorderCor;\

#endif /* UIViewModelProtocol_synthesize_part3 */

#ifndef UIViewModelProtocol_synthesize
#define UIViewModelProtocol_synthesize \
\
BaseProtocol_synthesize \
RACProtocol_synthesize \
UIViewModelProtocol_synthesize_part1 \
UIViewModelProtocol_synthesize_part2 \

#endif /* UIViewModelProtocol_synthesize */

#ifndef UIViewModelProtocol_dynamic_part1
#define UIViewModelProtocol_dynamic_part1 \
\
@dynamic jobsBlock;\
@dynamic jobsBlockMutArr;\
@dynamic normalImageURLString;\
@dynamic normalImageURL;\
@dynamic normalBgImageURLString;\
@dynamic normalBgImageURL;\
@dynamic titleImage;\
@dynamic masonryBlock;\
@dynamic imageViewFrame;\

#endif /* UIViewModelProtocol_dynamic_part1 */

#endif /* JobsDefineUIViewModelProtocol_h */
