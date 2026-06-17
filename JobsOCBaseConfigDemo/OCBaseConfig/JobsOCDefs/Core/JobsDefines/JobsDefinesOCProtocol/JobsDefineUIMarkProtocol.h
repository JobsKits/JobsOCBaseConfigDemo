//
//  JobsDefineUIMarkProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineUIMarkProtocol_h
#define JobsDefineUIMarkProtocol_h

#ifndef UIMarkProtocol_synthesize_part1
#define UIMarkProtocol_synthesize_part1 \
\
@synthesize indexPath = _indexPath; \
@synthesize lastPoint = _lastPoint; \
@synthesize index = _index; \
@synthesize currentPage = _currentPage; \
@synthesize pageSize = _pageSize; \
@synthesize pageNum = _pageNum; \
@synthesize isMark = _isMark; \
@synthesize presentUpHeight = _presentUpHeight; \

#endif /* UIMarkProtocol_synthesize_part1 */

#ifndef UIMarkProtocol_synthesize_part2
#define UIMarkProtocol_synthesize_part2 \
\
@synthesize section = _section; \
@synthesize row = _row; \
@synthesize item = _item; \

#endif /* UIMarkProtocol_synthesize_part2 */

#ifndef UIMarkProtocol_synthesize
#define UIMarkProtocol_synthesize \
\
UIMarkProtocol_synthesize_part1 \
UIMarkProtocol_synthesize_part2

#endif /* UIMarkProtocol_synthesize */

#ifndef UIMarkProtocol_dynamic_part1
#define UIMarkProtocol_dynamic_part1 \
\
@dynamic section; \
@dynamic item; \
@dynamic row; \

#endif /* UIMarkProtocol_dynamic_part1 */

#ifndef UIMarkProtocol_dynamic_part2
#define UIMarkProtocol_dynamic_part2 \
\
@dynamic indexPath; \
@dynamic lastPoint; \
@dynamic index; \
@dynamic currentPage; \
@dynamic pageSize; \
@dynamic pageNum; \
@dynamic isMark; \
@dynamic presentUpHeight; \

#endif /* UIMarkProtocol_dynamic_part2 */

#ifndef UIMarkProtocol_dynamic
#define UIMarkProtocol_dynamic \
\
UIMarkProtocol_dynamic_part1 \
UIMarkProtocol_dynamic_part2 \

#endif /* UIMarkProtocol_dynamic */

//item

#endif /* JobsDefineUIMarkProtocol_h */
