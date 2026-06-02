//
//  ASButtonNode+Private.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASButtonNode.h>
#import <AsyncDisplayKit/ASTextNode.h>
#import <AsyncDisplayKit/ASImageNode.h>
#import <AsyncDisplayKit/ASStackLayoutDefines.h>

@interface ASButtonNode () {
  NSAttributedString *_normalAttributedTitle;
  NSAttributedString *_highlightedAttributedTitle;
  NSAttributedString *_selectedAttributedTitle;
  NSAttributedString *_selectedHighlightedAttributedTitle;
  NSAttributedString *_disabledAttributedTitle;

  UIImage *_normalImage;
  UIImage *_highlightedImage;
  UIImage *_selectedImage;
  UIImage *_selectedHighlightedImage;
  UIImage *_disabledImage;

  UIImage *_normalBackgroundImage;
  UIImage *_highlightedBackgroundImage;
  UIImage *_selectedBackgroundImage;
  UIImage *_selectedHighlightedBackgroundImage;
  UIImage *_disabledBackgroundImage;

  CGFloat _contentSpacing;
  UIEdgeInsets _contentEdgeInsets;
  ASTextNode *_titleNode;
  ASImageNode *_imageNode;
  ASImageNode *_backgroundImageNode;

  BOOL _laysOutHorizontally;
  ASVerticalAlignment _contentVerticalAlignment;
  ASHorizontalAlignment _contentHorizontalAlignment;
  ASButtonNodeImageAlignment _imageAlignment;
}

@end
