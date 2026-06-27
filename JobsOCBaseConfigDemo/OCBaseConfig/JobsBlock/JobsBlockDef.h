//
//  JobsBlockDef.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#ifndef JobsBlockDef_h
#define JobsBlockDef_h
/// 主动调用宏，传入2个参数
#ifndef Jobs_2_Arguments
#define Jobs_2_Arguments \
    id _Nullable data, \
    id _Nullable data2
#endif /* Jobs_2_Arguments */
/// 主动调用宏，传入3个参数
#ifndef Jobs_3_Arguments
#define Jobs_3_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3
#endif /* Jobs_3_Arguments */
/// 主动调用宏，传入4个参数
#ifndef Jobs_4_Arguments
#define Jobs_4_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4
#endif /* Jobs_4_Arguments */
/// 主动调用宏，传入5个参数
#ifndef Jobs_5_Arguments
#define Jobs_5_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5
#endif /* Jobs_5_Arguments */
/// 主动调用宏，传入6个参数
#ifndef Jobs_6_Arguments
#define Jobs_6_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6
#endif /* Jobs_6_Arguments */
/// 主动调用宏，传入7个参数
#ifndef Jobs_7_Arguments
#define Jobs_7_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6, \
    id _Nullable data7
#endif /* Jobs_7_Arguments */
/// 主动调用宏，传入8个参数
#ifndef Jobs_8_Arguments
#define Jobs_8_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6, \
    id _Nullable data7, \
    id _Nullable data8
#endif /* Jobs_8_Arguments */
/// 主动调用宏，传入9个参数
#ifndef Jobs_9_Arguments
#define Jobs_9_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6, \
    id _Nullable data7, \
    id _Nullable data8, \
    id _Nullable data9
#endif /* Jobs_9_Arguments */
/// 主动调用宏，传入10个参数
#ifndef Jobs_10_Arguments
#define Jobs_10_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    id _Nullable data3, \
    id _Nullable data4, \
    id _Nullable data5, \
    id _Nullable data6, \
    id _Nullable data7, \
    id _Nullable data8, \
    id _Nullable data9, \
    id _Nullable data10
#endif /* Jobs_10_Arguments */
/// 主文字内容、字体大小
#ifndef Jobs_Title_Font_Arguments
#define Jobs_Title_Font_Arguments \
    __kindof NSString *_Nonnull title, \
    UIFont *_Nullable font
#endif /* Jobs_Title_Font_Arguments */
/// 主文字内容、字体大小、主文字颜色
#ifndef Jobs_Title_Font_TitleCor_Arguments
#define Jobs_Title_Font_TitleCor_Arguments \
    __kindof NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor
#endif /* Jobs_Title_Font_TitleCor_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片、图片和文字的位置关系、x
#ifndef Jobs_Title_Font_TitleCor_Image_imagePlacement_X_Arguments
#define Jobs_Title_Font_TitleCor_Image_imagePlacement_X_Arguments \
    __kindof NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image, \
    NSDirectionalRectEdge imagePlacement, \
    CGFloat x
#endif /* Jobs_Title_Font_TitleCor_Image_imagePlacement_X_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片、图文距离
#ifndef Jobs_Title_Font_TitleCor_Image_X_Arguments
#define Jobs_Title_Font_TitleCor_Image_X_Arguments \
    __kindof NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image, \
    CGFloat x
#endif /* Jobs_Title_Font_TitleCor_Image_X_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片
#ifndef Jobs_Title_Font_TitleCor_Image_Arguments
#define Jobs_Title_Font_TitleCor_Image_Arguments \
    __kindof NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image
#endif /* Jobs_Title_Font_TitleCor_Image_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片、按钮背景图片、图片和文字的位置关系
#ifndef Jobs_Title_Font_TitleCor_Image_BackgroundImage_ImagePlacement_Arguments
#define Jobs_Title_Font_TitleCor_Image_BackgroundImage_ImagePlacement_Arguments \
    __kindof NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image, \
    UIImage *_Nonnull backgroundImage, \
    NSDirectionalRectEdge imagePlacement
#endif /* Jobs_Title_Font_TitleCor_Image_BackgroundImage_ImagePlacement_Arguments */
/// 主文字内容、字体大小、主文字颜色、按钮图片、图文相对位置、图文距离
#ifndef Jobs_Title_Font_TitleCor_Image_DirectionalRectEdge_X_Arguments
#define Jobs_Title_Font_TitleCor_Image_DirectionalRectEdge_X_Arguments \
    __kindof NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable titleCor, \
    UIImage *_Nonnull image, \
    NSDirectionalRectEdge directionalRectEdge, \
    CGFloat x
#endif /* Jobs_Title_Font_TitleCor_Image_DirectionalRectEdge_X_Arguments */

#ifndef Jobs_WKNavigationDelegate_Arguments
#define Jobs_WKNavigationDelegate_Arguments \
    WKNavigationActionPolicy policy, \
    WKWebpagePreferences *_Nullable preferences
#endif /* Jobs_WKNavigationDelegate_Arguments */

#ifndef Jobs_NavBarConfig_Title_Action_Arguments
#define Jobs_NavBarConfig_Title_Action_Arguments \
    NSString *_Nullable string, \
    JobsRetIDByIDBlock _Nullable backActionBlock
#endif /* Jobs_NavBarConfig_Title_Action_Arguments */

#ifndef Jobs_NavBarConfig_Titles_Action_Arguments
#define Jobs_NavBarConfig_Titles_Action_Arguments \
    NSString *_Nullable title, \
    NSString *_Nullable backTitle, \
    JobsRetIDByIDBlock _Nullable backActionBlock
#endif /* Jobs_NavBarConfig_Titles_Action_Arguments */

#ifndef Jobs_NavBarConfig_BackBtnModel_CloseBtnModel_Arguments
#define Jobs_NavBarConfig_BackBtnModel_CloseBtnModel_Arguments \
    UIButtonModel *_Nullable backBtnModel, \
    UIButtonModel *_Nullable closeBtnModel
#endif /* Jobs_NavBarConfig_BackBtnModel_CloseBtnModel_Arguments */

#ifndef Jobs_ViewArrayRowsColumnsBlock_Arguments
#define Jobs_ViewArrayRowsColumnsBlock_Arguments \
    __kindof NSArray <__kindof UIView *>*_Nullable arr, \
    NSInteger rows, \
    NSInteger columns
#endif /* Jobs_ViewArrayRowsColumnsBlock_Arguments */

#ifndef Jobs_KeyValueBlock_Arguments
#define Jobs_KeyValueBlock_Arguments \
    id <NSCopying>_Nonnull key, \
    id _Nonnull value
#endif /* Jobs_KeyValueBlock_Arguments */

#ifndef Jobs_Key_ValueBlock_Arguments
#define Jobs_Key_ValueBlock_Arguments \
    __kindof NSString *_Nonnull key, \
    id _Nullable value
#endif /* Jobs_Key_ValueBlock_Arguments */

#ifndef Jobs_JSCompletionHandlerBlock_Arguments
#define Jobs_JSCompletionHandlerBlock_Arguments \
    id _Nullable result, \
    NSError *_Nullable error
#endif /* Jobs_JSCompletionHandlerBlock_Arguments */

#ifndef Jobs_UITableViewHeaderFooterViewBlock_Arguments
#define Jobs_UITableViewHeaderFooterViewBlock_Arguments \
    Class _Nonnull cls, \
    __kindof NSString *_Nullable salt
#endif /* Jobs_UITableViewHeaderFooterViewBlock_Arguments */

#ifndef Jobs_UITableViewHeaderFooterViewBlock2_Arguments
#define Jobs_UITableViewHeaderFooterViewBlock2_Arguments \
    __kindof UITableView *_Nullable tableView, \
    __kindof NSString *_Nullable salt
#endif /* Jobs_UITableViewHeaderFooterViewBlock2_Arguments */

#ifndef Jobs_UITableViewCellBlock_Arguments
#define Jobs_UITableViewCellBlock_Arguments \
    Class _Nonnull cls, \
    __kindof NSString *_Nullable salt, \
    NSIndexPath *_Nonnull indexPath
#endif /* Jobs_UITableViewCellBlock_Arguments */

#ifndef Jobs_NSStringBlock_1_Arguments
#define Jobs_NSStringBlock_1_Arguments \
    __kindof NSArray *_Nullable arr, \
    NSInteger index
#endif /* Jobs_NSStringBlock_1_Arguments */

#ifndef Jobs_NSStringBlock_2_Arguments
#define Jobs_NSStringBlock_2_Arguments \
    NSTimeInterval data, \
    NSDateFormatter *_Nullable dateFormatter
#endif /* Jobs_NSStringBlock_2_Arguments */

#ifndef Jobs_NSStringBlock_3_Arguments
#define Jobs_NSStringBlock_3_Arguments \
    __kindof NSString *_Nullable fontString, \
    __kindof NSString *_Nullable tailString
#endif /* Jobs_NSStringBlock_3_Arguments */

#ifndef Jobs_UIColorBlock_Arguments
#define Jobs_UIColorBlock_Arguments \
    uint32_t hexValue, \
    CGFloat alpha
#endif /* Jobs_UIColorBlock_Arguments */

#ifndef Jobs_ReturnIDByCenterBlock_Arguments
#define Jobs_ReturnIDByCenterBlock_Arguments \
    CGFloat x, \
    CGFloat y
#endif /* Jobs_ReturnIDByCenterBlock_Arguments */

#ifndef Jobs_ReturnButtonModelByStringAndImagesBlock_Arguments
#define Jobs_ReturnButtonModelByStringAndImagesBlock_Arguments \
    __kindof NSString *_Nullable title, \
    UIImage *_Nullable image, \
    UIImage *_Nullable highlightImage
#endif /* Jobs_ReturnButtonModelByStringAndImagesBlock_Arguments */

#ifndef Jobs_ReturnButtonByImagePlacementAndPaddingBlock_Arguments
#define Jobs_ReturnButtonByImagePlacementAndPaddingBlock_Arguments \
    NSDirectionalRectEdge data, \
    CGFloat x
#endif /* Jobs_ReturnButtonByImagePlacementAndPaddingBlock_Arguments */

#ifndef Jobs_ReturnButtonByColor_FloatBlock_Arguments
#define Jobs_ReturnButtonByColor_FloatBlock_Arguments \
    UIColor *_Nullable cor, \
    float borderWidth
#endif /* Jobs_ReturnButtonByColor_FloatBlock_Arguments */

#ifndef Jobs_ReturnButtonByAttributedStringsBlock_Arguments
#define Jobs_ReturnButtonByAttributedStringsBlock_Arguments \
    NSAttributedString *_Nonnull title, \
    NSAttributedString *_Nonnull subTitle
#endif /* Jobs_ReturnButtonByAttributedStringsBlock_Arguments */

#ifndef Jobs_ReturnMutableDicByKeyValueBlock_Arguments
#define Jobs_ReturnMutableDicByKeyValueBlock_Arguments \
    id <NSCopying>_Nonnull key, \
    id _Nonnull value
#endif /* Jobs_ReturnMutableDicByKeyValueBlock_Arguments */

#ifndef Jobs_ReturnMutableDicByKey_ValueBlock_Arguments
#define Jobs_ReturnMutableDicByKey_ValueBlock_Arguments \
    NSString *_Nonnull key, \
    id _Nullable value
#endif /* Jobs_ReturnMutableDicByKey_ValueBlock_Arguments */

#ifndef Jobs_ReturnCGRectByCGFloatAndUIViewBlock_Arguments
#define Jobs_ReturnCGRectByCGFloatAndUIViewBlock_Arguments \
    CGFloat data, \
    __kindof UIView *_Nonnull superView
#endif /* Jobs_ReturnCGRectByCGFloatAndUIViewBlock_Arguments */

#ifndef Jobs_ByClassAndSaltBlock_Arguments
#define Jobs_ByClassAndSaltBlock_Arguments \
    Class _Nonnull cls, \
    __kindof NSString *_Nullable salt
#endif /* Jobs_ByClassAndSaltBlock_Arguments */

#ifndef Jobs_ReturnIDByComponentTypeAndUIViewBlock_Arguments
#define Jobs_ReturnIDByComponentTypeAndUIViewBlock_Arguments \
    ComponentType componentType, \
    __kindof UIView *_Nullable view
#endif /* Jobs_ReturnIDByComponentTypeAndUIViewBlock_Arguments */

#ifndef Jobs_ViewModelAndBOOLBlock_Arguments
#define Jobs_ViewModelAndBOOLBlock_Arguments \
    __kindof UIViewModel *_Nonnull model, \
    BOOL data
#endif /* Jobs_ViewModelAndBOOLBlock_Arguments */

#ifndef Jobs_ReturnViewNavigatorByViewAndAnimatedBlock_Arguments
#define Jobs_ReturnViewNavigatorByViewAndAnimatedBlock_Arguments \
    __kindof UIView *_Nullable view, \
    BOOL animated
#endif /* Jobs_ReturnViewNavigatorByViewAndAnimatedBlock_Arguments */

#ifndef Jobs_ByButtonModelAndBOOLBlock_Arguments
#define Jobs_ByButtonModelAndBOOLBlock_Arguments \
    __kindof UIButtonModel *_Nonnull model, \
    BOOL data
#endif /* Jobs_ByButtonModelAndBOOLBlock_Arguments */

#ifndef Jobs_ReturnGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock_Arguments
#define Jobs_ReturnGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock_Arguments \
    __kindof NSArray * _Nullable photosArray, \
    NSInteger currentIndex
#endif /* Jobs_ReturnGKPhotoBrowserByPhotosArrayAndCurrentIndexBlock_Arguments */

#ifndef Jobs_DelegateBlocks_Arguments
#define Jobs_DelegateBlocks_Arguments \
    NSString *_Nullable string, \
    jobsByVoidBlock _Nullable block
#endif /* Jobs_DelegateBlocks_Arguments */

#ifndef Jobs_ReturnViewByViewAndMasonryConstraintsBlocks_Arguments
#define Jobs_ReturnViewByViewAndMasonryConstraintsBlocks_Arguments \
    __kindof UIView * _Nonnull subview, \
    jobsByMASConstraintMakerBlock _Nullable block
#endif /* Jobs_ReturnViewByViewAndMasonryConstraintsBlocks_Arguments */

#ifndef Jobs_ID_NSErrorPointer_Arguments
#define Jobs_ID_NSErrorPointer_Arguments \
    id _Nullable value, \
    NSError *_Nullable *_Nullable errorPtr
#endif /* Jobs_ID_NSErrorPointer_Arguments */

#ifndef Jobs_PageControl_Image_Page_Arguments
#define Jobs_PageControl_Image_Page_Arguments \
    UIImage *_Nullable image, \
    NSInteger page
#endif /* Jobs_PageControl_Image_Page_Arguments */

#ifndef Jobs_ID_BOOLPointer_Arguments
#define Jobs_ID_BOOLPointer_Arguments \
    id _Nullable value, \
    BOOL *_Nullable stop
#endif /* Jobs_ID_BOOLPointer_Arguments */

#ifndef Jobs_ReturnGoodsClassModelByInt2Block_Arguments
#define Jobs_ReturnGoodsClassModelByInt2Block_Arguments \
    NSUInteger data1, \
    int data2
#endif /* Jobs_ReturnGoodsClassModelByInt2Block_Arguments */

#ifndef Jobs_ReturnGoodsClassModelByIntStringBlock_Arguments
#define Jobs_ReturnGoodsClassModelByIntStringBlock_Arguments \
    int data1, \
    NSString *_Nullable data2
#endif /* Jobs_ReturnGoodsClassModelByIntStringBlock_Arguments */

#ifndef Jobs_ByBannerAdsModelAndCellBlock_Arguments
#define Jobs_ByBannerAdsModelAndCellBlock_Arguments \
    __kindof FMBannerAdsModel *_Nullable model, \
    JobsBtnStyleCVCell *_Nonnull cell
#endif /* Jobs_ByBannerAdsModelAndCellBlock_Arguments */

#ifndef Jobs_ByVCAndDataBlock_Arguments
#define Jobs_ByVCAndDataBlock_Arguments \
    __kindof UIViewController *_Nullable viewController, \
    id _Nullable data
#endif /* Jobs_ByVCAndDataBlock_Arguments */

#ifndef Jobs_ByView2Block_Arguments
#define Jobs_ByView2Block_Arguments \
    __kindof UIView *_Nullable superview, \
    __kindof UIView *_Nullable view
#endif /* Jobs_ByView2Block_Arguments */

#ifndef Jobs_ByViewAndDataBlock_Arguments
#define Jobs_ByViewAndDataBlock_Arguments \
    __kindof UIView *_Nullable view, \
    id _Nullable data
#endif /* Jobs_ByViewAndDataBlock_Arguments */


/// JobsBlock@Pods 返哺参数宏 BEGIN
#ifndef Jobs_LuckyWheelSegment_LPGestureRecognizer_Arguments
#define Jobs_LuckyWheelSegment_LPGestureRecognizer_Arguments \
    LuckyWheelSegment *_Nullable segment, \
    UILongPressGestureRecognizer *_Nullable gr
#endif /* Jobs_LuckyWheelSegment_LPGestureRecognizer_Arguments */

#ifndef BRDateResult_Arguments
#define BRDateResult_Arguments \
    NSDate *_Nullable selectDate, \
    NSString *_Nullable selectValue
#endif /* BRDateResult_Arguments */

#ifndef BRDateResultRange_Arguments
#define BRDateResultRange_Arguments \
    NSDate *_Nullable selectStartDate, \
    NSDate *_Nullable selectEndDate, \
    NSString *_Nullable selectValue
#endif /* BRDateResultRange_Arguments */

#ifndef Jobs_BaseModel_Index_Arguments
#define Jobs_BaseModel_Index_Arguments \
    __kindof BaseModel *_Nullable model, \
    NSInteger index
#endif /* Jobs_BaseModel_Index_Arguments */

#ifndef Jobs_UserModel_Key_Arguments
#define Jobs_UserModel_Key_Arguments \
    NSObject <NSCoding> *_Nonnull userModel, \
    NSString *_Nullable key
#endif /* Jobs_UserModel_Key_Arguments */

#ifndef Jobs_EKEventStoreRequestAccessCompletionHandler_Arguments
#define Jobs_EKEventStoreRequestAccessCompletionHandler_Arguments \
    BOOL granted, \
    EKEventStore *_Nullable eventStore, \
    NSError *_Nullable error
#endif /* Jobs_EKEventStoreRequestAccessCompletionHandler_Arguments */

#ifndef Jobs_NetworkUpdate_Arguments
#define Jobs_NetworkUpdate_Arguments \
    JobsNetworkSource *_Nullable source, \
    uint64_t uploadBytesPerSec, \
    uint64_t downloadBytesPerSec
#endif /* Jobs_NetworkUpdate_Arguments */

#ifndef TKPermissionCustomMsg_Arguments
#define TKPermissionCustomMsg_Arguments \
    NSString *_Nullable title, \
    NSString *_Nullable msg, \
    NSString *_Nullable left, \
    NSString *_Nullable right
#endif /* TKPermissionCustomMsg_Arguments */

#ifndef Jobs_String_NSUInteger_Arguments
#define Jobs_String_NSUInteger_Arguments \
    __kindof NSString *_Nullable data1, \
    NSUInteger data2
#endif /* Jobs_String_NSUInteger_Arguments */

#ifndef Jobs_WMZBannerParam_Arr_ADType_Arguments
#define Jobs_WMZBannerParam_Arr_ADType_Arguments \
    __kindof NSArray <FMBannerAdsModel *>*_Nullable models, \
    FMAdsType ADType
#endif /* Jobs_WMZBannerParam_Arr_ADType_Arguments */

#ifndef Jobs_CollectionView_Target_CollectionView_Arguments
#define Jobs_CollectionView_Target_CollectionView_Arguments \
    id _Nonnull target, \
    UICollectionView *_Nonnull collectionView
#endif /* Jobs_CollectionView_Target_CollectionView_Arguments */

#ifndef Jobs_CollectionView_Target_CollectionView_Section_Arguments
#define Jobs_CollectionView_Target_CollectionView_Section_Arguments \
    id _Nonnull target, \
    UICollectionView *_Nonnull collectionView, \
    NSInteger section
#endif /* Jobs_CollectionView_Target_CollectionView_Section_Arguments */

#ifndef Jobs_TableView_Target_TableView_Arguments
#define Jobs_TableView_Target_TableView_Arguments \
    id _Nonnull target, \
    UITableView *_Nonnull tableView
#endif /* Jobs_TableView_Target_TableView_Arguments */

#ifndef Jobs_TableView_Target_TableView_Section_Arguments
#define Jobs_TableView_Target_TableView_Section_Arguments \
    id _Nonnull target, \
    UITableView *_Nonnull tableView, \
    NSInteger section
#endif /* Jobs_TableView_Target_TableView_Section_Arguments */

#ifndef Jobs_CollectionView_Target_CollectionView_IndexPath_Arguments
#define Jobs_CollectionView_Target_CollectionView_IndexPath_Arguments \
    id _Nonnull target, \
    UICollectionView *_Nonnull collectionView, \
    NSIndexPath *_Nonnull indexPath
#endif /* Jobs_CollectionView_Target_CollectionView_IndexPath_Arguments */

#ifndef Jobs_TableView_Target_TableView_IndexPath_Arguments
#define Jobs_TableView_Target_TableView_IndexPath_Arguments \
    id _Nonnull target, \
    UITableView *_Nonnull tableView, \
    NSIndexPath *_Nonnull indexPath
#endif /* Jobs_TableView_Target_TableView_IndexPath_Arguments */

#ifndef Jobs_ButtonNode_LongPress_Arguments
#define Jobs_ButtonNode_LongPress_Arguments \
    __kindof ASButtonNode *_Nullable node, \
    UILongPressGestureRecognizer *_Nullable gr
#endif /* Jobs_ButtonNode_LongPress_Arguments */

#ifndef Jobs_EditableTextEvent_Arguments
#define Jobs_EditableTextEvent_Arguments \
    __kindof ASEditableTextNode *_Nullable node, \
    UITextView *_Nullable tv
#endif /* Jobs_EditableTextEvent_Arguments */

#ifndef Jobs_ID_ID_NSUInteger_Arguments
#define Jobs_ID_ID_NSUInteger_Arguments \
    id _Nullable data, \
    id _Nullable data2, \
    NSUInteger index
#endif /* Jobs_ID_ID_NSUInteger_Arguments */

#ifndef Jobs_Control_Events_Handler_Arguments
#define Jobs_Control_Events_Handler_Arguments \
    UIControlEvents events, \
    jobsByCtrlBlock _Nullable handler
#endif /* Jobs_Control_Events_Handler_Arguments */

#ifndef Jobs_Control_Align_Arguments
#define Jobs_Control_Align_Arguments \
    UIControlContentHorizontalAlignment horizontal, \
    UIControlContentVerticalAlignment vertical
#endif /* Jobs_Control_Align_Arguments */

#ifndef Jobs_Control_Target_Action_Events_Arguments
#define Jobs_Control_Target_Action_Events_Arguments \
    __kindof id _Nullable target, \
    SEL _Nullable action, \
    UIControlEvents events
#endif /* Jobs_Control_Target_Action_Events_Arguments */

#ifndef Jobs_Control_Action_Events_Arguments
#define Jobs_Control_Action_Events_Arguments \
    UIAction *_Nonnull action, \
    UIControlEvents events
#endif /* Jobs_Control_Action_Events_Arguments */

#ifndef Jobs_Control_Identifier_Events_Arguments
#define Jobs_Control_Identifier_Events_Arguments \
    UIActionIdentifier _Nonnull identifier, \
    UIControlEvents events
#endif /* Jobs_Control_Identifier_Events_Arguments */

#ifndef Jobs_Control_Events_Identifier_ActionHandler_Arguments
#define Jobs_Control_Events_Identifier_ActionHandler_Arguments \
    UIControlEvents events, \
    UIActionIdentifier _Nullable identifier, \
    void(^ _Nonnull handler)(UIAction *_Nullable action)
#endif /* Jobs_Control_Events_Identifier_ActionHandler_Arguments */

#ifndef Jobs_BezierPath_AddArc_Arguments
#define Jobs_BezierPath_AddArc_Arguments \
    CGPoint center, \
    CGFloat radius, \
    CGFloat startAngle, \
    CGFloat endAngle, \
    BOOL clockwise
#endif /* Jobs_BezierPath_AddArc_Arguments */

#ifndef Jobs_BezierPath_AddCurve_Arguments
#define Jobs_BezierPath_AddCurve_Arguments \
    CGPoint endPoint, \
    CGPoint controlPoint1, \
    CGPoint controlPoint2
#endif /* Jobs_BezierPath_AddCurve_Arguments */

#ifndef Jobs_BezierPath_AddQuadCurve_Arguments
#define Jobs_BezierPath_AddQuadCurve_Arguments \
    CGPoint endPoint, \
    CGPoint controlPoint
#endif /* Jobs_BezierPath_AddQuadCurve_Arguments */

#ifndef Jobs_BezierPath_LineDash_Arguments
#define Jobs_BezierPath_LineDash_Arguments \
    NSArray<NSNumber *> *_Nullable pattern, \
    CGFloat phase
#endif /* Jobs_BezierPath_LineDash_Arguments */

#ifndef Jobs_CALayer_CAAnimation_Key_Arguments
#define Jobs_CALayer_CAAnimation_Key_Arguments \
    __kindof CAAnimation *_Nullable animation, \
    NSString *_Nullable key
#endif /* Jobs_CALayer_CAAnimation_Key_Arguments */

#ifndef Jobs_Center_Arguments
#define Jobs_Center_Arguments \
    CGFloat x, \
    CGFloat y
#endif /* Jobs_Center_Arguments */

#ifndef Jobs_Progress_Animated_Arguments
#define Jobs_Progress_Animated_Arguments \
    float progress, \
    BOOL animated
#endif /* Jobs_Progress_Animated_Arguments */

#ifndef Jobs_ButtonNode_Image_State_Arguments
#define Jobs_ButtonNode_Image_State_Arguments \
    UIImage *_Nonnull image, \
    UIControlState state
#endif /* Jobs_ButtonNode_Image_State_Arguments */

#ifndef Jobs_ButtonNode_Title_Font_Color_State_Arguments
#define Jobs_ButtonNode_Title_Font_Color_State_Arguments \
    NSString *_Nonnull title, \
    UIFont *_Nullable font, \
    UIColor *_Nullable color, \
    UIControlState state
#endif /* Jobs_ButtonNode_Title_Font_Color_State_Arguments */

#ifndef Jobs_ButtonNode_LongPressTime_Arguments
#define Jobs_ButtonNode_LongPressTime_Arguments \
    NSTimeInterval minDuration, \
    CGFloat allowableMovement, \
    jobsByButtonNodeLongPressBlock _Nullable handler
#endif /* Jobs_ButtonNode_LongPressTime_Arguments */

#ifndef Jobs_CollectionNode_Point_Animated_Arguments
#define Jobs_CollectionNode_Point_Animated_Arguments \
    CGPoint point, \
    BOOL animated
#endif /* Jobs_CollectionNode_Point_Animated_Arguments */

#ifndef Jobs_CollectionNode_BatchAnimated_Arguments
#define Jobs_CollectionNode_BatchAnimated_Arguments \
    BOOL animated, \
    dispatch_block_t _Nullable updates, \
    jobsByBOOLBlock _Nullable completion
#endif /* Jobs_CollectionNode_BatchAnimated_Arguments */

#ifndef Jobs_CollectionNode_Batch_Arguments
#define Jobs_CollectionNode_Batch_Arguments \
    dispatch_block_t _Nullable updates, \
    jobsByBOOLBlock _Nullable completion
#endif /* Jobs_CollectionNode_Batch_Arguments */

#ifndef Jobs_CollectionNode_Select_Arguments
#define Jobs_CollectionNode_Select_Arguments \
    NSIndexPath *_Nullable indexPath, \
    BOOL animated, \
    UICollectionViewScrollPosition scrollPosition
#endif /* Jobs_CollectionNode_Select_Arguments */

#ifndef Jobs_CollectionNode_Deselect_Arguments
#define Jobs_CollectionNode_Deselect_Arguments \
    NSIndexPath *_Nullable indexPath, \
    BOOL animated
#endif /* Jobs_CollectionNode_Deselect_Arguments */

#ifndef Jobs_CollectionNode_ScrollToItem_Arguments
#define Jobs_CollectionNode_ScrollToItem_Arguments \
    NSIndexPath *_Nullable indexPath, \
    UICollectionViewScrollPosition scrollPosition, \
    BOOL animated
#endif /* Jobs_CollectionNode_ScrollToItem_Arguments */

#ifndef Jobs_CollectionNode_SetTuning_Arguments
#define Jobs_CollectionNode_SetTuning_Arguments \
    ASRangeTuningParameters params, \
    NSInteger type
#endif /* Jobs_CollectionNode_SetTuning_Arguments */

#ifndef Jobs_CollectionNode_SetTuningForMode_Arguments
#define Jobs_CollectionNode_SetTuningForMode_Arguments \
    ASRangeTuningParameters params, \
    char mode, \
    NSInteger type
#endif /* Jobs_CollectionNode_SetTuningForMode_Arguments */
/// JobsBlock@Pods 返哺参数宏 END

#ifndef API_IOS14_TVOS14_UNAVAILABLE_WATCHOS
#define API_IOS14_TVOS14_UNAVAILABLE_WATCHOS \
    API_AVAILABLE(ios(14.0), tvos(14.0)) API_UNAVAILABLE(watchos)
#endif

#ifndef API_IOS15_TVOS15_UNAVAILABLE_WATCHOS
#define API_IOS15_TVOS15_UNAVAILABLE_WATCHOS \
    API_AVAILABLE(ios(15.0), tvos(15.0)) API_UNAVAILABLE(watchos)
#endif

#endif /* JobsBlockDef_h */
