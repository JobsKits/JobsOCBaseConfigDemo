//
//  JobsOCCountryCodeCtrl.m
//  JobsOCCountryCodeCtrl
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#import "JobsOCCountryCodeCtrl.h"

@interface JobsOCCountryCodeCtrl ()

Prop_strong()UITableView *tableView;
Prop_strong()NSDictionary *sortedNameDict;
Prop_strong()NSArray *indexArray;
Prop_strong()NSMutableArray *results;

+(NSString *)jobs_cleanCountryName:(NSString *)countryName;
+(NSString *)jobs_cleanCountryCode:(NSString *)code;
+(NSString *)jobs_flagEmojiByISOCode:(NSString *)ISOCode;
+(BOOL)jobs_isTaiwanCountryName:(NSString *)countryName;
+(UIImage *)jobs_countryFlagImageByCountryName:(NSString *)countryName;
+(UIImage *)jobs_taiwanFlagImage;
+(NSAttributedString *)jobs_countryAttributedTextByCountryName:(NSString *)countryName
                                                          text:(NSString *)text
                                                          font:(UIFont *)font
                                                     textColor:(UIColor *)textColor;

@end

@implementation JobsOCCountryCodeCtrl
#pragma mark —— system
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"国家 / 地区代码".tr;
    self.view.byBgColor(JobsWhiteColor);
    self.tableView.byAlpha(1);
}
#pragma mark —— public
+(NSString *)jobs_countryFlagByCountryName:(NSString *)countryName{
    NSString *cleanCountryName = [self jobs_cleanCountryName:countryName];
    if ([self jobs_isTaiwanCountryName:cleanCountryName]) return @"";
    NSDictionary <NSString *,NSString *>*specialISOCodeByCountryName = @{
        @"中国":@"CN",
        @"中國":@"CN",
        @"China":@"CN",
        @"中国香港":@"HK",
        @"中國香港":@"HK",
        @"香港":@"HK",
        @"Hong Kong":@"HK",
        @"Hong Kong SAR China":@"HK",
        @"中国澳门":@"MO",
        @"中國澳門":@"MO",
        @"澳门":@"MO",
        @"澳門":@"MO",
        @"Macao":@"MO",
        @"Macau":@"MO",
        @"Macao SAR China":@"MO",
        @"中国台湾":@"TW",
        @"中國台灣":@"TW",
        @"中國臺灣":@"TW",
        @"台湾":@"TW",
        @"台灣":@"TW",
        @"臺灣":@"TW",
        @"Taiwan":@"TW",
        @"Taiwan, China":@"TW",
        @"China Taiwan":@"TW"
    };
    NSString *ISOCode = specialISOCodeByCountryName[cleanCountryName];
    if (ISOCode.length) return [self jobs_flagEmojiByISOCode:ISOCode];
    NSArray <NSLocale *>*locales = @[
        NSLocale.currentLocale,
        [NSLocale localeWithLocaleIdentifier:@"zh_Hans_CN"],
        [NSLocale localeWithLocaleIdentifier:@"en_US"]
    ];
    for (NSString *countryCode in NSLocale.ISOCountryCodes) {
        for (NSLocale *locale in locales) {
            NSString *displayName = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
            if ([cleanCountryName isEqualToString:displayName]) return [self jobs_flagEmojiByISOCode:countryCode];
        }
    };return @"🌐";
}

+(NSString *)jobs_countryNameTextByCountryName:(NSString *)countryName{
    NSString *cleanCountryName = [self jobs_cleanCountryName:countryName];
    NSString *countryFlag = [self jobs_countryFlagByCountryName:cleanCountryName];
    return countryFlag.length ? [NSString stringWithFormat:@"%@ %@",countryFlag,cleanCountryName] : cleanCountryName;
}

+(NSString *)jobs_countryCodeTextByCountryName:(NSString *)countryName code:(NSString *)code{
    NSString *cleanCountryName = [self jobs_cleanCountryName:countryName];
    NSString *cleanCode = [self jobs_cleanCountryCode:code];
    NSString *codeText = [cleanCode hasPrefix:@"+"] ? cleanCode : [NSString stringWithFormat:@"+%@",cleanCode];
    NSString *countryFlag = [self jobs_countryFlagByCountryName:cleanCountryName];
    if (countryFlag.length) {
        return [NSString stringWithFormat:@"%@ %@ %@",countryFlag,cleanCountryName,codeText];
    };return [NSString stringWithFormat:@"%@ %@",cleanCountryName,codeText];
}

+(NSAttributedString *)jobs_countryNameAttributedTextByCountryName:(NSString *)countryName
                                                              font:(UIFont *)font
                                                         textColor:(UIColor *)textColor{
    NSString *cleanCountryName = [self jobs_cleanCountryName:countryName];
    return [self jobs_countryAttributedTextByCountryName:cleanCountryName
                                                   text:cleanCountryName
                                                   font:font
                                              textColor:textColor];
}

+(NSAttributedString *)jobs_countryCodeAttributedTextByCountryName:(NSString *)countryName
                                                              code:(NSString *)code
                                                              font:(UIFont *)font
                                                         textColor:(UIColor *)textColor{
    NSString *cleanCountryName = [self jobs_cleanCountryName:countryName];
    NSString *cleanCode = [self jobs_cleanCountryCode:code];
    NSString *codeText = [cleanCode hasPrefix:@"+"] ? cleanCode : [NSString stringWithFormat:@"+%@",cleanCode];
    return [self jobs_countryAttributedTextByCountryName:cleanCountryName
                                                   text:[NSString stringWithFormat:@"%@ %@",cleanCountryName,codeText]
                                                   font:font
                                              textColor:textColor];
}
#pragma mark —— private
+(NSString *)jobs_cleanCountryName:(NSString *)countryName{
    NSString *cleanCountryName = [countryName stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    return cleanCountryName.length ? cleanCountryName : @"中国";
}

+(NSString *)jobs_cleanCountryCode:(NSString *)code{
    NSString *cleanCode = [code stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    return cleanCode.length ? cleanCode : @"86";
}

+(NSString *)jobs_flagEmojiByISOCode:(NSString *)ISOCode{
    NSString *uppercaseISOCode = ISOCode.uppercaseString;
    if (uppercaseISOCode.length != 2) return @"🌐";
    uint32_t base = 0x1F1E6;
    uint32_t scalars[2] = {
        base + [uppercaseISOCode characterAtIndex:0] - 'A',
        base + [uppercaseISOCode characterAtIndex:1] - 'A'
    };
    NSData *data = [NSData dataWithBytes:scalars length:sizeof(scalars)];
    NSString *flag = [NSString.alloc initWithData:data encoding:NSUTF32LittleEndianStringEncoding];
    return flag.length ? flag : @"🌐";
}

+(BOOL)jobs_isTaiwanCountryName:(NSString *)countryName{
    NSString *cleanCountryName = [self jobs_cleanCountryName:countryName];
    NSSet <NSString *>*taiwanNames = [NSSet setWithArray:@[
        @"中国台湾",
        @"中國台灣",
        @"中國臺灣",
        @"台湾",
        @"台灣",
        @"臺灣",
        @"Taiwan",
        @"Taiwan, China",
        @"China Taiwan"
    ]];
    return [taiwanNames containsObject:cleanCountryName];
}

+(UIImage *)jobs_countryFlagImageByCountryName:(NSString *)countryName{
    return [self jobs_isTaiwanCountryName:countryName] ? [self jobs_taiwanFlagImage] : nil;
}

+(UIImage *)jobs_taiwanFlagImage{
    static UIImage *taiwanFlagImage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray <NSString *>*imageNames = @[
            @"JobsOCCountryCodeCtrlTaiwanBlueSkyWhiteSun",
            @"AppDoorTaiwanBlueSkyWhiteSun"
        ];
        NSArray <NSBundle *>*bundles = @[
            [NSBundle bundleForClass:self.class],
            NSBundle.mainBundle
        ];
        for (NSString *imageName in imageNames) {
            for (NSBundle *bundle in bundles) {
                taiwanFlagImage = [UIImage imageNamed:imageName
                                             inBundle:bundle
                        compatibleWithTraitCollection:nil];
                if (taiwanFlagImage) break;
                NSString *imagePath = [bundle pathForResource:imageName ofType:@"png"];
                if (!imagePath.length) {
                    imagePath = [bundle pathForResource:imageName
                                                 ofType:@"png"
                                            inDirectory:@"JobsOCCountryCodeCtrl"];
                }
                if (imagePath.length) {
                    taiwanFlagImage = [UIImage imageWithContentsOfFile:imagePath];
                    break;
                }
            }
            if (taiwanFlagImage) break;
        }
    });return taiwanFlagImage;
}

+(NSAttributedString *)jobs_countryAttributedTextByCountryName:(NSString *)countryName
                                                          text:(NSString *)text
                                                          font:(UIFont *)font
                                                     textColor:(UIColor *)textColor{
    NSString *cleanCountryName = [self jobs_cleanCountryName:countryName];
    UIFont *textFont = font ?: [UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
    UIColor *foregroundColor = textColor ?: UIColor.blackColor;
    NSDictionary <NSAttributedStringKey,id>*attributes = @{
        NSFontAttributeName:textFont,
        NSForegroundColorAttributeName:foregroundColor
    };
    NSMutableAttributedString *attributedText = NSMutableAttributedString.new;
    UIImage *flagImage = [self jobs_countryFlagImageByCountryName:cleanCountryName];
    if (flagImage) {
        NSTextAttachment *attachment = NSTextAttachment.new;
        CGFloat flagHeight = ceil(textFont.lineHeight * 0.88);
        CGFloat flagWidth = flagHeight * flagImage.size.width / flagImage.size.height;
        attachment.image = flagImage;
        attachment.bounds = CGRectMake(0,
                                       (textFont.capHeight - flagHeight) / 2.0,
                                       flagWidth,
                                       flagHeight);
        [attributedText appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
        [attributedText appendAttributedString:[NSAttributedString.alloc initWithString:@" " attributes:attributes]];
    }else{
        NSString *countryFlag = [self jobs_countryFlagByCountryName:cleanCountryName];
        if (countryFlag.length) {
            NSAttributedString *flagText = [NSAttributedString.alloc initWithString:countryFlag.add(@" ")
                                                                         attributes:attributes];
            [attributedText appendAttributedString:flagText];
        }
    }
    [attributedText appendAttributedString:[NSAttributedString.alloc initWithString:text ?: @"" attributes:attributes]];
    return attributedText;
}

-(NSString *)showCodeStringIndex:(NSIndexPath *)indexPath jieQue:(BOOL)jieQu {
    NSString *showCodeSting;
    if (self.indexArray.count > indexPath.section) {
        NSArray *sectionArray = [self.sortedNameDict valueForKey:self.indexArray[indexPath.section]];
        if (sectionArray.count > indexPath.row) {
            showCodeSting = sectionArray[indexPath.row];
            NSArray *array = [showCodeSting componentsSeparatedByString:@"+"];
            if (array.count > 1) {
                NSString *showText = jieQu ? array[0] : array[1];
                showCodeSting = [showText stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
            }
        }
    };return [showCodeSting stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
}

-(NSString *)jobs_countryCodePlistPathByName:(NSString *)plistName{
    NSArray <NSBundle *>*bundles = @[
        [NSBundle bundleForClass:self.class],
        NSBundle.mainBundle
    ];
    for (NSBundle *bundle in bundles) {
        NSString *plistPath = [bundle pathForResource:plistName ofType:@"plist"];
        if (plistPath.length) return plistPath;
        plistPath = [bundle pathForResource:plistName
                                     ofType:@"plist"
                                inDirectory:@"JobsOCCountryCodeCtrl@plist"];
        if (plistPath.length) return plistPath;
    };return nil;
}

-(NSString *)jobs_countryCodePlistName{
    NSString *languageCode = LanMgr.languageCodeByAppLanguage(LanMgr.language);
    return [languageCode.lowercaseString hasPrefix:@"en"] ? @"sortedNameEN" : @"sortedNameCH";
}

-(void)selectCodeIndex:(NSIndexPath *)indexPath {
    NSString *countryName = [self showCodeStringIndex:indexPath jieQue:YES];
    NSString *code = [self showCodeStringIndex:indexPath jieQue:NO];
    if (self.countryCodeDelegate && [self.countryCodeDelegate respondsToSelector:@selector(returnCountryName:code:)]) {
        [self.countryCodeDelegate returnCountryName:countryName code:code];
    }
    if (self.countryCodeBlock) {
        self.countryCodeBlock(countryName,code);
    }
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}
#pragma mark —— UISearchResultsUpdating
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (self.results.count) {
        [self.results removeAllObjects];
    }
    NSString *inputText = searchController.searchBar.text;
    @jobs_weakify(self)
    [self.sortedNameDict.allValues enumerateObjectsUsingBlock:^(NSArray * obj,
                                                                NSUInteger idx,
                                                                BOOL * _Nonnull stop) {
        @jobs_strongify(self)
        [obj enumerateObjectsUsingBlock:^(NSString * obj,
                                          NSUInteger idx,
                                          BOOL * _Nonnull stop) {
            @jobs_strongify(self)
            if ([obj containsString:inputText]) {
                [self.results addObject:obj];
            }
        }];
    }];
    [self.tableView reloadData];
}
#pragma mark —— UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sortedNameDict.allKeys.count;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    if (self.indexArray.count > section) {
        NSArray *array = self.sortedNameDict[self.indexArray[section]];
        return array.count;
    };return 0;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"JobsOCCountryCodeCtrlCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = ((UITableViewCell *)[UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier])
            .byTextLabel(^(__kindof UILabel * _Nullable label) {
                label.byFont([UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular]);
            })
            .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
                label.byFont([UIFont systemFontOfSize:12.0 weight:UIFontWeightRegular])
                    .byTextCor(HEXCOLOR(0x8A8A8A));
            })
            .bySelectionStyle(UITableViewCellSelectionStyleNone);
    };return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            NSString *countryName = [self showCodeStringIndex:indexPath jieQue:YES];
            label.byAttributedText([self.class jobs_countryNameAttributedTextByCountryName:countryName
                                                                                      font:label.font
                                                                                 textColor:label.textColor]);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"+".add([self showCodeStringIndex:indexPath jieQue:NO]));
        });
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return tableView == _tableView ? self.indexArray : nil;
}

-(NSInteger)tableView:(UITableView *)tableView
sectionForSectionIndexTitle:(NSString *)title
              atIndex:(NSInteger)index {
    return tableView == _tableView ? index : 0;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section {
    if (tableView == _tableView) {
        if (section == 0) {
            return 0;
        };return 30;
    };return 0;
}

-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    if (self.indexArray.count > section) {
        return self.indexArray[section];
    };return nil;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self selectCodeIndex:indexPath];
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.byDelegate(self)
                .byDataSource(self)
                .byRowHeight(44.0)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byShowsVerticalScrollIndicator(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.view).offset(isiPhoneX_series() ? 84 : 64);
                });
        });
    };return _tableView;
}

-(NSDictionary *)sortedNameDict{
    if (!_sortedNameDict) {
        _sortedNameDict = [NSDictionary dictionaryWithContentsOfFile:[self jobs_countryCodePlistPathByName:self.jobs_countryCodePlistName]];
    };return _sortedNameDict;
}

-(NSArray *)indexArray{
    if (!_indexArray) {
        _indexArray = [self.sortedNameDict.allKeys sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1,
                                                                                                  id _Nonnull obj2) {
            return [obj1 compare:obj2];
        }];
    };return _indexArray;
}

-(NSMutableArray *)results{
    if (!_results) {
        _results = [NSMutableArray arrayWithCapacity:1];
    };return _results;
}

@end
