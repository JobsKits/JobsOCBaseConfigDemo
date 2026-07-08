//
//  JobsDefineYTKCustomBaseRequestProtocol.h
//  JobsOCDefs
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineYTKCustomBaseRequestProtocol_h
#define JobsDefineYTKCustomBaseRequestProtocol_h

#ifndef YTKCustomBaseRequestProtocol_synthesize
#define YTKCustomBaseRequestProtocol_synthesize \
\
@synthesize urlParameters = _urlParameters;\
@synthesize parameters = _parameters;\
@synthesize customHTTPHeader = _customHTTPHeader;\

#endif /* YTKCustomBaseRequestProtocol_synthesize */

#ifndef YTKCustomBaseRequestProtocol_dynamic
#define YTKCustomBaseRequestProtocol_dynamic \
\
@dynamic urlParameters;\
@dynamic parameters;\
@dynamic customHTTPHeader;\

#endif /* YTKCustomBaseRequestProtocol_dynamic */

#endif /* JobsDefineYTKCustomBaseRequestProtocol_h */
