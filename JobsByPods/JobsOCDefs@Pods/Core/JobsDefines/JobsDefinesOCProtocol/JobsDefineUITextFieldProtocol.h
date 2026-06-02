//
//  JobsDefineUITextFieldProtocol.h
//  JobsOCDefs
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineUITextFieldProtocol_h
#define JobsDefineUITextFieldProtocol_h

#ifndef UITextFieldProtocol_synthesize_part0
#define UITextFieldProtocol_synthesize_part0 \
\
@synthesize placeholderColor = _placeholderColor; \
@synthesize placeholderFont = _placeholderFont; \
@synthesize text = _text; \
@synthesize textCor = _textCor; \

#endif /* UITextFieldProtocol_synthesize_part0 */

#ifndef UITextFieldProtocol_synthesize_part1
#define UITextFieldProtocol_synthesize_part1 \
\
@synthesize baseBackgroundColor = _baseBackgroundColor; \
@synthesize borderWidth = _borderWidth; \
@synthesize cornerRadiusValue = _cornerRadiusValue; \
@synthesize layerBorderCor = _layerBorderCor; \
@synthesize textFont = _textFont; \

#endif /* UITextFieldProtocol_synthesize_part1 */

#ifndef UITextFieldProtocol_synthesize_part2
#define UITextFieldProtocol_synthesize_part2 \
\
@synthesize textFieldPlaceholder = _textFieldPlaceholder; \
@synthesize attributedPlaceholder = _attributedPlaceholder; \
@synthesize placeHolderAlignment = _placeHolderAlignment; \
@synthesize text_offset = _text_offset; \
@synthesize leftViewOffsetX = _leftViewOffsetX; \
@synthesize rightViewOffsetX = _rightViewOffsetX; \
@synthesize fieldEditorOffset = _fieldEditorOffset; \
@synthesize placeHolderOffset = _placeHolderOffset; \
@synthesize leftView = _leftView; \
@synthesize rightView = _rightView; \
@synthesize leftViewMode = _leftViewMode; \
@synthesize rightViewMode = _rightViewMode; \
@synthesize isShowDelBtn = _isShowDelBtn; \
@synthesize useCustomClearButton = _useCustomClearButton; \
@synthesize isShowMenu = _isShowMenu; \
@synthesize notAllowEdit = _notAllowEdit; \
@synthesize textFieldSecureTextEntry = _textFieldSecureTextEntry; \
@synthesize TFRiseHeight = _TFRiseHeight; \
@synthesize keyboardAppearance_ = _keyboardAppearance_; \
@synthesize keyboardType_ = _keyboardType_; \
@synthesize returnKeyType_ = _returnKeyType_; \
@synthesize clearButtonRectForBounds = _clearButtonRectForBounds; \
@synthesize borderRectForBounds = _borderRectForBounds; \
@synthesize drawPlaceholderInRect = _drawPlaceholderInRect; \
@synthesize leftViewRectForBounds = _leftViewRectForBounds; \
@synthesize rightViewRectForBounds = _rightViewRectForBounds; \
@synthesize placeholderRectForBounds = _placeholderRectForBounds; \
@synthesize textRectForBounds = _textRectForBounds; \
@synthesize editingRectForBounds = _editingRectForBounds; \

#endif /* UITextFieldProtocol_synthesize_part2 */

#ifndef UITextFieldProtocol_synthesize
#define UITextFieldProtocol_synthesize \
\
UITextFieldProtocol_synthesize_part0 \
UITextFieldProtocol_synthesize_part1 \
UITextFieldProtocol_synthesize_part2 \

#endif /* UITextFieldProtocol_synthesize */

#ifndef UITextFieldProtocol_dynamic
#define UITextFieldProtocol_dynamic \
\
@dynamic text;\
@dynamic textCor; \
@dynamic textFont; \
@dynamic textFieldPlaceholder; \
@dynamic placeholderColor; \
@dynamic placeholderFont; \
@dynamic attributedPlaceholder; \
@dynamic baseBackgroundColor; \
@dynamic placeHolderAlignment; \
@dynamic cornerRadiusValue; \
@dynamic layerBorderCor; \
@dynamic borderWidth; \
@dynamic text_offset; \
@dynamic leftViewOffsetX; \
@dynamic rightViewOffsetX; \
@dynamic fieldEditorOffset; \
@dynamic placeHolderOffset; \
@dynamic leftView; \
@dynamic rightView; \
@dynamic leftViewMode; \
@dynamic rightViewMode; \
@dynamic isShowDelBtn; \
@dynamic useCustomClearButton; \
@dynamic isShowMenu; \
@dynamic notAllowEdit; \
@dynamic textFieldSecureTextEntry; \
@dynamic TFRiseHeight; \
@dynamic keyboardAppearance_; \
@dynamic keyboardType_; \
@dynamic returnKeyType_; \
@dynamic clearButtonRectForBounds; \
@dynamic borderRectForBounds; \
@dynamic drawPlaceholderInRect; \
@dynamic leftViewRectForBounds; \
@dynamic rightViewRectForBounds; \
@dynamic placeholderRectForBounds; \
@dynamic textRectForBounds; \
@dynamic editingRectForBounds; \

#endif /* UITextFieldProtocol_dynamic */

#endif /* JobsDefineUITextFieldProtocol_h */
