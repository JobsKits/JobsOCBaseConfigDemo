//
//  JobsDefineBaseButtonProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineBaseButtonProtocol_h
#define JobsDefineBaseButtonProtocol_h

#ifndef BaseButtonProtocol_synthesize_part1
#define BaseButtonProtocol_synthesize_part1 \
\
@synthesize jobsSelected = _jobsSelected;\
@synthesize jobsEnabled = _jobsEnabled;\
@synthesize layerBorderCor = _layerBorderCor;\

#endif /* BaseButtonProtocol_synthesize_part1 */

#ifndef BaseButtonProtocol_synthesize_part2
#define BaseButtonProtocol_synthesize_part2 \
\
@synthesize buttonConfiguration = _buttonConfiguration;\
@synthesize backgroundConfiguration = _backgroundConfiguration;\
@synthesize contentHorizontalAlignment = _contentHorizontalAlignment;\
@synthesize contentVerticalAlignment = _contentVerticalAlignment;\
@synthesize contentInsets = _contentInsets;\
@synthesize contentEdgeInsets = _contentEdgeInsets;\
@synthesize baseBackgroundColor = _baseBackgroundColor;\
@synthesize selectedBaseBackgroundColor = _selectedBaseBackgroundColor;\
@synthesize selectedLayerBorderCor = _selectedLayerBorderCor;\
@synthesize normalBorderWidth = _normalBorderWidth;\
@synthesize selectedBorderWidth = _selectedBorderWidth;\
@synthesize imagePadding = _imagePadding;\
@synthesize titlePadding = _titlePadding;\
@synthesize imagePlacement = _imagePlacement;\
@synthesize titleShowingType = _titleShowingType;\
@synthesize subTitleShowingType = _subTitleShowingType;\
@synthesize imageSize = _imageSize;\
@synthesize contentSpacing = _contentSpacing;\
@synthesize btnWidth = _btnWidth;\
@synthesize title = _title;\
@synthesize subTitle = _subTitle;\
@synthesize titleFont = _titleFont;\
@synthesize subTitleFont = _subTitleFont;\
@synthesize titleCor = _titleCor;\
@synthesize subTitleCor = _subTitleCor;\
@synthesize titleAlignment = _titleAlignment;\
@synthesize subTitleAlignment = _subTitleAlignment;\
@synthesize buttonConfigurationTitleAlignment = _buttonConfigurationTitleAlignment;\
@synthesize titleLineBreakMode = _titleLineBreakMode;\
@synthesize subtitleLineBreakMode = _subtitleLineBreakMode;\
@synthesize selectedTitle = _selectedTitle;\
@synthesize selectedSubTitle = _selectedSubTitle;\
@synthesize selectedTitleFont = _selectedTitleFont;\
@synthesize selectedSubTitleFont = _selectedSubTitleFont;\
@synthesize selectedTitleCor = _selectedTitleCor;\
@synthesize selectedSubTitleCor = _selectedSubTitleCor;\
@synthesize selectedTitleAlignment = _selectedTitleAlignment;\
@synthesize selectedSubTitleAlignment = _selectedSubTitleAlignment;\
@synthesize selectedButtonConfigurationTitleAlignment = _selectedButtonConfigurationTitleAlignment;\
@synthesize selectedTitleLineBreakMode = _selectedTitleLineBreakMode;\
@synthesize selectedSubtitleLineBreakMode = _selectedSubtitleLineBreakMode;\
@synthesize backgroundImage = _backgroundImage;\
@synthesize normalImage = _normalImage;\
@synthesize highlightBackgroundImage = _highlightBackgroundImage;\
@synthesize highlightImage = _highlightImage;\
@synthesize attributedTitle = _attributedTitle;\
@synthesize attributedSubTitle = _attributedSubTitle;\
@synthesize selectedAttributedTitle = _selectedAttributedTitle;\
@synthesize selectedAttributedSubTitle = _selectedAttributedSubTitle;\
@synthesize textLabelFrame = _textLabelFrame;\
@synthesize subTextLabelFrame = _subTextLabelFrame;\
@synthesize btnImageViewFrame = _btnImageViewFrame;\
@synthesize textLabelSize = _textLabelSize;\
@synthesize textLabelFrameResetX = _textLabelFrameResetX;\
@synthesize textLabelFrameResetY = _textLabelFrameResetY;\
@synthesize subTextLabelSize = _subTextLabelSize;\
@synthesize subTextLabelFrameResetX = _subTextLabelFrameResetX;\
@synthesize subTextLabelFrameResetY = _subTextLabelFrameResetY;\
@synthesize imageViewSize = _imageViewSize;\
@synthesize imageViewFrameResetX = _imageViewFrameResetX;\
@synthesize imageViewFrameResetY = _imageViewFrameResetY;\
@synthesize textLabelWidth = _textLabelWidth;\
@synthesize subTextLabelWidth = _subTextLabelWidth;\
@synthesize imageViewWidth = _imageViewWidth;\
@synthesize textLabelHeight = _textLabelHeight;\
@synthesize subTextLabelHeight = _subTextLabelHeight;\
@synthesize imageViewHeight = _imageViewHeight;\
@synthesize textLabelFrameOffsetX = _textLabelFrameOffsetX;\
@synthesize textLabelFrameOffsetY = _textLabelFrameOffsetY;\
@synthesize textLabelFrameOffsetWidth = _textLabelFrameOffsetWidth;\
@synthesize textLabelFrameOffsetHeight = _textLabelFrameOffsetHeight;\
@synthesize subTextLabelFrameOffsetX = _subTextLabelFrameOffsetX;\
@synthesize subTextLabelFrameOffsetY = _subTextLabelFrameOffsetY;\
@synthesize subTextLabelFrameOffsetWidth = _subTextLabelFrameOffsetWidth;\
@synthesize subTextLabelFrameOffsetHeight = _subTextLabelFrameOffsetHeight;\
@synthesize imageViewFrameOffsetX = _imageViewFrameOffsetX;\
@synthesize imageViewFrameOffsetY = _imageViewFrameOffsetY;\
@synthesize imageViewFrameOffsetWidth = _imageViewFrameOffsetWidth;\
@synthesize imageViewFrameOffsetHeight = _imageViewFrameOffsetHeight;
#endif /* BaseButtonProtocol_synthesize_part2 */

#ifndef BaseButtonProtocol_synthesize
#define BaseButtonProtocol_synthesize \
\
BaseButtonProtocol_synthesize_part1 \
BaseButtonProtocol_synthesize_part2

#endif /* BaseButtonProtocol_synthesize */

#ifndef BaseButtonProtocol_dynamic_part2
#define BaseButtonProtocol_dynamic_part2 \
\
@dynamic buttonConfiguration;\
@dynamic backgroundConfiguration;\
@dynamic contentHorizontalAlignment;\
@dynamic contentVerticalAlignment;\
@dynamic contentInsets;\
@dynamic contentEdgeInsets;\
@dynamic baseBackgroundColor;\
@dynamic selectedBaseBackgroundColor;\
@dynamic layerBorderCor;\
@dynamic selectedLayerBorderCor;\
@dynamic normalBorderWidth;\
@dynamic selectedBorderWidth;\
@dynamic imagePadding;\
@dynamic titlePadding;\
@dynamic imagePlacement;\
@dynamic titleShowingType;\
@dynamic subTitleShowingType;\
@dynamic imageSize;\
@dynamic contentSpacing;\
@dynamic btnWidth;\
@dynamic title;\
@dynamic subTitle;\
@dynamic titleFont;\
@dynamic subTitleFont;\
@dynamic titleCor;\
@dynamic subTitleCor;\
@dynamic titleAlignment;\
@dynamic subTitleAlignment;\
@dynamic buttonConfigurationTitleAlignment;\
@dynamic titleLineBreakMode;\
@dynamic subtitleLineBreakMode;\
@dynamic selectedTitle;\
@dynamic selectedSubTitle;\
@dynamic selectedTitleFont;\
@dynamic selectedSubTitleFont;\
@dynamic selectedTitleCor;\
@dynamic selectedSubTitleCor;\
@dynamic selectedTitleAlignment;\
@dynamic selectedSubTitleAlignment;\
@dynamic selectedButtonConfigurationTitleAlignment;\
@dynamic selectedTitleLineBreakMode;\
@dynamic selectedSubtitleLineBreakMode;\
@dynamic backgroundImage;\
@dynamic normalImage;\
@dynamic highlightBackgroundImage;\
@dynamic highlightImage;\
@dynamic attributedTitle;\
@dynamic attributedSubTitle;\
@dynamic selectedAttributedTitle;\
@dynamic selectedAttributedSubTitle;\
@dynamic textLabelFrame;\
@dynamic subTextLabelFrame;\
@dynamic btnImageViewFrame;\
@dynamic textLabelSize;\
@dynamic textLabelFrameResetX;\
@dynamic textLabelFrameResetY;\
@dynamic subTextLabelSize;\
@dynamic subTextLabelFrameResetX;\
@dynamic subTextLabelFrameResetY;\
@dynamic imageViewSize;\
@dynamic imageViewFrameResetX;\
@dynamic imageViewFrameResetY;\
@dynamic textLabelWidth;\
@dynamic subTextLabelWidth;\
@dynamic imageViewWidth;\
@dynamic textLabelHeight;\
@dynamic subTextLabelHeight;\
@dynamic imageViewHeight;\
@dynamic textLabelFrameOffsetX;\
@dynamic textLabelFrameOffsetY;\
@dynamic textLabelFrameOffsetWidth;\
@dynamic textLabelFrameOffsetHeight;\
@dynamic subTextLabelFrameOffsetX;\
@dynamic subTextLabelFrameOffsetY;\
@dynamic subTextLabelFrameOffsetWidth;\
@dynamic subTextLabelFrameOffsetHeight;\
@dynamic imageViewFrameOffsetX;\
@dynamic imageViewFrameOffsetY;\
@dynamic imageViewFrameOffsetWidth;\
@dynamic imageViewFrameOffsetHeight;\
@dynamic isCanBeClickWhenTimerCycle;

#endif /* BaseButtonProtocol_dynamic_part2 */

#endif /* JobsDefineBaseButtonProtocol_h */
