//
//  NibDesignable.m
//  NibDesignable
//
//  Created by muneeba.meer on 28/01/2016.
//  Copyright © 2016 tenpearls. All rights reserved.
//

#import "NibDesignable.h"
#import <objc/runtime.h>

@implementation NibDesignable

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {

  self = [super initWithCoder:aDecoder];

  if (self && self.subviews.count == 0) {

    [self setupNib];
  }
  return self;

} // F.E
- (id)initWithFrame:(CGRect)frame {

  self = [super initWithFrame:frame];
  if (self && self.subviews.count == 0) {

    [self setupNib];
  }
  return self;
} // F.E
- (void)awakeFromNib {

  [super awakeFromNib];

  [self setupDynamicProperties];

} // F.E
- (void)setupDynamicProperties {

} // F.E

- (void)setupNib {

  UIView *view = [self loadNib];
  view.frame = self.bounds;
  view.autoresizingMask =
      UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

  [self addSubview:view];

} // F.E

- (UIView *)loadNib {

  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  return [bundle loadNibNamed:[self nibName] owner:self options:nil][0];

} // F.E

- (NSString *)nibName {

  NSString *strClass = NSStringFromClass([self class]);
  return strClass;
} // F.E
@end
