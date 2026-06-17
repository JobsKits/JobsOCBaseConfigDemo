//
//  JobsDefineUITextModelProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineUITextModelProtocol_h
#define JobsDefineUITextModelProtocol_h

#pragma mark —— @synthesize UITextModelProtocol
#ifndef UITextModelProtocol_synthesize_part1
#define UITextModelProtocol_synthesize_part1 \
\
@synthesize attributedTitle = _attributedTitle;\
@synthesize attributedSubTitle = _attributedSubTitle;\

#endif

#ifndef UITextModelProtocol_synthesize_part2
#define UITextModelProtocol_synthesize_part2 \
\
@synthesize lineBreakMode = _lineBreakMode;\
@synthesize subLineBreakMode = _subLineBreakMode;\

#endif

#ifndef UITextModelProtocol_synthesize_part3
#define UITextModelProtocol_synthesize_part3 \
\
@synthesize textAlignment = _textAlignment;\
@synthesize subTextAlignment = _subTextAlignment;\
@synthesize textLineSpacing = _textLineSpacing;\
@synthesize placeholder = _placeholder;\
@synthesize placeholderColor = _placeholderColor;\
@synthesize placeholderFont = _placeholderFont;\
@synthesize curWordCount = _curWordCount;\
@synthesize maxWordCount = _maxWordCount;\
@synthesize text = _text;\
@synthesize font = _font;\
@synthesize textCor = _textCor;\
@synthesize subText = _subText;\
@synthesize subFont = _subFont;\
@synthesize subTextCor = _subTextCor;\
@synthesize selectedText = _selectedText;\
@synthesize selectedFont = _selectedFont;\
@synthesize selectedTextCor = _selectedTextCor;\
@synthesize selectedAttributedText = _selectedAttributedText;\
@synthesize selectedSubText = _selectedSubText;\
@synthesize selectedSubFont = _selectedSubFont;\
@synthesize selectedSubTextCor = _selectedSubTextCor;\
@synthesize selectedAttributedSubText = _selectedAttributedSubText;\

#endif

#ifndef UITextModelProtocol_synthesize
#define UITextModelProtocol_synthesize \
\
UITextModelProtocol_synthesize_part1 \
UITextModelProtocol_synthesize_part2 \
UITextModelProtocol_synthesize_part3

#endif

#pragma mark —— @dynamic UITextModelProtocol
#ifndef UITextModelProtocol_dynamic
#define UITextModelProtocol_dynamic \
\
@dynamic textAlignment;\
@dynamic subTextAlignment;\
@dynamic lineBreakMode;\
@dynamic subLineBreakMode;\
@dynamic textLineSpacing;\
@dynamic placeholder;\
@dynamic placeholderColor;\
@dynamic placeholderFont;\
@dynamic curWordCount;\
@dynamic maxWordCount;\
@dynamic text;\
@dynamic font;\
@dynamic textCor;\
@dynamic subText;\
@dynamic subFont;\
@dynamic subTextCor;\
@dynamic attributedSubTitle;\
@dynamic attributedTitle;\
@dynamic selectedText;\
@dynamic selectedFont;\
@dynamic selectedTextCor;\
@dynamic selectedAttributedText;\
@dynamic selectedSubText;\
@dynamic selectedSubFont;\
@dynamic selectedSubTextCor;\
@dynamic selectedAttributedSubText;\

#endif

#endif /* JobsDefineUITextModelProtocol_h */
