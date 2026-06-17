//
//  JobsDefineDirectionEnums.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineDirectionEnums_h
#define JobsDefineDirectionEnums_h
#pragma mark —— 🧭方向相关
/// banner滚动方向
#ifndef JHT_BANNER_VIEW_ORIENTATION_ENUM_DEFINED
#define JHT_BANNER_VIEW_ORIENTATION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JhtBannerViewOrientation) {
    BV_Orientation_Horizontal,      // banner滚动方向@横向
    BV_Orientation_Vertical,        // banner滚动方向@纵向
};
#endif /* JHT_BANNER_VIEW_ORIENTATION_ENUM_DEFINED */
/// JobsDropDownListView的方向
typedef enum : NSInteger {
    JobsDropDownListViewDirection_Down = 0,
    JobsDropDownListViewDirection_UP
} JobsDropDownListViewDirection;
/// 抖音模式
#ifndef MK_RIGHT_BTN_VIEW_BTN_TYPE_ENUM_DEFINED
#define MK_RIGHT_BTN_VIEW_BTN_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, MKRightBtnViewBtnType) {
    MKRightBtnViewBtnType_loveBtn,   // 抖音模式@点赞
    MKRightBtnViewBtnType_commentBtn,// 抖音模式@评论
    MKRightBtnViewBtnType_shareBtn   // 抖音模式@分享
};
#endif /* MK_RIGHT_BTN_VIEW_BTN_TYPE_ENUM_DEFINED */
/// Push/pop 控制器的方向
#ifndef JOBS_TRANSITIONDIRECTION_TYPE_ENUM_DEFINED
#define JOBS_TRANSITIONDIRECTION_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, JobsTransitionDirection) {
    JobsTransitionDirectionTop,    // 控制器的方向@从上面进出
    JobsTransitionDirectionBottom, // 控制器的方向@从下面进出
    JobsTransitionDirectionLeft,   // 控制器的方向@从左边进出
    JobsTransitionDirectionRight,  // 控制器的方向@从右边进出
};
#endif /* JOBS_TRANSITIONDIRECTION_TYPE_ENUM_DEFINED */
/// 滑动方向（4方位）
#ifndef MOVE_DIRECTION_ENUM_DEFINED
#define MOVE_DIRECTION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, MoveDirection){
    MoveDirection_vertical_up = 0, // 滑动方向@垂直方向(👆🏻)
    MoveDirection_vertical_down,   // 滑动方向@垂直方向(👇🏻)
    MoveDirection_horizont_left,   // 滑动方向@水平方向(👈🏻)
    MoveDirection_horizont_right   // 滑动方向@水平方向(👉🏻)
};
#endif /* MOVE_DIRECTION_ENUM_DEFINED */
/// 滚动方向（8方位）
#ifndef ScrollDirection_h
#define ScrollDirection_h
typedef NS_ENUM(NSInteger, ScrollDirection) {
    ScrollDirectionNone = 0,
    ScrollDirectionRight,     // 滚动方向@右👉🏻
    ScrollDirectionLeft,      // 滚动方向@左👈🏻
    ScrollDirectionUp,        // 滚动方向@上面👆🏻
    ScrollDirectionDown,      // 滚动方向@下面👇🏻
    ScrollDirectionRight_UP,  // 滚动方向@右上👉🏻👆🏻
    ScrollDirectionLeft_UP,   // 滚动方向@左上👈🏻👆🏻
    ScrollDirectionRight_Down,// 滚动方向@右下👉🏻👇🏻
    ScrollDirectionLeft_Down, // 滚动方向@左下👈🏻👇🏻
};
#endif /* ScrollDirection_h */
/// ShadowDirection
#ifndef ShadowDirection_h
#define ShadowDirection_h
typedef NS_OPTIONS(NSUInteger, ShadowDirection) {
    ShadowDirection_top = 0,
    ShadowDirection_down = 1 << 0,
    ShadowDirection_left = 1 << 1,
    ShadowDirection_right = 1 << 2,
    ShadowDirection_leftTop = 1 << 3,
    ShadowDirection_leftDown = 1 << 4,
    ShadowDirection_rightTop = 1 << 5,
    ShadowDirection_rightDown = 1 << 6,
    ShadowDirection_All = ~0UL
};
#endif /* ShadowDirection_h */
/// UIBorderSideType
#ifndef UIBorderSideType_h
#define UIBorderSideType_h
typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};
#endif /* UIBorderSideType_h */

#endif /* JobsDefineDirectionEnums_h */
