//
//  JobsDefineBaseViewControllerProtocol.h
//  JobsOCDefs
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineBaseViewControllerProtocol_h
#define JobsDefineBaseViewControllerProtocol_h

#ifndef BaseViewControllerProtocol_synthesize_part1
#define BaseViewControllerProtocol_synthesize_part1 \
\
@synthesize navBar = _navBar;\
@synthesize navBarConfig = _navBarConfig;\

#endif /* BaseViewControllerProtocol_synthesize_part1 */

#ifndef BaseViewControllerProtocol_synthesize
#define BaseViewControllerProtocol_synthesize \
\
@synthesize fromVC = _fromVC;\
@synthesize alertController = _alertController;\
@synthesize pushOrPresent = _pushOrPresent;\
@synthesize setupNavigationBarHidden = _setupNavigationBarHidden;\
@synthesize LoadView = _LoadView;\
@synthesize ViewDidLoad = _ViewDidLoad;\
@synthesize ViewWillAppear = _ViewWillAppear;\
@synthesize ViewDidAppear = _ViewDidAppear;\
@synthesize ViewWillDisappear = _ViewWillDisappear;\
@synthesize ViewDidDisappear = _ViewDidDisappear;\
@synthesize statusBar = _statusBar;\
@synthesize leftBarButtonItems = _leftBarButtonItems;\
@synthesize rightBarButtonItems = _rightBarButtonItems;\
@synthesize vcs = _vcs;\
@synthesize barButtonItem = _barButtonItem;\

#endif /* BaseViewControllerProtocol_synthesize */

#ifndef BaseViewControllerProtocol_dynamic
#define BaseViewControllerProtocol_dynamic \
\
@dynamic fromVC;\
@dynamic alertController;\
@dynamic pushOrPresent;\
@dynamic setupNavigationBarHidden;\
@dynamic ViewAppear;\
@dynamic LoadView;\
@dynamic ViewDidLoad;\
@dynamic ViewWillAppear;\
@dynamic ViewDidAppear;\
@dynamic ViewWillDisappear;\
@dynamic ViewDidDisappear;\
@dynamic statusBar;\
@dynamic leftBarButtonItems;\
@dynamic rightBarButtonItems;\
@dynamic navBarConfig;\
@dynamic navBar;\
@dynamic vcs;\
@dynamic barButtonItem;\

#endif /* BaseViewControllerProtocol_dynamic */

#endif /* JobsDefineBaseViewControllerProtocol_h */
