//
//  JobsDefineGestureProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineGestureProtocol_h
#define JobsDefineGestureProtocol_h

#ifndef GestureProtocol_synthesize
#define GestureProtocol_synthesize \
\
@synthesize minimumNumberOfTouches = _minimumNumberOfTouches; \
@synthesize maximumNumberOfTouches = _maximumNumberOfTouches; \
@synthesize numberOfTapsRequired = _numberOfTapsRequired; \
@synthesize numberOfTouchesRequired = _numberOfTouchesRequired; \
@synthesize minimumPressDuration = _minimumPressDuration; \
@synthesize allowableMovement = _allowableMovement; \
@synthesize swipeGRDirection = _swipeGRDirection; \
@synthesize allowedScrollTypesMask = _allowedScrollTypesMask; \
@synthesize scale = _scale; \
@synthesize rotate = _rotate; \
\
@synthesize longPressGR = _longPressGR; \
@synthesize tapGR = _tapGR; \
@synthesize doubleTapGR = _doubleTapGR; \
@synthesize swipeGR = _swipeGR; \
@synthesize panGR = _panGR; \
@synthesize pinchGR = _pinchGR; \
@synthesize rotationGR = _rotationGR; \
@synthesize screenEdgePanGR = _screenEdgePanGR; \
\
@synthesize longPressGR_SelImp = _longPressGR_SelImp; \
@synthesize tapGR_SelImp = _tapGR_SelImp; \
@synthesize doubleTapGR_SelImp = _doubleTapGR_SelImp; \
@synthesize swipeGR_SelImp = _swipeGR_SelImp; \
@synthesize panGR_SelImp = _panGR_SelImp; \
@synthesize pinchGR_SelImp = _pinchGR_SelImp; \
@synthesize rotationGR_SelImp = _rotationGR_SelImp; \
@synthesize screenEdgePanGR_SelImp = _screenEdgePanGR_SelImp; \

#endif /* GestureProtocol_synthesize */

#ifndef GestureProtocol_dynamic
#define GestureProtocol_dynamic \
\
@dynamic minimumNumberOfTouches; \
@dynamic maximumNumberOfTouches; \
@dynamic numberOfTapsRequired; \
@dynamic numberOfTouchesRequired; \
@dynamic minimumPressDuration; \
@dynamic allowableMovement; \
@dynamic swipeGRDirection; \
@dynamic allowedScrollTypesMask; \
@dynamic scale; \
@dynamic rotate; \
\
@dynamic longPressGR; \
@dynamic tapGR; \
@dynamic doubleTapGR; \
@dynamic swipeGR; \
@dynamic panGR; \
@dynamic pinchGR; \
@dynamic rotationGR; \
@dynamic screenEdgePanGR; \
\
@dynamic longPressGR_SelImp; \
@dynamic tapGR_SelImp; \
@dynamic doubleTapGR_SelImp; \
@dynamic swipeGR_SelImp; \
@dynamic panGR_SelImp; \
@dynamic pinchGR_SelImp; \
@dynamic rotationGR_SelImp; \
@dynamic screenEdgePanGR_SelImp; \

#endif /* GestureProtocol_dynamic */

#endif /* JobsDefineGestureProtocol_h */
