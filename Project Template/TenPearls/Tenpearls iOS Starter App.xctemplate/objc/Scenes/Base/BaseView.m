//  Created on ___DATE___.

#import "BaseView.h"

@implementation BaseView
@synthesize controller;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void) viewDidLoad {}
-(void) viewDidAppear {}
-(void) viewWillAppear {}
-(void) viewWillDisappear {}
-(void) viewDidLayoutSubviews {}

-(void) dealloc {

#if SHOW_DEALLOC_LOG == 1
    NSLog(@"Dealloc called from- %@", NSStringFromClass([self class]));
#endif
}

@end
