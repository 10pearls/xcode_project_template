//___FILEHEADER___

#import "NibDesignable.h"
#import <objc/runtime.h>

@implementation NibDesignable

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {

  self = [super initWithCoder:aDecoder];

  if (self && self.subviews.count == 0) {

    [self setupNib];
  }
  return self;

}

- (id)initWithFrame:(CGRect)frame {

  self = [super initWithFrame:frame];
  if (self && self.subviews.count == 0) {

    [self setupNib];
  }
  return self;
}

- (void)awakeFromNib {

  [super awakeFromNib];

  [self setupDynamicProperties];

}

- (void)setupDynamicProperties {

}

- (void)setupNib {

  UIView *view = [self loadNib];
  view.frame = self.bounds;
  view.autoresizingMask =
      UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

  [self addSubview:view];

}

- (UIView *)loadNib {

  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  return [bundle loadNibNamed:[self nibName] owner:self options:nil][0];

}

- (NSString *)nibName {

  NSString *strClass = NSStringFromClass([self class]);
  return strClass;
}

@end
