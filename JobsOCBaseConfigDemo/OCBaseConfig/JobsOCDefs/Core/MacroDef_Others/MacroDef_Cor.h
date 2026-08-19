//
//  MacroDef_Cor.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsTheme.h"

#ifndef MacroDef_Cor_h

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#define MacroDef_Cor_h
#pragma mark —— XYColorOC.常见颜色
/* lightTextColor is always light, and darkTextColor is always dark, regardless of the current UIUserInterfaceStyle.
 * When possible, we recommend using `labelColor` and its variants, instead.
 */
#ifndef JobsLightTextColor
#define JobsLightTextColor [UIColor xy_createWithLightColor:UIColor.lightTextColor darkColor:UIColor.lightTextColor]
#endif

#ifndef JobsLightGrayColor
#define JobsLightGrayColor [UIColor xy_createWithLightColor:UIColor.lightGrayColor darkColor:UIColor.lightGrayColor]
#endif

#ifndef JobsGreenColor
#define JobsGreenColor     [UIColor xy_createWithLightColor:UIColor.greenColor darkColor:UIColor.greenColor]
#endif

#ifndef JobsMagentaColor
#define JobsMagentaColor   [UIColor xy_createWithLightColor:UIColor.magentaColor darkColor:UIColor.magentaColor]
#endif

#ifndef JobsClearColor
#define JobsClearColor     [UIColor xy_createWithLightColor:UIColor.clearColor darkColor:UIColor.clearColor]
#endif

#ifndef JobsBlackColor
#define JobsBlackColor     [UIColor xy_createWithLightColor:UIColor.blackColor darkColor:UIColor.blackColor]
#endif

#ifndef JobsBlueColor
#define JobsBlueColor      [UIColor xy_createWithLightColor:UIColor.blueColor darkColor:UIColor.blueColor]
#endif

#ifndef JobsWhiteColor
#define JobsWhiteColor     [UIColor xy_createWithLightColor:UIColor.whiteColor darkColor:UIColor.whiteColor]
#endif

#ifndef JobsCyanColor
#define JobsCyanColor      [UIColor xy_createWithLightColor:UIColor.cyanColor darkColor:UIColor.cyanColor]
#endif

#ifndef JobsGrayColor
#define JobsGrayColor      [UIColor xy_createWithLightColor:UIColor.grayColor darkColor:UIColor.grayColor]
#endif

#ifndef JobsOrangeColor
#define JobsOrangeColor    [UIColor xy_createWithLightColor:UIColor.orangeColor darkColor:UIColor.orangeColor]
#endif

#ifndef JobsRedColor
#define JobsRedColor       [UIColor xy_createWithLightColor:UIColor.redColor darkColor:UIColor.redColor]
#endif

#ifndef JobsBrownColor
#define JobsBrownColor     [UIColor xy_createWithLightColor:UIColor.brownColor darkColor:UIColor.brownColor]
#endif

#ifndef JobsDarkGrayColor
#define JobsDarkGrayColor  [UIColor xy_createWithLightColor:UIColor.darkGrayColor darkColor:UIColor.darkGrayColor]
#endif

#ifndef JobsDarkTextColor
#define JobsDarkTextColor  [UIColor xy_createWithLightColor:UIColor.darkTextColor darkColor:UIColor.darkTextColor]
#endif

#ifndef JobsYellowColor
#define JobsYellowColor    [UIColor xy_createWithLightColor:UIColor.yellowColor darkColor:UIColor.yellowColor]
#endif

#ifndef JobsPurpleColor
#define JobsPurpleColor    [UIColor xy_createWithLightColor:UIColor.purpleColor darkColor:UIColor.purpleColor]
#endif

#pragma mark —— XYColorOC.系统默认颜色
/* Some colors that are used by system elements and applications.
* These return named colors whose values may vary between different contexts and releases.
* Do not make assumptions about the color spaces or actual colors used.
*/
#ifndef JobsSystemRedColor
#define JobsSystemRedColor [UIColor xy_createWithLightColor:UIColor.systemRedColor darkColor:UIColor.systemRedColor]
#endif

#ifndef JobsSystemGreenColor
#define JobsSystemGreenColor [UIColor xy_createWithLightColor:UIColor.systemGreenColor darkColor:UIColor.systemGreenColor]
#endif

#ifndef JobsSystemBlueColor
#define JobsSystemBlueColor [UIColor xy_createWithLightColor:UIColor.systemBlueColor darkColor:UIColor.systemBlueColor]
#endif

#ifndef JobsSystemOrangeColor
#define JobsSystemOrangeColor [UIColor xy_createWithLightColor:UIColor.systemOrangeColor darkColor:UIColor.systemOrangeColor]
#endif

#ifndef JobsSystemYellowColor
#define JobsSystemYellowColor [UIColor xy_createWithLightColor:UIColor.systemYellowColor darkColor:UIColor.systemYellowColor]
#endif

#ifndef JobsSystemPinkColor
#define JobsSystemPinkColor [UIColor xy_createWithLightColor:UIColor.systemPinkColor darkColor:UIColor.systemPinkColor]
#endif

#ifndef JobsSystemPurpleColor
#define JobsSystemPurpleColor [UIColor xy_createWithLightColor:UIColor.systemPurpleColor darkColor:UIColor.systemPurpleColor]
#endif

#ifndef JobsSystemTealColor
#define JobsSystemTealColor [UIColor xy_createWithLightColor:UIColor.systemTealColor darkColor:UIColor.systemTealColor]
#endif

#ifndef JobsSystemIndigoColor
#define JobsSystemIndigoColor [UIColor xy_createWithLightColor:UIColor.systemIndigoColor darkColor:UIColor.systemIndigoColor]
#endif

#ifndef JobsSystemGrayColor
#define JobsSystemGrayColor [UIColor xy_createWithLightColor:UIColor.systemGrayColor darkColor:UIColor.systemGrayColor]
#endif

/* The numbered variations, systemGray2 through systemGray6, are grays which increasingly
* trend away from systemGray and in the direction of systemBackgroundColor.
*
* In UIUserInterfaceStyleLight: systemGray1 is slightly lighter than systemGray.
*                               systemGray2 is lighter than that, and so on.
* In UIUserInterfaceStyleDark:  systemGray1 is slightly darker than systemGray.
*                               systemGray2 is darker than that, and so on.
*/
#ifndef JobsSystemGray2Color
#define JobsSystemGray2Color [UIColor xy_createWithLightColor:UIColor.systemGray2Color darkColor:UIColor.systemGray2Color]
#endif

#ifndef JobsSystemGray3Color
#define JobsSystemGray3Color [UIColor xy_createWithLightColor:UIColor.systemGray3Color darkColor:UIColor.systemGray3Color]
#endif

#ifndef JobsSystemGray4Color
#define JobsSystemGray4Color [UIColor xy_createWithLightColor:UIColor.systemGray4Color darkColor:UIColor.systemGray4Color]
#endif

#ifndef JobsSystemGray5Color
#define JobsSystemGray5Color [UIColor xy_createWithLightColor:UIColor.systemGray5Color darkColor:UIColor.systemGray5Color]
#endif

#ifndef JobsSystemGray6Color
#define JobsSystemGray6Color [UIColor xy_createWithLightColor:UIColor.systemGray6Color darkColor:UIColor.systemGray6Color]
#endif
/// Foreground colors for static text and related elements.
#ifndef JobsLabelColor
#define JobsLabelColor JobsThemeColor(JobsThemeColorKeyTextPrimary)
#endif

#ifndef JobsSecondaryLabelColor
#define JobsSecondaryLabelColor JobsThemeColor(JobsThemeColorKeyTextSecondary)
#endif

#ifndef JobsTertiaryLabelColor
#define JobsTertiaryLabelColor JobsThemeColor(JobsThemeColorKeyTextTertiary)
#endif

#ifndef JobsQuaternaryLabelColor
#define JobsQuaternaryLabelColor JobsThemeColor(JobsThemeColorKeyTextQuaternary)
#endif
/// Foreground color for standard system links.
#ifndef JobsLinkColor
#define JobsLinkColor [UIColor xy_createWithLightColor:UIColor.linkColor darkColor:UIColor.linkColor]
#endif

#ifndef JobsPlaceholderTextColor
#define JobsPlaceholderTextColor JobsThemeColor(JobsThemeColorKeyTextPlaceholder)
#endif

#ifndef JobsSeparatorColor
#define JobsSeparatorColor [UIColor xy_createWithLightColor:UIColor.separatorColor darkColor:UIColor.separatorColor]
#endif

#ifndef JobsOpaqueSeparatorColor
#define JobsOpaqueSeparatorColor [UIColor xy_createWithLightColor:UIColor.opaqueSeparatorColor darkColor:UIColor.opaqueSeparatorColor]
#endif

#pragma mark —— XYColorOC.系统背景颜色
/* We provide two design systems (also known as "stacks") for structuring an iOS app's backgrounds.
*
* Each stack has three "levels" of background colors. The first color is intended to be the
* main background, farthest back. Secondary and tertiary colors are layered on top
* of the main background, when appropriate.
*
* Inside of a discrete piece of UI, choose a stack, then use colors from that stack.
* We do not recommend mixing and matching background colors between stacks.
* The foreground colors above are designed to work in both stacks.
*
* 1. systemBackground
*    Use this stack for views with standard table views, and designs which have a white
*    primary background in light mode.
*/
#ifndef JobsSystemBackgroundColor
#define JobsSystemBackgroundColor JobsThemeColor(JobsThemeColorKeyBackgroundPrimary)
#endif

#ifndef JobsSecondarySystemBackgroundColor
#define JobsSecondarySystemBackgroundColor JobsThemeColor(JobsThemeColorKeyBackgroundSecondary)
#endif

#ifndef JobsTertiarySystemBackgroundColor
#define JobsTertiarySystemBackgroundColor JobsThemeColor(JobsThemeColorKeyBackgroundTertiary)
#endif
/* 2. systemGroupedBackground
*    Use this stack for views with grouped content, such as grouped tables and
*    platter-based designs. These are like grouped table views, but you may use these
*    colors in places where a table view wouldn't make sense.
*/
#ifndef JobsSystemGroupedBackgroundColor
#define JobsSystemGroupedBackgroundColor JobsThemeColor(JobsThemeColorKeyBackgroundGrouped)
#endif

#ifndef JobsSecondarySystemGroupedBackgroundColor
#define JobsSecondarySystemGroupedBackgroundColor JobsThemeColor(JobsThemeColorKeyBackgroundGroupedSecondary)
#endif

#ifndef JobsTertiarySystemGroupedBackgroundColor
#define JobsTertiarySystemGroupedBackgroundColor JobsThemeColor(JobsThemeColorKeyBackgroundGroupedTertiary)
#endif
#pragma mark —— XYColorOC.FillColors
/* Fill colors for UI elements.
* These are meant to be used over the background colors, since their alpha component is less than 1.
*
* systemFillColor is appropriate for filling thin and small shapes.
* Example: The track of a slider.
*/
#ifndef JobsSystemFillColor
#define JobsSystemFillColor [UIColor xy_createWithLightColor:UIColor.systemFillColor darkColor:UIColor.systemFillColor]
#endif
/* secondarySystemFillColor is appropriate for filling medium-size shapes.
* Example: The background of a switch.
*/
#ifndef JobsSecondarySystemFillColor
#define JobsSecondarySystemFillColor [UIColor xy_createWithLightColor:UIColor.secondarySystemFillColor darkColor:UIColor.secondarySystemFillColor]
#endif
/* tertiarySystemFillColor is appropriate for filling large shapes.
* Examples: Input fields, search bars, buttons.
*/
#ifndef JobsTertiarySystemFillColor
#define JobsTertiarySystemFillColor [UIColor xy_createWithLightColor:UIColor.tertiarySystemFillColor darkColor:UIColor.tertiarySystemFillColor]
#endif
/* quaternarySystemFillColor is appropriate for filling large areas containing complex content.
* Example: Expanded table cells.
*/
#ifndef JobsQuaternarySystemFillColor
#define JobsQuaternarySystemFillColor [UIColor xy_createWithLightColor:UIColor.quaternarySystemFillColor darkColor:UIColor.quaternarySystemFillColor]
#endif
#pragma mark —— XYColorOC.其他颜色
/* groupTableViewBackgroundColor is now the same as systemGroupedBackgroundColor.*/
#ifndef JobsGroupTableViewBackgroundColor
#define JobsGroupTableViewBackgroundColor [UIColor xy_createWithLightColor:UIColor.groupTableViewBackgroundColor darkColor:UIColor.groupTableViewBackgroundColor]
#endif

#ifndef JobsViewFlipsideBackgroundColor
#define JobsViewFlipsideBackgroundColor [UIColor xy_createWithLightColor:UIColor.viewFlipsideBackgroundColor darkColor:UIColor.viewFlipsideBackgroundColor]
#endif

#ifndef JobsScrollViewTexturedBackgroundColor
#define JobsScrollViewTexturedBackgroundColor [UIColor xy_createWithLightColor:UIColor.scrollViewTexturedBackgroundColor darkColor:UIColor.scrollViewTexturedBackgroundColor]
#endif

#ifndef JobsUnderPageBackgroundColor
#define JobsUnderPageBackgroundColor [UIColor xy_createWithLightColor:UIColor.underPageBackgroundColor darkColor:UIColor.underPageBackgroundColor]
#endif

#pragma mark —— RGB颜色
#ifndef RGBA_SAMECOLOR
#define RGBA_SAMECOLOR(x,a) [UIColor colorWithRed:(x)/255.0 green:(x)/255.0 blue:(x)/255.0 alpha:a]
#endif

#ifndef RGB_SAMECOLOR
#define RGB_SAMECOLOR(x) [UIColor colorWithRed:(x)/255.0 green:(x)/255.0 blue:(x)/255.0 alpha:1]
#endif

#ifndef RGBA_COLOR
#define RGBA_COLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#endif

#ifndef RGB_COLOR
#define RGB_COLOR(r,g,b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#endif

#pragma mark —— 随机颜色
#ifndef JobsRandomColor
#define JobsRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 \
green:arc4random_uniform(256) / 255.0 \
blue:arc4random_uniform(256) / 255.0 \
alpha:1]
#endif

#pragma mark —— 十六进制颜色
#ifndef HEXCOLOR
#define HEXCOLOR(hexValue)  \
    [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 \
                    green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 \
                     blue:((float)(hexValue & 0xFF)) / 255.0 \
                    alpha:1]
#endif

#ifndef HEXCOLOR_ALPHA
#define HEXCOLOR_ALPHA(hexValue, al)  \
    [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 \
                    green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 \
                     blue:((float)(hexValue & 0xFF)) / 255.0 \
                    alpha:al]
#endif

#pragma mark —— 颜色透明度

NS_INLINE UIColor *_Nullable JobsColorWithAlpha(UIColor *_Nullable color, CGFloat alpha){
    return [color colorWithAlphaComponent:alpha];
}

NS_INLINE UIColor *_Nullable JobsLightTextCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.lightTextColor, alpha); }
NS_INLINE UIColor *_Nullable JobsLightGrayCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.lightGrayColor, alpha); }
NS_INLINE UIColor *_Nullable JobsGreenCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.greenColor, alpha); }
NS_INLINE UIColor *_Nullable JobsMagentaCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.magentaColor, alpha); }
NS_INLINE UIColor *_Nullable JobsBlackCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.blackColor, alpha); }
NS_INLINE UIColor *_Nullable JobsBlueCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.blueColor, alpha); }
NS_INLINE UIColor *_Nullable JobsWhiteCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.whiteColor, alpha); }
NS_INLINE UIColor *_Nullable JobsCyanCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.cyanColor, alpha); }
NS_INLINE UIColor *_Nullable JobsGrayCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.grayColor, alpha); }
NS_INLINE UIColor *_Nullable JobsOrangeCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.orangeColor, alpha); }
NS_INLINE UIColor *_Nullable JobsRedCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.redColor, alpha); }
NS_INLINE UIColor *_Nullable JobsBrownCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.brownColor, alpha); }
NS_INLINE UIColor *_Nullable JobsDarkGrayCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.darkGrayColor, alpha); }
NS_INLINE UIColor *_Nullable JobsDarkTextCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.darkTextColor, alpha); }
NS_INLINE UIColor *_Nullable JobsYellowCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.yellowColor, alpha); }
NS_INLINE UIColor *_Nullable JobsPurpleCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.purpleColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemRedCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemRedColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemGreenCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemGreenColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemBlueCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemBlueColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemOrangeCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemOrangeColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemYellowCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemYellowColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemPinkCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemPinkColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemPurpleCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemPurpleColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemTealCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemTealColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemIndigoCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemIndigoColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemGrayCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemGrayColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemGray2Cor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemGray2Color, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemGray3Cor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemGray3Color, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemGray4Cor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemGray4Color, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemGray5Cor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemGray5Color, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemGray6Cor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemGray6Color, alpha); }
NS_INLINE UIColor *_Nullable JobsLabelCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.labelColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSecondaryLabelCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.secondaryLabelColor, alpha); }
NS_INLINE UIColor *_Nullable JobsTertiaryLabelCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.tertiaryLabelColor, alpha); }
NS_INLINE UIColor *_Nullable JobsQuaternaryLabelCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.quaternaryLabelColor, alpha); }
NS_INLINE UIColor *_Nullable JobsLinkCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.linkColor, alpha); }
NS_INLINE UIColor *_Nullable JobsPlaceholderTextCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.placeholderTextColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSeparatorCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.separatorColor, alpha); }
NS_INLINE UIColor *_Nullable JobsOpaqueSeparatorCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.opaqueSeparatorColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemBackgroundColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSecondarySystemBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.secondarySystemBackgroundColor, alpha); }
NS_INLINE UIColor *_Nullable JobsTertiarySystemBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.tertiarySystemBackgroundColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemGroupedBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemGroupedBackgroundColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSecondarySystemGroupedBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.secondarySystemGroupedBackgroundColor, alpha); }
NS_INLINE UIColor *_Nullable JobsTertiarySystemGroupedBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.tertiarySystemGroupedBackgroundColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSystemFillCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.systemFillColor, alpha); }
NS_INLINE UIColor *_Nullable JobsSecondarySystemFillCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.secondarySystemFillColor, alpha); }
NS_INLINE UIColor *_Nullable JobsTertiarySystemFillCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.tertiarySystemFillColor, alpha); }
NS_INLINE UIColor *_Nullable JobsQuaternarySystemFillCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.quaternarySystemFillColor, alpha); }
NS_INLINE UIColor *_Nullable JobsRandomCor(CGFloat alpha){ return HEXCOLOR_ALPHA(arc4random_uniform(0xFFFFFF), alpha); }
NS_INLINE UIColor *_Nullable JobsHexCor(CGFloat alpha, UInt32 hexValue){ return HEXCOLOR_ALPHA(hexValue, alpha); }
NS_INLINE UIColor *_Nullable JobsGroupTableViewBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.groupTableViewBackgroundColor, alpha); }
NS_INLINE UIColor *_Nullable JobsViewFlipsideBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.viewFlipsideBackgroundColor, alpha); }
NS_INLINE UIColor *_Nullable JobsScrollViewTexturedBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.scrollViewTexturedBackgroundColor, alpha); }
NS_INLINE UIColor *_Nullable JobsUnderPageBackgroundCor(CGFloat alpha){ return JobsColorWithAlpha(UIColor.underPageBackgroundColor, alpha); }

#endif /* MacroDef_Cor_h */
