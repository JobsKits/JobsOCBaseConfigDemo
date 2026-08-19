//
//  TBCityIconFont.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TBCITYICONFONT_A532327029
#define JOBS_HEADER_GUARD_TBCITYICONFONT_A532327029

#import <CoreText/CoreText.h> // 提供底层文本排版与渲染能力，适合富文本、复杂排版和精细文本控制场景。

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>
#import <JobsOCTools/UIImage+TBCityIconFont.h>
#import <JobsOCTools/TBCityIconInfo.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#define TBCityIconInfoMake(text, imageSize, imageColor) [TBCityIconInfo iconInfoWithText:text size:imageSize color:imageColor]

@interface TBCityIconFont : NSObject

+(UIFont *)fontWithSize: (CGFloat)size;
+(JobsRetUIFontByCGFloatBlock _Nonnull)fontWithSize;
+(jobsByStrBlock _Nonnull)setFontName;

@end

/*

    使用示例

    iOS 教你如何使用iconfont图标 https://blog.csdn.net/u010960265/article/details/82531268
    阿里巴巴矢量图标库 https://www.iconfont.cn

     #import <JobsOCTools/TBCityIconFont.h>

     - (void)viewDidLoad {
         [super viewDidLoad];
         self.view.byBgColor(JobsSystemBackgroundColor);

         UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
         [self.view addSubview:imageView];
         // 图标编码是&#xe600，需要转成\U0000e600
         imageView.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e600", 30, [UIColor redColor])];

         UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 100, 30, 30)];
         [self.view addSubview:imageView1];

         imageView1.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e61b", 30, [UIColor redColor])];

         // button
         UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
         button.byFrame(CGRectMake(100, 150, 40, 40));

         [self.view addSubview:button];
         [button setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e614", 40, [UIColor redColor])] forState:UIControlStateNormal];

         // label,label可以将文字与图标结合一起，直接用label的text属性将图标显示出来
         UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 280, 40)];
         [self.view addSubview:label];
         label.byFont([UIFont fontWithName:@"iconfont" size:15]);//设置label的字体
         label.byText(@"在lable上显示  \U0000e658");

         // Do any additional setup after loading the view, typically from a nib.
     }
 */
#endif /* JOBS_HEADER_GUARD_TBCITYICONFONT_A532327029 */
