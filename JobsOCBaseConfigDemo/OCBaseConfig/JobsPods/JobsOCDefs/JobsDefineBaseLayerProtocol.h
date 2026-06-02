//
//  JobsDefineBaseLayerProtocol.h
//  JobsOCDefs
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineBaseLayerProtocol_h
#define JobsDefineBaseLayerProtocol_h

#ifndef BaseLayerProtocol_synthesize_part1
#define BaseLayerProtocol_synthesize_part1 \
\
@synthesize layerBorderCor = _layerBorderCor;\

#endif /* BaseLayerProtocol_synthesize_part1 */

#ifndef BaseLayerProtocol_synthesize_part2
#define BaseLayerProtocol_synthesize_part2 \
\
@synthesize borderWidth = _borderWidth;\

#endif /* BaseLayerProtocol_synthesize_part2 */

#ifndef BaseLayerProtocol_synthesize_part3
#define BaseLayerProtocol_synthesize_part3 \
\
@synthesize cornerRadiusValue = _cornerRadiusValue;\
@synthesize masksToBounds = _masksToBounds;\
@synthesize roundingCorners = _roundingCorners;\
@synthesize roundingCornersRadii = _roundingCornersRadii;\

#endif /* BaseLayerProtocol_synthesize_part3 */

#ifndef BaseLayerProtocol_synthesize
#define BaseLayerProtocol_synthesize \
\
BaseLayerProtocol_synthesize_part1 \
BaseLayerProtocol_synthesize_part2 \
BaseLayerProtocol_synthesize_part3 \

#endif /* BaseLayerProtocol_synthesize */

#ifndef BaseLayerProtocol_dynamic
#define BaseLayerProtocol_dynamic \
\
@dynamic layerBorderCor;\
@dynamic borderWidth;\
@dynamic cornerRadiusValue;\
@dynamic masksToBounds;\
@dynamic roundingCorners;\
@dynamic roundingCornersRadii;\

#endif /* BaseLayerProtocol_dynamic */

#endif /* JobsDefineBaseLayerProtocol_h */
